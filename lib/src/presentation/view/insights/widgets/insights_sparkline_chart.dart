import 'package:flutter/material.dart';

class InsightsSparklineChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final Color lineColor;
  final Color dotColor;

  const InsightsSparklineChart({
    super.key,
    required this.values,
    required this.labels,
    required this.lineColor,
    this.dotColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Graph Canvas
        SizedBox(
          height: 110,
          width: double.infinity,
          child: CustomPaint(
            painter: _SparklinePainter(
              values: values,
              lineColor: lineColor,
              dotColor: dotColor,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // X-Axis Month Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels.map((label) {
            return Text(
              label,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF94A3B8),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> values;
  final Color lineColor;
  final Color dotColor;

  _SparklinePainter({
    required this.values,
    required this.lineColor,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;

    // 1. Draw horizontal dotted/faint grid lines
    final gridPaint = Paint()
      ..color = const Color(0xFFF1F5F9)
      ..strokeWidth = 1.0;

    for (int i = 1; i <= 3; i++) {
      final y = size.height * (i / 4);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final double minVal = values.reduce((a, b) => a < b ? a : b);
    final double maxVal = values.reduce((a, b) => a > b ? a : b);
    final double range = (maxVal - minVal) == 0 ? 1.0 : (maxVal - minVal);

    // Padding inside canvas
    final double topPadding = 12.0;
    final double bottomPadding = 12.0;
    final double usableHeight = size.height - topPadding - bottomPadding;

    // Generate points
    final List<Offset> points = [];
    final double dx = size.width / (values.length - 1);

    for (int i = 0; i < values.length; i++) {
      final normY = (values[i] - minVal) / range;
      final y = size.height - bottomPadding - (normY * usableHeight);
      points.add(Offset(i * dx, y));
    }

    // 2. Build Smooth Spline Path
    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final controlPoint1 = Offset(p0.dx + (p1.dx - p0.dx) / 2, p0.dy);
      final controlPoint2 = Offset(p0.dx + (p1.dx - p0.dx) / 2, p1.dy);
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        p1.dx,
        p1.dy,
      );
    }

    // 3. Fill Gradient under Curve
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withValues(alpha: 0.28),
          lineColor.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    // 4. Draw Line Stroke
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, linePaint);

    // 5. Draw Dots
    final dotFillPaint = Paint()..color = dotColor;
    final dotBorderPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (final point in points) {
      canvas.drawCircle(point, 3.5, dotFillPaint);
      canvas.drawCircle(point, 3.5, dotBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.lineColor != lineColor;
  }
}
