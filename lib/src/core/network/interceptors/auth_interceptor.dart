import 'package:dio/dio.dart';
import '../../constants/app_constants.dart';
import '../auth/token_refresh_coordinator.dart';
import '../auth/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final TokenRefreshCoordinator refreshCoordinator;
  final Dio dio;

  static const String extraSkipAuth = 'skipAuth';
  static const String extraSkipRefresh = 'skipRefresh';
  static const String extraIsRetry = 'isRetry';

  AuthInterceptor({
    required this.tokenStorage,
    required this.refreshCoordinator,
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final skipAuth = options.extra[extraSkipAuth] == true;
    if (!skipAuth) {
      final token = await tokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers[AppConstants.headerAuthorization] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final is401 = response?.statusCode == 401;
    final skipRefresh = err.requestOptions.extra[extraSkipRefresh] == true;
    final alreadyRetried = err.requestOptions.extra[extraIsRetry] == true;

    if (is401 && !skipRefresh && !alreadyRetried) {
      try {
        final newAccessToken = await refreshCoordinator.refreshToken();
        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          // Retry the original request with new token
          final retryOptions = err.requestOptions;
          retryOptions.headers[AppConstants.headerAuthorization] =
              'Bearer $newAccessToken';
          retryOptions.extra[extraIsRetry] = true;

          final retryResponse = await dio.fetch(retryOptions);
          return handler.resolve(retryResponse);
        }
      } catch (e) {
        // Refresh failed, let the 401 pass through
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
