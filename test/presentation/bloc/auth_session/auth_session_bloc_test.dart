import 'package:bloc_test/bloc_test.dart';
import 'package:spa_booking/src/app/session/app_session.dart';
import 'package:spa_booking/src/app/session/session_manager.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/network/auth/token_pair.dart';
import 'package:spa_booking/src/core/storage/session_storage.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/usecases/auth/logout_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/refresh_token_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/restore_session.dart';
import 'package:spa_booking/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRestoreSession extends Mock implements RestoreSession {}

class MockRefreshTokenUseCase extends Mock implements RefreshTokenUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockSessionStorage extends Mock implements SessionStorage {}

class MockSessionManager extends Mock implements SessionManager {}

void main() {
  late MockRestoreSession mockRestoreSession;
  late MockRefreshTokenUseCase mockRefreshTokenUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockSessionStorage mockSessionStorage;
  late MockSessionManager mockSessionManager;
  late AuthSessionBloc authSessionBloc;

  const tUser = User(
    id: 'user_001',
    phone: '0900000001',
    fullName: 'Luminous Glow',
    role: UserRoleEnum.customer,
  );

  const tTokenPair = TokenPair(
    accessToken: 'valid_access_token',
    refreshToken: 'valid_refresh_token',
  );

  setUpAll(() {
    registerFallbackValue(const TokenPair(accessToken: '', refreshToken: ''));
  });

  setUp(() {
    mockRestoreSession = MockRestoreSession();
    mockRefreshTokenUseCase = MockRefreshTokenUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockSessionStorage = MockSessionStorage();
    mockSessionManager = MockSessionManager();

    when(
      () => mockSessionManager.sessionStream,
    ).thenAnswer((_) => const Stream<AppSession>.empty());
    when(() => mockSessionManager.restoreSession()).thenAnswer((_) async {});
    when(
      () => mockSessionManager.login(
        tokens: any(named: 'tokens'),
        userId: any(named: 'userId'),
        role: any(named: 'role'),
      ),
    ).thenAnswer((_) async {});
    when(() => mockSessionManager.logout()).thenAnswer((_) async {});
    when(
      () => mockSessionManager.markSessionExpired(),
    ).thenAnswer((_) async {});

    authSessionBloc = AuthSessionBloc(
      restoreSessionUseCase: mockRestoreSession,
      refreshTokenUseCase: mockRefreshTokenUseCase,
      logoutUseCase: mockLogoutUseCase,
      sessionStorage: mockSessionStorage,
      sessionManager: mockSessionManager,
    );
  });

  tearDown(() {
    authSessionBloc.close();
  });

  group('AuthSessionBloc', () {
    test('initial state is bootstrapping', () {
      expect(authSessionBloc.state, const AuthSessionState.bootstrapping());
      expect(authSessionBloc.state.isBootstrapping, isTrue);
    });

    group('RestoreSessionRequested', () {
      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits [bootstrapping, unauthenticated] when no tokens exist in storage',
        build: () {
          when(
            () => mockSessionStorage.getAccessToken(),
          ).thenAnswer((_) async => null);
          when(
            () => mockSessionStorage.getRefreshToken(),
          ).thenAnswer((_) async => null);
          return authSessionBloc;
        },
        act: (bloc) => bloc.add(const RestoreSessionRequested()),
        expect: () => [
          const AuthSessionState.bootstrapping(),
          const AuthSessionState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockSessionManager.restoreSession()).called(1);
        },
      );

      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits [bootstrapping, authenticated] when valid tokens exist and token is not expired',
        build: () {
          when(
            () => mockSessionStorage.getAccessToken(),
          ).thenAnswer((_) async => tTokenPair.accessToken);
          when(
            () => mockSessionStorage.getRefreshToken(),
          ).thenAnswer((_) async => tTokenPair.refreshToken);
          when(
            () => mockSessionStorage.isTokenExpired(),
          ).thenAnswer((_) async => false);
          when(
            () => mockRestoreSession(),
          ).thenAnswer((_) async => const Right(tUser));
          return authSessionBloc;
        },
        act: (bloc) => bloc.add(const RestoreSessionRequested()),
        expect: () => [
          const AuthSessionState.bootstrapping(),
          const AuthSessionState.authenticated(tUser),
        ],
        verify: (_) {
          verify(() => mockRestoreSession()).called(1);
          verify(() => mockSessionManager.restoreSession()).called(1);
        },
      );

      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits [bootstrapping, refreshing, authenticated] when access token is expired but refresh succeeds',
        build: () {
          when(
            () => mockSessionStorage.getAccessToken(),
          ).thenAnswer((_) async => 'expired_access');
          when(
            () => mockSessionStorage.getRefreshToken(),
          ).thenAnswer((_) async => 'valid_refresh');
          when(
            () => mockSessionStorage.isTokenExpired(),
          ).thenAnswer((_) async => true);
          when(
            () => mockRefreshTokenUseCase('valid_refresh'),
          ).thenAnswer((_) async => const Right(tTokenPair));
          when(
            () => mockSessionStorage.saveTokens(
              accessToken: any(named: 'accessToken'),
              refreshToken: any(named: 'refreshToken'),
            ),
          ).thenAnswer((_) async {});
          when(
            () => mockRestoreSession(),
          ).thenAnswer((_) async => const Right(tUser));
          return authSessionBloc;
        },
        act: (bloc) => bloc.add(const RestoreSessionRequested()),
        expect: () => [
          const AuthSessionState.bootstrapping(),
          const AuthSessionState.refreshing(),
          const AuthSessionState.authenticated(tUser),
        ],
        verify: (_) {
          verify(() => mockRefreshTokenUseCase('valid_refresh')).called(1);
          verify(
            () => mockSessionManager.login(
              tokens: tTokenPair,
              userId: tUser.id,
              role: tUser.role.value,
            ),
          ).called(1);
        },
      );

      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits [bootstrapping, refreshing, unauthenticated] when access token is expired and refresh fails',
        build: () {
          when(
            () => mockSessionStorage.getAccessToken(),
          ).thenAnswer((_) async => 'expired_access');
          when(
            () => mockSessionStorage.getRefreshToken(),
          ).thenAnswer((_) async => 'invalid_refresh');
          when(
            () => mockSessionStorage.isTokenExpired(),
          ).thenAnswer((_) async => true);
          when(() => mockRefreshTokenUseCase('invalid_refresh')).thenAnswer(
            (_) async => const Left(UnauthorizedFailure('Token revoked')),
          );
          when(
            () => mockSessionStorage.clearSession(),
          ).thenAnswer((_) async {});
          return authSessionBloc;
        },
        act: (bloc) => bloc.add(const RestoreSessionRequested()),
        expect: () => [
          const AuthSessionState.bootstrapping(),
          const AuthSessionState.refreshing(),
          const AuthSessionState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockSessionStorage.clearSession()).called(1);
          verify(() => mockSessionManager.markSessionExpired()).called(1);
        },
      );

      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits [bootstrapping, unauthenticated] and fails safely if storage is corrupted',
        build: () {
          when(
            () => mockSessionStorage.getAccessToken(),
          ).thenThrow(Exception('Secure storage corrupted'));
          when(
            () => mockSessionStorage.clearSession(),
          ).thenAnswer((_) async {});
          return authSessionBloc;
        },
        act: (bloc) => bloc.add(const RestoreSessionRequested()),
        expect: () => [
          const AuthSessionState.bootstrapping(),
          const AuthSessionState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockSessionStorage.clearSession()).called(1);
        },
      );
    });

    group('AuthSessionLoggedIn', () {
      blocTest<AuthSessionBloc, AuthSessionState>(
        'emits authenticated state and updates SessionManager',
        build: () => authSessionBloc,
        act: (bloc) => bloc.add(
          const AuthSessionLoggedIn(user: tUser, tokens: tTokenPair),
        ),
        expect: () => [const AuthSessionState.authenticated(tUser)],
        verify: (_) {
          verify(
            () => mockSessionManager.login(
              tokens: tTokenPair,
              userId: tUser.id,
              role: tUser.role.value,
            ),
          ).called(1);
        },
      );
    });

    group('LogoutRequested', () {
      blocTest<AuthSessionBloc, AuthSessionState>(
        'clears storage, notifies SessionManager, and emits unauthenticated even on remote failure',
        build: () {
          when(
            () => mockLogoutUseCase(),
          ).thenAnswer((_) async => const Left(ServerFailure('Offline')));
          when(
            () => mockSessionStorage.clearSession(),
          ).thenAnswer((_) async {});
          return authSessionBloc;
        },
        seed: () => const AuthSessionState.authenticated(tUser),
        act: (bloc) => bloc.add(const LogoutRequested()),
        expect: () => [
          const AuthSessionState.refreshing(user: tUser),
          const AuthSessionState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockSessionStorage.clearSession()).called(1);
          verify(() => mockSessionManager.logout()).called(1);
        },
      );
    });

    group('SessionExpiredReceived', () {
      blocTest<AuthSessionBloc, AuthSessionState>(
        'clears session storage and emits unauthenticated',
        build: () {
          when(
            () => mockSessionStorage.clearSession(),
          ).thenAnswer((_) async {});
          return authSessionBloc;
        },
        seed: () => const AuthSessionState.authenticated(tUser),
        act: (bloc) => bloc.add(const SessionExpiredReceived()),
        expect: () => [const AuthSessionState.unauthenticated()],
        verify: (_) {
          verify(() => mockSessionStorage.clearSession()).called(1);
          verify(() => mockSessionManager.markSessionExpired()).called(1);
        },
      );
    });
  });
}
