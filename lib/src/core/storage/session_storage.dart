import '../constants/app_constants.dart';
import '../network/auth/token_pair.dart';
import '../network/auth/token_storage.dart';
import 'preferences_storage.dart';
import 'secure_storage.dart';

abstract interface class SessionStorage implements TokenStorage {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    int? expiresInSeconds,
  });
  Future<void> clearSession();
  Future<String?> getUserData();
  Future<void> saveUserData(String data);
  Future<void> saveTokenExpiry(int expiresInSeconds);
  Future<int?> getTokenExpiry();
  Future<bool> isTokenExpired();
}

class SessionStorageImpl implements SessionStorage {
  final SecureStorage secureStorage;
  final PreferencesStorage preferencesStorage;

  const SessionStorageImpl({
    required this.secureStorage,
    required this.preferencesStorage,
  });

  @override
  Future<String?> getAccessToken() =>
      secureStorage.read(AppConstants.keyAccessToken);

  @override
  Future<void> saveAccessToken(String token) =>
      secureStorage.write(AppConstants.keyAccessToken, token);

  @override
  Future<String?> getRefreshToken() =>
      secureStorage.read(AppConstants.keyRefreshToken);

  @override
  Future<void> saveRefreshToken(String token) =>
      secureStorage.write(AppConstants.keyRefreshToken, token);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    int? expiresInSeconds,
  }) async {
    await secureStorage.write(AppConstants.keyAccessToken, accessToken);
    await secureStorage.write(AppConstants.keyRefreshToken, refreshToken);
    if (expiresInSeconds != null && expiresInSeconds > 0) {
      await saveTokenExpiry(expiresInSeconds);
    }
  }

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) => saveTokens(
    accessToken: tokenPair.accessToken,
    refreshToken: tokenPair.refreshToken,
  );

  @override
  Future<void> clear() => clearSession();

  @override
  Future<void> clearSession() async {
    await secureStorage.delete(AppConstants.keyAccessToken);
    await secureStorage.delete(AppConstants.keyRefreshToken);
    await preferencesStorage.remove(AppConstants.keySessionUser);
    await preferencesStorage.remove(AppConstants.keyTokenExpiry);
  }

  @override
  Future<String?> getUserData() =>
      preferencesStorage.getString(AppConstants.keySessionUser);

  @override
  Future<void> saveUserData(String data) =>
      preferencesStorage.setString(AppConstants.keySessionUser, data);

  @override
  Future<void> saveTokenExpiry(int expiresInSeconds) async {
    final expiryTime =
        DateTime.now().millisecondsSinceEpoch + (expiresInSeconds * 1000);
    await preferencesStorage.setInt(AppConstants.keyTokenExpiry, expiryTime);
  }

  @override
  Future<int?> getTokenExpiry() =>
      preferencesStorage.getInt(AppConstants.keyTokenExpiry);

  @override
  Future<bool> isTokenExpired() async {
    final expiryTime = await getTokenExpiry();
    if (expiryTime == null) return false;
    // 30 seconds leeway to avoid race condition on token expiration
    return DateTime.now().millisecondsSinceEpoch >= (expiryTime - 30000);
  }
}
