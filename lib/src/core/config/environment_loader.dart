import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'app_config.dart';
import 'environment.dart';

class EnvironmentLoader {
  const EnvironmentLoader();

  static AppConfig load() {
    const rawEnv = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    );
    final environment = Environment.fromString(rawEnv);

    // Fallback to local API server documented in API_DOCUMENTATION.md
    final String defaultHost;
    if (kIsWeb) {
      defaultHost = 'http://localhost:3000';
    } else if (Platform.isAndroid) {
      defaultHost = 'http://10.0.2.2:3000';
    } else {
      defaultHost = 'http://localhost:3000';
    }

    const envApiBaseUrl = String.fromEnvironment('API_BASE_URL');
    final apiBaseUrl = envApiBaseUrl.isNotEmpty ? envApiBaseUrl : defaultHost;

    const envSocketUrl = String.fromEnvironment('SOCKET_URL');
    final socketUrl = envSocketUrl.isNotEmpty ? envSocketUrl : defaultHost;

    final config = AppConfig(
      environment: environment,
      apiBaseUrl: apiBaseUrl,
      socketUrl: socketUrl,
    );

    config.validate();
    return config;
  }
}
