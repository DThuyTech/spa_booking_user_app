import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import '../../../../shared/shared.dart';
import '../utils/store_operating_hours_helper.dart';

class StoreHeaderCard extends StatelessWidget {
  final StoreFullDetailEntity store;

  static const Color _starColor = Color(0xFFF59E0B);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const StoreHeaderCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final operatingStatus = StoreOperatingHoursHelper.calculateStatus(
      businessHours: store.businessHours?.days,
      context: context,
    );
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Store Name
          Text(
            store.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
              color: _textDark,
            ),
          ),

          // Rating and Distance Row
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 17, color: _starColor),
              const SizedBox(width: 4),
              Text(
                '${store.averageRating} (${store.reviewSummary?.totalReviews ?? 0} ${context.l10n.reviews.toLowerCase()})',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
              const SizedBox(width: 14),
            ],
          ),
          Row(
            children: [
              const Icon(LucideIcons.map_pin, size: 14, color: _textMuted),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  store.address,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _textMuted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Badges Row
          Row(
            children: [
              // Operating Status Badge (Open / Closed / Opening soon)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: operatingStatus.badgeBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: operatingStatus.badgeTextColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      operatingStatus.statusText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: operatingStatus.badgeTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (operatingStatus.nextTimeText != null) ...[
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    operatingStatus.nextTimeText!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _textMuted,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),

          // Advance booking availability hint when closed
          if (!operatingStatus.isOpen) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  LucideIcons.calendar_clock,
                  size: 14,
                  color: Color(0xFF059669),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    isVi
                        ? 'Vẫn nhận đặt lịch hẹn cho các ngày khác'
                        : 'Advance booking open for any upcoming day',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF059669),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
