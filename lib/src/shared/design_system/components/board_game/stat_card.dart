import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

/// Social statistics metric card for player profile.
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final String? subtitle;
  final IconData? icon;
  final Color? accentColor;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.subtitle,
    this.icon,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderCard,
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTypography.displayMedium.copyWith(
                  color: AppColors.darkText,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  size: 18,
                  color: accentColor ?? AppColors.primaryBrown,
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.secondaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Collectible modern achievement card (no medieval tropes).
class AchievementCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isUnlocked;
  final String? dateUnlocked;

  const AchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.isUnlocked = true,
    this.dateUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = isUnlocked
        ? AppColors.accent
        : AppColors.secondaryText;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isUnlocked ? AppColors.surface : AppColors.surfaceWarm,
        borderRadius: AppRadius.borderCard,
        border: Border.all(
          color: isUnlocked ? AppColors.border : AppColors.border,
        ),
        boxShadow: isUnlocked ? AppShadows.card : null,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isUnlocked ? AppColors.accentLight : AppColors.warmBeige,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: effectiveColor, size: 22),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTypography.titleSmall.copyWith(
                        color: isUnlocked
                            ? AppColors.darkText
                            : AppColors.secondaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isUnlocked && dateUnlocked != null)
                      Text(
                        dateUnlocked!,
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.secondaryText,
                          fontSize: 10,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                    fontSize: 11,
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
