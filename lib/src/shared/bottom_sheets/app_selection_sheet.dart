import 'package:flutter/material.dart';
import '../design_system/components/sheets/app_bottom_sheet.dart';
import '../design_system/tokens/app_colors.dart';
import '../design_system/tokens/app_spacing.dart';

class AppSelectionOption<T> {
  final T value;
  final String label;
  final String? subtitle;
  final Widget? icon;

  const AppSelectionOption({
    required this.value,
    required this.label,
    this.subtitle,
    this.icon,
  });
}

class AppSelectionSheet<T> extends StatelessWidget {
  final String title;
  final List<AppSelectionOption<T>> items;
  final T? selectedValue;

  const AppSelectionSheet({
    super.key,
    required this.title,
    required this.items,
    this.selectedValue,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<AppSelectionOption<T>> items,
    T? selectedValue,
  }) {
    return AppBottomSheet.show<T>(
      context,
      title: title,
      child: AppSelectionSheet<T>(
        title: title,
        items: items,
        selectedValue: selectedValue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = item.value == selectedValue;

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          leading: item.icon,
          title: Text(
            item.label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? theme.colorScheme.primary : null,
            ),
          ),
          subtitle: item.subtitle != null
              ? Text(
                  item.subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral500,
                  ),
                )
              : null,
          trailing: isSelected
              ? Icon(Icons.check_rounded, color: theme.colorScheme.primary)
              : null,
          onTap: () => Navigator.of(context).pop(item.value),
        );
      },
    );
  }
}
