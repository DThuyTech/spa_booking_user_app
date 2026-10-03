import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class BookingSearchFilterBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final String hintText;

  const BookingSearchFilterBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterTap,
    this.hintText = 'Search salons, services...',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Input Field
        Expanded(
          child: AppTextField(
            controller: controller,
            onChanged: onChanged,
            hint: hintText,
            hintStyle: const TextStyle(
              fontSize: 13.5,
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.w400,
            ),
            style: const TextStyle(fontSize: 13.5, color: Color(0xFF1E293B)),
            prefixIcon: const Icon(
              LucideIcons.search,
              size: 18,
              color: Color(0xFF64748B),
            ),
            fillColor: const Color(0xFFF1F5F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Filter Button (Like Home page, styled with coral accent)
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onFilterTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFFA7762),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFA7762).withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  LucideIcons.sliders_horizontal,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
