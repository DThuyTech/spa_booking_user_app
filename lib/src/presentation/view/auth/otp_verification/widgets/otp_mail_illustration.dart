import 'package:flutter/material.dart';

class OtpMailIllustration extends StatelessWidget {
  final double size;

  const OtpMailIllustration({super.key, this.size = 130});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0xFFF2F8FF),
            const Color(0xFFFAF7F5),
            Colors.white.withValues(alpha: 0.1),
          ],
          stops: const [0.3, 0.7, 1.0],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 80,
          height: 90,
          child: CustomPaint(
            painter: _PhoneMailPainter(),
          ),
        ),
      ),
    );
  }
}

class _PhoneMailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Phone outline
    final phoneRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h / 2),
        width: w * 0.68,
        height: h * 0.88,
      ),
      const Radius.circular(16),
    );

    final phoneOutlinePaint = Paint()
      ..color = const Color(0xFFFA8B74).withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    canvas.drawRRect(phoneRect, phoneOutlinePaint);

    // Camera circle at top of phone
    final speakerPaint = Paint()
      ..color = const Color(0xFF90A4AE).withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    canvas.drawCircle(Offset(w / 2 + 12, h * 0.14), 2.5, speakerPaint);

    // Inner phone screen line
    final innerScreen = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h / 2),
        width: w * 0.52,
        height: h * 0.65,
      ),
      const Radius.circular(10),
    );
    final innerPaint = Paint()
      ..color = const Color(0xFFFDEFEA).withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(innerScreen, innerPaint);

    // Envelope badge in center of screen
    final envCenter = Offset(w / 2, h / 2);
    final envWidth = w * 0.36;
    final envHeight = h * 0.28;

    final envRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: envCenter, width: envWidth, height: envHeight),
      const Radius.circular(6),
    );

    final envBgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final envBorderPaint = Paint()
      ..color = const Color(0xFFF87154)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    canvas.drawRRect(envRect, envBgPaint);
    canvas.drawRRect(envRect, envBorderPaint);

    // Envelope flap lines (V)
    final flapPath = Path()
      ..moveTo(envCenter.dx - envWidth / 2 + 2, envCenter.dy - envHeight / 2 + 2)
      ..lineTo(envCenter.dx, envCenter.dy + 2)
      ..lineTo(envCenter.dx + envWidth / 2 - 2, envCenter.dy - envHeight / 2 + 2);

    canvas.drawPath(flapPath, envBorderPaint);

    // Little decorative accents
    // 1. Pale cyan triangle top-left
    final trianglePaint = Paint()
      ..color = const Color(0xFF7DD3FC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final triPath = Path()
      ..moveTo(w * 0.15, h * 0.22)
      ..lineTo(w * 0.24, h * 0.22)
      ..lineTo(w * 0.19, h * 0.14)
      ..close();
    canvas.drawPath(triPath, trianglePaint);

    // 2. Small star bottom-right
    final starPaint = Paint()
      ..color = const Color(0xFF5EEAD4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final cx = w * 0.88;
    final cy = h * 0.78;
    canvas.drawLine(Offset(cx - 3, cy), Offset(cx + 3, cy), starPaint);
    canvas.drawLine(Offset(cx, cy - 3), Offset(cx, cy + 3), starPaint);

    // 3. Small polygon bottom-left
    final polyPaint = Paint()
      ..color = const Color(0xFFFDBA74)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    canvas.drawCircle(Offset(w * 0.16, h * 0.76), 3, polyPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
