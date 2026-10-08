import 'package:flutter/material.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../../../../shared/shared.dart';
import 'user_review_merchant_reply_card.dart';
import 'user_review_more_menu.dart';
import 'user_review_rating_badge.dart';
import 'user_review_store_logo.dart';

class UserReviewCard extends StatelessWidget {
  final UserReviewEntity review;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const UserReviewCard({
    super.key,
    required this.review,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = review.createdAt.toReviewDateFormat();
    final storeName = review.store?.name ?? 'Salon & Spa';
    final storeAddress = review.store?.address;
    final storeLogo = review.store?.logoUrl;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Store Avatar, Name & Date, Star Rating, 3-dots More Menu
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserReviewStoreLogo(
                      logoUrl: storeLogo,
                      storeName: storeName,
                      size: 44,
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            storeName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 2),
                          if (storeAddress != null && storeAddress.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                storeAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserReviewRatingBadge(rating: review.rating),
                        if (onEdit != null || onDelete != null) ...[
                          const SizedBox(width: 4),
                          UserReviewMoreMenu(
                            onEdit: onEdit,
                            onDelete: onDelete,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Review Comment
                Text(
                  review.comment,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF334155),
                  ),
                ),

                // Images Thumbnails
                if (review.images.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildImageThumbnails(),
                ],

                // Merchant Reply bubble if present
                if (review.merchantReply != null &&
                    review.merchantReply!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  UserReviewMerchantReplyCard(
                    reply: review.merchantReply!,
                    repliedAt: review.merchantRepliedAt,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageThumbnails() {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: review.images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              review.images[index],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
