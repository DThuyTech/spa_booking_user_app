import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginPhoneChanged extends LoginEvent {
  final String phone;

  const LoginPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LoginErrorDismissed extends LoginEvent {
  const LoginErrorDismissed();
}
