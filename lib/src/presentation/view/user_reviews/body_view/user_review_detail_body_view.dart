import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../../../../shared/shared.dart';
import '../widgets/user_review_merchant_reply_card.dart';
import '../widgets/user_review_store_logo.dart';

class UserReviewDetailBodyView extends StatelessWidget {
  final UserReviewEntity review;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UserReviewDetailBodyView({
    super.key,
    required this.review,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'HH:mm - dd/MM/yyyy',
    ).format(review.createdAt);
    final store = review.store;
    final storeName = store?.name ?? 'Salon & Spa';
    final storeAddress = store?.address;
    final storeLogo = store?.logoUrl;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Store Info Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                UserReviewStoreLogo(
                  logoUrl: storeLogo,
                  storeName: storeName,
                  size: 52,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      if (storeAddress != null && storeAddress.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              LucideIcons.map_pin,
                              size: 13,
                              color: Color(0xFF94A3B8),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                storeAddress,
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (review.bookingId != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Mã đơn: #${review.bookingId!.substring(0, review.bookingId!.length > 8 ? 8 : review.bookingId!.length)}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Rating & Content Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Star rating row
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star_rounded,
                            size: 24,
                            color: index < review.rating
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFFE2E8F0),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${review.rating}.0 / 5.0',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E5AF6),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),

                // Services & Staff Tags
                if (review.serviceNames.isNotEmpty ||
                    review.staffName != null) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      ...review.serviceNames.map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF1EE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            s,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFA7762),
                            ),
                          ),
                        ),
                      ),
                      if (review.staffName != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                LucideIcons.user,
                                size: 12,
                                color: Color(0xFF64748B),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                review.staffName!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],

                const SizedBox(height: 16),

                // Comment Content
                const Text(
                  'Nhận xét:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  review.comment,
                  style: const TextStyle(
                    fontSize: 14.5,
                    height: 1.5,
                    color: Color(0xFF334155),
                  ),
                ),

                // Attached photos
                if (review.images.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Hình ảnh đính kèm:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemCount: review.images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          review.images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: const Color(0xFFF1F5F9),
                                child: const Icon(
                                  LucideIcons.image,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),

          // Merchant Reply Card
          if (review.merchantReply != null &&
              review.merchantReply!.isNotEmpty) ...[
            const SizedBox(height: 16),
            UserReviewMerchantReplyCard(
              reply: review.merchantReply!,
              repliedAt: review.merchantRepliedAt,
            ),
          ],

          const SizedBox(height: 24),

          // Bottom Action Buttons
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'Xóa đánh giá',
                  onPressed: onDelete,
                  variant: AppButtonVariant.outline,
                  textColor: const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(24),
                  height: 48,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: AppButton(
                  text: 'Sửa đánh giá',
                  onPressed: onEdit,
                  backgroundColor: const Color(0xFFFA7762),
                  textColor: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  height: 48,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
