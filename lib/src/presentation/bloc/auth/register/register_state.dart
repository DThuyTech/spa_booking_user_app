import 'package:board_oi/src/domain/entities/auth/auth_session_entity.dart';
import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, validating, loading, success, failure }

/// Trailing Enum naming alias
typedef RegisterStatusEnum = RegisterStatus;

class RegisterState extends Equatable {
  final String fullName;
  final String identifier;
  final String password;
  final RegisterStatus status;
  final String? errorMessage;
  final AuthSessionEntity? authSession;

  const RegisterState({
    this.fullName = '',
    this.identifier = '',
    this.password = '',
    this.status = RegisterStatus.initial,
    this.errorMessage,
    this.authSession,
  });

  bool get isLoading => status == RegisterStatus.loading;
  bool get isSuccess => status == RegisterStatus.success;
  bool get canSubmit =>
      identifier.trim().isNotEmpty && password.isNotEmpty && !isLoading;

  RegisterState copyWith({
    String? fullName,
    String? identifier,
    String? password,
    RegisterStatus? status,
    String? Function()? errorMessage,
    AuthSessionEntity? Function()? authSession,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      authSession: authSession != null ? authSession() : this.authSession,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    identifier,
    password,
    status,
    errorMessage,
    authSession,
  ];
}
