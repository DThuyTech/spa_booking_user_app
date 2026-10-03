import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/app/session/session_manager.dart';
import 'package:spa_booking/src/core/network/auth/token_pair.dart';
import 'package:spa_booking/src/domain/entities/auth/auth_session_entity.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/usecases/auth/register_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth/register/register_bloc.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockSessionManager extends Mock implements SessionManager {}

class FakeTokenPair extends Fake implements TokenPair {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeTokenPair());
  });

  late MockRegisterUseCase mockRegisterUseCase;
  late MockSessionManager mockSessionManager;
  late RegisterBloc registerBloc;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockSessionManager = MockSessionManager();
    registerBloc = RegisterBloc(
      registerUseCase: mockRegisterUseCase,
      sessionManager: mockSessionManager,
    );
  });

  tearDown(() {
    registerBloc.close();
  });

  group('RegisterBloc - Confirm Password & Validation', () {
    const tFullName = 'Jane Doe';
    const tEmail = 'jane@example.com';
    const tPassword = 'securePassword123';
    const tUser = User(
      id: 'usr_002',
      email: tEmail,
      fullName: tFullName,
      role: UserRoleEnum.customer,
    );
    const tSession = AuthSessionEntity(
      accessToken: 'access_abc',
      refreshToken: 'refresh_abc',
      expiresIn: 900,
      user: tUser,
    );

    test('initial state has empty confirmPassword and cannot submit', () {
      expect(registerBloc.state.confirmPassword, '');
      expect(registerBloc.state.canSubmit, isFalse);
    });

    blocTest<RegisterBloc, RegisterState>(
      'updates confirmPassword and checks isPasswordMatched',
      build: () => registerBloc,
      seed: () => const RegisterState(password: tPassword),
      act: (bloc) => bloc.add(const RegisterConfirmPasswordChanged(tPassword)),
      expect: () => [
        const RegisterState(password: tPassword, confirmPassword: tPassword),
      ],
      verify: (bloc) {
        expect(bloc.state.isPasswordMatched, isTrue);
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'fails registration with error if passwords do not match',
      build: () => registerBloc,
      seed: () => const RegisterState(
        fullName: tFullName,
        identifier: tEmail,
        password: tPassword,
        confirmPassword: 'mismatchedPassword',
      ),
      act: (bloc) => bloc.add(const RegisterSubmitted()),
      expect: () => [
        const RegisterState(
          fullName: tFullName,
          identifier: tEmail,
          password: tPassword,
          confirmPassword: 'mismatchedPassword',
          status: RegisterStatus.failure,
          errorMessage: 'Passwords do not match.',
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'submits successfully when passwords match',
      setUp: () {
        when(
          () => mockRegisterUseCase(
            email: tEmail,
            password: tPassword,
            fullName: tFullName,
          ),
        ).thenAnswer((_) async => const Right(tSession));
        when(
          () => mockSessionManager.login(
            tokens: any(named: 'tokens'),
            userId: any(named: 'userId'),
            role: any(named: 'role'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => registerBloc,
      seed: () => const RegisterState(
        fullName: tFullName,
        identifier: tEmail,
        password: tPassword,
        confirmPassword: tPassword,
      ),
      act: (bloc) => bloc.add(const RegisterSubmitted()),
      expect: () => [
        const RegisterState(
          fullName: tFullName,
          identifier: tEmail,
          password: tPassword,
          confirmPassword: tPassword,
          status: RegisterStatus.loading,
        ),
        const RegisterState(
          fullName: tFullName,
          identifier: tEmail,
          password: tPassword,
          confirmPassword: tPassword,
          status: RegisterStatus.success,
          authSession: tSession,
        ),
      ],
    );
  });
}
