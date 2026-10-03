import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../shared/design_system/components/buttons/app_favorite_button.dart';

class HomeRecommendedSalonItem {
  final String id;
  final String name;
  final String categoryLocation;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final bool isFavorite;

  const HomeRecommendedSalonItem({
    required this.id,
    required this.name,
    required this.categoryLocation,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class HomeRecommendedSalonCard extends StatelessWidget {
  final HomeRecommendedSalonItem item;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeRecommendedSalonCard({
    super.key,
    required this.item,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F3F5), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                // Bottom-right decorative corner petal matching Image 2 & Image 3
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Image.asset(
                    'assets/images/recommended_corner_petal.png',
                    width: 52,
                    height: 52,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),

                // Card content padding
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Square Rounded Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: SizedBox(
                          width: 76,
                          height: 76,
                          child: Image.network(
                            item.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFEFEBE7),
                                child: const Icon(
                                  Icons.spa,
                                  color: Color(0xFFB3A8A0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Center text info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _textDark,
                                letterSpacing: -0.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.categoryLocation,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  size: 17,
                                  color: Color(0xFFF59E0B),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  item.rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _textDark,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  LucideIcons.message_square,
                                  size: 13,
                                  color: Color(0xFF9CA3AF),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${item.reviewCount} reviews)',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Spacing for top-right heart icon
                      const SizedBox(width: 34),
                    ],
                  ),
                ),

                // Top-right animated heart favorite button
                Positioned(
                  top: 6,
                  right: 6,
                  child: AppFavoriteButton(
                    isFavorite: item.isFavorite,
                    onToggle: onFavoriteToggle,
                    size: 38,
                    iconSize: 22,
                    activeColor: _coralColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
