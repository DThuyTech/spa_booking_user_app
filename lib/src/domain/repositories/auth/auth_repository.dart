import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../entities/auth/forgot_password_result.dart';
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
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<Either<Failure, User>> updateCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<Either<Failure, User>> saveCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
    bool isCreate = false,
  });

  Future<Either<Failure, User?>> restoreSession();

  Future<Either<Failure, Unit>> deleteAccount();

  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<Either<Failure, ForgotPasswordResult>> forgotPassword({
    required String phone,
  });

  Future<Either<Failure, String>> verifyResetOtp({
    required String phone,
    required String otp,
  });

  Future<Either<Failure, String>> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  });
}
