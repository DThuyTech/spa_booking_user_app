import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:spa_booking/src/domain/entities/store/service_entity.dart';
import '../../../../shared/shared.dart';

class StoreDetailEntityCard extends StatelessWidget {
  final ServiceEntity service;

  final VoidCallback? onBook;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const StoreDetailEntityCard({super.key, this.onBook, required this.service});

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
              Spacer(),
              const Icon(LucideIcons.clock, size: 13, color: _textMuted),
              const SizedBox(width: 4),
              Text(
                service.durationMinutes.toString(),
                style: const TextStyle(fontSize: 12, color: _textMuted),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Description
          if (service.description != null &&
              service.description!.isNotEmpty) ...[
            Text(
              service.description ?? '-',
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: _textMuted,
              ),
            ),
            const SizedBox(height: 6),
          ],

          // Bottom Row: Duration & Price on left, Book button on right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    service.basePrice.toVnd(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _coralColor,
                    ),
                  ),
                ],
              ),
              AppButton(
                text: 'Book',
                onPressed: onBook,
                backgroundColor: _coralColor,
                textColor: Colors.white,
                borderRadius: BorderRadius.circular(19),
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
