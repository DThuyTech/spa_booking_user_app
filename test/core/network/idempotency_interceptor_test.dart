import 'package:board_oi/src/core/network/idempotency/idempotency_policy.dart';
import 'package:board_oi/src/core/network/interceptors/idempotency_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IdempotencyPolicy and IdempotencyInterceptor', () {
    const interceptor = IdempotencyInterceptor();

    test(
      'attaches X-Idempotency-Key to mutating POST operations with idempotencyKey extra',
      () {
        const operationKey = 'op-key-abc-123';
        final options = RequestOptions(
          path: '/bookings',
          method: 'POST',
          extra: {IdempotencyPolicy.extraKey: operationKey},
        );

        final handler = RequestInterceptorHandler();
        interceptor.onRequest(options, handler);

        expect(
          options.headers[IdempotencyPolicy.headerKey],
          equals(operationKey),
        );
      },
    );

    test(
      'reuses the exact same X-Idempotency-Key across retries of the same operation',
      () {
        const operationKey = 'op-key-retry-999';
        final initialAttempt = RequestOptions(
          path: '/payments',
          method: 'POST',
          extra: {IdempotencyPolicy.extraKey: operationKey},
        );

        final retryAttempt = RequestOptions(
          path: '/payments',
          method: 'POST',
          extra: {IdempotencyPolicy.extraKey: operationKey, 'isRetry': true},
        );

        interceptor.onRequest(initialAttempt, RequestInterceptorHandler());
        interceptor.onRequest(retryAttempt, RequestInterceptorHandler());

        expect(
          initialAttempt.headers[IdempotencyPolicy.headerKey],
          equals(retryAttempt.headers[IdempotencyPolicy.headerKey]),
        );
        expect(
          retryAttempt.headers[IdempotencyPolicy.headerKey],
          equals(operationKey),
        );
      },
    );

    test('does NOT attach X-Idempotency-Key to ordinary GET requests', () {
      final getOptions = RequestOptions(path: '/items', method: 'GET');

      interceptor.onRequest(getOptions, RequestInterceptorHandler());

      expect(
        getOptions.headers.containsKey(IdempotencyPolicy.headerKey),
        isFalse,
      );
    });

    test(
      'does NOT attach X-Idempotency-Key to GET requests even if extra is present',
      () {
        final getOptions = RequestOptions(
          path: '/items',
          method: 'GET',
          extra: {IdempotencyPolicy.extraKey: 'should-not-attach'},
        );

        interceptor.onRequest(getOptions, RequestInterceptorHandler());

        expect(
          getOptions.headers.containsKey(IdempotencyPolicy.headerKey),
          isFalse,
        );
      },
    );
  });
}
