import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/favorite/favorite_store_entity.dart';
import '../widgets/favorite_store_card.dart';
import '../widgets/favorite_stores_empty_view.dart';
import '../widgets/favorite_stores_search_bar.dart';

class FavoriteStoresBodyView extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onFilterTap;
  final bool hasActiveFilter;
  final List<FavoriteStoreEntity> stores;
  final ValueChanged<FavoriteStoreEntity> onFavoriteToggle;
  final ValueChanged<FavoriteStoreEntity> onViewSalon;
  final VoidCallback onClearSearch;
  final VoidCallback onExploreSalons;

  const FavoriteStoresBodyView({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    this.onFilterTap,
    this.hasActiveFilter = false,
    required this.stores,
    required this.onFavoriteToggle,
    required this.onViewSalon,
    required this.onClearSearch,
    required this.onExploreSalons,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Column(
      children: [
        // Search & Filter Header Row
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: FavoriteStoresSearchBar(
            controller: searchController,
            onChanged: onSearchChanged,
            onFilterTap: onFilterTap,
            hasActiveFilter: hasActiveFilter,
            onClear: onClearSearch,
          ),
        ),

        // List of Favorites or Empty State
        Expanded(
          child: stores.isEmpty
              ? FavoriteStoresEmptyView(
                  isSearching:
                      searchController.text.isNotEmpty || hasActiveFilter,
                  onAction: searchController.text.isNotEmpty || hasActiveFilter
                      ? onClearSearch
                      : onExploreSalons,
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    bottomInset > 0 ? bottomInset + 20 : 28,
                  ),
                  itemCount: stores.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final store = stores[index];
                    return FavoriteStoreCard(
                      store: store,
                      onFavoriteToggle: () => onFavoriteToggle(store),
                      onViewSalon: () => onViewSalon(store),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
