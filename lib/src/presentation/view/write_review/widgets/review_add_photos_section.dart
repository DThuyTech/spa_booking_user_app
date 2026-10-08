import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/shared.dart';

class ReviewAddPhotosSection extends StatelessWidget {
  final List<String> photoUrls;
  final VoidCallback? onAddPhoto;
  final ValueChanged<int>? onRemovePhoto;

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _borderColor = Color(0xFFCBD5E1);

  const ReviewAddPhotosSection({
    super.key,
    this.photoUrls = const [],
    this.onAddPhoto,
    this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.addPhotos,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: _textDark,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              // Dashed Add Photo Button
              GestureDetector(
                onTap: onAddPhoto,
                child: CustomPaint(
                  painter: _DashedRectPainter(
                    color: _borderColor,
                    strokeWidth: 1.5,
                    gap: 4,
                    radius: 16,
                  ),
                  child: Container(
                    width: 76,
                    height: 76,
                    alignment: Alignment.center,
                    child: const Icon(
                      LucideIcons.camera,
                      size: 26,
                      color: Color(0xFF334155),
                    ),
                  ),
                ),
              ),

              // Selected Photo Thumbnails
              ...List.generate(photoUrls.length, (index) {
                final url = photoUrls[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 76,
                          height: 76,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: const Color(0xFFE2E8F0),
                                  child: const Icon(
                                    LucideIcons.image,
                                    size: 24,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -6,
                        right: -6,
                        child: GestureDetector(
                          onTap: () => onRemovePhoto?.call(index),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Color(0xFF1E2022),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              LucideIcons.x,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double radius;

  _DashedRectPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().first;
    final totalLength = metrics.length;
    final dashLength = gap * 1.5;

    double distance = 0;
    while (distance < totalLength) {
      final extractPath = metrics.extractPath(distance, distance + dashLength);
      canvas.drawPath(extractPath, paint);
      distance += dashLength + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
