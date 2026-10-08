import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../domain/usecases/favorite/get_favorites_usecase.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/store/store_list/store_list_bloc.dart';
import '../body_view/search_body_view.dart';
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
  SpaFilterCriteria _filterCriteria = const SpaFilterCriteria(
    location: '',
    distanceKm: 50.0,
    services: [],
    date: 'Today',
    time: 'Any Time',
    priceRange: RangeValues(0, 500),
    rating: 'All',
  );

  final Set<String> _favoriteIds = {};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onFavoriteToggle(SearchStoreItem store) async {
    final isFav = _favoriteIds.contains(store.id) || store.isFavorite;
    final nextFav = !isFav;
    setState(() {
      if (nextFav) {
        _favoriteIds.add(store.id);
      } else {
        _favoriteIds.remove(store.id);
      }
    });

    if (sl.isRegistered<ToggleFavoriteUseCase>()) {
      final result = await sl<ToggleFavoriteUseCase>()(
        storeId: store.id,
        isFavorite: nextFav,
      );
      result.fold((_) {
        if (mounted) {
          setState(() {
            if (nextFav) {
              _favoriteIds.remove(store.id);
            } else {
              _favoriteIds.add(store.id);
            }
          });
        }
      }, (_) {});
    }

    if (mounted) {
      AppToastHelper.showInfo(
        context,
        message: nextFav
            ? 'Đã thêm ${store.name} vào yêu thích'
            : 'Đã xóa ${store.name} khỏi yêu thích',
      );
    }
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
            city: criteria.location.isNotEmpty ? criteria.location : null,
          ),
        );
        AppToastHelper.showSuccess(context, message: 'Đã áp dụng bộ lọc');
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
        location: '',
        distanceKm: 50.0,
        services: [],
        date: 'Today',
        time: 'Any Time',
        priceRange: RangeValues(0, 500),
        rating: 'All',
      );
      _searchController.clear();
      _searchQuery = '';
    });
    context.read<StoreListBloc>().add(const FetchStoresEvent());
    AppToastHelper.showInfo(context, message: 'Đã đặt lại bộ lọc');
  }

  List<SearchStoreItem> _mapToSearchItems(List<StoreEntity> stores) {
    if (stores.isEmpty) return const [];

    return stores.map((s) {
      final isFav = _favoriteIds.contains(s.id) || s.isFavorite;
      return SearchStoreItem(
        id: s.id,
        name: s.name,
        rating: s.rating,
        distance: s.distanceKm != null
            ? '${s.distanceKm!.toStringAsFixed(1)} km'
            : (s.district?.isNotEmpty == true
                  ? s.district!
                  : (s.address.contains(',')
                        ? s.address.split(',').last.trim()
                        : (s.city ?? s.address))),
        tags: const ['Spa & Wellness'],
        description: s.address,
        imageUrl: (s.coverUrl != null && s.coverUrl!.isNotEmpty)
            ? s.coverUrl!
            : (s.logoUrl != null && s.logoUrl!.isNotEmpty)
            ? s.logoUrl!
            : 'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
        isFavorite: isFav,
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
                isLoading: state.isLoading,
                onQueryChanged: (q) {
                  setState(() {
                    _searchQuery = q.trim();
                  });
                  context.read<StoreListBloc>().add(
                    FetchStoresEvent(
                      search: _searchQuery.isNotEmpty ? _searchQuery : null,
                      city: _filterCriteria.location.isNotEmpty
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
                  context.router.push(StoreDetailRoute(storeId: store.id));
                },
                onFavoriteToggle: _onFavoriteToggle,
                onResetFilters: _onResetFilters,
                onRefresh: () async {
                  context.read<StoreListBloc>().add(
                    FetchStoresEvent(
                      search: _searchQuery.isNotEmpty ? _searchQuery : null,
                      city: _filterCriteria.location.isNotEmpty
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
