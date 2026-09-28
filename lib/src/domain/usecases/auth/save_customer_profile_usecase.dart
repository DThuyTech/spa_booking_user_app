import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user.dart';
import '../../repositories/auth/auth_repository.dart';

class SaveCustomerProfileParams extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String dateOfBirth;
  final bool isCreate;

  const SaveCustomerProfileParams({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    this.isCreate = false,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    phoneNumber,
    dateOfBirth,
    isCreate,
  ];
}

class SaveCustomerProfileUseCase {
  final AuthRepository _repository;

  const SaveCustomerProfileUseCase(this._repository);

  Future<Either<Failure, User>> call(SaveCustomerProfileParams params) {
    return _repository.saveCustomerProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      phoneNumber: params.phoneNumber,
      dateOfBirth: params.dateOfBirth,
      isCreate: params.isCreate,
    );
  }
}
