import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/request_otp_result.dart';
import '../../repositories/auth/auth_repository.dart';

class RequestOtpUseCase {
  final AuthRepository _repository;

  const RequestOtpUseCase(this._repository);

  Future<Either<Failure, RequestOtpResult>> call(String phone) {
    return _repository.requestOtp(phone);
  }
}
