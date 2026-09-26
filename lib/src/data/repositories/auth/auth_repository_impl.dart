import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/failure_mapper.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../../core/storage/session_storage.dart';
import '../../../domain/entities/auth/auth_session_entity.dart';
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
      return userResult.fold(
        (failure) => Left(failure),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
