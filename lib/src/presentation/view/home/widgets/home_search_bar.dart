import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:spa_booking/src/shared/design_system/tokens/app_colors.dart';
import 'package:spa_booking/src/shared/design_system/tokens/app_radius.dart';
import 'package:spa_booking/src/shared/design_system/tokens/app_shadows.dart';
import 'package:spa_booking/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// Entry point search bar for salon and service discovery.
class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;

  const HomeSearchBar({super.key, this.onTap, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderFull,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.sm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.borderFull,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  LucideIcons.search,
                  size: 20,
                  color: AppColors.primaryBrown,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.searchSalonsPlaceholder,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.secondaryText.withValues(alpha: 0.8),
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: onFilterTap ?? onTap,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceWarm,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.border.withValues(alpha: 0.7),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        LucideIcons.sliders_horizontal,
                        size: 16,
                        color: AppColors.primaryBrown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
