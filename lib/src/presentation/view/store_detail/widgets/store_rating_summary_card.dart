import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';

class StoreRatingSummaryCard extends StatelessWidget {
  final StoreReviewsOverviewEntity summary;

  static const Color _starColor = Color(0xFFF59E0B);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);
  static const Color _trackColor = Color(0xFFF1F5F9);

  const StoreRatingSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Average Rating Number
          Text(
            summary.averageRating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),

          // 5 Stars row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Icon(Icons.star_rounded, size: 20, color: _starColor),
              );
            }),
          ),
          const SizedBox(height: 6),

          // Total Reviews text
          Text(
            '${summary.totalReviews} reviews',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _textMuted,
            ),
          ),
          const SizedBox(height: 18),

          // Star breakdown bars (5 down to 1)
          ...List.generate(5, (index) {
            final star = 5 - index;
            final count = summary.ratingDistribution[star.toString()] ?? 0;
            final ratio = summary.totalReviews > 0
                ? (count / summary.totalReviews).clamp(0.0, 1.0)
                : 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.5),
              child: Row(
                children: [
                  SizedBox(
                    width: 14,
                    child: Text(
                      '$star',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _textMuted,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 6,
                        color: _trackColor,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: ratio,
                            child: Container(color: _starColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
