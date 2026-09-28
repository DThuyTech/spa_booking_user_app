import 'package:flutter/material.dart';
import '../mockup_data/store_detail_mock_data.dart';

class StoreReviewItemCard extends StatelessWidget {
  final StoreReviewItem review;

  static const Color _starColor = Color(0xFFF59E0B);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const StoreReviewItemCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar with Initials
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: review.avatarBgColor.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  review.authorInitials,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Name and Time ago
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: _textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      review.timeAgo,
                      style: const TextStyle(fontSize: 12, color: _textMuted),
                    ),
                  ],
                ),
              ),

              // Star rating
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 1.5),
                    child: Icon(
                      Icons.star_rounded,
                      size: 15,
                      color: index < review.rating
                          ? _starColor
                          : const Color(0xFFCBD5E1),
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Review Content
          Text(
            review.content,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }
}
