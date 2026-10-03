import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user.dart';
import '../../repositories/auth/auth_repository.dart';

class SaveCustomerProfileParams extends Equatable {
  final String name;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String dateOfBirth;
  final bool isCreate;

  SaveCustomerProfileParams({
    String? name,
    String? firstName,
    String? lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    this.isCreate = false,
  })  : name = name ?? '${firstName ?? ''} ${lastName ?? ''}'.trim(),
        firstName = firstName ??
            (name != null && name.trim().isNotEmpty
                ? name.trim().split(' ').first
                : ''),
        lastName = lastName ??
            (name != null && name.trim().split(' ').length > 1
                ? name.trim().split(' ').sublist(1).join(' ')
                : (name ?? ''));

  @override
  List<Object?> get props => [
    name,
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
      name: params.name,
      firstName: params.firstName,
      lastName: params.lastName,
      phoneNumber: params.phoneNumber,
      dateOfBirth: params.dateOfBirth,
      isCreate: params.isCreate,
    );
  }
}
