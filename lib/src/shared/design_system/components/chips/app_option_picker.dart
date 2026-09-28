import 'package:flutter/material.dart';

class OptionPickerItem<T> {
  final T value;
  final String label;
  final Widget? icon;

  const OptionPickerItem({required this.value, required this.label, this.icon});
}

class AppOptionPicker<T> extends StatelessWidget {
  final List<OptionPickerItem<T>> options;
  final List<T> selectedValues;
  final ValueChanged<T> onSelected;
  final bool isMultiSelect;
  final Color activeColor;
  final Color activeTextColor;
  final Color inactiveColor;
  final Color inactiveTextColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double spacing;
  final double runSpacing;

  const AppOptionPicker({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onSelected,
    this.isMultiSelect = false,
    this.activeColor = const Color(0xFFFC6E58),
    this.activeTextColor = Colors.white,
    this.inactiveColor = const Color(0xFFF3F4F6),
    this.inactiveTextColor = const Color(0xFF374151),
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.spacing = 8,
    this.runSpacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: options.map((option) {
        final isSelected = selectedValues.contains(option.value);
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onSelected(option.value),
            borderRadius: BorderRadius.circular(borderRadius),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: padding,
              decoration: BoxDecoration(
                color: isSelected ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: activeColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (option.icon != null) ...[
                    option.icon!,
                    const SizedBox(width: 6),
                  ],
                  Text(
                    option.label,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected ? activeTextColor : inactiveTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
