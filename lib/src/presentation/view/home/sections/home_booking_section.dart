import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import '../widgets/home_booking_card.dart';
import '../widgets/home_section_header.dart';

/// Section showing nearest upcoming booking or a calm empty appointment card.
class HomeBookingSection extends StatelessWidget {
  final VoidCallback? onBookAppointmentTap;
  final VoidCallback? onBookingCardTap;

  const HomeBookingSection({
    super.key,
    this.onBookAppointmentTap,
    this.onBookingCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionHeader(title: l10n.upcomingAppointment),
        const SizedBox(height: 8),
        HomeBookingCard(
          onTap: onBookingCardTap,
          onBookNowTap: onBookAppointmentTap,
        ),
      ],
    );
  }
}
