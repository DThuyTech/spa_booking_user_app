import 'package:equatable/equatable.dart';

enum ChangePasswordStatus { initial, loading, success, failure }

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final String? errorMessage;
  final String? message;

  const ChangePasswordState({
    this.status = ChangePasswordStatus.initial,
    this.errorMessage,
    this.message,
  });

  bool get isLoading => status == ChangePasswordStatus.loading;
  bool get isSuccess => status == ChangePasswordStatus.success;
  bool get isFailure => status == ChangePasswordStatus.failure;

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    String? Function()? errorMessage,
    String? Function()? message,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      message: message != null ? message() : this.message,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, message];
}
