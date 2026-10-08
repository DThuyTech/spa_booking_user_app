import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/location/city_entity.dart';
import '../../../../domain/usecases/location/get_cities_usecase.dart';
import '../inputs/app_text_field.dart';

class CitySelectionBottomSheet extends StatefulWidget {
  final List<CityEntity> cities;
  final String selectedCity;
  final ValueChanged<String> onCitySelected;

  const CitySelectionBottomSheet({
    super.key,
    required this.cities,
    required this.selectedCity,
    required this.onCitySelected,
  });

  static Future<void> show(
    BuildContext context, {
    List<CityEntity>? cities,
    required String selectedCity,
    required ValueChanged<String> onCitySelected,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => CitySelectionBottomSheet(
        cities: cities ?? const [],
        selectedCity: selectedCity,
        onCitySelected: onCitySelected,
      ),
    );
  }

  @override
  State<CitySelectionBottomSheet> createState() =>
      _CitySelectionBottomSheetState();
}

class _CitySelectionBottomSheetState extends State<CitySelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<CityEntity> _loadedCities = [];
  bool _isLoading = false;

  static const Color _coralColor = Color(0xFFFC6E58);

  static const List<CityEntity> _fallbackCities = [
    CityEntity(
      code: '79',
      name: 'Hồ Chí Minh',
      fullName: 'Thành phố Hồ Chí Minh',
    ),
    CityEntity(code: '01', name: 'Hà Nội', fullName: 'Thành phố Hà Nội'),
    CityEntity(code: '48', name: 'Đà Nẵng', fullName: 'Thành phố Đà Nẵng'),
    CityEntity(code: '31', name: 'Hải Phòng', fullName: 'Thành phố Hải Phòng'),
    CityEntity(code: '92', name: 'Cần Thơ', fullName: 'Thành phố Cần Thơ'),
    CityEntity(code: '74', name: 'Bình Dương', fullName: 'Tỉnh Bình Dương'),
    CityEntity(code: '75', name: 'Đồng Nai', fullName: 'Tỉnh Đồng Nai'),
    CityEntity(
      code: '77',
      name: 'Bà Rịa - Vũng Tàu',
      fullName: 'Tỉnh Bà Rịa - Vũng Tàu',
    ),
    CityEntity(code: '56', name: 'Khánh Hòa', fullName: 'Tỉnh Khánh Hòa'),
    CityEntity(code: '68', name: 'Lâm Đồng', fullName: 'Tỉnh Lâm Đồng'),
    CityEntity(code: '49', name: 'Quảng Nam', fullName: 'Tỉnh Quảng Nam'),
    CityEntity(
      code: '46',
      name: 'Thừa Thiên Huế',
      fullName: 'Tỉnh Thừa Thiên Huế',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadedCities = List.from(widget.cities);
    if (_loadedCities.isEmpty) {
      _fetchCitiesIfEmpty();
    }
  }

  Future<void> _fetchCitiesIfEmpty() async {
    try {
      if (sl.isRegistered<GetCitiesUseCase>()) {
        setState(() => _isLoading = true);
        final result = await sl<GetCitiesUseCase>()();
        result.fold((_) {}, (cities) {
          if (mounted && cities.isNotEmpty) {
            setState(() {
              _loadedCities = cities;
            });
          }
        });
      }
    } catch (_) {
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CityEntity> get _allCities {
    if (_loadedCities.isNotEmpty) {
      return _loadedCities;
    }
    return _fallbackCities;
  }

  List<CityEntity> get _filteredCities {
    final list = _allCities;
    if (_searchQuery.trim().isEmpty) return list;
    final query = _searchQuery.trim().toLowerCase();
    return list.where((c) {
      return c.name.toLowerCase().contains(query) ||
          c.fullName.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredCities;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      margin: EdgeInsets.only(bottom: bottomInset),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Chọn Tỉnh / Thành phố',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E2022),
                  ),
                ),
                IconButton(
                  icon: const Icon(LucideIcons.x, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                  color: const Color(0xFF6B7280),
                  splashRadius: 20,
                ),
              ],
            ),
          ),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: AppTextField(
              controller: _searchController,
              hint: 'Tìm kiếm tỉnh hoặc thành phố...',
              prefixIcon: const Icon(
                LucideIcons.search,
                color: Color(0xFF9CA3AF),
                size: 18,
              ),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        LucideIcons.x,
                        color: Color(0xFF9CA3AF),
                        size: 16,
                      ),
                      splashRadius: 18,
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = '';
                        });
                      },
                    )
                  : null,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
            ),
          ),

          const Divider(height: 16, thickness: 0.8, color: Color(0xFFF3F4F6)),

          // Cities List
          Expanded(
            child: _isLoading && filtered.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: _coralColor,
                    ),
                  )
                : filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.map_pin_off,
                          size: 36,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Không tìm thấy thành phố phù hợp',
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Color(0xFFF3F4F6),
                    ),
                    itemBuilder: (context, index) {
                      final city = filtered[index];
                      final isSelected =
                          city.name.toLowerCase() ==
                              widget.selectedCity.toLowerCase() ||
                          city.fullName.toLowerCase() ==
                              widget.selectedCity.toLowerCase();

                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            widget.onCitySelected(city.name);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 13,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? _coralColor.withValues(alpha: 0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? _coralColor.withValues(alpha: 0.15)
                                        : const Color(0xFFF4F6F8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    LucideIcons.map_pin,
                                    size: 15,
                                    color: isSelected
                                        ? _coralColor
                                        : const Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        city.name,
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: isSelected
                                              ? _coralColor
                                              : const Color(0xFF1E2022),
                                        ),
                                      ),
                                      if (city.fullName.isNotEmpty &&
                                          city.fullName != city.name) ...[
                                        const SizedBox(height: 2),
                                        Text(
                                          city.fullName,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF9CA3AF),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    LucideIcons.check,
                                    size: 20,
                                    color: _coralColor,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
