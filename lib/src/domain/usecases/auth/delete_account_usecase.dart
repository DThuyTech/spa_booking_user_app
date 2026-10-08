import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/auth/auth_repository.dart';

class DeleteAccountUseCase {
  final AuthRepository repository;

  const DeleteAccountUseCase(this.repository);

  Future<Either<Failure, Unit>> call() => repository.deleteAccount();
}
