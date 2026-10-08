import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/auth/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  const ResetPasswordUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String phone,
    required String otp,
    required String newPassword,
  }) {
    return _repository.resetPassword(
      phone: phone,
      otp: otp,
      newPassword: newPassword,
    );
  }
}
