import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/shared.dart';

class UserReviewMerchantReplyCard extends StatelessWidget {
  final String reply;
  final DateTime? repliedAt;

  const UserReviewMerchantReplyCard({
    super.key,
    required this.reply,
    this.repliedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.message_square,
                size: 13,
                color: Color(0xFFFA7762),
              ),
              const SizedBox(width: 6),
              const Text(
                'Phản hồi từ Salon',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              if (repliedAt != null) ...[
                const Spacer(),
                Text(
                  DateFormat('dd/MM/yyyy').format(repliedAt!),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            reply,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.4,
              color: Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }
}
