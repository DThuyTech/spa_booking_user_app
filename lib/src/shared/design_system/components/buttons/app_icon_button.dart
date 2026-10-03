import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';

enum AppIconButtonVariant { filled, tonal, outlined, ghost }

enum AppIconButtonSize { sm, md, lg }

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final AppIconButtonVariant variant;
  final AppIconButtonSize size;
  final bool isCircle;
  final bool isLoading;
  final String? tooltip;
  final Color? color;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? dimension;
  final double? iconSize;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AppIconButtonVariant.ghost,
    this.size = AppIconButtonSize.md,
    this.isCircle = true,
    this.isLoading = false,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
    this.boxShadow,
    this.dimension,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final double effectiveDimension =
        dimension ??
        switch (size) {
          AppIconButtonSize.sm => 32.0,
          AppIconButtonSize.md => 40.0,
          AppIconButtonSize.lg => 48.0,
        };

    final double effectiveIconSize =
        iconSize ??
        switch (size) {
          AppIconButtonSize.sm => 18.0,
          AppIconButtonSize.md => 22.0,
          AppIconButtonSize.lg => 26.0,
        };

    final Color effectiveColor = color ?? theme.colorScheme.primary;

    Color? effectiveBg = backgroundColor;
    Border? border;
    Color effectiveIconColor = iconColor ?? effectiveColor;

    if (effectiveBg == null) {
      switch (variant) {
        case AppIconButtonVariant.filled:
          effectiveBg = effectiveColor;
          effectiveIconColor = iconColor ?? AppColors.white;
          break;
        case AppIconButtonVariant.tonal:
          effectiveBg = effectiveColor.withValues(alpha: 0.12);
          effectiveIconColor = iconColor ?? effectiveColor;
          break;
        case AppIconButtonVariant.outlined:
          effectiveBg = Colors.transparent;
          border = Border.all(
            color: isDark ? AppColors.neutral700 : AppColors.neutral300,
          );
          effectiveIconColor =
              iconColor ??
              (color ?? (isDark ? AppColors.neutral100 : AppColors.neutral800));
          break;
        case AppIconButtonVariant.ghost:
          effectiveBg = Colors.transparent;
          effectiveIconColor =
              iconColor ??
              (color ?? (isDark ? AppColors.neutral200 : AppColors.neutral700));
          break;
      }
    }

    final effectiveRadius =
        borderRadius ?? (isCircle ? null : AppRadius.borderMd);

    final ShapeBorder shape = isCircle && borderRadius == null
        ? const CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: effectiveRadius ?? BorderRadius.circular(12),
          );

    Widget content = Container(
      width: effectiveDimension,
      height: effectiveDimension,
      decoration: BoxDecoration(
        color: effectiveBg,
        shape: (isCircle && borderRadius == null)
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: (isCircle && borderRadius == null)
            ? null
            : (effectiveRadius ?? BorderRadius.circular(12)),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: effectiveIconSize * 0.75,
                height: effectiveIconSize * 0.75,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveIconColor),
                ),
              )
            : Icon(icon, size: effectiveIconSize, color: effectiveIconColor),
      ),
    );

    Widget button = Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: isLoading ? null : onPressed,
        child: content,
      ),
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}
