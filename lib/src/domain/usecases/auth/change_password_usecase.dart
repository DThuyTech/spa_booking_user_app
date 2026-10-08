import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/auth/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _repository;

  const ChangePasswordUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String oldPassword,
    required String newPassword,
  }) {
    return _repository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
