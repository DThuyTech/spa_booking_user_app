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
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final double dimension = switch (size) {
      AppIconButtonSize.sm => 32.0,
      AppIconButtonSize.md => 40.0,
      AppIconButtonSize.lg => 48.0,
    };

    final double iconSize = switch (size) {
      AppIconButtonSize.sm => 18.0,
      AppIconButtonSize.md => 22.0,
      AppIconButtonSize.lg => 26.0,
    };

    final Color effectiveColor = color ?? theme.colorScheme.primary;

    Color? backgroundColor;
    Border? border;
    Color iconColor = effectiveColor;

    switch (variant) {
      case AppIconButtonVariant.filled:
        backgroundColor = effectiveColor;
        iconColor = AppColors.white;
        break;
      case AppIconButtonVariant.tonal:
        backgroundColor = effectiveColor.withValues(alpha: 0.12);
        iconColor = effectiveColor;
        break;
      case AppIconButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        border = Border.all(
          color: isDark ? AppColors.neutral700 : AppColors.neutral300,
        );
        iconColor =
            color ?? (isDark ? AppColors.neutral100 : AppColors.neutral800);
        break;
      case AppIconButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        iconColor =
            color ?? (isDark ? AppColors.neutral200 : AppColors.neutral700);
        break;
    }

    final shape = isCircle
        ? const CircleBorder()
        : const RoundedRectangleBorder(borderRadius: AppRadius.borderMd);

    Widget content = Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : AppRadius.borderMd,
        border: border,
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: iconSize * 0.75,
                height: iconSize * 0.75,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                ),
              )
            : Icon(icon, size: iconSize, color: iconColor),
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
