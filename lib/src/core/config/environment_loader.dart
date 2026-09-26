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

    const apiBaseUrl = String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.example.com/api/v1',
    );

    const socketUrl = String.fromEnvironment(
      'SOCKET_URL',
      defaultValue: 'https://socket.example.com',
    );

    final config = AppConfig(
      environment: environment,
      apiBaseUrl: apiBaseUrl,
      socketUrl: socketUrl,
    );

    config.validate();
    return config;
  }
}
