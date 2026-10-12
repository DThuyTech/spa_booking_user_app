import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/request_otp_result.dart';
import '../../repositories/auth/auth_repository.dart';

class SendLoginOtpUseCase {
  final AuthRepository repository;

  const SendLoginOtpUseCase(this.repository);

  Future<Either<Failure, RequestOtpResult>> call({required String identifier}) {
    return repository.sendLoginOtp(identifier: identifier);
  }
}
