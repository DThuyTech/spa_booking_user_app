import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:board_oi/src/domain/entities/auth/auth_session_entity.dart';
import 'package:board_oi/src/domain/entities/auth/request_otp_result.dart';
import 'package:board_oi/src/domain/entities/auth/user.dart';
import 'package:board_oi/src/domain/entities/auth/user_role_enum.dart';
import 'package:board_oi/src/domain/repositories/auth/auth_repository.dart';
import 'package:board_oi/src/domain/usecases/auth/logout_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/refresh_token_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late RequestOtpUseCase requestOtpUseCase;
  late VerifyOtpUseCase verifyOtpUseCase;
  late RefreshTokenUseCase refreshTokenUseCase;
  late LogoutUseCase logoutUseCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    requestOtpUseCase = RequestOtpUseCase(mockRepository);
    verifyOtpUseCase = VerifyOtpUseCase(mockRepository);
    refreshTokenUseCase = RefreshTokenUseCase(mockRepository);
    logoutUseCase = LogoutUseCase(mockRepository);
  });

  group('RequestOtpUseCase', () {
    const tPhone = '0900000001';
    const tResult = RequestOtpResult(
      message: 'OTP sent successfully',
      expiresInSeconds: 300,
    );

    test('should return RequestOtpResult on success', () async {
      when(
        () => mockRepository.requestOtp(tPhone),
      ).thenAnswer((_) async => const Right(tResult));

      final result = await requestOtpUseCase(tPhone);

      expect(result, const Right(tResult));
      verify(() => mockRepository.requestOtp(tPhone)).called(1);
    });

    test('should return Failure on error', () async {
      const failure = NetworkFailure('Connection error');
      when(
        () => mockRepository.requestOtp(tPhone),
      ).thenAnswer((_) async => const Left(failure));

      final result = await requestOtpUseCase(tPhone);

      expect(result, const Left(failure));
      verify(() => mockRepository.requestOtp(tPhone)).called(1);
    });
  });

  group('VerifyOtpUseCase', () {
    const tPhone = '0900000001';
    const tCode = '123456';
    const tUser = User(
      id: 'usr_001',
      phone: tPhone,
      fullName: 'Aura Customer',
      role: UserRoleEnum.customer,
    );
    const tSession = AuthSessionEntity(
      accessToken: 'access_token_123',
      refreshToken: 'refresh_token_123',
      expiresIn: 86400,
      user: tUser,
    );

    test('should return AuthSessionEntity on success', () async {
      when(
        () => mockRepository.verifyOtp(phone: tPhone, code: tCode),
      ).thenAnswer((_) async => const Right(tSession));

      final result = await verifyOtpUseCase(phone: tPhone, code: tCode);

      expect(result, const Right(tSession));
      verify(
        () => mockRepository.verifyOtp(phone: tPhone, code: tCode),
      ).called(1);
    });

    test('should return Failure on invalid OTP', () async {
      const failure = UnauthorizedFailure('Invalid code');
      when(
        () => mockRepository.verifyOtp(phone: tPhone, code: tCode),
      ).thenAnswer((_) async => const Left(failure));

      final result = await verifyOtpUseCase(phone: tPhone, code: tCode);

      expect(result, const Left(failure));
      verify(
        () => mockRepository.verifyOtp(phone: tPhone, code: tCode),
      ).called(1);
    });
  });

  group('RefreshTokenUseCase', () {
    const tRefreshToken = 'valid_refresh_token';
    const tTokenPair = TokenPair(
      accessToken: 'new_access_token',
      refreshToken: 'new_refresh_token',
    );

    test('should return TokenPair on refresh success', () async {
      when(
        () => mockRepository.refreshToken(tRefreshToken),
      ).thenAnswer((_) async => const Right(tTokenPair));

      final result = await refreshTokenUseCase(tRefreshToken);

      expect(result, const Right(tTokenPair));
      verify(() => mockRepository.refreshToken(tRefreshToken)).called(1);
    });

    test('should return Failure on refresh failure', () async {
      const failure = UnauthorizedFailure('Token expired');
      when(
        () => mockRepository.refreshToken(tRefreshToken),
      ).thenAnswer((_) async => const Left(failure));

      final result = await refreshTokenUseCase(tRefreshToken);

      expect(result, const Left(failure));
      verify(() => mockRepository.refreshToken(tRefreshToken)).called(1);
    });
  });

  group('LogoutUseCase', () {
    test('should return Unit on successful logout', () async {
      when(
        () => mockRepository.logout(),
      ).thenAnswer((_) async => const Right(unit));

      final result = await logoutUseCase();

      expect(result, const Right(unit));
      verify(() => mockRepository.logout()).called(1);
    });
  });
}
