import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/forgot_password_result.dart';
import '../../repositories/auth/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _repository;

  const ForgotPasswordUseCase(this._repository);

  Future<Either<Failure, ForgotPasswordResult>> call(String phone) {
    return _repository.forgotPassword(phone: phone);
  }
}
