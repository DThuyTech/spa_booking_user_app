import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_bloc.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_state.dart';
import '../widgets/otp_mail_illustration.dart';

class OtpHeaderSection extends StatelessWidget {
  const OtpHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
      buildWhen: (prev, curr) =>
          prev.phone != curr.phone || prev.maskedPhone != curr.maskedPhone,
      builder: (context, state) {
        return Column(
          children: [
            // Top Bar with Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => context.router.maybePop(),
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE4DED6),
                      width: 1.2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      LucideIcons.arrow_left,
                      size: 20,
                      color: Color(0xFF2C241F),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Mail / Phone Illustration
            const OtpMailIllustration(),

            const SizedBox(height: 22),

            // Title
            Text(
              l10n.verifyYourNumber,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: Color(0xFF1E1713),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Masked phone message
            Text(
              '${l10n.weSentCodeTo}\n${state.maskedPhone}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5A5149),
                height: 1.45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
