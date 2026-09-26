import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable glassmorphic text input field with soft translucent white background,
/// matching Image 2 with subtle opacity and zero harsh theme borders.
class GlassmorphicTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool hasError;
  final Key? textFieldKey;

  const GlassmorphicTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.hasError = false,
    this.textFieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.36),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: hasError
                  ? const Color(0xFFE53E3E).withValues(alpha: 0.8)
                  : Colors.white.withValues(alpha: 0.45),
              width: 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: TextField(
            key: textFieldKey,
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            cursorColor: const Color(0xFFFA7355),
            cursorWidth: 1.8,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C241F),
              letterSpacing: 0.2,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.transparent, // Overrides theme's solid white surface
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: Color(0xFF94857E),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 18, right: 12),
                child: Icon(
                  prefixIcon,
                  size: 20,
                  color: const Color(0xFF8A7D75),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 50,
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
