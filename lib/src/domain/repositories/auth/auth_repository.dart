import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../entities/auth/request_otp_result.dart';
import '../../entities/auth/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthSessionEntity>> loginCustomer({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthSessionEntity>> registerCustomer({
    required String email,
    required String password,
    String? fullName,
  });

  Future<Either<Failure, RequestOtpResult>> requestOtp(String phone);

  Future<Either<Failure, AuthSessionEntity>> verifyOtp({
    required String phone,
    required String code,
  });

  Future<Either<Failure, TokenPair>> refreshToken(String refreshToken);

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, User>> createCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<Either<Failure, User>> updateCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<Either<Failure, User>> saveCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
    bool isCreate = false,
  });

  Future<Either<Failure, User?>> restoreSession();
}
