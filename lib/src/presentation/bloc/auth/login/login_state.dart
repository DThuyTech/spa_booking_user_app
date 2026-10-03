import 'package:spa_booking/src/domain/entities/auth/auth_session_entity.dart';
import 'package:spa_booking/src/domain/entities/auth/request_otp_result.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, validating, loading, success, failure }

/// Trailing Enum naming alias
typedef LoginStatusEnum = LoginStatus;

class LoginState extends Equatable {
  final String identifier;
  final String password;
  final bool isValid;
  final String? identifierError;
  final String? passwordError;
  final LoginStatus status;
  final String? errorMessage;
  final AuthSessionEntity? authSession;
  final RequestOtpResult? otpResult;

  const LoginState({
    this.identifier = '',
    this.password = '',
    this.isValid = false,
    this.identifierError,
    this.passwordError,
    this.status = LoginStatus.initial,
    this.errorMessage,
    this.authSession,
    this.otpResult,
  });

  // Backward compatibility getters
  String get phone => identifier;
  String? get phoneError => identifierError;

  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isFailure => status == LoginStatus.failure;
  bool get canSubmit =>
      identifier.trim().isNotEmpty && password.isNotEmpty && !isLoading;

  LoginState copyWith({
    String? identifier,
    String? phone,
    String? password,
    bool? isValid,
    String? Function()? identifierError,
    String? Function()? phoneError,
    String? Function()? passwordError,
    LoginStatus? status,
    String? Function()? errorMessage,
    AuthSessionEntity? Function()? authSession,
    RequestOtpResult? Function()? otpResult,
  }) {
    return LoginState(
      identifier: identifier ?? phone ?? this.identifier,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      identifierError: identifierError != null
          ? identifierError()
          : (phoneError != null ? phoneError() : this.identifierError),
      passwordError: passwordError != null
          ? passwordError()
          : this.passwordError,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      authSession: authSession != null ? authSession() : this.authSession,
      otpResult: otpResult != null ? otpResult() : this.otpResult,
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    password,
    isValid,
    identifierError,
    passwordError,
    status,
    errorMessage,
    authSession,
    otpResult,
  ];
}
