import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/core/extensions/locale_extension.dart';
import 'package:spa_booking/src/presentation/view/auth/login/widgets/aura_logo_badge.dart';

class RegisterHeaderSession extends StatefulWidget {
  const RegisterHeaderSession({super.key});

  @override
  State<RegisterHeaderSession> createState() => _RegisterHeaderSessionState();
}

class _RegisterHeaderSessionState extends State<RegisterHeaderSession> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        // Top back button
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(
              LucideIcons.arrow_left,
              color: Color(0xFF2C241F),
              size: 22,
            ),
            onPressed: () => context.router.maybePop(),
          ),
        ),
        SizedBox(height: 4),

        // Header Section
        AuraLogoBadge(),
        SizedBox(height: 18),
        Text(
          l10n.createAccount,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
            color: Color(0xFF1E1713),
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          l10n.registerSubtitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6E625A),
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
