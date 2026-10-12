import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/request_otp_result.dart';
import '../../entities/auth/user.dart';
import '../../repositories/auth/auth_repository.dart';

class ChangeContactUseCase {
  final AuthRepository repository;

  const ChangeContactUseCase(this.repository);

  Future<Either<Failure, RequestOtpResult>> requestChangeEmail(
    String newEmail,
  ) {
    return repository.requestChangeEmail(newEmail: newEmail);
  }

  Future<Either<Failure, User>> verifyChangeEmail({
    required String newEmail,
    required String otp,
  }) {
    return repository.verifyChangeEmail(newEmail: newEmail, otp: otp);
  }

  Future<Either<Failure, RequestOtpResult>> requestChangePhone(
    String newPhone,
  ) {
    return repository.requestChangePhone(newPhone: newPhone);
  }

  Future<Either<Failure, User>> verifyChangePhone({
    required String newPhone,
    required String otp,
  }) {
    return repository.verifyChangePhone(newPhone: newPhone, otp: otp);
  }

  Future<Either<Failure, Unit>> removeEmail() {
    return repository.removeCustomerEmail();
  }

  Future<Either<Failure, Unit>> removePhone() {
    return repository.removeCustomerPhone();
  }
}
