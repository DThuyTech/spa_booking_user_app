import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../../../../shared/shared.dart';
import '../widgets/store_rating_summary_card.dart';
import '../widgets/store_review_item_card.dart';

class StoreReviewsTabView extends StatelessWidget {
  final StoreReviewsOverviewEntity? ratingSummary;
  final VoidCallback? onViewAllReviews;
  final VoidCallback? onWriteReview;

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _coralColor = Color(0xFFFF6F59);

  const StoreReviewsTabView({
    super.key,
    required this.ratingSummary,
    this.onViewAllReviews,
    this.onWriteReview,
  });

  @override
  Widget build(BuildContext context) {
    if (ratingSummary == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final reviews = ratingSummary!.recentReviews;
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
              Text(
                context.l10n.customerReviews,
                style: const TextStyle(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        LucideIcons.pen_line,
                        size: 13,
                        color: _coralColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        context.l10n.review,
                        style: const TextStyle(
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
          StoreRatingSummaryCard(summary: ratingSummary!),
          const SizedBox(height: 16),

          // List of customer reviews
          if (reviews.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFECEFF1)),
              ),
              child: Column(
                children: [
                  const Icon(
                    LucideIcons.message_square_dashed,
                    size: 36,
                    color: Color(0xFF90A4AE),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.noReviewsYet,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF455A64),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.beTheFirstToReview,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF90A4AE),
                    ),
                  ),
                ],
              ),
            )
          else ...[
            ...reviews.map((review) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: StoreReviewItemCard(review: review),
              );
            }),
            const SizedBox(height: 8),
            // View all reviews button
            AppButton(
              text: 'View all reviews',
              trailingIcon: const Icon(LucideIcons.chevron_right, size: 16),
              onPressed: onViewAllReviews,
              variant: AppButtonVariant.outline,
              textColor: const Color(0xFFFF6F59),
              borderRadius: BorderRadius.circular(24),
              height: 48,
              fullWidth: true,
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
