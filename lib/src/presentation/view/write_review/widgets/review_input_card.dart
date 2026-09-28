import 'package:flutter/material.dart';
import '../../../../shared/design_system/components/inputs/app_text_field.dart';

class ReviewInputCard extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  static const Color _bg = Color(0xFFF1F5F9);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _hintColor = Color(0xFF94A3B8);

  const ReviewInputCard({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Tell us more about your visit...',
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      onChanged: onChanged,
      minLines: 5,
      maxLines: 8,
      hint: hintText,
      hintStyle: const TextStyle(fontSize: 14.5, color: _hintColor),
      style: const TextStyle(fontSize: 14.5, height: 1.45, color: _textDark),
      fillColor: _bg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    );
  }
}
