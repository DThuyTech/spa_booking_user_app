import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// Focused countdown widget showing the clock icon and remaining duration.
class OtpCountdown extends StatelessWidget {
  final String formattedCountdown;

  const OtpCountdown({super.key, required this.formattedCountdown});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(LucideIcons.clock, size: 15, color: Color(0xFF5A5149)),
        const SizedBox(width: 6),
        Text(
          '$formattedCountdown ${l10n.remaining}',
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5A5149),
          ),
        ),
      ],
    );
  }
}
