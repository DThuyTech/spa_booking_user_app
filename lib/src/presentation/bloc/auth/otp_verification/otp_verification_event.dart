import 'package:equatable/equatable.dart';

import 'otp_verification_state.dart';

sealed class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();

  @override
  List<Object?> get props => [];
}

final class OtpStarted extends OtpVerificationEvent {
  final String identifier;
  final String? name;
  final String? password;
  final String? mockOtp;
  final OtpFlowType flowType;
  final int initialCountdownSeconds;

  const OtpStarted({
    required this.identifier,
    this.name,
    this.password,
    this.mockOtp,
    this.flowType = OtpFlowType.login,
    this.initialCountdownSeconds = 300,
  });

  // Backward compatibility factory constructor
  factory OtpStarted.legacy({
    required String phone,
    int initialCountdownSeconds = 300,
  }) => OtpStarted(
    identifier: phone,
    flowType: OtpFlowType.phoneVerify,
    initialCountdownSeconds: initialCountdownSeconds,
  );

  @override
  List<Object?> get props => [
    identifier,
    name,
    password,
    mockOtp,
    flowType,
    initialCountdownSeconds,
  ];
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
