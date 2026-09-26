import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class AuraLogoBadge extends StatelessWidget {
  final double size;

  const AuraLogoBadge({super.key, this.size = 88});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC8754D).withValues(alpha: 0.16),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.8),
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFF1EB),
            ),
            child: const Icon(
              LucideIcons.sparkles,
              size: 24,
              color: Color(0xFFF26E4F),
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'AURA',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 2.2,
              color: Color(0xFFD35B3B),
            ),
          ),
        ],
      ),
    );
  }
}
