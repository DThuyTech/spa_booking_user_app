import 'package:dio/dio.dart';
import '../../logging/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger logger;
  final bool isProduction;

  LoggingInterceptor({required this.logger, this.isProduction = false});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['request_start_time'] = DateTime.now().millisecondsSinceEpoch;

    final sanitizedHeaders = AppLogger.sanitizeMap(options.headers);
    final sanitizedData = options.data is Map<String, dynamic>
        ? AppLogger.sanitizeMap(options.data as Map<String, dynamic>)
        : options.data;

    final prettyBody = AppLogger.formatJson(sanitizedData);
    final prettyHeaders = AppLogger.formatJson(sanitizedHeaders);

    logger.debug(
      '🌐 [API REQUEST] --> ${options.method} ${options.uri}\n'
      'Headers:\n$prettyHeaders\n'
      'Body:\n$prettyBody',
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final startTime =
        response.requestOptions.extra['request_start_time'] as int?;
    final duration = startTime != null
        ? '${DateTime.now().millisecondsSinceEpoch - startTime}ms'
        : 'unknown';

    final sanitizedData = response.data is Map<String, dynamic>
        ? AppLogger.sanitizeMap(response.data as Map<String, dynamic>)
        : response.data;

    final prettyBody = AppLogger.formatJson(sanitizedData);

    logger.info(
      '✅ [API RESPONSE] <-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri} ($duration)\n'
      'Body:\n$prettyBody',
    );

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final startTime = err.requestOptions.extra['request_start_time'] as int?;
    final duration = startTime != null
        ? '${DateTime.now().millisecondsSinceEpoch - startTime}ms'
        : 'unknown';

    final prettyResponse = AppLogger.formatJson(err.response?.data);

    logger.error(
      '❌ [API ERROR] <-- ${err.response?.statusCode ?? 'No Response'} ${err.requestOptions.method} ${err.requestOptions.uri} ($duration)\n'
      'Message: ${err.message}\n'
      'Error Body:\n$prettyResponse',
      err,
      err.stackTrace,
    );

    handler.next(err);
  }
}
