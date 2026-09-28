import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../../store_detail/view/store_detail_view.dart';
import '../body_view/search_body_view.dart';
import '../mockup_data/search_mock_data.dart';
import '../widgets/search_store_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;
  String _searchQuery = '';
  SpaFilterCriteria _filterCriteria = SearchMockData.defaultCriteria;

  late List<SearchStoreItem> _allStores;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _allStores = List.from(SearchMockData.stores);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SearchStoreItem> get _filteredStores {
    return _allStores.where((store) {
      // 1. Search Query Filter
      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        final matchesName = store.name.toLowerCase().contains(q);
        final matchesTags = store.tags.any((t) => t.toLowerCase().contains(q));
        final matchesDesc = store.description.toLowerCase().contains(q);
        if (!matchesName && !matchesTags && !matchesDesc) return false;
      }

      // 2. Service Filter
      if (_filterCriteria.services.isNotEmpty) {
        final matchesAnyService = _filterCriteria.services.any((svc) {
          return store.tags.any(
            (tag) => tag.toLowerCase().contains(svc.toLowerCase()),
          );
        });
        if (!matchesAnyService) return false;
      }

      // 3. Distance Filter
      final distVal =
          double.tryParse(store.distance.replaceAll(RegExp(r'[^0-9.]'), '')) ??
          0;
      if (distVal > _filterCriteria.distanceKm) return false;

      return true;
    }).toList();
  }

  void _onFavoriteToggle(SearchStoreItem store) {
    setState(() {
      final index = _allStores.indexWhere((s) => s.id == store.id);
      if (index != -1) {
        _allStores[index] = store.copyWith(isFavorite: !store.isFavorite);
      }
    });
    AppToast.info(
      context,
      message: store.isFavorite
          ? 'Removed from favorites'
          : 'Added to favorites',
    );
  }

  void _openFilterBottomSheet() {
    AppFilterBottomSheet.show(
      context,
      initialCriteria: _filterCriteria,
      onApply: (criteria) {
        setState(() {
          _filterCriteria = criteria;
        });
        AppToast.success(context, message: 'Filters applied');
      },
    );
  }

  void _onRemoveServiceFilter(String service) {
    setState(() {
      final updated = List<String>.from(_filterCriteria.services)
        ..remove(service);
      _filterCriteria = _filterCriteria.copyWith(services: updated);
    });
  }

  void _onResetFilters() {
    setState(() {
      _filterCriteria = const SpaFilterCriteria(
        location: 'Ho Chi Minh City',
        distanceKm: 50.0,
        services: [],
        date: 'Today',
        time: 'Any Time',
        priceRange: RangeValues(0, 200),
        rating: '4.0+',
      );
      _searchController.clear();
      _searchQuery = '';
    });
    AppToast.info(context, message: 'Filters reset');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SearchBodyView(
            searchController: _searchController,
            onQueryChanged: (q) {
              setState(() {
                _searchQuery = q.trim();
              });
            },
            onClearQuery: () {
              setState(() {
                _searchController.clear();
                _searchQuery = '';
              });
            },
            onFilterTap: _openFilterBottomSheet,
            activeFilters: _filterCriteria,
            onRemoveServiceFilter: _onRemoveServiceFilter,
            stores: _filteredStores,
            onStoreTap: (store) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StoreDetailView(storeId: store.id),
                ),
              );
            },
            onFavoriteToggle: _onFavoriteToggle,
            onResetFilters: _onResetFilters,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 500));
            },
          ),
        ),
      ),
    );
  }
}
