import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../widgets/user_review_card.dart';

class UserReviewsBodyView extends StatelessWidget {
  final List<UserReviewEntity> reviews;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final VoidCallback? onLoadMore;
  final void Function(UserReviewEntity review) onTapReview;
  final void Function(UserReviewEntity review) onEditReview;
  final void Function(UserReviewEntity review) onDeleteReview;

  const UserReviewsBodyView({
    super.key,
    required this.reviews,
    this.isLoading = false,
    required this.onRefresh,
    this.onLoadMore,
    required this.onTapReview,
    required this.onEditReview,
    required this.onDeleteReview,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && reviews.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFFA7762)),
      );
    }

    if (reviews.isEmpty) {
      return RefreshIndicator(
        color: const Color(0xFFFA7762),
        onRefresh: onRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          children: [
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.star,
                  size: 42,
                  color: Color(0xFFFA7762),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Chưa có đánh giá nào',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Các đánh giá của bạn sau khi trải nghiệm dịch vụ tại Salon sẽ xuất hiện tại đây.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      color: const Color(0xFFFA7762),
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: reviews.length,
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final review = reviews[index];
          return UserReviewCard(
            review: review,
            onTap: () => onTapReview(review),
            onEdit: () => onEditReview(review),
            onDelete: () => onDeleteReview(review),
          );
        },
      ),
    );
  }
}
