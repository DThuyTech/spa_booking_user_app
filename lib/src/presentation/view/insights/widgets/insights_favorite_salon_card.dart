import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class InsightsFavoriteSalonCard extends StatelessWidget {
  final String salonName;
  final String stats;
  final VoidCallback onViewSalon;

  const InsightsFavoriteSalonCard({
    super.key,
    required this.salonName,
    required this.stats,
    required this.onViewSalon,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
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
          // Section Label
          const Text(
            'FAVORITE SALON',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: _textMuted,
              letterSpacing: 0.6,
            ),
          ),

          const SizedBox(height: 10),

          // Star Icon & Salon Name
          Row(
            children: [
              const Icon(LucideIcons.star, size: 18, color: Color(0xFFF59E0B)),
              const SizedBox(width: 8),
              Text(
                salonName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Stats Subtitle
          Text(
            stats,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _textMuted,
            ),
          ),

          const SizedBox(height: 14),

          // "View Salon ->" Button (matching Image 4)
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: onViewSalon,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2E8F0),
                foregroundColor: const Color(0xFF334155),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View Salon'),
                  SizedBox(width: 6),
                  Icon(LucideIcons.arrow_right, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
