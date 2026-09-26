import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final Color? backgroundColor;
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
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation = 0,
    this.showBottomBorder = false,
    this.isEditorial = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    Widget? effectiveLeading = leading;
    if (effectiveLeading == null && showBackButton && canPop) {
      effectiveLeading = Center(
        child: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.sm),
          child: InkWell(
            onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                boxShadow: AppShadows.neuLow,
                border: Border.all(color: AppColors.border, width: 0.8),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: AppColors.darkText,
              ),
            ),
          ),
        ),
      );
    }

    Widget? effectiveTitle = titleWidget;
    if (effectiveTitle == null && title != null) {
      final titleStyle = isEditorial
          ? AppTypography.editorialTitle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            )
          : AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
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

    return AppBar(
      title: effectiveTitle,
      centerTitle: centerTitle,
      leading: effectiveLeading,
      actions: actions != null
          ? [...actions!, const SizedBox(width: AppSpacing.sm)]
          : null,
      backgroundColor: backgroundColor ?? AppColors.background,
      elevation: elevation,
      surfaceTintColor: Colors.transparent,
      shape: showBottomBorder
          ? Border(
              bottom: BorderSide(
                color: AppColors.border.withValues(alpha: 0.8),
                width: 1,
              ),
            )
          : null,
    );
  }
}
