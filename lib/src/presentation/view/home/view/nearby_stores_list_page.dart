import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../domain/usecases/favorite/get_favorites_usecase.dart';
import '../../../../domain/usecases/store/get_stores_usecase.dart';
import '../../../../domain/usecases/store/get_nearby_stores_usecase.dart';
import '../../../../shared/shared.dart';
import '../widgets/nearby_store_list_item_card.dart';

@RoutePage()
class NearbyStoresListPage extends StatefulWidget {
  final List<StoreEntity>? initialStores;
  final String? city;

  const NearbyStoresListPage({super.key, this.initialStores, this.city});

  @override
  State<NearbyStoresListPage> createState() => _NearbyStoresListPageState();
}

class _NearbyStoresListPageState extends State<NearbyStoresListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<StoreEntity> _stores = [];
  Set<String> _favoriteIds = {};
  bool _isLoading = false;
  String _searchQuery = '';

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  void initState() {
    super.initState();
    if (widget.initialStores != null && widget.initialStores!.isNotEmpty) {
      _stores = List.from(widget.initialStores!);
      _favoriteIds = _stores
          .where((s) => s.isFavorite)
          .map((s) => s.id)
          .toSet();
    } else {
      _fetchStores();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchStores() async {
    setState(() => _isLoading = true);
    if (sl.isRegistered<GetNearbyStoresUseCase>()) {
      final nearbyUseCase = sl<GetNearbyStoresUseCase>();
      final result = await nearbyUseCase(
        lat: 10.7769,
        lng: 106.7009,
        city: widget.city,
        limit: 30,
      );
      if (mounted) {
        result.fold((failure) => _fallbackFetchStores(), (stores) {
          if (stores.isNotEmpty) {
            setState(() {
              _stores = stores;
              _favoriteIds = stores
                  .where((s) => s.isFavorite)
                  .map((s) => s.id)
                  .toSet();
              _isLoading = false;
            });
          } else {
            _fallbackFetchStores();
          }
        });
      }
      return;
    }
    await _fallbackFetchStores();
  }

  Future<void> _fallbackFetchStores() async {
    final useCase = sl<GetStoresUseCase>();
    final result = await useCase(city: widget.city, limit: 30);
    result.fold(
      (failure) {
        if (mounted) {
          setState(() => _isLoading = false);
          AppToast.error(context, message: failure.message);
        }
      },
      (stores) {
        if (mounted) {
          setState(() {
            _stores = stores;
            _favoriteIds = stores
                .where((s) => s.isFavorite)
                .map((s) => s.id)
                .toSet();
            _isLoading = false;
          });
        }
      },
    );
  }

  List<StoreEntity> get _filteredStores {
    if (_searchQuery.trim().isEmpty) return _stores;
    final query = _searchQuery.trim().toLowerCase();
    return _stores.where((s) {
      return s.name.toLowerCase().contains(query) ||
          s.address.toLowerCase().contains(query) ||
          (s.district?.toLowerCase().contains(query) ?? false) ||
          (s.city?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  Future<void> _toggleFavorite(StoreEntity store) async {
    final isFav = _favoriteIds.contains(store.id);
    final newFav = !isFav;
    setState(() {
      if (newFav) {
        _favoriteIds.add(store.id);
      } else {
        _favoriteIds.remove(store.id);
      }
    });

    final toggleUseCase = sl<ToggleFavoriteUseCase>();
    final res = await toggleUseCase(storeId: store.id, isFavorite: newFav);
    res.fold(
      (_) {
        // Rollback on error
        if (mounted) {
          setState(() {
            if (isFav) {
              _favoriteIds.add(store.id);
            } else {
              _favoriteIds.remove(store.id);
            }
          });
        }
      },
      (success) {
        if (mounted) {
          AppToast.success(
            context,
            message: newFav
                ? 'Đã thêm ${store.name} vào mục yêu thích'
                : 'Đã xóa ${store.name} khỏi mục yêu thích',
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredStores;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrow_left, color: _textDark, size: 22),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Salon gần bạn',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _textDark,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search & Summary Header Card
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Input Box
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F6F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.search,
                        color: Color(0xFF9CA3AF),
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(
                            fontSize: 14,
                            color: _textDark,
                          ),
                          decoration: const InputDecoration(
                            hintText:
                                'Tìm kiếm spa, salon theo tên, địa chỉ...',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9CA3AF),
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (val) {
                            setState(() => _searchQuery = val);
                          },
                        ),
                      ),
                      if (_searchQuery.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                          child: const Icon(
                            LucideIcons.x,
                            color: Color(0xFF9CA3AF),
                            size: 16,
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Summary Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3.5,
                          ),
                          decoration: BoxDecoration(
                            color: _coralColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${filtered.length}',
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w800,
                              color: _coralColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _searchQuery.isEmpty
                              ? 'Tìm thấy ${filtered.length} spa & salon'
                              : 'Kết quả tìm kiếm cho "${_searchQuery.trim()}"',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                    if (widget.city != null && widget.city!.isNotEmpty)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            LucideIcons.map_pin,
                            size: 12,
                            color: Color(0xFF6B7280),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            widget.city!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFF1F3F5)),

          // Store List
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: _coralColor,
                      strokeWidth: 2.5,
                    ),
                  )
                : filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.store,
                          size: 48,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _searchQuery.isEmpty
                              ? 'Không có salon nào'
                              : 'Không tìm thấy salon phù hợp',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    color: _coralColor,
                    onRefresh: _fetchStores,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: filtered.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final store = filtered[index];
                        final isFav = _favoriteIds.contains(store.id);
                        return NearbyStoreListItemCard(
                          store: store,
                          isFavorite: isFav,
                          onTap: () {
                            context.router.push(
                              StoreDetailRoute(storeId: store.id),
                            );
                          },
                          onFavoriteToggle: () => _toggleFavorite(store),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
