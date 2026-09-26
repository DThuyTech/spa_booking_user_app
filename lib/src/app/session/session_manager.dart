import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../core/constants/app_constants.dart';
import '../../core/logging/app_logger.dart';
import '../../core/network/auth/token_pair.dart';
import '../../core/network/auth/token_storage.dart';
import '../../core/storage/preferences_storage.dart';
import 'app_session.dart';
import 'app_session_state.dart';

abstract interface class SessionManager extends ValueListenable<AppSession> {
  AppSession get currentSession;
  Stream<AppSession> get sessionStream;

  Future<void> restoreSession();
  Future<void> login({
    required TokenPair tokens,
    required String userId,
    String? role,
  });
  Future<void> logout();
  Future<void> markSessionExpired();
  Future<void> completeOnboarding();
}

class SessionManagerImpl extends ChangeNotifier
    implements SessionManager, TokenStorage {
  final TokenStorage secureTokenStorage;
  final PreferencesStorage preferencesStorage;
  final Logger logger;

  final _sessionController = StreamController<AppSession>.broadcast();
  AppSession _currentSession = const AppSession.unauthenticated();

  SessionManagerImpl({
    required this.secureTokenStorage,
    required this.preferencesStorage,
    required this.logger,
  });

  @override
  AppSession get value => _currentSession;

  @override
  AppSession get currentSession => _currentSession;

  @override
  Stream<AppSession> get sessionStream => _sessionController.stream;

  @override
  Future<void> restoreSession() async {
    try {
      logger.info('Restoring session from storage...');
      final accessToken = await secureTokenStorage.getAccessToken();
      final refreshToken = await secureTokenStorage.getRefreshToken();

      if (accessToken != null &&
          accessToken.isNotEmpty &&
          refreshToken != null &&
          refreshToken.isNotEmpty) {
        final userId =
            await preferencesStorage.getString(AppConstants.keySessionUser) ??
            'restored_user';
        final isOnboardingCompleted =
            await preferencesStorage.getBool(
              AppConstants.keyOnboardingComplete,
            ) ??
            true;

        _updateSession(
          AppSession.authenticated(
            userId: userId,
            isOnboardingCompleted: isOnboardingCompleted,
          ),
        );
        logger.info('Session restored successfully for user $userId');
      } else {
        _updateSession(const AppSession.unauthenticated());
        logger.info('No active session found.');
      }
    } catch (e, st) {
      logger.error('Failed to restore session: $e', e, st);
      _updateSession(const AppSession.unauthenticated());
    }
  }

  @override
  Future<void> login({
    required TokenPair tokens,
    required String userId,
    String? role,
  }) async {
    _updateSession(
      _currentSession.copyWith(status: AppSessionStatus.authenticating),
    );
    await secureTokenStorage.saveTokenPair(tokens);
    await preferencesStorage.setString(AppConstants.keySessionUser, userId);

    final isOnboardingCompleted =
        await preferencesStorage.getBool(AppConstants.keyOnboardingComplete) ??
        true;

    _updateSession(
      AppSession.authenticated(
        userId: userId,
        role: role,
        isOnboardingCompleted: isOnboardingCompleted,
      ),
    );
    logger.info('User logged in: $userId');
  }

  @override
  Future<void> logout() async {
    _updateSession(
      _currentSession.copyWith(status: AppSessionStatus.loggingOut),
    );
    await secureTokenStorage.clear();
    await preferencesStorage.remove(AppConstants.keySessionUser);
    _updateSession(const AppSession.unauthenticated());
    logger.info('User logged out');
  }

  @override
  Future<void> markSessionExpired() async {
    logger.warning('Session expired');
    await secureTokenStorage.clear();
    _updateSession(
      _currentSession.copyWith(status: AppSessionStatus.sessionExpired),
    );
  }

  @override
  Future<void> completeOnboarding() async {
    await preferencesStorage.setBool(AppConstants.keyOnboardingComplete, true);
    _updateSession(_currentSession.copyWith(isOnboardingCompleted: true));
  }

  void _updateSession(AppSession newSession) {
    _currentSession = newSession;
    _sessionController.add(newSession);
    notifyListeners();
  }

  // TokenStorage delegation
  @override
  Future<String?> getAccessToken() => secureTokenStorage.getAccessToken();

  @override
  Future<String?> getRefreshToken() => secureTokenStorage.getRefreshToken();

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) =>
      secureTokenStorage.saveTokenPair(tokenPair);

  @override
  Future<void> clear() => secureTokenStorage.clear();

  @override
  void dispose() {
    _sessionController.close();
    super.dispose();
  }
}
