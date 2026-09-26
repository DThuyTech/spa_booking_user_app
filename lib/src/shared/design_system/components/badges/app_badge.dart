import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';

enum AppBadgeVariant { primary, success, warning, error, info, neutral }

enum AppBadgeStyle { subtle, filled, outline }

class AppBadge extends StatelessWidget {
  final String label;
  final AppBadgeVariant variant;
  final AppBadgeStyle style;
  final bool showDot;
  final Widget? icon;

  const AppBadge({
    super.key,
    required this.label,
    this.variant = AppBadgeVariant.primary,
    this.style = AppBadgeStyle.subtle,
    this.showDot = false,
    this.icon,
  });

  const AppBadge.count({
    super.key,
    required int count,
    int maxCount = 99,
    this.variant = AppBadgeVariant.error,
  }) : label = count > maxCount ? '$maxCount+' : '$count',
       style = AppBadgeStyle.filled,
       showDot = false,
       icon = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color baseColor = switch (variant) {
      AppBadgeVariant.primary => AppColors.primary600,
      AppBadgeVariant.success => AppColors.success,
      AppBadgeVariant.warning => AppColors.warning,
      AppBadgeVariant.error => AppColors.error,
      AppBadgeVariant.info => AppColors.info,
      AppBadgeVariant.neutral =>
        isDark ? AppColors.neutral400 : AppColors.neutral600,
    };

    Color backgroundColor;
    Color textColor;
    Border? border;

    switch (style) {
      case AppBadgeStyle.filled:
        backgroundColor = baseColor;
        textColor = AppColors.white;
        break;
      case AppBadgeStyle.subtle:
        backgroundColor = baseColor.withValues(alpha: isDark ? 0.2 : 0.1);
        textColor = baseColor;
        break;
      case AppBadgeStyle.outline:
        backgroundColor = Colors.transparent;
        textColor = baseColor;
        border = Border.all(color: baseColor.withValues(alpha: 0.5));
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.borderFull,
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
          ],
          if (icon != null) ...[icon!, const SizedBox(width: AppSpacing.xs)],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
