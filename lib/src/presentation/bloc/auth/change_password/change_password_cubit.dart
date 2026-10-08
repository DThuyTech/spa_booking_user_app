import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/auth/change_password_usecase.dart';
import 'change_password_state.dart';

export 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({required this.changePasswordUseCase})
    : super(const ChangePasswordState());

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(
      state.copyWith(
        status: ChangePasswordStatus.loading,
        errorMessage: () => null,
        message: () => null,
      ),
    );

    final result = await changePasswordUseCase(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ChangePasswordStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
        return false;
      },
      (msg) {
        emit(
          state.copyWith(
            status: ChangePasswordStatus.success,
            message: () => msg,
          ),
        );
        return true;
      },
    );
  }

  void reset() {
    emit(const ChangePasswordState());
  }
}
