import 'package:equatable/equatable.dart';

sealed class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();

  @override
  List<Object?> get props => [];
}

final class OtpStarted extends OtpVerificationEvent {
  final String phone;
  final int initialCountdownSeconds;

  const OtpStarted({required this.phone, this.initialCountdownSeconds = 300});

  @override
  List<Object?> get props => [phone, initialCountdownSeconds];
}

final class OtpDigitChanged extends OtpVerificationEvent {
  final String code;

  const OtpDigitChanged(this.code);

  @override
  List<Object?> get props => [code];
}

final class OtpSubmitted extends OtpVerificationEvent {
  const OtpSubmitted();
}

final class OtpResendRequested extends OtpVerificationEvent {
  const OtpResendRequested();
}

final class OtpTimerTicked extends OtpVerificationEvent {
  final int remainingSeconds;

  const OtpTimerTicked(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}

final class OtpErrorDismissed extends OtpVerificationEvent {
  const OtpErrorDismissed();
}
