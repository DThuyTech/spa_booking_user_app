import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';

class AppDivider extends StatelessWidget {
  final String? label;
  final double thickness;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const AppDivider({
    super.key,
    this.label,
    this.thickness = 1.0,
    this.color,
    this.padding = const EdgeInsets.symmetric(vertical: AppSpacing.md),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final dividerColor =
        color ?? (isDark ? AppColors.neutral800 : AppColors.neutral200);

    if (label == null) {
      return Padding(
        padding: padding,
        child: Divider(
          height: thickness,
          thickness: thickness,
          color: dividerColor,
        ),
      );
    }

    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: thickness,
              thickness: thickness,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Text(
              label!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.neutral500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              height: thickness,
              thickness: thickness,
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
