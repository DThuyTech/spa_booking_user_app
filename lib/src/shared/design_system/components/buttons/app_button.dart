import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

enum AppButtonVariant { primary, secondary, outline, ghost }

enum AppButtonSize { sm, md, lg }

/// Board Ơi Tactile Button
///
/// Design: Premium minimalism with tactile press feedback.
/// Press animation: 1.0 → 0.97 → 1.0 over 150ms.
/// Shadow: accent glow for primary, soft neumorphic for secondary.
class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.fullWidth = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  bool get _isEnabled => widget.onPressed != null && !widget.isLoading;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppMotion.fast,
      reverseDuration: const Duration(milliseconds: 180),
    );
    _scaleAnimation = Tween<double>(
      begin: AppMotion.scaleNormal,
      end: AppMotion.scalePressed,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.spring));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) {
    if (!_isEnabled) return;
    HapticFeedback.lightImpact();
    _controller.forward();
  }

  void _onTapUp(TapUpDetails _) {
    if (!_isEnabled) return;
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final cfg = _ButtonConfig.of(widget.variant, widget.size);

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading) ...[
          SizedBox(
            width: cfg.fontSize + 2,
            height: cfg.fontSize + 2,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(cfg.foreground),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ] else if (widget.leadingIcon != null) ...[
          widget.leadingIcon!,
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.labelLarge.copyWith(
              fontSize: cfg.fontSize,
              fontWeight: FontWeight.w600,
              color: cfg.foreground,
              letterSpacing: 0.1,
            ),
          ),
        ),
        if (!widget.isLoading && widget.trailingIcon != null) ...[
          const SizedBox(width: 6),
          widget.trailingIcon!,
        ],
      ],
    );

    Widget button = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: _isEnabled ? widget.onPressed : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: AppMotion.fast,
          curve: AppMotion.spring,
          padding: cfg.padding,
          decoration: BoxDecoration(
            color: _isEnabled ? cfg.background : cfg.background.withValues(alpha: 0.5),
            borderRadius: cfg.borderRadius,
            border: cfg.border,
            boxShadow: _isEnabled ? cfg.shadows : null,
          ),
          child: content,
        ),
      ),
    );

    if (widget.fullWidth || widget.width != null) {
      return SizedBox(
        width: widget.fullWidth ? double.infinity : widget.width,
        child: button,
      );
    }
    return button;
  }
}

// ---------------------------------------------------------------------------
// Internal config resolver
// ---------------------------------------------------------------------------

class _ButtonConfig {
  final Color background;
  final Color foreground;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Border? border;
  final List<BoxShadow>? shadows;
  final double fontSize;

  const _ButtonConfig({
    required this.background,
    required this.foreground,
    required this.padding,
    required this.borderRadius,
    required this.fontSize,
    this.border,
    this.shadows,
  });

  static _ButtonConfig of(AppButtonVariant variant, AppButtonSize size) {
    final (padding, fontSize, br) = switch (size) {
      AppButtonSize.sm => (
          const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          12.0,
          BorderRadius.circular(AppRadius.button - 2),
        ),
      AppButtonSize.md => (
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          14.0,
          BorderRadius.circular(AppRadius.button),
        ),
      AppButtonSize.lg => (
          const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          16.0,
          BorderRadius.circular(AppRadius.button + 2),
        ),
    };

    return switch (variant) {
      AppButtonVariant.primary => _ButtonConfig(
          background: AppColors.darkBrown,
          foreground: AppColors.white,
          padding: padding,
          borderRadius: br,
          fontSize: fontSize,
          shadows: AppShadows.accentGlow(AppColors.darkBrown),
        ),
      AppButtonVariant.secondary => _ButtonConfig(
          background: AppColors.surfaceWarm,
          foreground: AppColors.darkBrown,
          padding: padding,
          borderRadius: br,
          fontSize: fontSize,
          border: Border.all(color: AppColors.border, width: 1),
          shadows: AppShadows.neuLow,
        ),
      AppButtonVariant.outline => _ButtonConfig(
          background: AppColors.white,
          foreground: AppColors.primaryBrown,
          padding: padding,
          borderRadius: br,
          fontSize: fontSize,
          border: Border.all(color: AppColors.primaryBrown.withValues(alpha: 0.5), width: 1.2),
        ),
      AppButtonVariant.ghost => _ButtonConfig(
          background: AppColors.transparent,
          foreground: AppColors.primaryBrown,
          padding: padding,
          borderRadius: br,
          fontSize: fontSize,
        ),
    };
  }
}
