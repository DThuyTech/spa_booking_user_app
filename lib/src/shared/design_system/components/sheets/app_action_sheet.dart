import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';

class AppActionSheetItem {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final bool isDestructive;

  const AppActionSheetItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });
}

class AppActionSheet extends StatelessWidget {
  final String? title;
  final String? message;
  final List<AppActionSheetItem> actions;
  final String cancelLabel;

  const AppActionSheet({
    super.key,
    this.title,
    this.message,
    required this.actions,
    this.cancelLabel = 'Cancel',
  });

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? message,
    required List<AppActionSheetItem> actions,
    String cancelLabel = 'Cancel',
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AppActionSheet(
        title: title,
        message: message,
        actions: actions,
        cancelLabel: cancelLabel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark ? AppColors.neutral900 : AppColors.white;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: AppRadius.borderLg,
              ),
              child: Column(
                children: [
                  if (title != null || message != null) ...[
                    Padding(
                      padding: AppSpacing.edgeInsetsAllMd,
                      child: Column(
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (message != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              message!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.neutral500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                  ],
                  ...actions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final action = entry.value;
                    final itemColor = action.isDestructive
                        ? AppColors.error
                        : (isDark ? AppColors.white : AppColors.neutral900);

                    return Column(
                      children: [
                        if (index > 0) const Divider(height: 1),
                        ListTile(
                          leading: action.icon != null
                              ? Icon(action.icon, color: itemColor, size: 22)
                              : null,
                          title: Text(
                            action.label,
                            style: TextStyle(
                              color: itemColor,
                              fontWeight: action.isDestructive
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                            textAlign: action.icon == null
                                ? TextAlign.center
                                : TextAlign.start,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            action.onTap();
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: AppRadius.borderLg,
              ),
              child: ListTile(
                title: Text(
                  cancelLabel,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
