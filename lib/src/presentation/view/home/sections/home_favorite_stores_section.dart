import 'package:flutter/material.dart';
import '../../../../domain/entities/favorite/favorite_store_entity.dart';
import '../widgets/home_favorite_store_card.dart';

class HomeFavoriteStoresSection extends StatelessWidget {
  final List<FavoriteStoreEntity> stores;
  final ValueChanged<FavoriteStoreEntity>? onStoreTap;
  final ValueChanged<FavoriteStoreEntity>? onFavoriteToggle;
  final VoidCallback? onSeeAllTap;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeFavoriteStoresSection({
    super.key,
    required this.stores,
    this.onStoreTap,
    this.onFavoriteToggle,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.favorite_rounded, size: 18, color: _coralColor),
                  SizedBox(width: 8),
                  Text(
                    'Salon yêu thích',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _textDark,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              if (onSeeAllTap != null)
                InkWell(
                  onTap: onSeeAllTap,
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      'Tất cả',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _coralColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Horizontal List
        SizedBox(
          height: 206,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: stores.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final store = stores[index];
              return HomeFavoriteStoreCard(
                store: store,
                onTap: () => onStoreTap?.call(store),
                onFavoriteToggle: () => onFavoriteToggle?.call(store),
              );
            },
          ),
        ),
      ],
    );
  }
}
