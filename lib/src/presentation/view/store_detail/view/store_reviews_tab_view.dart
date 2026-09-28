import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../mockup_data/store_detail_mock_data.dart';
import '../widgets/store_rating_summary_card.dart';
import '../widgets/store_review_item_card.dart';

class StoreReviewsTabView extends StatelessWidget {
  final StoreRatingSummary ratingSummary;
  final List<StoreReviewItem> reviews;
  final VoidCallback? onViewAllReviews;
  final VoidCallback? onWriteReview;

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _coralColor = Color(0xFFFF6F59);

  const StoreReviewsTabView({
    super.key,
    required this.ratingSummary,
    required this.reviews,
    this.onViewAllReviews,
    this.onWriteReview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Header Row with Title and Write a Review button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Customer reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: onWriteReview,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDEEEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(LucideIcons.pen_line, size: 13, color: _coralColor),
                      SizedBox(width: 5),
                      Text(
                        'Review',
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: _coralColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Rating summary card
          StoreRatingSummaryCard(summary: ratingSummary),
          const SizedBox(height: 16),

          // List of customer reviews
          ...reviews.map((review) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: StoreReviewItemCard(review: review),
            );
          }),
          const SizedBox(height: 8),

          // View all reviews button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: onViewAllReviews,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFF6F59),
                side: const BorderSide(color: Color(0xFFFFD4CC), width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View all reviews'),
                  SizedBox(width: 4),
                  Icon(LucideIcons.chevron_right, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
