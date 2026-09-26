import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

/// Focused resend button widget with loading and enabled/disabled state.
class OtpResendButton extends StatelessWidget {
  final bool canResend;
  final bool isResending;
  final VoidCallback? onResendTap;

  const OtpResendButton({
    super.key,
    required this.canResend,
    this.isResending = false,
    this.onResendTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.didNotReceiveCode,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6E625A),
          ),
        ),
        const SizedBox(width: 6),
        if (isResending)
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFA7355)),
            ),
          )
        else
          GestureDetector(
            onTap: canResend ? onResendTap : null,
            child: Text(
              l10n.resendOtp,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: canResend
                    ? const Color(0xFFFA7355)
                    : const Color(0xFFFA7355).withValues(alpha: 0.4),
              ),
            ),
          ),
      ],
    );
  }
}
