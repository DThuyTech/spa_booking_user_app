import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/failure_mapper.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../../core/storage/session_storage.dart';
import '../../../domain/entities/auth/auth_session_entity.dart';
import '../../../domain/entities/auth/forgot_password_result.dart';
import '../../../domain/entities/auth/request_otp_result.dart';
import '../../../domain/entities/auth/user.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../datasources/remote/auth/auth_remote_data_source.dart';
import '../../mapper/auth/auth_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final SessionStorage sessionStorage;

  const AuthRepositoryImpl({
    required this.remote,
    required this.sessionStorage,
  });

  @override
  Future<Either<Failure, AuthSessionEntity>> loginCustomer({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remote.loginCustomer(
        email: email,
        password: password,
      );
      final entity = AuthMapper.toAuthSessionEntityFromAuthResponse(response);

      await sessionStorage.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresInSeconds: entity.expiresIn,
      );
      await sessionStorage.saveUserData(entity.user.id);

      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> registerCustomer({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      final response = await remote.registerCustomer(
        email: email,
        password: password,
        fullName: fullName,
      );
      final entity = AuthMapper.toAuthSessionEntityFromAuthResponse(response);

      await sessionStorage.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresInSeconds: entity.expiresIn,
      );
      await sessionStorage.saveUserData(entity.user.id);

      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, RequestOtpResult>> requestOtp(String phone) async {
    try {
      final response = await remote.requestOtp(phone);
      return Right(AuthMapper.toRequestOtpResult(response));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> verifyOtp({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await remote.verifyOtp(phone: phone, code: code);
      final entity = AuthMapper.toAuthSessionEntity(response);

      // Persist session tokens securely with expiration
      await sessionStorage.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresInSeconds: entity.expiresIn,
      );
      await sessionStorage.saveUserData(entity.user.id);

      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, TokenPair>> refreshToken(String refreshToken) async {
    try {
      final response = await remote.refreshToken(refreshToken);
      final tokens = AuthMapper.toTokenPair(response);
      await sessionStorage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );
      return Right(tokens);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      try {
        await remote.logout();
      } catch (_) {
        // Even if remote logout fails, proceed to clear local session
      }
      await sessionStorage.clearSession();
      return const Right(unit);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final model = await remote.getCurrentUser();
      final user = AuthMapper.toUser(model);
      await sessionStorage.saveUserData(user.id);
      return Right(user);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> createCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    try {
      final model = await remote.createCustomerProfile(
        name: name,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
      );
      final user = AuthMapper.toUser(model);
      await sessionStorage.saveUserData(user.id);
      return Right(user);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> updateCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    try {
      final model = await remote.updateCustomerProfile(
        name: name,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
      );
      final user = AuthMapper.toUser(model);
      await sessionStorage.saveUserData(user.id);
      return Right(user);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> saveCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
    bool isCreate = false,
  }) async {
    if (isCreate) {
      final createResult = await createCustomerProfile(
        name: name,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
      );
      return createResult.fold((failure) async {
        if (failure is ConflictFailure) {
          return updateCustomerProfile(
            name: name,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
          );
        }
        return Left(failure);
      }, (user) => Right(user));
    } else {
      final updateResult = await updateCustomerProfile(
        name: name,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
      );
      return updateResult.fold((failure) async {
        if (failure is NotFoundFailure) {
          return createCustomerProfile(
            name: name,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
          );
        }
        return Left(failure);
      }, (user) => Right(user));
    }
  }

  @override
  Future<Either<Failure, User?>> restoreSession() async {
    try {
      final token = await sessionStorage.getAccessToken();
      final rToken = await sessionStorage.getRefreshToken();
      if (token == null || token.isEmpty || rToken == null || rToken.isEmpty) {
        return const Right(null);
      }

      // Check if access token is expired
      final isExpired = await sessionStorage.isTokenExpired();
      if (isExpired) {
        final refreshResult = await refreshToken(rToken);
        return refreshResult.fold(
          (failure) async {
            await sessionStorage.clearSession();
            return Left(failure);
          },
          (_) async {
            final userResult = await getCurrentUser();
            return userResult.fold(
              (failure) => Left(failure),
              (user) => Right(user),
            );
          },
        );
      }

      final userResult = await getCurrentUser();
      return userResult.fold((failure) => Left(failure), (user) => Right(user));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    try {
      await remote.deleteAccount();
      await sessionStorage.clearSession();
      return const Right(unit);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword({
    String? oldPassword,
    required String newPassword,
  }) async {
    try {
      final message = await remote.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return Right(message);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResult>> forgotPassword({
    required String phone,
  }) async {
    try {
      final response = await remote.forgotPassword(phone: phone);
      final entity = AuthMapper.toForgotPasswordResult(response);
      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyResetOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final message = await remote.verifyResetOtp(phone: phone, otp: otp);
      return Right(message);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final message = await remote.resetPassword(
        phone: phone,
        otp: otp,
        newPassword: newPassword,
      );
      return Right(message);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, RequestOtpResult>> sendRegisterOtp({
    String? phoneNumber,
    String? email,
  }) async {
    try {
      final response = await remote.sendRegisterOtp(
        phoneNumber: phoneNumber,
        email: email,
      );
      return Right(AuthMapper.toRequestOtpResult(response));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> registerWithOtp({
    String? phoneNumber,
    String? email,
    required String otp,
    required String name,
    String? password,
  }) async {
    try {
      final response = await remote.registerWithOtp(
        phoneNumber: phoneNumber,
        email: email,
        otp: otp,
        name: name,
        password: password,
      );
      final entity = AuthMapper.toAuthSessionEntityFromAuthResponse(response);

      await sessionStorage.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresInSeconds: entity.expiresIn,
      );
      await sessionStorage.saveUserData(entity.user.id);

      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, RequestOtpResult>> sendLoginOtp({
    required String identifier,
  }) async {
    try {
      final response = await remote.sendLoginOtp(identifier: identifier);
      return Right(AuthMapper.toRequestOtpResult(response));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> loginWithOtp({
    required String identifier,
    required String otp,
  }) async {
    try {
      final response = await remote.loginWithOtp(
        identifier: identifier,
        otp: otp,
      );
      final entity = AuthMapper.toAuthSessionEntityFromAuthResponse(response);

      await sessionStorage.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresInSeconds: entity.expiresIn,
      );
      await sessionStorage.saveUserData(entity.user.id);

      return Right(entity);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, RequestOtpResult>> requestChangeEmail({
    required String newEmail,
  }) async {
    try {
      final response = await remote.requestChangeEmail(newEmail: newEmail);
      return Right(AuthMapper.toRequestOtpResult(response));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> verifyChangeEmail({
    required String newEmail,
    required String otp,
  }) async {
    try {
      final userModel = await remote.verifyChangeEmail(
        newEmail: newEmail,
        otp: otp,
      );
      return Right(AuthMapper.toUser(userModel));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, RequestOtpResult>> requestChangePhone({
    required String newPhone,
  }) async {
    try {
      final response = await remote.requestChangePhone(newPhone: newPhone);
      return Right(AuthMapper.toRequestOtpResult(response));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, User>> verifyChangePhone({
    required String newPhone,
    required String otp,
  }) async {
    try {
      final userModel = await remote.verifyChangePhone(
        newPhone: newPhone,
        otp: otp,
      );
      return Right(AuthMapper.toUser(userModel));
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeCustomerEmail() async {
    try {
      await remote.removeCustomerEmail();
      return const Right(unit);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeCustomerPhone() async {
    try {
      await remote.removeCustomerPhone();
      return const Right(unit);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
