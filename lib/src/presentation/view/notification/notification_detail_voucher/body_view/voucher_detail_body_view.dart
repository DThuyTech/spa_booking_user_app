import 'package:flutter/material.dart';
import '../../models/notification_models.dart';
import '../widgets/voucher_info_card.dart';

class VoucherDetailBodyView extends StatelessWidget {
  final VoucherNotificationData voucher;

  const VoucherDetailBodyView({super.key, required this.voucher});

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Hero Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.network(
                voucher.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE2E8F0),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 48,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 22),

          // 2. Title
          Text(
            voucher.title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 10),

          // 3. Description
          Text(
            voucher.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: _textMuted,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 22),

          // 4. Voucher Info Card
          VoucherInfoCard(voucher: voucher),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
