import 'package:flutter/material.dart';

class ProfileEditCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const ProfileEditCircularButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = const Color(0xFFF3F5F7),
    this.iconColor = const Color(0xFF1E2022),
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
