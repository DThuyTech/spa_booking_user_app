import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../widgets/home_upcoming_appointment_card.dart';

class HomeUpcomingAppointmentSection extends StatelessWidget {
  final HomeAppointmentItem? appointment;
  final VoidCallback? onAppointmentTap;

  static const Color _textDark = Color(0xFF1E2022);

  const HomeUpcomingAppointmentSection({
    super.key,
    this.appointment,
    this.onAppointmentTap,
  });

  @override
  Widget build(BuildContext context) {
    if (appointment == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.upcomingAppointment,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          HomeUpcomingAppointmentCard(
            appointment: appointment!,
            onTap: onAppointmentTap,
          ),
        ],
      ),
    );
  }
}
