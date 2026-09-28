import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.registerCustomer(email: email, password: password);
  }
}
