import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_bloc.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_event.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_state.dart';

class OtpActionSection extends StatelessWidget {
  const OtpActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
      buildWhen: (prev, curr) =>
          prev.canSubmit != curr.canSubmit ||
          prev.isVerifying != curr.isVerifying,
      builder: (context, state) {
        final isEnabled = state.canSubmit;
        final isVerifying = state.isVerifying;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Verify Button
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: isEnabled
                      ? const [Color(0xFFFA7355), Color(0xFFF26242)]
                      : [
                          const Color(0xFFFA7355).withValues(alpha: 0.45),
                          const Color(0xFFF26242).withValues(alpha: 0.45),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: isEnabled
                    ? [
                        BoxShadow(
                          color: const Color(
                            0xFFF26242,
                          ).withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: isEnabled
                      ? () {
                          context.read<OtpVerificationBloc>().add(
                            const OtpSubmitted(),
                          );
                        }
                      : null,
                  child: Center(
                    child: isVerifying
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            l10n.verify,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Change Phone Number Action
            Center(
              child: TextButton(
                onPressed: () {
                  context.router.maybePop();
                },
                child: Text(
                  l10n.changePhoneNumber,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C241F),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
