import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginIdentifierChanged extends LoginEvent {
  final String identifier;

  const LoginIdentifierChanged(this.identifier);

  @override
  List<Object?> get props => [identifier];
}

// Backward compatibility alias for LoginPhoneChanged
typedef LoginPhoneChanged = LoginIdentifierChanged;

final class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LoginErrorDismissed extends LoginEvent {
  const LoginErrorDismissed();
}
