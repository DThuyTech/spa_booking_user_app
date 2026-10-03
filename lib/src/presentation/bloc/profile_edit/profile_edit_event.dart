import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth/user.dart';

sealed class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object?> get props => [];
}

class ProfileEditStarted extends ProfileEditEvent {
  final User? initialUser;
  final bool isInitialSetup;

  const ProfileEditStarted({this.initialUser, this.isInitialSetup = false});

  @override
  List<Object?> get props => [initialUser, isInitialSetup];
}

class ProfileEditFullNameChanged extends ProfileEditEvent {
  final String fullName;

  const ProfileEditFullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class ProfileEditPhoneNumberChanged extends ProfileEditEvent {
  final String phoneNumber;

  const ProfileEditPhoneNumberChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class ProfileEditDateOfBirthChanged extends ProfileEditEvent {
  final String dateOfBirth;

  const ProfileEditDateOfBirthChanged(this.dateOfBirth);

  @override
  List<Object?> get props => [dateOfBirth];
}

class ProfileEditGenderChanged extends ProfileEditEvent {
  final String gender;

  const ProfileEditGenderChanged(this.gender);

  @override
  List<Object?> get props => [gender];
}

class ProfileEditSubmitted extends ProfileEditEvent {
  const ProfileEditSubmitted();
}
