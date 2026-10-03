import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/store/store_list/store_list_bloc.dart';
import '../../store_detail/view/store_detail_view.dart';
import '../body_view/search_body_view.dart';
import '../mockup_data/search_mock_data.dart';
import '../widgets/search_store_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreListBloc>(
      create: (_) => sl<StoreListBloc>()..add(const FetchStoresEvent()),
      child: const _SearchContent(),
    );
  }
}

class _SearchContent extends StatefulWidget {
  const _SearchContent();

  @override
  State<_SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<_SearchContent> {
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

  void _onFavoriteToggle(SearchStoreItem store) {
    setState(() {
      final index = _allStores.indexWhere((s) => s.id == store.id);
      if (index != -1) {
        _allStores[index] = store.copyWith(isFavorite: !store.isFavorite);
      }
    });
    AppToastHelper.showInfo(
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
        context.read<StoreListBloc>().add(
          FetchStoresEvent(
            search: _searchQuery.isNotEmpty ? _searchQuery : null,
            province: criteria.location.isNotEmpty ? criteria.location : null,
          ),
        );
        AppToastHelper.showSuccess(context, message: 'Filters applied');
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
    context.read<StoreListBloc>().add(const FetchStoresEvent());
    AppToastHelper.showInfo(context, message: 'Filters reset');
  }

  List<SearchStoreItem> _mapToSearchItems(List<StoreEntity> stores) {
    if (stores.isEmpty) {
      return _allStores;
    }

    return stores.map((s) {
      return SearchStoreItem(
        id: s.id,
        name: s.name,
        rating: s.rating,
        distance: '1.2 km',
        tags: const ['Spa & Wellness'],
        description: s.address,
        imageUrl:
            s.coverUrl ??
            s.logoUrl ??
            'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
        isFavorite: false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreListBloc, StoreListState>(
      listener: (context, state) {
        if (state.isFailure && state.failure != null) {
          AppToastHelper.showError(context, error: state.failure);
        }
      },
      builder: (context, state) {
        final displayStores = _mapToSearchItems(state.stores);

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
                  context.read<StoreListBloc>().add(
                    FetchStoresEvent(
                      search: _searchQuery.isNotEmpty ? _searchQuery : null,
                      province: _filterCriteria.location.isNotEmpty
                          ? _filterCriteria.location
                          : null,
                    ),
                  );
                },
                onClearQuery: () {
                  setState(() {
                    _searchController.clear();
                    _searchQuery = '';
                  });
                  context.read<StoreListBloc>().add(const FetchStoresEvent());
                },
                onFilterTap: _openFilterBottomSheet,
                activeFilters: _filterCriteria,
                onRemoveServiceFilter: _onRemoveServiceFilter,
                stores: displayStores,
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
                  context.read<StoreListBloc>().add(
                    FetchStoresEvent(
                      search: _searchQuery.isNotEmpty ? _searchQuery : null,
                      province: _filterCriteria.location.isNotEmpty
                          ? _filterCriteria.location
                          : null,
                      isRefresh: true,
                    ),
                  );
                  await Future.delayed(const Duration(milliseconds: 400));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
