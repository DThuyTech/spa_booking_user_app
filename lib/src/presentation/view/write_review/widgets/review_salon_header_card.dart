import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ReviewSalonHeaderCard extends StatelessWidget {
  final String salonName;
  final String subtitle;
  final String logoUrl;
  final int selectedRating;
  final ValueChanged<int> onRatingChanged;

  static const Color _starActiveColor = Color(0xFFF59E0B);
  static const Color _starInactiveColor = Color(0xFFE2E8F0);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const ReviewSalonHeaderCard({
    super.key,
    required this.salonName,
    this.subtitle = 'What do you think of your experience?',
    this.logoUrl = '',
    required this.selectedRating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo Avatar
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: logoUrl.isNotEmpty
                  ? Image.network(
                      logoUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildDefaultLogo(),
                    )
                  : _buildDefaultLogo(),
            ),
          ),
          const SizedBox(height: 14),

          // Salon Name
          Text(
            salonName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 6),

          // Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13.5, color: _textMuted),
          ),
          const SizedBox(height: 18),

          // Interactive 5 Stars Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starNumber = index + 1;
              final isFilled = starNumber <= selectedRating;
              return GestureDetector(
                onTap: () => onRatingChanged(starNumber),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedScale(
                    scale: isFilled ? 1.08 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: Icon(
                      isFilled
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      size: 38,
                      color: isFilled ? _starActiveColor : _starInactiveColor,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultLogo() {
    return Container(
      color: const Color(0xFFF1F5F9),
      alignment: Alignment.center,
      child: const Icon(
        LucideIcons.sparkles,
        size: 28,
        color: Color(0xFFFF6F59),
      ),
    );
  }
}
