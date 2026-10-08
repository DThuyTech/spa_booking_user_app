import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/domain/entities/favorite/favorite_store_entity.dart';
import 'package:spa_booking/src/presentation/view/favorite_stores/body_view/favorite_stores_body_view.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../bloc/favorite/favorite_stores_bloc.dart';

@RoutePage()
class FavoriteStoresPage extends StatelessWidget {
  const FavoriteStoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteStoresBloc>(
      create: (_) =>
          sl<FavoriteStoresBloc>()..add(const FetchFavoriteStoresEvent()),
      child: const FavoriteStoresView(),
    );
  }
}

class FavoriteStoresView extends StatefulWidget {
  const FavoriteStoresView({super.key});

  @override
  State<FavoriteStoresView> createState() => _FavoriteStoresViewState();
}

enum _FavoriteSortOption { none, highestRated, nameAsc }

class _FavoriteStoresViewState extends State<FavoriteStoresView> {
  static const Color _coralColor = Color(0xFFFF6F59);
  late final TextEditingController _searchController;
  String _searchQuery = '';
  _FavoriteSortOption _sortOption = _FavoriteSortOption.none;

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

  List<FavoriteStoreEntity> _getDisplayStores(
    List<FavoriteStoreEntity> stores,
  ) {
    List<FavoriteStoreEntity> filtered = stores;
    if (_searchQuery.trim().isNotEmpty) {
      final query = _searchQuery.toLowerCase().trim();
      filtered = filtered.where((store) {
        return store.name.toLowerCase().contains(query) ||
            store.address.toLowerCase().contains(query);
      }).toList();
    }

    if (_sortOption == _FavoriteSortOption.highestRated) {
      filtered = List.of(filtered)
        ..sort(
          (a, b) => (b.averageRating ?? 0.0).compareTo(a.averageRating ?? 0.0),
        );
    } else if (_sortOption == _FavoriteSortOption.nameAsc) {
      filtered = List.of(filtered)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    return filtered;
  }

  void _onFavoriteToggle(FavoriteStoreEntity store) {
    final wasFavorite = store.isFavorite;

    context.read<FavoriteStoresBloc>().add(
      ToggleFavoriteStoreEvent(storeId: store.id, isFavorite: wasFavorite),
    );

    if (wasFavorite) {
      AppToast.info(
        context,
        message: 'Removed ${store.name} from favorites',
        actionLabel: 'Undo',
        onAction: () {
          context.read<FavoriteStoresBloc>().add(
            ToggleFavoriteStoreEvent(storeId: store.id, isFavorite: false),
          );
        },
      );
    } else {
      AppToast.success(context, message: 'Added ${store.name} to favorites');
    }
  }

  void _onViewSalon(FavoriteStoreEntity store) {
    context.router.push(StoreDetailRoute(storeId: store.id));
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    LucideIcons.arrow_up_down,
                    color: _coralColor,
                  ),
                  title: Text(context.l10n.sortByHighestRated),
                  trailing: _sortOption == _FavoriteSortOption.highestRated
                      ? const Icon(
                          LucideIcons.check,
                          color: _coralColor,
                          size: 20,
                        )
                      : null,
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    setState(() {
                      _sortOption = _FavoriteSortOption.highestRated;
                    });
                    AppToast.info(context, message: 'Sorted by highest rating');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LucideIcons.arrow_down_a_z,
                    color: _coralColor,
                  ),
                  title: Text(context.l10n.sortAlphabetically),
                  trailing: _sortOption == _FavoriteSortOption.nameAsc
                      ? const Icon(
                          LucideIcons.check,
                          color: _coralColor,
                          size: 20,
                        )
                      : null,
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    setState(() {
                      _sortOption = _FavoriteSortOption.nameAsc;
                    });
                    AppToast.info(context, message: 'Sorted alphabetically');
                  },
                ),
                if (_sortOption != _FavoriteSortOption.none)
                  ListTile(
                    leading: const Icon(
                      LucideIcons.rotate_ccw,
                      color: Color(0xFF64748B),
                    ),
                    title: Text(context.l10n.resetSortOrder),
                    onTap: () {
                      Navigator.of(sheetContext).pop();
                      setState(() {
                        _sortOption = _FavoriteSortOption.none;
                      });
                      AppToast.info(context, message: 'Reset sorting');
                    },
                  ),
                ListTile(
                  leading: const Icon(LucideIcons.share_2, color: _coralColor),
                  title: Text(context.l10n.shareFavorites),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    AppToast.info(
                      context,
                      message: 'Favorites list link copied to clipboard',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(List<FavoriteStoreEntity> rawStores) {
    final displayStores = _getDisplayStores(rawStores);

    return FavoriteStoresBodyView(
      searchController: _searchController,
      onSearchChanged: (query) {
        setState(() {
          _searchQuery = query;
        });
      },
      stores: displayStores,
      onFavoriteToggle: _onFavoriteToggle,
      onViewSalon: _onViewSalon,
      onClearSearch: () {
        setState(() {
          _searchController.clear();
          _searchQuery = '';
        });
      },
      onExploreSalons: () {
        Navigator.of(context).maybePop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppAppBar(
        title: context.l10n.favorites,
        onMorePressed: _showMoreOptions,
      ),
      body: BlocConsumer<FavoriteStoresBloc, FavoriteStoresState>(
        listener: (context, state) {
          if (state.status == FavoriteStoresStatus.failure) {
            AppToast.error(
              context,
              message: state.failure?.message ?? 'Failed to load favorites',
            );
          }
        },
        builder: (context, state) {
          if (state.status == FavoriteStoresStatus.loading &&
              state.items.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: _coralColor),
            );
          }

          return RefreshIndicator(
            color: _coralColor,
            onRefresh: () async {
              context.read<FavoriteStoresBloc>().add(
                const FetchFavoriteStoresEvent(isRefresh: true),
              );
            },
            child: _buildContent(state.items),
          );
        },
      ),
    );
  }
}
