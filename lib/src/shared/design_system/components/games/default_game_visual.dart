import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_typography.dart';

/// Clean editorial illustration representing board game elements (meeple, dice, cards, hexagon)
/// in Board Ơi palette (warm white, brown, beige, terracotta) as required by Section 4 & 30.
class DefaultGameVisual extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final bool compact;

  const DefaultGameVisual({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColors.canvasWarm,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _BoardGameElementsPainter()),
          if (!compact)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.darkBrown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _BoardGameElementsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Background subtle diagonal lines / board grid
    final gridPaint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (double i = -size.height; i < size.width + size.height; i += 32) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        gridPaint,
      );
    }

    // 1. Hexagon Tile (Catan / Resource tile)
    final hexPaint = Paint()
      ..color = AppColors.warmBeige
      ..style = PaintingStyle.fill;
    final hexPath = Path();
    final hexRadius = math.min(size.width, size.height) * 0.28;
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 + 30) * math.pi / 180;
      final x = cx + hexRadius * math.cos(angle);
      final y = cy + hexRadius * math.sin(angle);
      if (i == 0) {
        hexPath.moveTo(x, y);
      } else {
        hexPath.lineTo(x, y);
      }
    }
    hexPath.close();
    canvas.drawPath(hexPath, hexPaint);

    // Hex border
    final hexBorderPaint = Paint()
      ..color = AppColors.primaryBrown.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(hexPath, hexBorderPaint);

    // 2. Playing Card (tilted behind meeple)
    canvas.save();
    canvas.translate(cx + 20, cy - 10);
    canvas.rotate(14 * math.pi / 180);
    final cardRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(-16, -24, 32, 48),
      const Radius.circular(6),
    );
    canvas.drawRRect(
      cardRect,
      Paint()
        ..color = AppColors.surface
        ..style = PaintingStyle.fill,
    );
    canvas.drawRRect(
      cardRect,
      Paint()
        ..color = AppColors.accent.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
    canvas.restore();

    // 3. Meeple (Center iconic shape in terracotta & coffee brown)
    final meeplePaint = Paint()
      ..color = AppColors.accent
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(cx - 14, cy - 6);
    // Head
    canvas.drawCircle(const Offset(0, -18), 7, meeplePaint);
    // Body / Arms / Legs path
    final bodyPath = Path()
      ..moveTo(-6, -11)
      ..lineTo(6, -11)
      ..lineTo(14, -2)
      ..lineTo(11, 4)
      ..lineTo(7, 0)
      ..lineTo(9, 14)
      ..lineTo(3, 14)
      ..lineTo(0, 5)
      ..lineTo(-3, 14)
      ..lineTo(-9, 14)
      ..lineTo(-7, 0)
      ..lineTo(-11, 4)
      ..lineTo(-14, -2)
      ..close();
    canvas.drawPath(bodyPath, meeplePaint);
    canvas.restore();

    // 4. D6 Die (Bottom right)
    final diceRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx + 26, cy + 24),
        width: 22,
        height: 22,
      ),
      const Radius.circular(5),
    );
    canvas.drawRRect(
      diceRect,
      Paint()
        ..color = AppColors.primaryBrown
        ..style = PaintingStyle.fill,
    );
    // Die pips (5 dots)
    final pipPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    final dcx = cx + 26;
    final dcy = cy + 24;
    canvas.drawCircle(Offset(dcx, dcy), 1.6, pipPaint);
    canvas.drawCircle(Offset(dcx - 5, dcy - 5), 1.4, pipPaint);
    canvas.drawCircle(Offset(dcx + 5, dcy - 5), 1.4, pipPaint);
    canvas.drawCircle(Offset(dcx - 5, dcy + 5), 1.4, pipPaint);
    canvas.drawCircle(Offset(dcx + 5, dcy + 5), 1.4, pipPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
