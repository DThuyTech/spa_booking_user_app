import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/auth/save_customer_profile_usecase.dart';
import '../auth_session/auth_session_bloc.dart';
import 'profile_edit_event.dart';
import 'profile_edit_state.dart';

export 'profile_edit_event.dart';
export 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final SaveCustomerProfileUseCase saveCustomerProfileUseCase;
  final AuthSessionBloc? authSessionBloc;

  ProfileEditBloc({
    required this.saveCustomerProfileUseCase,
    this.authSessionBloc,
  }) : super(const ProfileEditState()) {
    on<ProfileEditStarted>(_onStarted);
    on<ProfileEditFullNameChanged>(_onFullNameChanged);
    on<ProfileEditPhoneNumberChanged>(_onPhoneNumberChanged);
    on<ProfileEditDateOfBirthChanged>(_onDateOfBirthChanged);
    on<ProfileEditGenderChanged>(_onGenderChanged);
    on<ProfileEditSubmitted>(_onSubmitted);
  }

  void _onStarted(ProfileEditStarted event, Emitter<ProfileEditState> emit) {
    final user = event.initialUser ?? authSessionBloc?.state.user;
    if (user != null) {
      String resolvedDob = state.dateOfBirth;
      if (user.dateOfBirth != null && user.dateOfBirth!.isNotEmpty) {
        resolvedDob = user.dateOfBirth!.split('T').first;
      }

      emit(
        state.copyWith(
          status: ProfileEditStatus.editing,
          fullName: user.fullName.isNotEmpty ? user.fullName : state.fullName,
          phoneNumber: user.phone.isNotEmpty ? user.phone : state.phoneNumber,
          dateOfBirth: resolvedDob,
          isInitialSetup: event.isInitialSetup,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: ProfileEditStatus.editing,
          isInitialSetup: event.isInitialSetup,
        ),
      );
    }
  }

  void _onFullNameChanged(
    ProfileEditFullNameChanged event,
    Emitter<ProfileEditState> emit,
  ) {
    emit(
      state.copyWith(
        fullName: event.fullName,
        status: ProfileEditStatus.editing,
        errorMessage: () => null,
      ),
    );
  }

  void _onPhoneNumberChanged(
    ProfileEditPhoneNumberChanged event,
    Emitter<ProfileEditState> emit,
  ) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
        status: ProfileEditStatus.editing,
        errorMessage: () => null,
      ),
    );
  }

  void _onDateOfBirthChanged(
    ProfileEditDateOfBirthChanged event,
    Emitter<ProfileEditState> emit,
  ) {
    emit(
      state.copyWith(
        dateOfBirth: event.dateOfBirth,
        status: ProfileEditStatus.editing,
        errorMessage: () => null,
      ),
    );
  }

  void _onGenderChanged(
    ProfileEditGenderChanged event,
    Emitter<ProfileEditState> emit,
  ) {
    emit(
      state.copyWith(
        gender: event.gender,
        status: ProfileEditStatus.editing,
        errorMessage: () => null,
      ),
    );
  }

  Future<void> _onSubmitted(
    ProfileEditSubmitted event,
    Emitter<ProfileEditState> emit,
  ) async {
    final trimmedName = state.fullName.trim();
    if (trimmedName.isEmpty) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.failure,
          errorMessage: () => 'Please enter your full name',
        ),
      );
      return;
    }

    String trimmedPhone = state.phoneNumber.trim();
    if (trimmedPhone.isEmpty) {
      final user = authSessionBloc?.state.user;
      if (user != null && user.phone.isNotEmpty) {
        trimmedPhone = user.phone;
      } else {
        trimmedPhone = '+1234567890';
      }
    }

    final trimmedDob = state.dateOfBirth.trim();
    if (trimmedDob.isEmpty) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.failure,
          errorMessage: () => 'Please select your date of birth',
        ),
      );
      return;
    }

    // Split fullName into firstName and lastName
    final parts = trimmedName.split(' ').where((s) => s.isNotEmpty).toList();
    final String firstName;
    final String lastName;
    if (parts.length == 1) {
      firstName = parts.first;
      lastName = parts.first;
    } else {
      firstName = parts.first;
      lastName = parts.sublist(1).join(' ');
    }

    emit(state.copyWith(status: ProfileEditStatus.submitting));

    final result = await saveCustomerProfileUseCase(
      SaveCustomerProfileParams(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: trimmedPhone,
        dateOfBirth: trimmedDob,
        isCreate: state.isInitialSetup,
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ProfileEditStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
      },
      (user) {
        authSessionBloc?.add(AuthSessionUserUpdated(user));
        emit(
          state.copyWith(
            status: ProfileEditStatus.success,
            savedUser: () => user,
            errorMessage: () => null,
          ),
        );
      },
    );
  }
}
