import 'package:flutter/material.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../sections/search_content_section.dart';
import '../sections/search_header_section.dart';
import '../widgets/search_store_card.dart';

class SearchBodyView extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onClearQuery;
  final VoidCallback onFilterTap;
  final SpaFilterCriteria activeFilters;
  final ValueChanged<String>? onRemoveServiceFilter;

  final List<SearchStoreItem> stores;
  final bool isLoading;
  final ValueChanged<SearchStoreItem>? onStoreTap;
  final ValueChanged<SearchStoreItem>? onFavoriteToggle;
  final VoidCallback? onResetFilters;

  final Future<void> Function() onRefresh;

  const SearchBodyView({
    super.key,
    required this.searchController,
    required this.onQueryChanged,
    required this.onClearQuery,
    required this.onFilterTap,
    required this.activeFilters,
    this.onRemoveServiceFilter,
    required this.stores,
    this.isLoading = false,
    this.onStoreTap,
    this.onFavoriteToggle,
    this.onResetFilters,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: const Color(0xFFFC6E58),
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // 1. Search Header Section
            SearchHeaderSection(
              searchController: searchController,
              onQueryChanged: onQueryChanged,
              onClearQuery: onClearQuery,
              onFilterTap: onFilterTap,
              activeFilters: activeFilters,
              resultCount: stores.length,
              onRemoveServiceFilter: onRemoveServiceFilter,
            ),

            const SizedBox(height: 16),

            // 2. Search Content Section (List of Store Cards)
            SearchContentSection(
              stores: stores,
              isLoading: isLoading,
              onStoreTap: onStoreTap,
              onFavoriteToggle: onFavoriteToggle,
              onResetFilters: onResetFilters,
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
