import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth/user.dart';

enum ProfileEditStatus { initial, editing, submitting, success, failure }

class ProfileEditState extends Equatable {
  final ProfileEditStatus status;
  final String fullName;
  final String phoneNumber;
  final String dateOfBirth; // Stored as YYYY-MM-DD
  final String gender;
  final String? errorMessage;
  final bool isInitialSetup;
  final User? savedUser;

  const ProfileEditState({
    this.status = ProfileEditStatus.initial,
    this.fullName = '',
    this.phoneNumber = '',
    this.dateOfBirth = '2002-02-10',
    this.gender = 'Female',
    this.errorMessage,
    this.isInitialSetup = false,
    this.savedUser,
  });

  bool get isSubmitting => status == ProfileEditStatus.submitting;
  bool get isSuccess => status == ProfileEditStatus.success;

  String get displayDateOfBirth {
    if (dateOfBirth.isEmpty) return 'Select Date of Birth';
    try {
      final parts = dateOfBirth.split('-');
      if (parts.length == 3) {
        // YYYY-MM-DD -> DD/MM/YYYY
        return '${parts[2].padLeft(2, '0')}/${parts[1].padLeft(2, '0')}/${parts[0]}';
      }
    } catch (_) {}
    return dateOfBirth;
  }

  bool get isValid =>
      fullName.trim().isNotEmpty &&
      phoneNumber.trim().isNotEmpty &&
      dateOfBirth.trim().isNotEmpty;

  ProfileEditState copyWith({
    ProfileEditStatus? status,
    String? fullName,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? Function()? errorMessage,
    bool? isInitialSetup,
    User? Function()? savedUser,
  }) {
    return ProfileEditState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      isInitialSetup: isInitialSetup ?? this.isInitialSetup,
      savedUser: savedUser != null ? savedUser() : this.savedUser,
    );
  }

  @override
  List<Object?> get props => [
    status,
    fullName,
    phoneNumber,
    dateOfBirth,
    gender,
    errorMessage,
    isInitialSetup,
    savedUser,
  ];
}
