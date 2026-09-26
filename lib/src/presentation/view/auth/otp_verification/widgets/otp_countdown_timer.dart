import 'package:flutter/material.dart';
import 'otp_countdown.dart';
import 'otp_resend_button.dart';

export 'otp_countdown.dart';
export 'otp_resend_button.dart';

/// Composed widget containing both countdown and resend button.
class OtpCountdownTimer extends StatelessWidget {
  final String formattedCountdown;
  final bool canResend;
  final bool isResending;
  final VoidCallback? onResendTap;

  const OtpCountdownTimer({
    super.key,
    required this.formattedCountdown,
    required this.canResend,
    this.isResending = false,
    this.onResendTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpCountdown(formattedCountdown: formattedCountdown),
        const SizedBox(height: 10),
        OtpResendButton(
          canResend: canResend,
          isResending: isResending,
          onResendTap: onResendTap,
        ),
      ],
    );
  }
}
