import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/request_otp_result.dart';
import '../../repositories/auth/auth_repository.dart';

class SendRegisterOtpUseCase {
  final AuthRepository repository;

  const SendRegisterOtpUseCase(this.repository);

  Future<Either<Failure, RequestOtpResult>> call({
    String? phoneNumber,
    String? email,
  }) {
    return repository.sendRegisterOtp(phoneNumber: phoneNumber, email: email);
  }
}
