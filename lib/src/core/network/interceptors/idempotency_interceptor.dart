import 'package:dio/dio.dart';
import '../idempotency/idempotency_policy.dart';

class IdempotencyInterceptor extends Interceptor {
  const IdempotencyInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (IdempotencyPolicy.isApplicable(options)) {
      final key = IdempotencyPolicy.getKey(options);
      if (key != null) {
        options.headers[IdempotencyPolicy.headerKey] = key;
      }
    }
    handler.next(options);
  }
}
