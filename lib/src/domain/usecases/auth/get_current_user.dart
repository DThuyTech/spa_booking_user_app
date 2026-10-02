import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/repositories/auth/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  const GetCurrentUser(this.repository);

  Future<Either<Failure, User>> call() {
    return repository.getCurrentUser();
  }
}
