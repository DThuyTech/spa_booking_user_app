import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/datetime_extension.dart';
import 'package:spa_booking/src/domain/entities/review/review_entity.dart';
import 'package:spa_booking/src/shared/utils/avatar_helper.dart';

class StoreReviewItemCard extends StatelessWidget {
  final ReviewEntity review;

  const StoreReviewItemCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final formattedDate = review.createdAt.toReviewDateFormat();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar, Name & Date, Star Rating with blue number
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Avatar
              _buildAvatar(),
              const SizedBox(width: 12),

              // Name and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      review.customerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              // Rating: Star icon + Blue number (⭐ 5)
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${review.rating}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E5AF6),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Review Content
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.45,
              fontWeight: FontWeight.w400,
              color: Color(0xFF334155),
            ),
          ),

          // Optional photos
          if (review.images.isNotEmpty) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 64,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: review.images.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      review.images[index],
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final hasAvatar = review.avatarUrl != null && review.avatarUrl!.isNotEmpty;
    final initials = AvatarHelper.getInitials(review.customerName);

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF1F5F9),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: ClipOval(
        child: hasAvatar
            ? Image.network(
                review.avatarUrl!,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallbackAvatar(initials),
              )
            : _buildFallbackAvatar(initials),
      ),
    );
  }

  Widget _buildFallbackAvatar(String initials) {
    return Container(
      color: const Color(0xFFFFECE8),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFA7762),
        ),
      ),
    );
  }
}
