import 'package:flutter/material.dart';
import '../../../../core/utils/debouncer.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

/// Board Ơi Soft Tactile Search Bar
///
/// Design:
/// - Warm white pill surface with soft shadow
/// - Animated focus state: border brightens + shadow lifts
/// - Filter button with subtle active state
/// - Clear button fades in when text is present
class AppSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onFilterTap;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool autoFocus;
  final Duration debounceDuration;
  final bool showFilterButton;

  const AppSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Tìm ván cờ, địa điểm...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onFilterTap,
    this.onTap,
    this.readOnly = false,
    this.autoFocus = false,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.showFilterButton = false,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  late final Debouncer _debouncer;
  late final FocusNode _focusNode;
  late final AnimationController _focusController;
  late final Animation<double> _focusAnim;

  bool _hasText = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _debouncer = Debouncer(delay: widget.debounceDuration);
    _focusNode = FocusNode();
    _hasText = _controller.text.isNotEmpty;

    _focusController = AnimationController(
      vsync: this,
      duration: AppMotion.normal,
    );
    _focusAnim = CurvedAnimation(
      parent: _focusController,
      curve: AppMotion.spring,
    );

    _controller.addListener(_handleTextChanged);
    _focusNode.addListener(_handleFocusChanged);
  }

  void _handleTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  void _handleFocusChanged() {
    setState(() => _isFocused = _focusNode.hasFocus);
    if (_focusNode.hasFocus) {
      _focusController.forward();
    } else {
      _focusController.reverse();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    _focusNode.removeListener(_handleFocusChanged);
    if (widget.controller == null) _controller.dispose();
    _focusNode.dispose();
    _debouncer.dispose();
    _focusController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _focusAnim,
      builder: (context, child) {
        final shadowColor = Color.lerp(
          AppColors.darkBrown.withValues(alpha: 0.06),
          AppColors.primaryBrown.withValues(alpha: 0.14),
          _focusAnim.value,
        )!;
        final borderColor = Color.lerp(
          AppColors.border,
          AppColors.primaryBrown.withValues(alpha: 0.4),
          _focusAnim.value,
        )!;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(color: borderColor, width: 1.2),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 16 + (_focusAnim.value * 8),
                offset: const Offset(0, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          child: child,
        );
      },
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        textInputAction: TextInputAction.search,
        style: AppTypography.bodyMedium.copyWith(color: AppColors.darkBrown),
        onSubmitted: widget.onSubmitted,
        onChanged: (value) {
          _debouncer.run(() => widget.onChanged?.call(value));
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: AppColors.softBrown,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: Icon(
              Icons.search_rounded,
              color: _isFocused ? AppColors.primaryBrown : AppColors.softBrown,
              size: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Clear button
              AnimatedOpacity(
                opacity: _hasText ? 1.0 : 0.0,
                duration: AppMotion.fast,
                child: _hasText
                    ? GestureDetector(
                        onTap: _clearSearch,
                        child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.canvasWarm,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 14,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              // Filter button
              if (widget.showFilterButton || widget.onFilterTap != null) ...[
                Container(
                  width: 1,
                  height: 20,
                  color: AppColors.border,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                ),
                GestureDetector(
                  onTap: widget.onFilterTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14, left: 8),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 18,
                      color: widget.onFilterTap != null
                          ? AppColors.primaryBrown
                          : AppColors.softBrown,
                    ),
                  ),
                ),
              ] else
                const SizedBox(width: 16),
            ],
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.smMd,
          ),
        ),
      ),
    );
  }
}
