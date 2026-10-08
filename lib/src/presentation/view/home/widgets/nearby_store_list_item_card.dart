import 'package:flutter/material.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../shared/shared.dart';

class NearbyStoreListItemCard extends StatelessWidget {
  final StoreEntity store;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const NearbyStoreListItemCard({
    super.key,
    required this.store,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final image = store.coverUrl?.isNotEmpty == true
        ? store.coverUrl!
        : (store.logoUrl?.isNotEmpty == true
              ? store.logoUrl!
              : 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=600&q=80');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F3F5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store Image
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        width: 96,
                        height: 96,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 96,
                          height: 96,
                          color: const Color(0xFFF3F4F6),
                          child: const Center(
                            child: Icon(
                              LucideIcons.image,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Rating badge in bottom-left of image
                    Positioned(
                      bottom: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 11,
                              color: Color(0xFFF59E0B),
                            ),
                            const SizedBox(width: 2.5),
                            Text(
                              store.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),

                // Store Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name & Favorite
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              store.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: _textDark,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: onFavoriteToggle,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                isFavorite || store.isFavorite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                size: 19,
                                color: isFavorite || store.isFavorite
                                    ? _coralColor
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // Address
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.map_pin,
                            size: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              store.address.isNotEmpty
                                  ? store.address
                                  : (store.city ?? 'Hồ Chí Minh'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (store.distanceKm != null) ...[
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.navigation,
                              size: 11,
                              color: _coralColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Cách bạn ${store.distanceKm!.toStringAsFixed(1)} km',
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: _coralColor,
                              ),
                            ),
                          ],
                        ),
                      ],

                      const SizedBox(height: 8),

                      // Price range & Reviews
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (store.priceRange != null &&
                              store.priceRange!.isNotEmpty)
                            Text(
                              store.priceRange!,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: _coralColor,
                              ),
                            )
                          else if (store.minPrice != null)
                            Text(
                              'Từ ${store.minPrice} đ',
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: _coralColor,
                              ),
                            )
                          else
                            const SizedBox.shrink(),
                          Text(
                            '${store.reviewCount} đánh giá',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ],
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
