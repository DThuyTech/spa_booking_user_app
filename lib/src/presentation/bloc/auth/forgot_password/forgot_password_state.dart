import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus {
  initial,
  sendingOtp,
  otpSent,
  verifyingOtp,
  otpVerified,
  resettingPassword,
  resetSuccess,
  failure,
}

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String phone;
  final String? otp;
  final String? errorMessage;
  final String? successMessage;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.phone = '',
    this.otp,
    this.errorMessage,
    this.successMessage,
  });

  bool get isLoading =>
      status == ForgotPasswordStatus.sendingOtp ||
      status == ForgotPasswordStatus.verifyingOtp ||
      status == ForgotPasswordStatus.resettingPassword;

  bool get isOtpSent => status == ForgotPasswordStatus.otpSent;
  bool get isOtpVerified => status == ForgotPasswordStatus.otpVerified;
  bool get isResetSuccess => status == ForgotPasswordStatus.resetSuccess;
  bool get isFailure => status == ForgotPasswordStatus.failure;

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? phone,
    String? Function()? otp,
    String? Function()? errorMessage,
    String? Function()? successMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      phone: phone ?? this.phone,
      otp: otp != null ? otp() : this.otp,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      successMessage: successMessage != null
          ? successMessage()
          : this.successMessage,
    );
  }

  @override
  List<Object?> get props => [status, phone, otp, errorMessage, successMessage];
}
