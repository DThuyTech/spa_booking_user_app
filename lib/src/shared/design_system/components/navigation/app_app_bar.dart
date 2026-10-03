import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

/// Standard, reusable application bar designed for the Spa Booking app.
///
/// Features a circular back button on the left, a centered terracotta title,
/// and an optional circular more/options button (or custom actions) on the right.
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMorePressed;
  final bool showMoreButton;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final bool showBottomBorder;
  final bool isEditorial;

  const AppAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.onMorePressed,
    this.showMoreButton = false,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 0,
    this.showBottomBorder = false,
    this.isEditorial = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);

  Widget _buildCircularButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(21),
        child: Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F5F9),
            shape: BoxShape.circle,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    // 1. Leading Button
    Widget? effectiveLeading = leading;
    if (effectiveLeading == null && showBackButton && canPop) {
      effectiveLeading = Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: _buildCircularButton(
            onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
            child: const Icon(
              LucideIcons.arrow_left,
              size: 20,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
      );
    }

    // 2. Title
    Widget? effectiveTitle = titleWidget;
    if (effectiveTitle == null && title != null) {
      final Color resolvedTitleColor =
          titleColor ?? const Color(0xFFBA4A32); // Brand terracotta color

      final titleStyle = isEditorial
          ? AppTypography.editorialTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: resolvedTitleColor,
            )
          : TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: resolvedTitleColor,
            );

      if (subtitle != null) {
        effectiveTitle = Column(
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title!, style: titleStyle),
            Text(
              subtitle!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        );
      } else {
        effectiveTitle = Text(title!, style: titleStyle);
      }
    }

    // 3. Actions / Trailing Button
    List<Widget>? effectiveActions = actions;
    if ((onMorePressed != null || showMoreButton) &&
        (effectiveActions == null || effectiveActions.isEmpty)) {
      effectiveActions = [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Center(
            child: _buildCircularButton(
              onTap: onMorePressed ?? () {},
              child: const Icon(
                LucideIcons.ellipsis,
                size: 20,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ),
      ];
    } else if (effectiveActions != null) {
      effectiveActions = [
        ...effectiveActions,
        const SizedBox(width: AppSpacing.xs),
      ];
    }

    return AppBar(
      title: effectiveTitle,
      centerTitle: centerTitle,
      leading: effectiveLeading,
      leadingWidth: effectiveLeading != null ? 58 : null,
      actions: effectiveActions,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      scrolledUnderElevation: 0.5,
      surfaceTintColor: Colors.transparent,
      shape: showBottomBorder
          ? Border(bottom: BorderSide(color: const Color(0xFFF1F5F9), width: 1))
          : null,
    );
  }
}
