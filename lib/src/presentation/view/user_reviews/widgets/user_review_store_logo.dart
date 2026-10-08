import 'package:flutter/material.dart';

class UserReviewStoreLogo extends StatelessWidget {
  final String? logoUrl;
  final String storeName;
  final double size;

  const UserReviewStoreLogo({
    super.key,
    required this.logoUrl,
    required this.storeName,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    final hasLogo = logoUrl != null && logoUrl!.trim().isNotEmpty;
    final initial = storeName.trim().isNotEmpty
        ? storeName.trim()[0].toUpperCase()
        : 'S';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF1F5F9),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: ClipOval(
        child: hasLogo
            ? Image.network(
                logoUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(initial),
              )
            : _buildFallback(initial),
      ),
    );
  }

  Widget _buildFallback(String initial) {
    return Container(
      color: const Color(0xFFFFECE8),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          fontSize: size * 0.38,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFFA7762),
        ),
      ),
    );
  }
}
