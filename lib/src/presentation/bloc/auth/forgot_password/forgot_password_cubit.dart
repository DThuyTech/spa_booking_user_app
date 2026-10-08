import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/auth/forgot_password_usecase.dart';
import '../../../../domain/usecases/auth/reset_password_usecase.dart';
import '../../../../domain/usecases/auth/verify_reset_otp_usecase.dart';
import 'forgot_password_state.dart';

export 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyResetOtpUseCase verifyResetOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgotPasswordCubit({
    required this.forgotPasswordUseCase,
    required this.verifyResetOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(const ForgotPasswordState());

  Future<bool> sendOtp(String phone) async {
    final sanitizedPhone = phone.trim();
    emit(
      state.copyWith(
        status: ForgotPasswordStatus.sendingOtp,
        phone: sanitizedPhone,
        errorMessage: () => null,
        successMessage: () => null,
      ),
    );

    final result = await forgotPasswordUseCase(sanitizedPhone);

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
        return false;
      },
      (res) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.otpSent,
            phone: res.phone.isNotEmpty ? res.phone : sanitizedPhone,
            otp: () => res.otp,
            successMessage: () => res.message,
          ),
        );
        return true;
      },
    );
  }

  Future<bool> verifyOtp({required String phone, required String otp}) async {
    final sanitizedPhone = phone.trim();
    final sanitizedOtp = otp.trim();

    emit(
      state.copyWith(
        status: ForgotPasswordStatus.verifyingOtp,
        errorMessage: () => null,
        successMessage: () => null,
      ),
    );

    final result = await verifyResetOtpUseCase(
      phone: sanitizedPhone,
      otp: sanitizedOtp,
    );

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
        return false;
      },
      (message) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.otpVerified,
            phone: sanitizedPhone,
            otp: () => sanitizedOtp,
            successMessage: () => message,
          ),
        );
        return true;
      },
    );
  }

  Future<bool> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    final sanitizedPhone = phone.trim();
    final sanitizedOtp = otp.trim();

    emit(
      state.copyWith(
        status: ForgotPasswordStatus.resettingPassword,
        errorMessage: () => null,
        successMessage: () => null,
      ),
    );

    final result = await resetPasswordUseCase(
      phone: sanitizedPhone,
      otp: sanitizedOtp,
      newPassword: newPassword,
    );

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
        return false;
      },
      (message) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.resetSuccess,
            successMessage: () => message,
          ),
        );
        return true;
      },
    );
  }

  void reset() {
    emit(const ForgotPasswordState());
  }
}
