import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:board_oi/src/core/network/auth/token_refresh_coordinator.dart';
import 'package:board_oi/src/core/network/auth/token_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTokenStorage implements TokenStorage {
  String? accessToken = 'initial_access_token';
  String? refreshTokenVal = 'initial_refresh_token';
  bool cleared = false;

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshTokenVal;

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) async {
    accessToken = tokenPair.accessToken;
    refreshTokenVal = tokenPair.refreshToken;
  }

  @override
  Future<void> clear() async {
    accessToken = null;
    refreshTokenVal = null;
    cleared = true;
  }
}

void main() {
  group('TokenRefreshCoordinator', () {
    late MockTokenStorage tokenStorage;

    setUp(() {
      tokenStorage = MockTokenStorage();
    });

    test(
      'coalesces multiple concurrent 401 refresh calls into exactly ONE refresh request',
      () async {
        int refreshCallCount = 0;

        final coordinator = TokenRefreshCoordinator(
          tokenStorage: tokenStorage,
          refreshDelegate: (oldRefreshToken) async {
            refreshCallCount++;
            // Simulate network latency for token refresh
            await Future.delayed(const Duration(milliseconds: 50));
            return const TokenPair(
              accessToken: 'new_access_token_123',
              refreshToken: 'new_refresh_token_456',
            );
          },
        );

        // Simulate 3 concurrent requests encountering 401
        final futureA = coordinator.refreshToken();
        final futureB = coordinator.refreshToken();
        final futureC = coordinator.refreshToken();

        final results = await Future.wait([futureA, futureB, futureC]);

        // Exactly ONE refresh network call was executed
        expect(refreshCallCount, equals(1));

        // All 3 requests received the new access token
        expect(results[0], equals('new_access_token_123'));
        expect(results[1], equals('new_access_token_123'));
        expect(results[2], equals('new_access_token_123'));

        // Storage was updated
        expect(
          await tokenStorage.getAccessToken(),
          equals('new_access_token_123'),
        );
      },
    );

    test(
      'clears storage and triggers onSessionExpired when refresh fails',
      () async {
        bool sessionExpiredTriggered = false;

        final coordinator = TokenRefreshCoordinator(
          tokenStorage: tokenStorage,
          onSessionExpired: () {
            sessionExpiredTriggered = true;
          },
          refreshDelegate: (oldRefreshToken) async {
            // Simulate refresh rejection (e.g. invalid/expired refresh token)
            return null;
          },
        );

        final result = await coordinator.refreshToken();

        expect(result, isNull);
        expect(tokenStorage.cleared, isTrue);
        expect(sessionExpiredTriggered, isTrue);
      },
    );
  });
}
