import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginWithOtpUseCase {
  final AuthRepository repository;

  const LoginWithOtpUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call({
    required String identifier,
    required String otp,
  }) {
    return repository.loginWithOtp(identifier: identifier, otp: otp);
  }
}
