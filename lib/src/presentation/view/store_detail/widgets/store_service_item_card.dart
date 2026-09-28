import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../mockup_data/store_detail_mock_data.dart';

class StoreServiceItemCard extends StatelessWidget {
  final StoreServiceItem service;
  final VoidCallback? onBook;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);
  static const Color _popularBadgeBg = Color(0xFFE0F2FE);
  static const Color _popularBadgeText = Color(0xFF0284C7);

  const StoreServiceItemCard({super.key, required this.service, this.onBook});

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
          // Title + Popular Badge Row
          Row(
            children: [
              Text(
                service.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              if (service.badge != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _popularBadgeBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    service.badge!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: _popularBadgeText,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),

          // Description
          Text(
            service.description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: _textMuted,
            ),
          ),
          const SizedBox(height: 12),

          // Bottom Row: Duration & Price on left, Book button on right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.clock,
                        size: 13,
                        color: _textMuted,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        service.duration,
                        style: const TextStyle(fontSize: 12, color: _textMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.priceDisplay,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _coralColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 38,
                child: ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coralColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('Book'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
