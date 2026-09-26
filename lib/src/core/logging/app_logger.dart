import 'dart:developer' as developer;
import 'log_level.dart';

abstract interface class Logger {
  void debug(String message, [Object? error, StackTrace? stackTrace]);
  void info(String message, [Object? error, StackTrace? stackTrace]);
  void warning(String message, [Object? error, StackTrace? stackTrace]);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

class AppLogger implements Logger {
  final LogLevel minLevel;
  final bool isProduction;

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

  const AppLogger({this.minLevel = LogLevel.debug, this.isProduction = false});

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
    final prefix = switch (level) {
      LogLevel.debug => '[DEBUG]',
      LogLevel.info => '[INFO]',
      LogLevel.warning => '[WARN]',
      LogLevel.error => '[ERROR]',
    };

    developer.log(
      '$prefix $sanitizedMessage',
      name: 'BoardOi',
      level: _toDeveloperLogLevel(level),
      error: error,
      stackTrace: stackTrace,
    );
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
