import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/auth_session_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;

  const VerifyOtpUseCase(this._repository);

  Future<Either<Failure, AuthSessionEntity>> call({
    required String phone,
    required String code,
  }) {
    return _repository.verifyOtp(phone: phone, code: code);
  }
}
