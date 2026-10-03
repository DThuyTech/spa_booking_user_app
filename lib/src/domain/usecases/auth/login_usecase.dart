import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.loginCustomer(email: email, password: password);
  }
}
