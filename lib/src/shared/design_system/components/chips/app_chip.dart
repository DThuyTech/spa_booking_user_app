import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

enum AppChipVariant {
  filter, // Horizontal filter row (mood, category)
  category, // Larger category card
}

/// Board Ơi Animated Filter / Category Chip
///
/// Selected state: brown accent surface + neuLow shadow + scale micro-animation.
/// Unselected: warm canvas + border.
class AppChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final Widget? leadingIcon;
  final AppChipVariant variant;
  final Color? selectedColor;

  const AppChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
    this.leadingIcon,
    this.variant = AppChipVariant.filter,
    this.selectedColor,
  });

  @override
  State<AppChip> createState() => _AppChipState();
}

class _AppChipState extends State<AppChip> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppMotion.normal,
      value: widget.isSelected ? 1.0 : 0.0,
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 1.03,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.spring));
    _opacityAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.spring));
  }

  @override
  void didUpdateWidget(covariant AppChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    HapticFeedback.selectionClick();
    widget.onSelected?.call(!widget.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.selectedColor ?? AppColors.primaryBrown;

    final isCategory = widget.variant == AppChipVariant.category;

    return ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final bg = Color.lerp(
              AppColors.canvasWarm,
              accent.withValues(alpha: 0.1),
              _opacityAnim.value,
            )!;
            final borderColor = Color.lerp(
              AppColors.border,
              accent.withValues(alpha: 0.5),
              _opacityAnim.value,
            )!;
            final textColor = Color.lerp(
              AppColors.secondaryText,
              accent,
              _opacityAnim.value,
            )!;

            return AnimatedContainer(
              duration: AppMotion.normal,
              curve: AppMotion.spring,
              padding: EdgeInsets.symmetric(
                horizontal: isCategory ? AppSpacing.md : AppSpacing.smMd,
                vertical: isCategory ? AppSpacing.sm : 7,
              ),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(
                  color: borderColor,
                  width: widget.isSelected ? 1.5 : 1,
                ),
                boxShadow: widget.isSelected ? AppShadows.neuLow : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.leadingIcon != null) ...[
                    IconTheme(
                      data: IconThemeData(color: textColor, size: 14),
                      child: widget.leadingIcon!,
                    ),
                    const SizedBox(width: 5),
                  ],
                  Text(
                    widget.label,
                    style: AppTypography.labelSmall.copyWith(
                      color: textColor,
                      fontWeight: widget.isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: isCategory ? 12 : 11,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Horizontal scrollable chip filter bar
class AppChipFilterBar extends StatefulWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String>? onChanged;
  final List<Widget>? leadingIcons;

  const AppChipFilterBar({
    super.key,
    required this.options,
    this.selectedValue,
    this.onChanged,
    this.leadingIcons,
  });

  @override
  State<AppChipFilterBar> createState() => _AppChipFilterBarState();
}

class _AppChipFilterBarState extends State<AppChipFilterBar> {
  late String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: widget.options.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, i) {
          final opt = widget.options[i];
          return AppChip(
            label: opt,
            isSelected: _selected == opt,
            leadingIcon:
                widget.leadingIcons != null && i < widget.leadingIcons!.length
                ? widget.leadingIcons![i]
                : null,
            onSelected: (_) {
              setState(() => _selected = opt);
              widget.onChanged?.call(opt);
            },
          );
        },
      ),
    );
  }
}
