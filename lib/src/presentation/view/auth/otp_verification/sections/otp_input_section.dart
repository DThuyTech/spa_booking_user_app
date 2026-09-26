import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/otp_verification_bloc.dart';
import '../bloc/otp_verification_event.dart';
import '../bloc/otp_verification_state.dart';
import '../widgets/otp_countdown.dart';
import '../widgets/otp_input.dart';
import '../widgets/otp_resend_button.dart';

class OtpInputSection extends StatelessWidget {
  const OtpInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
      buildWhen: (prev, curr) =>
          prev.code != curr.code ||
          prev.status != curr.status ||
          prev.errorMessage != curr.errorMessage ||
          prev.remainingSeconds != curr.remainingSeconds,
      builder: (context, state) {
        final bloc = context.read<OtpVerificationBloc>();
        final hasError = state.isFailure && state.errorMessage != null;

        return Column(
          children: [
            // 6-Pin Input Boxes
            OtpInput(
              code: state.code,
              hasError: hasError,
              errorMessage: state.errorMessage,
              isEnabled: !state.isVerifying,
              onChanged: (val) {
                bloc.add(OtpDigitChanged(val));
              },
              onCompleted: (_) {
                bloc.add(const OtpSubmitted());
              },
            ),

            const SizedBox(height: 22),

            // Countdown Timer Display
            OtpCountdown(
              formattedCountdown: state.formattedCountdown,
            ),

            const SizedBox(height: 10),

            // Resend Code Option
            OtpResendButton(
              canResend: state.canResend,
              isResending: state.isResending,
              onResendTap: () {
                bloc.add(const OtpResendRequested());
              },
            ),
          ],
        );
      },
    );
  }
}
