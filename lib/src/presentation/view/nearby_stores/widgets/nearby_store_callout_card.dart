import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../models/nearby_store_model.dart';

class NearbyStoreCalloutCard extends StatelessWidget {
  final NearbyStoreItem store;
  final VoidCallback onTapDetail;
  final VoidCallback? onClose;
  final VoidCallback? onDirections;

  const NearbyStoreCalloutCard({
    super.key,
    required this.store,
    required this.onTapDetail,
    this.onClose,
    this.onDirections,
  });

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);
  static const Color _secondaryText = Color(0xFF756C64);
  static const Color _badgeGreen = Color(0xFF4A8B5D);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Main Card Container
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFF0ECE6), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: _darkEspresso.withValues(alpha: 0.14),
                blurRadius: 24,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: onTapDetail,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top: Image + Badges + Close Button
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: SizedBox(
                            height: 105,
                            width: double.infinity,
                            child: Image.network(
                              store.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    color: const Color(0xFFF3EFEA),
                                    child: const Icon(
                                      LucideIcons.store,
                                      color: Color(0xFFA89F95),
                                      size: 32,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        // Soft overlay gradient at bottom of image
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.45),
                                ],
                                stops: const [0.55, 1.0],
                              ),
                            ),
                          ),
                        ),
                        // Status badge (Open / Closed)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: store.isOpen
                                  ? _badgeGreen
                                  : const Color(0xFF6B7280),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  store.isOpen ? 'Mở cửa' : 'Đóng cửa',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Close button
                        if (onClose != null)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: onClose,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    LucideIcons.x,
                                    size: 14,
                                    color: _darkEspresso,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // Price tag overlaid on bottom left of image
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            'Từ ${store.priceFrom}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(color: Colors.black54, blurRadius: 4),
                              ],
                            ),
                          ),
                        ),
                        // Promo Tag if any
                        if (store.promoBadge != null)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: _primaryCoral,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                store.promoBadge!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Store Name
                    Text(
                      store.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        color: _darkEspresso,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Rating & Distance Row
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Color(0xFFF59E0B),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          store.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _darkEspresso,
                          ),
                        ),
                        Text(
                          ' (${store.reviewCount})',
                          style: const TextStyle(
                            fontSize: 11,
                            color: _secondaryText,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC4B8AF),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          LucideIcons.navigation,
                          size: 11,
                          color: _primaryCoral,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            store.distanceText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: _primaryCoral,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Address
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            LucideIcons.map_pin,
                            size: 12,
                            color: _secondaryText,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            store.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: _secondaryText,
                              height: 1.25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Action buttons
                    Row(
                      children: [
                        // Details / Booking Button
                        Expanded(
                          child: Container(
                            height: 34,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFC6E58), Color(0xFFEE533A)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: _primaryCoral.withValues(alpha: 0.35),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: onTapDetail,
                                borderRadius: BorderRadius.circular(12),
                                child: const Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Xem chi tiết',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        LucideIcons.arrow_right,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Directions icon button
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F4F0),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE8E0D7)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onDirections,
                              borderRadius: BorderRadius.circular(12),
                              child: const Center(
                                child: Icon(
                                  LucideIcons.compass,
                                  size: 16,
                                  color: _darkEspresso,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Pointer triangle pointing straight down to the marker pin
        CustomPaint(
          size: const Size(18, 10),
          painter: _CalloutArrowPainter(
            color: Colors.white,
            borderColor: const Color(0xFFF0ECE6),
          ),
        ),
      ],
    );
  }
}

class _CalloutArrowPainter extends CustomPainter {
  final Color color;
  final Color borderColor;

  _CalloutArrowPainter({required this.color, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final borderPath = Path();
    borderPath.moveTo(0, 0);
    borderPath.lineTo(size.width / 2, size.height);
    borderPath.lineTo(size.width, 0);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _CalloutArrowPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.borderColor != borderColor;
}
