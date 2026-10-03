import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class InsightsMonthSummaryCard extends StatelessWidget {
  final int bookingsCount;
  final String bookingsDiff;
  final String spentDisplay;

  const InsightsMonthSummaryCard({
    super.key,
    required this.bookingsCount,
    required this.bookingsDiff,
    required this.spentDisplay,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textLabel = Color(0xFF64748B);
  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFFF6F4).withValues(alpha: 0.9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Your Month',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.2,
            ),
          ),

          const SizedBox(height: 18),

          // Bookings Label
          const Text(
            'Bookings',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _textLabel,
            ),
          ),

          const SizedBox(height: 6),

          // Bookings Value & Growth Pill
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$bookingsCount',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                  height: 1.1,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFA7F3D0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      LucideIcons.trending_up,
                      size: 13,
                      color: Color(0xFF059669),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bookingsDiff,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF059669),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Spent Label
          const Text(
            'Spent',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _textLabel,
            ),
          ),

          const SizedBox(height: 4),

          // Spent Value
          Text(
            spentDisplay,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: _coralColor,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
