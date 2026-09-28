import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class HomeAppointmentItem {
  final String id;
  final String salonName;
  final String serviceName;
  final String status;
  final String dateTimeDisplay;
  final String stylist;

  const HomeAppointmentItem({
    required this.id,
    required this.salonName,
    required this.serviceName,
    this.status = 'Confirmed',
    required this.dateTimeDisplay,
    required this.stylist,
  });
}

class HomeUpcomingAppointmentCard extends StatelessWidget {
  final HomeAppointmentItem appointment;
  final VoidCallback? onTap;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeUpcomingAppointmentCard({
    super.key,
    required this.appointment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F3F5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top Row: Store Icon, Info, Status Badge
                Row(
                  children: [
                    // Peach container with Store Icon
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDEEEB),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: Icon(
                          LucideIcons.store,
                          color: _coralColor,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Salon + Service Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.salonName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: _textDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            appointment.serviceName,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Confirmed Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF7EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            LucideIcons.circle_check,
                            size: 13,
                            color: Color(0xFF27AE60),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            appointment.status,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF27AE60),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFF3F4F6)),
                const SizedBox(height: 14),

                // Bottom Row: Date/Time, Stylist, Arrow Button
                Row(
                  children: [
                    const Icon(
                      LucideIcons.calendar,
                      size: 15,
                      color: Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      appointment.dateTimeDisplay,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: _textDark,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Icon(
                      LucideIcons.user,
                      size: 15,
                      color: Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Stylist: ${appointment.stylist}',
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: _textDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Coral Circle Arrow Button
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: _coralColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          LucideIcons.arrow_right,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
