import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class FavoriteStoresSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;
  final bool hasActiveFilter;
  final VoidCallback? onClear;

  const FavoriteStoresSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
    this.hasActiveFilter = false,
    this.onClear,
  });

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Pill search text field
        Expanded(
          child: AppTextField(
            controller: controller,
            onChanged: onChanged,
            hint: 'Search salons, services...',
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.w400,
            ),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1E2022),
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: const Icon(
              LucideIcons.search,
              size: 20,
              color: Color(0xFF94A3B8),
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      LucideIcons.x,
                      size: 18,
                      color: Color(0xFF94A3B8),
                    ),
                    onPressed: () {
                      controller.clear();
                      onChanged('');
                      onClear?.call();
                    },
                  )
                : null,
            fillColor: const Color(0xFFF1F5F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Coral Filter Button
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _coralColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _coralColor.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  LucideIcons.sliders_horizontal,
                  color: Colors.white,
                  size: 22,
                ),
                if (hasActiveFilter)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
