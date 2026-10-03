import 'dart:convert';
import 'dart:developer' as developer;
import 'package:logger/logger.dart' as log_pkg;
import 'log_level.dart';

abstract interface class Logger {
  void debug(String message, [Object? error, StackTrace? stackTrace]);
  void info(String message, [Object? error, StackTrace? stackTrace]);
  void warning(String message, [Object? error, StackTrace? stackTrace]);
  void error(String message, [Object? error, StackTrace? stackTrace]);
  void json(dynamic data, {String? title, LogLevel level = LogLevel.debug});
}

class AppLogger implements Logger {
  final LogLevel minLevel;
  final bool isProduction;
  final log_pkg.Logger _internalLogger;

  static const List<String> sensitiveKeys = [
    'authorization',
    'password',
    'token',
    'access_token',
    'refresh_token',
    'secret',
    'cookie',
    'otp',
    'credit_card',
  ];

  AppLogger({
    this.minLevel = LogLevel.debug,
    this.isProduction = false,
    log_pkg.Logger? internalLogger,
  }) : _internalLogger = internalLogger ??
            log_pkg.Logger(
              printer: log_pkg.PrettyPrinter(
                methodCount: 0,
                errorMethodCount: 8,
                lineLength: 90,
                colors: true,
                printEmojis: true,
                dateTimeFormat: log_pkg.DateTimeFormat.onlyTimeAndSinceStart,
              ),
              level: isProduction ? log_pkg.Level.warning : log_pkg.Level.trace,
            );

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  @override
  void json(dynamic data, {String? title, LogLevel level = LogLevel.debug}) {
    final formatted = formatJson(data);
    final msg = title != null ? '$title:\n$formatted' : formatted;
    _log(level, msg, null, null);
  }

  void _log(
    LogLevel level,
    String message,
    Object? error,
    StackTrace? stackTrace,
  ) {
    if (level.priority < minLevel.priority) return;

    final sanitizedMessage = isProduction
        ? redactSensitiveText(message)
        : message;

    developer.log(
      sanitizedMessage,
      name: 'SpaBooking',
      level: _toDeveloperLogLevel(level),
      error: error,
      stackTrace: stackTrace,
    );

    switch (level) {
      case LogLevel.debug:
        _internalLogger.d(sanitizedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.info:
        _internalLogger.i(sanitizedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.warning:
        _internalLogger.w(sanitizedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.error:
        _internalLogger.e(sanitizedMessage, error: error, stackTrace: stackTrace);
    }
  }

  /// Converts any Map, List, or JSON string into pretty-printed 2-space indented JSON.
  static String formatJson(dynamic data) {
    if (data == null) return 'null';
    try {
      final sanitized = data is Map<String, dynamic>
          ? sanitizeMap(data)
          : data;
      if (sanitized is Map || sanitized is List) {
        return const JsonEncoder.withIndent('  ').convert(sanitized);
      }
      if (sanitized is String) {
        final decoded = jsonDecode(sanitized);
        final sanitizedDecoded = decoded is Map<String, dynamic>
            ? sanitizeMap(decoded)
            : decoded;
        return const JsonEncoder.withIndent('  ').convert(sanitizedDecoded);
      }
    } catch (_) {
      // Fallback if not valid JSON
    }
    return data.toString();
  }

  static String redactSensitiveText(String text) {
    var result = text;
    for (final key in sensitiveKeys) {
      final pattern = RegExp(
        '("$key"\\s*:\\s*")([^"]+)(")',
        caseSensitive: false,
      );
      result = result.replaceAllMapped(
        pattern,
        (match) => '${match.group(1)}[REDACTED]${match.group(3)}',
      );
    }
    return result;
  }

  static Map<String, dynamic> sanitizeMap(Map<String, dynamic> map) {
    final sanitized = <String, dynamic>{};
    for (final entry in map.entries) {
      final keyLower = entry.key.toLowerCase();
      if (sensitiveKeys.any((s) => keyLower.contains(s))) {
        sanitized[entry.key] = '[REDACTED]';
      } else if (entry.value is Map<String, dynamic>) {
        sanitized[entry.key] = sanitizeMap(entry.value as Map<String, dynamic>);
      } else {
        sanitized[entry.key] = entry.value;
      }
    }
    return sanitized;
  }

  static int _toDeveloperLogLevel(LogLevel level) {
    return switch (level) {
      LogLevel.debug => 500,
      LogLevel.info => 800,
      LogLevel.warning => 900,
      LogLevel.error => 1000,
    };
  }
}
