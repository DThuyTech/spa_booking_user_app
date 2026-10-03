import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'app_config.dart';
import 'environment.dart';

class EnvironmentLoader {
  const EnvironmentLoader();

  static Map<String, String> _parseEnvContent(String content) {
    final env = <String, String>{};
    for (final rawLine in content.split('\n')) {
      final line = rawLine.trim();
      if (line.isEmpty || line.startsWith('#')) continue;
      final eqIndex = line.indexOf('=');
      if (eqIndex != -1) {
        final key = line.substring(0, eqIndex).trim();
        var value = line.substring(eqIndex + 1).trim();
        if ((value.startsWith('"') && value.endsWith('"')) ||
            (value.startsWith("'") && value.endsWith("'"))) {
          value = value.substring(1, value.length - 1);
        }
        env[key] = value;
      }
    }
    return env;
  }

  static String _resolveDefaultHost() {
    if (kIsWeb) {
      return 'http://localhost:3000';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://localhost:3000';
    }
  }

  static AppConfig _buildConfig(Map<String, String> envMap) {
    const rawCliEnv = String.fromEnvironment('APP_ENV');
    final envStr = rawCliEnv.isNotEmpty
        ? rawCliEnv
        : (envMap['ENVIRONMENT'] ?? envMap['APP_ENV'] ?? 'development');
    final environment = Environment.fromString(envStr);

    final defaultHost = _resolveDefaultHost();

    const cliApiBase = String.fromEnvironment('API_BASE_URL');
    const cliBase = String.fromEnvironment('BASE_URL');
    final resolvedApiBase = cliApiBase.isNotEmpty
        ? cliApiBase
        : (cliBase.isNotEmpty
            ? cliBase
            : (envMap['BASE_URL'] ?? envMap['API_BASE_URL'] ?? defaultHost));

    const cliSocket = String.fromEnvironment('SOCKET_URL');
    final resolvedSocket = cliSocket.isNotEmpty
        ? cliSocket
        : (envMap['SOCKET_URL'] ??
            (resolvedApiBase.startsWith('http')
                ? resolvedApiBase
                : defaultHost));

    final xToken = envMap['X_TOKEN_ACCESS'];
    final appName = envMap['APP_NAME'] ?? 'Aura Spa & Salon';

    final config = AppConfig(
      environment: environment,
      apiBaseUrl: resolvedApiBase,
      socketUrl: resolvedSocket,
      xTokenAccess: xToken,
      appName: appName,
    );

    config.validate();
    return config;
  }

  /// Synchronously loads configuration (uses local .env file if available, falls back to compile-time env)
  static AppConfig load() {
    Map<String, String> envMap = {};
    try {
      final file = File('.env');
      if (file.existsSync()) {
        envMap = _parseEnvContent(file.readAsStringSync());
      }
    } catch (_) {}

    return _buildConfig(envMap);
  }

  /// Asynchronously loads configuration (reads .env asset from rootBundle, falls back to disk file and compile-time env)
  static Future<AppConfig> loadAsync() async {
    Map<String, String> envMap = {};

    try {
      final content = await rootBundle.loadString('.env');
      envMap = _parseEnvContent(content);
    } catch (_) {
      try {
        final file = File('.env');
        if (file.existsSync()) {
          envMap = _parseEnvContent(file.readAsStringSync());
        }
      } catch (_) {}
    }

    return _buildConfig(envMap);
  }
}
