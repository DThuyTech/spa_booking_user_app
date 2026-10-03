import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/core/logging/app_logger.dart';
import 'package:spa_booking/src/core/logging/log_level.dart';
import 'package:spa_booking/src/core/network/interceptors/logging_interceptor.dart';

class TestLogger implements Logger {
  final List<String> debugLogs = [];
  final List<String> infoLogs = [];
  final List<String> warningLogs = [];
  final List<String> errorLogs = [];

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    debugLogs.add(message);
  }

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    infoLogs.add(message);
  }

  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    warningLogs.add(message);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    errorLogs.add(message);
  }

  @override
  void json(dynamic data, {String? title, LogLevel level = LogLevel.debug}) {
    final formatted = AppLogger.formatJson(data);
    final msg = title != null ? '$title:\n$formatted' : formatted;
    debug(msg);
  }
}

void main() {
  group('AppLogger & Pretty JSON Formatting', () {
    test('formats Map to indented JSON and redacts sensitive keys', () {
      final input = {
        'name': 'Spa Customer',
        'password': 'secretPassword123',
        'token': 'bearer_token_xyz',
        'profile': {'age': 25, 'secret': 'sensitiveData'},
      };

      final formatted = AppLogger.formatJson(input);

      expect(formatted, contains('"name": "Spa Customer"'));
      expect(formatted, contains('"password": "[REDACTED]"'));
      expect(formatted, contains('"token": "[REDACTED]"'));
      expect(formatted, contains('"secret": "[REDACTED]"'));
      expect(formatted, contains('  "profile": {'));
    });

    test('formats JSON string to pretty indented JSON', () {
      const jsonStr = '{"status":"active","count":10}';
      final formatted = AppLogger.formatJson(jsonStr);

      expect(formatted, contains('{\n  "status": "active",\n  "count": 10\n}'));
    });

    test('AppLogger logs debug, info, warning, error, and json safely', () {
      final logger = AppLogger();

      expect(() => logger.debug('Debug test'), returnsNormally);
      expect(() => logger.info('Info test'), returnsNormally);
      expect(() => logger.warning('Warning test'), returnsNormally);
      expect(
        () => logger.error('Error test', Exception('fail')),
        returnsNormally,
      );
      expect(
        () => logger.json({
          'id': 1,
          'email': 'test@example.com',
        }, title: 'User Data'),
        returnsNormally,
      );
    });
  });

  group('LoggingInterceptor Pretty JSON', () {
    late TestLogger testLogger;
    late LoggingInterceptor interceptor;

    setUp(() {
      testLogger = TestLogger();
      interceptor = LoggingInterceptor(logger: testLogger);
    });

    test('logs pretty JSON on onRequest', () {
      final options = RequestOptions(
        path: '/api/v1/customers/me/profile',
        method: 'POST',
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer abc',
        },
        data: {'name': 'John Doe', 'password': 'myPassword'},
      );

      interceptor.onRequest(options, RequestInterceptorHandler());

      expect(testLogger.debugLogs, isNotEmpty);
      final log = testLogger.debugLogs.first;
      expect(log, contains('🌐 [API REQUEST] --> POST'));
      expect(log, contains('"password": "[REDACTED]"'));
      expect(log, contains('"authorization": "[REDACTED]"'));
      expect(log, contains('Body:\n{'));
    });

    test('logs pretty JSON on onResponse', () {
      final response = Response(
        requestOptions: RequestOptions(path: '/api/v1/users/me', method: 'GET'),
        statusCode: 200,
        data: {'id': 'usr_1', 'name': 'John'},
      );

      interceptor.onResponse(response, ResponseInterceptorHandler());

      expect(testLogger.infoLogs, isNotEmpty);
      final log = testLogger.infoLogs.first;
      expect(log, contains('✅ [API RESPONSE] <-- 200 GET'));
      expect(log, contains('"name": "John"'));
      expect(log, contains('Body:\n{'));
    });

    test('logs pretty JSON and error on onError', () {
      final err = DioException(
        requestOptions: RequestOptions(path: '/api/v1/login', method: 'POST'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/login'),
          statusCode: 400,
          data: {'statusCode': 400, 'message': 'Invalid credentials'},
        ),
        message: 'Bad Request',
      );

      final handler = _TestErrorHandler();
      interceptor.onError(err, handler);

      expect(testLogger.errorLogs, isNotEmpty);
      final log = testLogger.errorLogs.first;
      expect(log, contains('❌ [API ERROR] <-- 400 POST'));
      expect(log, contains('"message": "Invalid credentials"'));
    });
  });
}

class _TestErrorHandler extends ErrorInterceptorHandler {
  @override
  void next(DioException err) {}
}
