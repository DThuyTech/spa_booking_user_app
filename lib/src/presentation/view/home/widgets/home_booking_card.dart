import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_radius.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_shadows.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// Card displaying either the nearest upcoming booking or an intentional, premium empty state.
class HomeBookingCard extends StatelessWidget {
  final String? storeName;
  final String? serviceName;
  final String? staffName;
  final String? formattedDateTime;
  final String? statusLabel;
  final VoidCallback? onTap;
  final VoidCallback? onBookNowTap;

  const HomeBookingCard({
    super.key,
    this.storeName,
    this.serviceName,
    this.staffName,
    this.formattedDateTime,
    this.statusLabel,
    this.onTap,
    this.onBookNowTap,
  });

  bool get hasBooking => storeName != null && formattedDateTime != null;

  @override
  Widget build(BuildContext context) {
    if (hasBooking) {
      return _buildActiveBookingCard(context);
    }
    return _buildEmptyBookingCard(context);
  }

  Widget _buildActiveBookingCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderCard,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.sm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.borderCard,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        storeName!,
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBrown,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (statusLabel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.successLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          statusLabel!,
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.calendar_clock,
                      size: 16,
                      color: AppColors.primaryBrown,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      formattedDateTime!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.darkBrown,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (serviceName != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.sparkles,
                        size: 16,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        serviceName!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyBookingCard(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderCard,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.sm,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary50,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.6),
                width: 1,
              ),
            ),
            child: const Center(
              child: Icon(
                LucideIcons.calendar_heart,
                size: 22,
                color: AppColors.primaryBrown,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.noUpcomingAppointments,
                  style: AppTypography.titleMedium.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBrown,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.bookAppointmentSubtitle,
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 12.5,
                    color: AppColors.secondaryText,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          if (onBookNowTap != null) ...[
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                LucideIcons.chevron_right,
                size: 20,
                color: AppColors.accent,
              ),
              onPressed: onBookNowTap,
            ),
          ],
        ],
      ),
    );
  }
}
