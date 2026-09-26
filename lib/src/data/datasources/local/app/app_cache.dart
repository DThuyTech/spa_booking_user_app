import '../../../../core/storage/preferences_storage.dart';
import '../../../../core/storage/secure_storage.dart';

/// Centralized Local Cache orchestrating SharedPreferences & SecureStorage.
class AppCache {
  final PreferencesStorage preferences;
  final SecureStorage secureStorage;

  const AppCache({
    required this.preferences,
    required this.secureStorage,
  });

  Future<void> saveToken({required String accessToken, String? refreshToken}) async {
    await secureStorage.write('access_token', accessToken);
    if (refreshToken != null) {
      await secureStorage.write('refresh_token', refreshToken);
    }
  }

  Future<String?> getAccessToken() => secureStorage.read('access_token');
  Future<String?> getRefreshToken() => secureStorage.read('refresh_token');

  Future<void> clearAuth() async {
    await secureStorage.delete('access_token');
    await secureStorage.delete('refresh_token');
  }
}
