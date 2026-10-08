import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';

class BookingDetailPricingCard extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double totalAmount;
  final String paymentStatus;

  const BookingDetailPricingCard({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.totalAmount,
    required this.paymentStatus,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Subtotal Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.subtotal,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _textMuted,
                ),
              ),
              Text(
                subtotal.toVnd(),
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
            ],
          ),

          if (discount > 0) ...[
            const SizedBox(height: 10),
            // Discount Row with 10% OFF pill
            Row(
              children: [
                Text(
                  context.l10n.discount,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D9488),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCFBF1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '10% OFF',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F766E),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  discount.toVnd(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0D9488),
                  ),
                ),
              ],
            ),
          ],

          const Divider(height: 24, thickness: 1, color: Color(0xFFF1F5F9)),

          // Total Amount Row & UNPAID pill (Matching Image 5)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.totalAmount,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECE8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      paymentStatus,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFFF6F59),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                totalAmount.toVnd(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
