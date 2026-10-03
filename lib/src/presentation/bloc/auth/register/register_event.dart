import 'package:equatable/equatable.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

final class RegisterFullNameChanged extends RegisterEvent {
  final String fullName;
  const RegisterFullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

final class RegisterIdentifierChanged extends RegisterEvent {
  final String identifier;
  const RegisterIdentifierChanged(this.identifier);

  @override
  List<Object?> get props => [identifier];
}

final class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  const RegisterPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  const RegisterConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
