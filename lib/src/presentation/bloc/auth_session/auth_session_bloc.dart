import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/session/session_manager.dart';
import '../../../core/storage/session_storage.dart';
import '../../../domain/usecases/auth/logout_usecase.dart';
import '../../../domain/usecases/auth/refresh_token_usecase.dart';
import '../../../domain/usecases/auth/restore_session.dart';
import 'auth_session_event.dart';
import 'auth_session_state.dart';

export 'auth_session_event.dart';
export 'auth_session_state.dart';

class AuthSessionBloc extends Bloc<AuthSessionEvent, AuthSessionState> {
  final RestoreSession restoreSessionUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final LogoutUseCase logoutUseCase;
  final SessionStorage sessionStorage;
  final SessionManager sessionManager;

  StreamSubscription? _sessionSubscription;

  AuthSessionBloc({
    required this.restoreSessionUseCase,
    required this.refreshTokenUseCase,
    required this.logoutUseCase,
    required this.sessionStorage,
    required this.sessionManager,
  }) : super(const AuthSessionState.bootstrapping()) {
    on<RestoreSessionRequested>(_onRestoreSessionRequested);
    on<AuthSessionLoggedIn>(_onAuthSessionLoggedIn);
    on<TokenRefreshRequested>(_onTokenRefreshRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<SessionExpiredReceived>(_onSessionExpiredReceived);
    on<AuthSessionUserUpdated>((event, emit) {
      emit(AuthSessionState.authenticated(event.user));
    });

    // Synchronize if SessionManager marks session expired (e.g. from 401 interceptor)
    _sessionSubscription = sessionManager.sessionStream.listen((session) {
      if (session.status.isUnauthenticated && state.isAuthenticated) {
        add(const SessionExpiredReceived());
      }
    });
  }

  Future<void> restoreSession() async {
    add(const RestoreSessionRequested());
    await stream.firstWhere((s) => s.status != AuthSessionStatus.bootstrapping);
  }

  Future<void> _onRestoreSessionRequested(
    RestoreSessionRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(const AuthSessionState.bootstrapping());

    try {
      final accessToken = await sessionStorage.getAccessToken();
      final refreshToken = await sessionStorage.getRefreshToken();

      if (accessToken == null ||
          accessToken.isEmpty ||
          refreshToken == null ||
          refreshToken.isEmpty) {
        await sessionManager.restoreSession();
        emit(const AuthSessionState.unauthenticated());
        return;
      }

      // Check if access token is expired
      final isExpired = await sessionStorage.isTokenExpired();
      if (isExpired) {
        emit(const AuthSessionState.refreshing());
        final refreshResult = await refreshTokenUseCase(refreshToken);

        await refreshResult.fold(
          (failure) async {
            // Refresh failed: clear invalid session and go to unauthenticated
            await sessionStorage.clearSession();
            await sessionManager.markSessionExpired();
            emit(const AuthSessionState.unauthenticated());
          },
          (tokens) async {
            await sessionStorage.saveTokens(
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            );
            final userResult = await restoreSessionUseCase();
            await userResult.fold(
              (failure) async {
                await sessionStorage.clearSession();
                await sessionManager.markSessionExpired();
                emit(const AuthSessionState.unauthenticated());
              },
              (user) async {
                if (user != null) {
                  await sessionManager.login(
                    tokens: tokens,
                    userId: user.id,
                    role: user.role.value,
                  );
                  emit(AuthSessionState.authenticated(user));
                } else {
                  await sessionStorage.clearSession();
                  await sessionManager.markSessionExpired();
                  emit(const AuthSessionState.unauthenticated());
                }
              },
            );
          },
        );
        return;
      }

      // Access token is valid; fetch user profile
      final userResult = await restoreSessionUseCase();
      await userResult.fold(
        (failure) async {
          // If server fails or unauthorized, clear session
          await sessionStorage.clearSession();
          await sessionManager.markSessionExpired();
          emit(const AuthSessionState.unauthenticated());
        },
        (user) async {
          if (user != null) {
            await sessionManager.restoreSession();
            emit(AuthSessionState.authenticated(user));
          } else {
            await sessionStorage.clearSession();
            await sessionManager.restoreSession();
            emit(const AuthSessionState.unauthenticated());
          }
        },
      );
    } catch (e) {
      // Fail safely on storage error or exception
      await sessionStorage.clearSession();
      await sessionManager.restoreSession();
      emit(const AuthSessionState.unauthenticated());
    }
  }

  Future<void> _onAuthSessionLoggedIn(
    AuthSessionLoggedIn event,
    Emitter<AuthSessionState> emit,
  ) async {
    await sessionManager.login(
      tokens: event.tokens,
      userId: event.user.id,
      role: event.user.role.value,
    );
    emit(AuthSessionState.authenticated(event.user));
  }

  Future<void> _onTokenRefreshRequested(
    TokenRefreshRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    final rToken = await sessionStorage.getRefreshToken();
    if (rToken == null || rToken.isEmpty) {
      add(const SessionExpiredReceived());
      return;
    }

    emit(AuthSessionState.refreshing(user: state.user));
    final result = await refreshTokenUseCase(rToken);

    await result.fold(
      (failure) async {
        add(const SessionExpiredReceived());
      },
      (tokens) async {
        await sessionStorage.saveTokens(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );
        if (state.user != null) {
          emit(AuthSessionState.authenticated(state.user!));
        } else {
          add(const RestoreSessionRequested());
        }
      },
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(AuthSessionState.refreshing(user: state.user));

    try {
      await logoutUseCase();
    } catch (_) {
      // Ensure local session is cleared regardless of network failure
    }

    await sessionStorage.clearSession();
    await sessionManager.logout();
    emit(const AuthSessionState.unauthenticated());
  }

  Future<void> _onSessionExpiredReceived(
    SessionExpiredReceived event,
    Emitter<AuthSessionState> emit,
  ) async {
    await sessionStorage.clearSession();
    await sessionManager.markSessionExpired();
    emit(const AuthSessionState.unauthenticated());
  }

  @override
  Future<void> close() {
    _sessionSubscription?.cancel();
    return super.close();
  }
}
