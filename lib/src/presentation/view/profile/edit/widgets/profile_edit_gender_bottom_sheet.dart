import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ProfileEditGenderBottomSheet extends StatelessWidget {
  final String currentGender;
  final ValueChanged<String> onSelected;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _inputBackground = Color(0xFFF4F6F8);
  static const Color _textDark = Color(0xFF1E2022);

  const ProfileEditGenderBottomSheet({
    super.key,
    required this.currentGender,
    required this.onSelected,
  });

  static Future<void> show(
    BuildContext context, {
    required String currentGender,
    required ValueChanged<String> onSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => ProfileEditGenderBottomSheet(
        currentGender: currentGender,
        onSelected: (gender) {
          onSelected(gender);
          Navigator.of(sheetContext).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const options = ['Female', 'Male', 'Other'];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 16),
            ...options.map((gender) {
              final isSelected = gender == currentGender;
              return InkWell(
                onTap: () => onSelected(gender),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _coralColor.withValues(alpha: 0.1)
                        : _inputBackground,
                    borderRadius: BorderRadius.circular(14),
                    border: isSelected
                        ? Border.all(color: _coralColor, width: 1.5)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gender,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected ? _coralColor : _textDark,
                        ),
                      ),
                      if (isSelected)
                        const Icon(
                          LucideIcons.check,
                          size: 18,
                          color: _coralColor,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
