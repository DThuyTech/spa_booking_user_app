import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/locale_extension.dart';
import 'package:spa_booking/src/presentation/view/terms/view/terms_of_use_view.dart';

class RegisterBottomSession extends StatelessWidget {
  const RegisterBottomSession({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        const SizedBox(height: 24),

        // Back to Sign In
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.alreadyHaveAccount,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E625A),
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.router.maybePop(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text(
                  l10n.signIn,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF26242),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const TermsOfUseView()));
            },
            child: Text(
              l10n.termsNotice,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8A7D75).withValues(alpha: 0.9),
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
