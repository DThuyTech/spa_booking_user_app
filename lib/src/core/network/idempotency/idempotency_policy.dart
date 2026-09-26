import 'package:dio/dio.dart';

abstract final class IdempotencyPolicy {
  static const String extraKey = 'idempotencyKey';
  static const String headerKey = 'X-Idempotency-Key';

  static bool isApplicable(RequestOptions options) {
    // Only applies if the caller explicitly provided an idempotency key
    // or tagged the operation with an idempotencyKey extra
    final hasKey =
        options.extra.containsKey(extraKey) &&
        options.extra[extraKey] != null &&
        options.extra[extraKey].toString().isNotEmpty;

    // By default, idempotency keys belong to non-idempotent mutating HTTP methods (POST, PATCH)
    final isMutatingMethod =
        options.method == 'POST' || options.method == 'PATCH';

    return hasKey && isMutatingMethod;
  }

  static String? getKey(RequestOptions options) {
    return options.extra[extraKey]?.toString();
  }
}
