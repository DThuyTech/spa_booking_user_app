import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_radius.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_shadows.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// Reusable store card for salon presentation, supporting both live store entities
/// and an isolated placeholder when store endpoints are pending backend contract.
class HomeStoreCard extends StatelessWidget {
  final String? name;
  final String? address;
  final double? rating;
  final String? coverUrl;
  final VoidCallback? onTap;

  const HomeStoreCard({
    super.key,
    this.name,
    this.address,
    this.rating,
    this.coverUrl,
    this.onTap,
  });

  bool get hasData => name != null;

  @override
  Widget build(BuildContext context) {
    if (hasData) {
      return _buildStoreCard(context);
    }
    return _buildDiscoveryPlaceholderCard(context);
  }

  Widget _buildStoreCard(BuildContext context) {
    return Container(
      width: 220,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  color: AppColors.surfaceWarm,
                  child: coverUrl != null
                      ? Image.network(
                          coverUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _buildFallbackCover(),
                        )
                      : _buildFallbackCover(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: AppTypography.titleSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkBrown,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (address != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        address!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondaryText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (rating != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color(0xFFF59E0B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating!.toStringAsFixed(1),
                            style: AppTypography.labelSmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackCover() {
    return Container(
      color: AppColors.surfaceWarm,
      child: const Center(
        child: Icon(
          LucideIcons.store,
          size: 32,
          color: AppColors.softBrown,
        ),
      ),
    );
  }

  Widget _buildDiscoveryPlaceholderCard(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
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
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surfaceWarm,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: const Center(
              child: Icon(
                LucideIcons.sparkles,
                size: 20,
                color: AppColors.accent,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.salonDiscoveryComingSoon,
                  style: AppTypography.titleMedium.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBrown,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.salonDiscoverySubtitle,
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
