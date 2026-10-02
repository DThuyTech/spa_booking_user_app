import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/repositories/auth/auth_repository.dart';

class RestoreSession {
  final AuthRepository repository;

  const RestoreSession(this.repository);

  Future<Either<Failure, User?>> call() {
    return repository.restoreSession();
  }
}
