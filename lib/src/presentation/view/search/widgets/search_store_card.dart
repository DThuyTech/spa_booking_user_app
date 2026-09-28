import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../shared/design_system/components/buttons/app_favorite_button.dart';

class SearchStoreItem {
  final String id;
  final String name;
  final double rating;
  final String distance;
  final List<String> tags;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  const SearchStoreItem({
    required this.id,
    required this.name,
    required this.rating,
    required this.distance,
    required this.tags,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  SearchStoreItem copyWith({
    String? id,
    String? name,
    double? rating,
    String? distance,
    List<String>? tags,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return SearchStoreItem(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      distance: distance ?? this.distance,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class SearchStoreCard extends StatelessWidget {
  final SearchStoreItem store;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _tagBg = Color(0xFFFDEEEB);

  const SearchStoreCard({
    super.key,
    required this.store,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F3F5), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Banner Image with Rating Badge & Floating Heart
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 2.1,
                        child: Image.network(
                          store.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFEFEBE7),
                              child: const Icon(
                                Icons.storefront,
                                size: 36,
                                color: Color(0xFFB3A8A0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Rating Badge on Bottom-Left of Image
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.94),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: Color(0xFFC04B37),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              store.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: _textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Floating White Button with Animated Coral Heart on Top-Right
                    Positioned(
                      top: 10,
                      right: 10,
                      child: AppFavoriteButton(
                        isFavorite: store.isFavorite,
                        onToggle: onFavoriteToggle,
                        isFloating: true,
                        size: 38,
                        iconSize: 20,
                        activeColor: _coralColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Name and Distance Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.map_pin,
                          size: 15,
                          color: Color(0xFF4B5563),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          store.distance,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Tags Row (Soft Pink Pills)
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: store.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _tagBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8A5D54),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  store.description,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                    height: 1.35,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
