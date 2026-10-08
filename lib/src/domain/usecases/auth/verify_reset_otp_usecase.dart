import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/auth/auth_repository.dart';

class VerifyResetOtpUseCase {
  final AuthRepository _repository;

  const VerifyResetOtpUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String phone,
    required String otp,
  }) {
    return _repository.verifyResetOtp(phone: phone, otp: otp);
  }
}
