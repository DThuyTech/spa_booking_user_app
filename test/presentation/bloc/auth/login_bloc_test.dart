import 'package:bloc_test/bloc_test.dart';
import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:board_oi/src/domain/entities/auth/auth_session_entity.dart';
import 'package:board_oi/src/domain/entities/auth/user.dart';
import 'package:board_oi/src/domain/entities/auth/user_role_enum.dart';
import 'package:board_oi/src/domain/usecases/auth/login_usecase.dart';
import 'package:board_oi/src/presentation/bloc/auth/login/login_bloc.dart';
import 'package:board_oi/src/presentation/bloc/auth/login/login_event.dart';
import 'package:board_oi/src/presentation/bloc/auth/login/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockSessionManager extends Mock implements SessionManager {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockSessionManager mockSessionManager;
  late LoginBloc loginBloc;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockSessionManager = MockSessionManager();
    loginBloc = LoginBloc(
      loginUseCase: mockLoginUseCase,
      sessionManager: mockSessionManager,
    );
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';
    const tUser = User(
      id: 'usr_001',
      email: tEmail,
      fullName: 'Customer Test',
      role: UserRoleEnum.customer,
    );
    const tSession = AuthSessionEntity(
      accessToken: 'access_123',
      refreshToken: 'refresh_123',
      expiresIn: 900,
      user: tUser,
    );

    test('initial state should be idle and not loading', () {
      expect(loginBloc.state, const LoginState());
      expect(loginBloc.state.isLoading, isFalse);
      expect(loginBloc.state.isSuccess, isFalse);
    });

    blocTest<LoginBloc, LoginState>(
      'emits validating state when identifier changes',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginIdentifierChanged(tEmail)),
      expect: () => [
        const LoginState(identifier: tEmail, status: LoginStatus.validating),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits validating state when password changes',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginPasswordChanged(tPassword)),
      expect: () => [
        const LoginState(password: tPassword, status: LoginStatus.validating),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits failure directly if submitted with invalid email format',
      build: () => loginBloc,
      seed: () =>
          const LoginState(identifier: 'not-an-email', password: tPassword),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          identifier: 'not-an-email',
          password: tPassword,
          identifierError: 'Please enter a valid email address.',
          status: LoginStatus.failure,
        ),
      ],
      verify: (_) {
        verifyNever(
          () => mockLoginUseCase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        );
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and success on valid credentials submission',
      setUp: () {
        when(
          () => mockLoginUseCase(email: tEmail, password: tPassword),
        ).thenAnswer((_) async => const Right(tSession));
        when(
          () => mockSessionManager.login(
            tokens: any(named: 'tokens'),
            userId: any(named: 'userId'),
            role: any(named: 'role'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => loginBloc,
      seed: () => const LoginState(
        identifier: tEmail,
        password: tPassword,
        status: LoginStatus.validating,
      ),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          identifier: tEmail,
          password: tPassword,
          status: LoginStatus.loading,
        ),
        const LoginState(
          identifier: tEmail,
          password: tPassword,
          status: LoginStatus.success,
          authSession: tSession,
        ),
      ],
      verify: (_) {
        verify(
          () => mockLoginUseCase(email: tEmail, password: tPassword),
        ).called(1);
        verify(
          () => mockSessionManager.login(
            tokens: const TokenPair(
              accessToken: 'access_123',
              refreshToken: 'refresh_123',
            ),
            userId: 'usr_001',
            role: 'CUSTOMER',
          ),
        ).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and failure on login error',
      setUp: () {
        when(
          () => mockLoginUseCase(email: tEmail, password: tPassword),
        ).thenAnswer(
          (_) async => const Left(UnauthorizedFailure('Invalid credentials')),
        );
      },
      build: () => loginBloc,
      seed: () => const LoginState(
        identifier: tEmail,
        password: tPassword,
        status: LoginStatus.validating,
      ),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          identifier: tEmail,
          password: tPassword,
          status: LoginStatus.loading,
        ),
        const LoginState(
          identifier: tEmail,
          password: tPassword,
          status: LoginStatus.failure,
          errorMessage: 'Invalid credentials',
        ),
      ],
    );
  });
}
