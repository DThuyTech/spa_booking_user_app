import 'package:bloc_test/bloc_test.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/auth/auth_session_entity.dart';
import 'package:board_oi/src/domain/entities/auth/request_otp_result.dart';
import 'package:board_oi/src/domain/entities/auth/user.dart';
import 'package:board_oi/src/domain/entities/auth/user_role_enum.dart';
import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:board_oi/src/presentation/bloc/auth/otp_verification/otp_verification_bloc.dart';
import 'package:board_oi/src/presentation/bloc/auth/otp_verification/otp_verification_event.dart';
import 'package:board_oi/src/presentation/bloc/auth/otp_verification/otp_verification_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

class MockRequestOtpUseCase extends Mock implements RequestOtpUseCase {}

void main() {
  late MockVerifyOtpUseCase mockVerifyOtpUseCase;
  late MockRequestOtpUseCase mockRequestOtpUseCase;
  late OtpVerificationBloc otpBloc;

  setUp(() {
    mockVerifyOtpUseCase = MockVerifyOtpUseCase();
    mockRequestOtpUseCase = MockRequestOtpUseCase();
    otpBloc = OtpVerificationBloc(
      verifyOtpUseCase: mockVerifyOtpUseCase,
      requestOtpUseCase: mockRequestOtpUseCase,
    );
  });

  tearDown(() {
    otpBloc.close();
  });

  group('OtpVerificationBloc', () {
    const tPhone = '0900000001';
    const tCode = '123456';
    const tUser = User(
      id: 'usr_001',
      phone: tPhone,
      fullName: 'Aura Customer',
      role: UserRoleEnum.customer,
    );
    const tSession = AuthSessionEntity(
      accessToken: 'access_123',
      refreshToken: 'refresh_123',
      expiresIn: 86400,
      user: tUser,
    );

    test('initial state has empty code and default values', () {
      expect(otpBloc.state, const OtpVerificationState());
      expect(otpBloc.state.code, isEmpty);
      expect(otpBloc.state.isVerifying, isFalse);
      expect(otpBloc.state.isVerified, isFalse);
    });

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'formats countdown and masks phone number correctly',
      build: () => otpBloc,
      seed: () =>
          const OtpVerificationState(phone: tPhone, remainingSeconds: 45),
      verify: (bloc) {
        expect(bloc.state.formattedCountdown, equals('00:45'));
        expect(bloc.state.maskedPhone, equals('+84 *** *** 001'));
      },
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'emits entering state on digit change without auto-submit when length < 6',
      build: () => otpBloc,
      act: (bloc) => bloc.add(const OtpDigitChanged('123')),
      expect: () => [
        const OtpVerificationState(code: '123', status: OtpStatus.entering),
      ],
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'verifies OTP successfully on valid 6-digit code',
      build: () {
        when(
          () => mockVerifyOtpUseCase(phone: tPhone, code: tCode),
        ).thenAnswer((_) async => const Right(tSession));
        return otpBloc;
      },
      seed: () => const OtpVerificationState(
        phone: tPhone,
        code: tCode,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpSubmitted()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          code: tCode,
          status: OtpStatus.verifying,
        ),
        const OtpVerificationState(
          phone: tPhone,
          code: tCode,
          status: OtpStatus.verified,
          authSession: tSession,
        ),
      ],
      verify: (_) {
        verify(
          () => mockVerifyOtpUseCase(phone: tPhone, code: tCode),
        ).called(1);
      },
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'emits failure on incorrect OTP verification',
      build: () {
        when(
          () => mockVerifyOtpUseCase(phone: tPhone, code: '000000'),
        ).thenAnswer(
          (_) async => const Left(UnauthorizedFailure('Invalid code')),
        );
        return otpBloc;
      },
      seed: () => const OtpVerificationState(
        phone: tPhone,
        code: '000000',
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpSubmitted()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          code: '000000',
          status: OtpStatus.verifying,
        ),
        const OtpVerificationState(
          phone: tPhone,
          code: '000000',
          status: OtpStatus.failure,
          errorMessage: 'Invalid verification code. Please try again.',
        ),
      ],
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'resends OTP when countdown has reached 0',
      build: () {
        when(() => mockRequestOtpUseCase(tPhone)).thenAnswer(
          (_) async => const Right(
            RequestOtpResult(message: 'Sent', expiresInSeconds: 60),
          ),
        );
        return otpBloc;
      },
      seed: () => const OtpVerificationState(
        phone: tPhone,
        remainingSeconds: 0,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpResendRequested()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          remainingSeconds: 0,
          status: OtpStatus.resending,
        ),
        const OtpVerificationState(
          phone: tPhone,
          code: '',
          remainingSeconds: 60,
          status: OtpStatus.entering,
        ),
      ],
      verify: (_) {
        verify(() => mockRequestOtpUseCase(tPhone)).called(1);
      },
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'does not resend OTP when countdown is still active',
      build: () => otpBloc,
      seed: () => const OtpVerificationState(
        phone: tPhone,
        remainingSeconds: 45,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpResendRequested()),
      expect: () => [],
      verify: (_) {
        verifyNever(() => mockRequestOtpUseCase(any()));
      },
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'emits failure when resend OTP fails',
      build: () {
        when(() => mockRequestOtpUseCase(tPhone)).thenAnswer(
          (_) async => const Left(ServerFailure('Resend limit exceeded')),
        );
        return otpBloc;
      },
      seed: () => const OtpVerificationState(
        phone: tPhone,
        remainingSeconds: 0,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpResendRequested()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          remainingSeconds: 0,
          status: OtpStatus.resending,
        ),
        const OtpVerificationState(
          phone: tPhone,
          remainingSeconds: 0,
          status: OtpStatus.failure,
          errorMessage: 'Resend limit exceeded',
        ),
      ],
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'emits failure immediately when verifying expired OTP',
      build: () => otpBloc,
      seed: () => const OtpVerificationState(
        phone: tPhone,
        code: tCode,
        remainingSeconds: 0,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpSubmitted()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          code: tCode,
          remainingSeconds: 0,
          status: OtpStatus.failure,
          errorMessage:
              'Verification code has expired. Please request a new one.',
        ),
      ],
      verify: (_) {
        verifyNever(
          () => mockVerifyOtpUseCase(
            phone: any(named: 'phone'),
            code: any(named: 'code'),
          ),
        );
      },
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'emits failure on network failure during verification',
      build: () {
        when(
          () => mockVerifyOtpUseCase(phone: tPhone, code: tCode),
        ).thenAnswer((_) async => const Left(NetworkFailure('No connection')));
        return otpBloc;
      },
      seed: () => const OtpVerificationState(
        phone: tPhone,
        code: tCode,
        status: OtpStatus.entering,
      ),
      act: (bloc) => bloc.add(const OtpSubmitted()),
      expect: () => [
        const OtpVerificationState(
          phone: tPhone,
          code: tCode,
          status: OtpStatus.verifying,
        ),
        const OtpVerificationState(
          phone: tPhone,
          code: tCode,
          status: OtpStatus.failure,
          errorMessage: 'Invalid verification code. Please try again.',
        ),
      ],
    );

    blocTest<OtpVerificationBloc, OtpVerificationState>(
      'updates remainingSeconds on OtpTimerTicked',
      build: () => otpBloc,
      act: (bloc) => bloc.add(const OtpTimerTicked(0)),
      expect: () => [const OtpVerificationState(remainingSeconds: 0)],
      verify: (bloc) {
        expect(bloc.state.canResend, isTrue);
      },
    );
  });
}
