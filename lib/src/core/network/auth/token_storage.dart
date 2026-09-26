import 'token_pair.dart';

abstract interface class TokenStorage {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokenPair(TokenPair tokenPair);
  Future<void> clear();
}
