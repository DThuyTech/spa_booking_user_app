import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/notification_models.dart';
import '../widgets/booking_notification_card.dart';

class BookingNotificationBodyView extends StatelessWidget {
  final BookingNotificationData booking;

  const BookingNotificationBodyView({super.key, required this.booking});

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),

          // 1. Calendar Icon with Peach Glow
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECE8),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _coralColor.withValues(alpha: 0.18),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Center(
              child: Icon(LucideIcons.calendar, size: 34, color: _coralColor),
            ),
          ),

          const SizedBox(height: 20),

          // 2. Title
          const Text(
            'Booking confirmed',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 8),

          // 3. Subtitle
          const Text(
            'Your appointment has been successfully confirmed.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: _textMuted,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 28),

          // 4. White Booking Card with Coral Stripe
          BookingNotificationCard(booking: booking),

          const SizedBox(height: 28),

          // 5. Timestamp Footer
          Text(
            booking.timestamp,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
