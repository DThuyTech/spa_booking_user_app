import 'environment.dart';

class AppConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String socketUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  const AppConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.socketUrl,
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 15),
  });

  void validate() {
    if (apiBaseUrl.isEmpty) {
      throw StateError('AppConfig: apiBaseUrl cannot be empty.');
    }
    final parsedUri = Uri.tryParse(apiBaseUrl);
    if (parsedUri == null || !parsedUri.hasScheme) {
      throw StateError(
        'AppConfig: apiBaseUrl is not a valid URL ($apiBaseUrl).',
      );
    }
    if (socketUrl.isEmpty) {
      throw StateError('AppConfig: socketUrl cannot be empty.');
    }
    final parsedSocketUri = Uri.tryParse(socketUrl);
    if (parsedSocketUri == null || !parsedSocketUri.hasScheme) {
      throw StateError('AppConfig: socketUrl is not a valid URL ($socketUrl).');
    }
  }
}
