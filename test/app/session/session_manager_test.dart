import 'package:board_oi/src/app/session/app_session_state.dart';
import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:board_oi/src/core/constants/app_constants.dart';
import 'package:board_oi/src/core/logging/app_logger.dart';
import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:board_oi/src/core/network/auth/token_storage.dart';
import 'package:board_oi/src/core/storage/preferences_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class InMemoryTokenStorage implements TokenStorage {
  String? accessToken;
  String? refreshToken;

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) async {
    accessToken = tokenPair.accessToken;
    refreshToken = tokenPair.refreshToken;
  }

  @override
  Future<void> clear() async {
    accessToken = null;
    refreshToken = null;
  }
}

class InMemoryPreferencesStorage implements PreferencesStorage {
  final Map<String, dynamic> _data = {};

  @override
  Future<void> clear() async => _data.clear();

  @override
  Future<bool?> getBool(String key) async => _data[key] as bool?;

  @override
  Future<int?> getInt(String key) async => _data[key] as int?;

  @override
  Future<String?> getString(String key) async => _data[key] as String?;

  @override
  Future<void> remove(String key) async => _data.remove(key);

  @override
  Future<void> setBool(String key, bool value) async => _data[key] = value;

  @override
  Future<void> setInt(String key, int value) async => _data[key] = value;

  @override
  Future<void> setString(String key, String value) async => _data[key] = value;
}

class NoopLogger implements Logger {
  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {}
  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {}
  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {}
  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {}
}

void main() {
  group('SessionManager', () {
    late InMemoryTokenStorage tokenStorage;
    late InMemoryPreferencesStorage prefsStorage;
    late SessionManagerImpl sessionManager;

    setUp(() {
      tokenStorage = InMemoryTokenStorage();
      prefsStorage = InMemoryPreferencesStorage();
      sessionManager = SessionManagerImpl(
        secureTokenStorage: tokenStorage,
        preferencesStorage: prefsStorage,
        logger: NoopLogger(),
      );
    });

    test('valid stored token -> restore -> authenticated', () async {
      tokenStorage.accessToken = 'valid_acc_token';
      tokenStorage.refreshToken = 'valid_ref_token';
      await prefsStorage.setString(AppConstants.keySessionUser, 'user_999');

      await sessionManager.restoreSession();

      expect(
        sessionManager.currentSession.status,
        equals(AppSessionStatus.authenticated),
      );
      expect(sessionManager.currentSession.userId, equals('user_999'));
    });

    test('no stored token -> restore -> unauthenticated', () async {
      await sessionManager.restoreSession();

      expect(
        sessionManager.currentSession.status,
        equals(AppSessionStatus.unauthenticated),
      );
    });

    test(
      'markSessionExpired clears secure tokens and updates status to sessionExpired',
      () async {
        tokenStorage.accessToken = 'valid_acc_token';
        tokenStorage.refreshToken = 'valid_ref_token';

        await sessionManager.markSessionExpired();

        expect(
          sessionManager.currentSession.status,
          equals(AppSessionStatus.sessionExpired),
        );
        expect(await tokenStorage.getAccessToken(), isNull);
        expect(await tokenStorage.getRefreshToken(), isNull);
      },
    );

    test(
      'logout clears tokens and user data and sets status to unauthenticated',
      () async {
        await sessionManager.login(
          tokens: const TokenPair(accessToken: 'a', refreshToken: 'b'),
          userId: 'user_1',
        );
        expect(
          sessionManager.currentSession.status,
          equals(AppSessionStatus.authenticated),
        );

        await sessionManager.logout();

        expect(
          sessionManager.currentSession.status,
          equals(AppSessionStatus.unauthenticated),
        );
        expect(await tokenStorage.getAccessToken(), isNull);
        expect(
          await prefsStorage.getString(AppConstants.keySessionUser),
          isNull,
        );
      },
    );
  });
}
