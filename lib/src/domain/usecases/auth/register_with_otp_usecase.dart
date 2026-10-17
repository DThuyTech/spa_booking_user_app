import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class RegisterWithOtpUseCase {
  final AuthRepository repository;

  const RegisterWithOtpUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call({
    String? phoneNumber,
    String? email,
    required String otp,
    required String name,
    String? password,
  }) {
    return repository.registerWithOtp(
      phoneNumber: phoneNumber,
      email: email,
      otp: otp,
      name: name,
      password: password,
    );
  }
}
