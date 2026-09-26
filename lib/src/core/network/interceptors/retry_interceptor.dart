import 'package:dio/dio.dart';
import '../idempotency/idempotency_policy.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  static const String extraRetryCount = 'internal_retry_count';

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 2,
    this.retryDelay = const Duration(milliseconds: 500),
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    final currentRetry = (requestOptions.extra[extraRetryCount] as int?) ?? 0;

    if (currentRetry >= maxRetries || !_isRetryable(err)) {
      return handler.next(err);
    }

    // For non-idempotent methods like POST/PATCH, only retry if idempotency key is present
    final isMutating =
        requestOptions.method == 'POST' || requestOptions.method == 'PATCH';
    if (isMutating && !IdempotencyPolicy.isApplicable(requestOptions)) {
      return handler.next(err);
    }

    requestOptions.extra[extraRetryCount] = currentRetry + 1;
    await Future.delayed(retryDelay * (currentRetry + 1));

    try {
      final response = await dio.fetch(requestOptions);
      return handler.resolve(response);
    } on DioException catch (retryError) {
      return handler.next(retryError);
    } catch (e) {
      return handler.next(err);
    }
  }

  bool _isRetryable(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;
      case DioExceptionType.badResponse:
        final status = err.response?.statusCode;
        // Retry transient 502, 503, 504
        return status == 502 || status == 503 || status == 504;
      default:
        return false;
    }
  }
}
