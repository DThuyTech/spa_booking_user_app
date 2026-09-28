import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/notification_models.dart';

class BookingNotificationCard extends StatelessWidget {
  final BookingNotificationData booking;

  const BookingNotificationCard({super.key, required this.booking});

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textLabel = Color(0xFF64748B);
  static const Color _iconCircleBg = Color(0xFFE0F2FE);
  static const Color _iconColor = Color(0xFF0284C7);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Coral Accent Stripe
          Container(height: 4.5, width: double.infinity, color: _coralColor),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Salon Name & Status Pill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        booking.salonName,
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.w800,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1EE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: _coralColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            booking.status,
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              color: _coralColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Service Name in Coral Caps
                Text(
                  booking.serviceName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFBA4A32),
                    letterSpacing: 0.8,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF1F5F9),
                  ),
                ),

                // Stylist Row
                _buildInfoRow(
                  icon: LucideIcons.user,
                  label: 'STYLIST',
                  value: booking.stylist,
                ),

                const SizedBox(height: 16),

                // Date Row
                _buildInfoRow(
                  icon: LucideIcons.calendar,
                  label: 'DATE',
                  value: booking.date,
                ),

                const SizedBox(height: 16),

                // Time Row
                _buildInfoRow(
                  icon: LucideIcons.clock,
                  label: 'TIME',
                  value: booking.time,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: _iconCircleBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: _iconColor),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _textLabel,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _textDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
