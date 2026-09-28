import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../store_detail/view/store_detail_view.dart';
import '../body_view/favorite_stores_body_view.dart';
import '../mockup_data/favorite_stores_mock_data.dart';
import '../models/favorite_store_item.dart';

@RoutePage()
class FavoriteStoresPage extends StatelessWidget {
  const FavoriteStoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteStoresView();
  }
}

class FavoriteStoresView extends StatefulWidget {
  const FavoriteStoresView({super.key});

  @override
  State<FavoriteStoresView> createState() => _FavoriteStoresViewState();
}

class _FavoriteStoresViewState extends State<FavoriteStoresView> {
  late List<FavoriteStoreItem> _allStores;
  late TextEditingController _searchController;
  String _selectedCategory = 'All';
  String _searchQuery = '';

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  void initState() {
    super.initState();
    _allStores = List.from(FavoriteStoresMockData.defaultFavoriteStores);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<FavoriteStoreItem> get _filteredStores {
    return _allStores.where((store) {
      if (!store.isFavorite) return false;

      final matchesQuery =
          _searchQuery.isEmpty ||
          store.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          store.description.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          store.category.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _selectedCategory == 'All' ||
          store.category.toLowerCase() == _selectedCategory.toLowerCase();

      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _onFavoriteToggle(FavoriteStoreItem store) {
    final nextFavoriteState = !store.isFavorite;

    setState(() {
      final index = _allStores.indexWhere((s) => s.id == store.id);
      if (index != -1) {
        _allStores[index] = _allStores[index].copyWith(
          isFavorite: nextFavoriteState,
        );
      }
    });

    if (!nextFavoriteState) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed ${store.name} from favorites'),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'Undo',
            textColor: _coralColor,
            onPressed: () {
              setState(() {
                final index = _allStores.indexWhere((s) => s.id == store.id);
                if (index != -1) {
                  _allStores[index] = _allStores[index].copyWith(
                    isFavorite: true,
                  );
                }
              });
            },
          ),
        ),
      );
    } else {
      AppToast.success(context, message: 'Added ${store.name} to favorites');
    }
  }

  void _onViewSalon(FavoriteStoreItem store) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StoreDetailView(storeId: store.id)),
    );
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sheet header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Filter by Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: _textDark,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(LucideIcons.x, size: 20),
                          onPressed: () => Navigator.of(sheetContext).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Category chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: FavoriteStoresMockData.categories.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        return ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          selectedColor: _coralColor,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : _textDark,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 13,
                          ),
                          backgroundColor: const Color(0xFFF1F5F9),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (selected) {
                            if (selected) {
                              setSheetState(() => _selectedCategory = cat);
                              setState(() => _selectedCategory = cat);
                              Navigator.of(sheetContext).pop();
                            }
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    // Reset button
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: OutlinedButton(
                        onPressed: () {
                          setSheetState(() => _selectedCategory = 'All');
                          setState(() => _selectedCategory = 'All');
                          Navigator.of(sheetContext).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _textDark,
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Reset Category Filter'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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
                  title: const Text('Sort by Highest Rated'),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    setState(() {
                      _allStores.sort((a, b) => b.rating.compareTo(a.rating));
                    });
                    AppToast.info(context, message: 'Sorted by highest rating');
                  },
                ),
                ListTile(
                  leading: const Icon(LucideIcons.map_pin, color: _coralColor),
                  title: const Text('Sort by Nearest Distance'),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    setState(() {
                      _allStores.sort((a, b) {
                        final distA =
                            double.tryParse(
                              a.distance.replaceAll(RegExp(r'[^0-9.]'), ''),
                            ) ??
                            0;
                        final distB =
                            double.tryParse(
                              b.distance.replaceAll(RegExp(r'[^0-9.]'), ''),
                            ) ??
                            0;
                        return distA.compareTo(distB);
                      });
                    });
                    AppToast.info(
                      context,
                      message: 'Sorted by nearest distance',
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(LucideIcons.share_2, color: _coralColor),
                  title: const Text('Share Favorites List'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppAppBar(title: 'Favorites...', onMorePressed: _showMoreOptions),
      body: FavoriteStoresBodyView(
        searchController: _searchController,
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        onFilterTap: _openFilterSheet,
        hasActiveFilter: _selectedCategory != 'All',
        stores: _filteredStores,
        onFavoriteToggle: _onFavoriteToggle,
        onViewSalon: _onViewSalon,
        onClearSearch: () {
          setState(() {
            _searchController.clear();
            _searchQuery = '';
            _selectedCategory = 'All';
          });
        },
        onExploreSalons: () {
          Navigator.of(context).maybePop();
        },
      ),
    );
  }
}
