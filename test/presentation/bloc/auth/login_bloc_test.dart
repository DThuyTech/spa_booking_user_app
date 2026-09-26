import 'package:bloc_test/bloc_test.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/auth/request_otp_result.dart';
import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:board_oi/src/presentation/view/auth/login/bloc/login_bloc.dart';
import 'package:board_oi/src/presentation/view/auth/login/bloc/login_event.dart';
import 'package:board_oi/src/presentation/view/auth/login/bloc/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRequestOtpUseCase extends Mock implements RequestOtpUseCase {}

void main() {
  late MockRequestOtpUseCase mockRequestOtpUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    mockRequestOtpUseCase = MockRequestOtpUseCase();
    loginBloc = LoginBloc(requestOtpUseCase: mockRequestOtpUseCase);
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc', () {
    const tPhone = '0900000001';
    const tOtpResult = RequestOtpResult(
      message: 'OTP sent successfully',
      expiresInSeconds: 300,
    );

    test('initial state should be idle and invalid', () {
      expect(loginBloc.state, const LoginState());
      expect(loginBloc.state.isValid, isFalse);
      expect(loginBloc.state.isLoading, isFalse);
      expect(loginBloc.state.isSuccess, isFalse);
    });

    blocTest<LoginBloc, LoginState>(
      'emits validating state with isValid true for a valid 10-digit phone',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginPhoneChanged(tPhone)),
      expect: () => [
        const LoginState(
          phone: tPhone,
          isValid: true,
          status: LoginStatus.validating,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits validating state with isValid false for an invalid phone',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginPhoneChanged('12345')),
      expect: () => [
        const LoginState(
          phone: '12345',
          isValid: false,
          status: LoginStatus.validating,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and success on valid phone submission and OTP request success',
      build: () {
        when(() => mockRequestOtpUseCase(tPhone))
            .thenAnswer((_) async => const Right(tOtpResult));
        return loginBloc;
      },
      seed: () => const LoginState(
        phone: tPhone,
        isValid: true,
        status: LoginStatus.validating,
      ),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          phone: tPhone,
          isValid: true,
          status: LoginStatus.loading,
        ),
        const LoginState(
          phone: tPhone,
          isValid: true,
          status: LoginStatus.success,
          otpResult: tOtpResult,
        ),
      ],
      verify: (_) {
        verify(() => mockRequestOtpUseCase(tPhone)).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and failure on OTP request error',
      build: () {
        when(() => mockRequestOtpUseCase(tPhone))
            .thenAnswer((_) async => const Left(NetworkFailure('Network error')));
        return loginBloc;
      },
      seed: () => const LoginState(
        phone: tPhone,
        isValid: true,
        status: LoginStatus.validating,
      ),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          phone: tPhone,
          isValid: true,
          status: LoginStatus.loading,
        ),
        const LoginState(
          phone: tPhone,
          isValid: true,
          status: LoginStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits failure directly if submitted with invalid phone',
      build: () => loginBloc,
      seed: () => const LoginState(
        phone: '012',
        isValid: false,
      ),
      act: (bloc) => bloc.add(const LoginSubmitted()),
      expect: () => [
        const LoginState(
          phone: '012',
          isValid: false,
          phoneError: 'Invalid phone number. Must be 10 digits.',
          status: LoginStatus.failure,
        ),
      ],
      verify: (_) {
        verifyNever(() => mockRequestOtpUseCase(any()));
      },
    );
  });
}
