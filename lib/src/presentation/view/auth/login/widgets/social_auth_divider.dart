import 'package:flutter/material.dart';

class SocialAuthDivider extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const SocialAuthDivider({super.key, this.onGoogleTap, this.onAppleTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFFD6CBC3).withValues(alpha: 0.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'or',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF8A7D75),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFFD6CBC3).withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialCircle(onTap: onGoogleTap, child: _buildGoogleIcon()),
            const SizedBox(width: 22),
            _buildSocialCircle(
              onTap: onAppleTap,
              child: const Icon(
                Icons.apple,
                size: 26,
                color: Color(0xFF1E1713),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialCircle({required Widget child, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2C241F).withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildGoogleIcon() {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Google 'G' 4-color multi-arc approximation
    final center = Offset(w / 2, h / 2);
    final radius = w / 2;

    final redPaint = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.6;
    final yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.6;
    final greenPaint = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.6;
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.6;

    final rect = Rect.fromCircle(center: center, radius: radius - 2);

    // Red arc (top)
    canvas.drawArc(rect, -2.3, 1.4, false, redPaint);
    // Yellow arc (left)
    canvas.drawArc(rect, 2.3, 1.3, false, yellowPaint);
    // Green arc (bottom)
    canvas.drawArc(rect, 0.8, 1.5, false, greenPaint);
    // Blue arc + bar (right)
    canvas.drawArc(rect, -0.4, 1.2, false, bluePaint);

    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(center.dx - 1, center.dy - 1.8, radius + 1, 3.6),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
