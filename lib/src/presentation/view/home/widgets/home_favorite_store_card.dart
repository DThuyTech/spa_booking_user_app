import 'package:flutter/material.dart';
import '../../../../domain/entities/favorite/favorite_store_entity.dart';
import '../../../../shared/shared.dart';

class HomeFavoriteStoreCard extends StatelessWidget {
  final FavoriteStoreEntity store;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeFavoriteStoreCard({
    super.key,
    required this.store,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final image = store.coverImageUrl?.isNotEmpty == true
        ? store.coverImageUrl!
        : (store.logoUrl?.isNotEmpty == true
              ? store.logoUrl!
              : 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=600&q=80');

    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F3F5), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image with Favorite heart & Rating Badge
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        image,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 120,
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

                    // Top-right Heart button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite_rounded,
                            size: 16,
                            color: _coralColor,
                          ),
                        ),
                      ),
                    ),

                    // Bottom-left Rating Badge
                    if (store.averageRating != null && store.averageRating! > 0)
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.65),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 13,
                                color: Color(0xFFFFB800),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                store.averageRating!.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
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
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                    letterSpacing: -0.2,
                  ),
                ),

                const SizedBox(height: 4),

                // Address
                Row(
                  children: [
                    const Icon(
                      LucideIcons.map_pin,
                      size: 13,
                      color: Color(0xFF9CA3AF),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        store.address,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
