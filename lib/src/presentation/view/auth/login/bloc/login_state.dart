import 'package:board_oi/src/domain/entities/auth/request_otp_result.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, validating, loading, success, failure }

class LoginState extends Equatable {
  final String phone;
  final bool isValid;
  final String? phoneError;
  final LoginStatus status;
  final String? errorMessage;
  final RequestOtpResult? otpResult;

  const LoginState({
    this.phone = '',
    this.isValid = false,
    this.phoneError,
    this.status = LoginStatus.initial,
    this.errorMessage,
    this.otpResult,
  });

  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isFailure => status == LoginStatus.failure;
  bool get canSubmit => isValid && !isLoading;

  LoginState copyWith({
    String? phone,
    bool? isValid,
    String? Function()? phoneError,
    LoginStatus? status,
    String? Function()? errorMessage,
    RequestOtpResult? Function()? otpResult,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      phoneError: phoneError != null ? phoneError() : this.phoneError,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      otpResult: otpResult != null ? otpResult() : this.otpResult,
    );
  }

  @override
  List<Object?> get props => [
    phone,
    isValid,
    phoneError,
    status,
    errorMessage,
    otpResult,
  ];
}
