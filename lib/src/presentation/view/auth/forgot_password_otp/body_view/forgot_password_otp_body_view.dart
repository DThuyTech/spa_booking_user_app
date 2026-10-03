import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';
import '../../otp_verification/widgets/otp_input.dart';

class ForgotPasswordOtpBodyView extends StatelessWidget {
  final String contact;
  final String otpCode;
  final ValueChanged<String> onOtpChanged;
  final VoidCallback onVerify;
  final int countdownSeconds;
  final VoidCallback onResend;

  const ForgotPasswordOtpBodyView({
    super.key,
    required this.contact,
    required this.otpCode,
    required this.onOtpChanged,
    required this.onVerify,
    required this.countdownSeconds,
    required this.onResend,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);
  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  Widget build(BuildContext context) {
    final canResend = countdownSeconds <= 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // Title
          const Text(
            'Verify Code',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 10),

          // Subtitle
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: _textMuted,
                height: 1.45,
              ),
              children: [
                const TextSpan(
                  text: 'Please enter the 6-digit verification code sent to ',
                ),
                TextSpan(
                  text: contact,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),

          const SizedBox(height: 36),

          // 6-digit OTP Input
          Center(
            child: OtpInput(
              code: otpCode,
              onChanged: onOtpChanged,
              onCompleted: (_) => onVerify(),
            ),
          ),

          const SizedBox(height: 28),

          // Resend Countdown
          Center(
            child: canResend
                ? TextButton(
                    onPressed: onResend,
                    style: TextButton.styleFrom(
                      foregroundColor: _coralColor,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text('Resend Code'),
                  )
                : Text(
                    'Resend code in 00:${countdownSeconds.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
          ),

          const SizedBox(height: 32),

          // Verify Button
          AppButton(
            text: 'Verify & Proceed',
            onPressed: otpCode.length == 6 ? onVerify : null,
            backgroundColor: _coralColor,
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(28),
            height: 54,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
