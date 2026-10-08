import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../domain/usecases/store/get_nearby_stores_usecase.dart';
import '../../../../domain/usecases/store/get_stores_usecase.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../models/nearby_store_model.dart';
import '../widgets/nearby_store_bottom_slider.dart';
import '../widgets/nearby_store_map_canvas.dart';
import '../widgets/nearby_store_search_bar.dart';

@RoutePage()
class NearbyStoresView extends StatefulWidget {
  const NearbyStoresView({super.key});

  @override
  State<NearbyStoresView> createState() => _NearbyStoresViewState();
}

class _NearbyStoresViewState extends State<NearbyStoresView> {
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  late final PageController _pageController;

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);

  List<NearbyStoreItem> _allStores = [];
  List<NearbyStoreItem> _filteredStores = [];
  NearbyStoreItem? _selectedStore;
  String _activeFilter = 'Tất cả';

  // Filter criteria for bottom sheet
  double _filterRadiusKm = 3.0;
  double _filterMinRating = 4.0;
  bool _filterOnlyOpen = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
    _loadStores();

    // Initial center on user location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recenterMapOnUser();
    });
  }

  Future<void> _loadStores() async {
    List<StoreEntity> stores = [];
    if (sl.isRegistered<GetNearbyStoresUseCase>()) {
      final res = await sl<GetNearbyStoresUseCase>()(
        lat: 10.7769,
        lng: 106.7009,
        limit: 30,
      );
      res.fold((_) {}, (list) => stores = list);
    }
    if (stores.isEmpty && sl.isRegistered<GetStoresUseCase>()) {
      final res = await sl<GetStoresUseCase>()(limit: 30);
      res.fold((_) {}, (list) => stores = list);
    }

    if (!mounted) return;
    final items = stores.map((s) {
      final dist = s.distanceKm ?? 1.2;
      return NearbyStoreItem(
        id: s.id,
        name: s.name,
        category: 'Spa & Salon',
        address: s.address,
        rating: s.rating,
        reviewCount: s.reviewCount,
        distanceKm: dist,
        distanceText: '${dist.toStringAsFixed(1)} km',
        priceFrom: s.minPrice != null ? '${s.minPrice}đ' : '150.000đ',
        imageUrl: (s.coverUrl != null && s.coverUrl!.isNotEmpty)
            ? s.coverUrl!
            : (s.logoUrl != null && s.logoUrl!.isNotEmpty)
            ? s.logoUrl!
            : 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=600&q=80',
        isOpen: true,
        openHours: '08:30 - 21:00',
        phone: s.phoneNumber,
        popularServices: const ['Chăm sóc da', 'Massage'],
        latitude: s.latitude ?? 10.7769,
        longitude: s.longitude ?? 106.7009,
      );
    }).toList();

    setState(() {
      _allStores = items;
      _applyFilters();
      if (_filteredStores.isNotEmpty) {
        _selectedStore = _filteredStores.first;
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _recenterMapOnUser() {
    if (!mounted) return;
    _mapController.move(
      const LatLng(
        NearbyStoreMockData.userLatitude,
        NearbyStoreMockData.userLongitude,
      ),
      15.0,
    );
  }

  void _panToStore(NearbyStoreItem store) {
    if (!mounted) return;
    setState(() {
      _selectedStore = store;
    });

    _mapController.move(LatLng(store.latitude, store.longitude), 15.8);

    // Sync page controller if needed
    final index = _filteredStores.indexWhere((s) => s.id == store.id);
    if (index != -1 && _pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _applyFilters() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      _filteredStores = _allStores.where((store) {
        // Keyword match
        final matchesQuery =
            query.isEmpty ||
            store.name.toLowerCase().contains(query) ||
            store.address.toLowerCase().contains(query) ||
            store.category.toLowerCase().contains(query) ||
            store.popularServices.any((s) => s.toLowerCase().contains(query));

        if (!matchesQuery) return false;

        // Radius match
        if (store.distanceKm > _filterRadiusKm) return false;

        // Min rating
        if (store.rating < _filterMinRating) return false;

        // Only open
        if (_filterOnlyOpen && !store.isOpen) return false;

        // Chip match
        switch (_activeFilter) {
          case 'Gần nhất (< 1km)':
            return store.distanceKm <= 1.0;
          case 'Đánh giá 4.8+ ⭐':
            return store.rating >= 4.8;
          case 'Đang mở cửa':
            return store.isOpen;
          case 'Ưu đãi sốc 🔥':
            return store.promoBadge != null;
          case 'Massage Body':
            return store.category.toLowerCase().contains('massage') ||
                store.popularServices.any(
                  (s) => s.toLowerCase().contains('massage'),
                );
          case 'Dưỡng sinh đông y':
            return store.category.toLowerCase().contains('dưỡng sinh') ||
                store.popularServices.any(
                  (s) => s.toLowerCase().contains('dưỡng sinh'),
                );
          case 'Chăm sóc da & Nail':
            return store.category.toLowerCase().contains('da') ||
                store.category.toLowerCase().contains('nail');
          default:
            return true;
        }
      }).toList();

      if (_selectedStore != null &&
          !_filteredStores.any((s) => s.id == _selectedStore!.id)) {
        _selectedStore = _filteredStores.isNotEmpty
            ? _filteredStores.first
            : null;
      }
    });
  }

  void _onSearchChanged(String text) {
    _applyFilters();
  }

  void _onClearSearch() {
    _searchController.clear();
    _applyFilters();
  }

  void _onSelectFilter(String filter) {
    setState(() {
      _activeFilter = filter;
    });
    _applyFilters();
  }

  void _onTapStoreDetail(NearbyStoreItem store) {
    // Navigate to Store Detail View
    try {
      context.router.push(StoreDetailRoute(storeId: store.id));
    } catch (_) {
      AppToast.info(context, message: 'Đang mở ${store.name}');
    }
  }

  void _onDirections(NearbyStoreItem store) {
    AppToast.info(
      context,
      message:
          'Đang mở tuyến đường ngắn nhất đến ${store.name} (${store.distanceText})',
    );
  }

  void _openFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bộ lọc tìm kiếm spa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: _darkEspresso,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(LucideIcons.x, size: 20),
                          onPressed: () => Navigator.pop(sheetContext),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Distance Slider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bán kính khoảng cách',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: _darkEspresso,
                          ),
                        ),
                        Text(
                          '< ${_filterRadiusKm.toStringAsFixed(1)} km',
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: _primaryCoral,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _filterRadiusKm,
                      min: 0.5,
                      max: 10.0,
                      divisions: 19,
                      activeColor: _primaryCoral,
                      inactiveColor: const Color(0xFFF0EBE6),
                      onChanged: (val) {
                        setModalState(() => _filterRadiusKm = val);
                      },
                    ),
                    const SizedBox(height: 10),

                    // Min Rating
                    const Text(
                      'Đánh giá tối thiểu',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: _darkEspresso,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [3.5, 4.0, 4.5, 4.8].map((rating) {
                        final isSel = _filterMinRating == rating;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setModalState(() => _filterMinRating = rating);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: isSel
                                    ? _primaryCoral
                                    : const Color(0xFFFAF7F2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSel
                                      ? _primaryCoral
                                      : const Color(0xFFEDE5DC),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 15,
                                    color: isSel
                                        ? Colors.white
                                        : const Color(0xFFF59E0B),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '$rating+',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: isSel
                                          ? Colors.white
                                          : _darkEspresso,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    // Open Now Toggle
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF7F2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                LucideIcons.clock,
                                size: 18,
                                color: _primaryCoral,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Chỉ hiện spa đang mở cửa',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  color: _darkEspresso,
                                ),
                              ),
                            ],
                          ),
                          Switch.adaptive(
                            value: _filterOnlyOpen,
                            activeThumbColor: _primaryCoral,
                            activeTrackColor: _primaryCoral.withValues(
                              alpha: 0.5,
                            ),
                            onChanged: (val) {
                              setModalState(() => _filterOnlyOpen = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Apply Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryCoral,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(sheetContext);
                          _applyFilters();
                          AppToast.success(
                            context,
                            message:
                                'Đã áp dụng bộ lọc: ${_filteredStores.length} spa phù hợp',
                          );
                        },
                        child: const Text(
                          'Áp dụng bộ lọc',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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

  void _zoomIn() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom + 0.8);
  }

  void _zoomOut() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom - 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F0),
      body: Stack(
        children: [
          // 1. Interactive Map Canvas with gestures and pins
          Positioned.fill(
            child: NearbyStoreMapCanvas(
              stores: _filteredStores,
              selectedStore: _selectedStore,
              onSelectStore: (store) {
                setState(() => _selectedStore = store);
                if (store != null) {
                  _panToStore(store);
                }
              },
              onTapStoreDetail: _onTapStoreDetail,
              onDirections: () {
                if (_selectedStore != null) {
                  _onDirections(_selectedStore!);
                }
              },
              mapController: _mapController,
            ),
          ),

          // 2. Floating Search Header with Filters at Top Safe Area
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: NearbyStoreSearchHeader(
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                onClearSearch: _onClearSearch,
                onOpenFilter: _openFilterBottomSheet,
                activeFilter: _activeFilter,
                onSelectFilter: _onSelectFilter,
                totalResults: _filteredStores.length,
              ),
            ),
          ),

          // 3. Floating Action Controls on Right Side (My Location, Zoom)
          Positioned(
            right: 16,
            bottom: 220, // Above bottom slider and curved nav bar
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Recenter My Location Button
                _buildFloatingCircleButton(
                  icon: LucideIcons.locate_fixed,
                  color: _primaryCoral,
                  iconColor: Colors.white,
                  onTap: _recenterMapOnUser,
                  tooltip: 'Vị trí của tôi',
                ),
                const SizedBox(height: 10),

                // Zoom In
                _buildFloatingCircleButton(
                  icon: LucideIcons.plus,
                  color: Colors.white,
                  iconColor: _darkEspresso,
                  onTap: _zoomIn,
                  tooltip: 'Phóng to',
                ),
                const SizedBox(height: 6),

                // Zoom Out
                _buildFloatingCircleButton(
                  icon: LucideIcons.minus,
                  color: Colors.white,
                  iconColor: _darkEspresso,
                  onTap: _zoomOut,
                  tooltip: 'Thu nhỏ',
                ),
              ],
            ),
          ),

          // 4. Horizontal Nearby Store Cards Slider at Bottom (above curved bottom bar)
          Positioned(
            left: 0,
            right: 0,
            bottom: 84, // Clear space for CurvedNavigationBar
            child: NearbyStoreBottomSlider(
              stores: _filteredStores,
              selectedStore: _selectedStore,
              onSelectStore: (store) {
                _panToStore(store);
              },
              onTapDetail: _onTapStoreDetail,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingCircleButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFF0ECE6),
          width: color == Colors.white ? 1.2 : 0,
        ),
        boxShadow: [
          BoxShadow(
            color: _darkEspresso.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(child: Icon(icon, size: 20, color: iconColor)),
        ),
      ),
    );
  }
}
