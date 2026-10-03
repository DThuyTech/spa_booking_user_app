import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../widgets/search_store_card.dart';

class SearchContentSection extends StatelessWidget {
  final List<SearchStoreItem> stores;
  final ValueChanged<SearchStoreItem>? onStoreTap;
  final ValueChanged<SearchStoreItem>? onFavoriteToggle;
  final VoidCallback? onResetFilters;

  const SearchContentSection({
    super.key,
    required this.stores,
    this.onStoreTap,
    this.onFavoriteToggle,
    this.onResetFilters,
  });

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDEEEB),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    LucideIcons.search_x,
                    color: Color(0xFFFC6E58),
                    size: 34,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'No Salons Found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E2022),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Try adjusting your search query or reset your filters to discover more beauty spots.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
              if (onResetFilters != null) ...[
                const SizedBox(height: 18),
                AppButton(
                  text: 'Reset Filters',
                  onPressed: onResetFilters,
                  backgroundColor: const Color(0xFFFC6E58),
                  textColor: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  size: AppButtonSize.sm,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return SearchStoreCard(
          store: store,
          onTap: () => onStoreTap?.call(store),
          onFavoriteToggle: () => onFavoriteToggle?.call(store),
        );
      },
    );
  }
}
