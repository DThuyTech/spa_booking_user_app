import 'dart:ui';
import 'package:flutter/material.dart';

class HomeSpecialOfferItem {
  final String id;
  final String title;
  final String discount;
  final String subtitle;
  final String validUntil;
  final String imageUrl;

  const HomeSpecialOfferItem({
    required this.id,
    required this.title,
    required this.discount,
    required this.subtitle,
    required this.validUntil,
    required this.imageUrl,
  });
}

class HomeSpecialOfferCard extends StatelessWidget {
  final HomeSpecialOfferItem offer;
  final VoidCallback? onTap;
  final VoidCallback? onBookNow;

  static const Color _coralColor = Color(0xFFFC6E58);

  const HomeSpecialOfferCard({
    super.key,
    required this.offer,
    this.onTap,
    this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                offer.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE5DDD5),
                    child: const Center(
                      child: Icon(
                        Icons.spa,
                        size: 48,
                        color: Color(0xFFB5A99F),
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFF3EFEA),
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: _coralColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Translucent Glassmorphic Overlay at Bottom
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.9),
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Left Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                offer.discount,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: _coralColor,
                                  letterSpacing: -0.5,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                offer.subtitle,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E2022),
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                offer.validUntil,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Book Now Button
                        ElevatedButton(
                          onPressed: onBookNow ?? onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _coralColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            elevation: 0,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // InkWell for full card click
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
