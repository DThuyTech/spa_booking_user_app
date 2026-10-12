import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../buttons/app_button.dart';
import '../chips/app_option_picker.dart';
import '../inputs/app_text_field.dart';
import '../feedback/app_filter_slider.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/location/city_entity.dart';
import '../../../../domain/usecases/location/get_cities_usecase.dart';
import 'city_selection_bottom_sheet.dart';

class SpaFilterCriteria {
  final String location;
  final double distanceKm;
  final List<String> services;
  final String date;
  final String time;
  final RangeValues priceRange;
  final double? minPrice;
  final double? maxPrice;
  final String? rating;

  const SpaFilterCriteria({
    this.location = 'Ho Chi Minh City',
    this.distanceKm = 20.0,
    this.services = const [],
    this.date = 'This Week',
    this.time = 'Any Time',
    this.priceRange = const RangeValues(0, 500),
    this.minPrice,
    this.maxPrice,
    this.rating,
  });

  SpaFilterCriteria copyWith({
    String? location,
    double? distanceKm,
    List<String>? services,
    String? date,
    String? time,
    RangeValues? priceRange,
    double? minPrice,
    double? maxPrice,
    String? rating,
  }) {
    return SpaFilterCriteria(
      location: location ?? this.location,
      distanceKm: distanceKm ?? this.distanceKm,
      services: services ?? this.services,
      date: date ?? this.date,
      time: time ?? this.time,
      priceRange: priceRange ?? this.priceRange,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      rating: rating ?? this.rating,
    );
  }
}

class AppFilterBottomSheet extends StatefulWidget {
  final SpaFilterCriteria initialCriteria;
  final List<CityEntity>? availableCities;
  final ValueChanged<SpaFilterCriteria> onApply;

  const AppFilterBottomSheet({
    super.key,
    required this.initialCriteria,
    this.availableCities,
    required this.onApply,
  });

  static Future<SpaFilterCriteria?> show(
    BuildContext context, {
    SpaFilterCriteria? initialCriteria,
    List<CityEntity>? availableCities,
    ValueChanged<SpaFilterCriteria>? onApply,
  }) {
    return showModalBottomSheet<SpaFilterCriteria>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AppFilterBottomSheet(
        initialCriteria: initialCriteria ?? const SpaFilterCriteria(),
        availableCities: availableCities,
        onApply: (criteria) {
          onApply?.call(criteria);
          Navigator.of(ctx).pop(criteria);
        },
      ),
    );
  }

  @override
  State<AppFilterBottomSheet> createState() => _AppFilterBottomSheetState();
}

class _AppFilterBottomSheetState extends State<AppFilterBottomSheet> {
  late String _location;
  late double _distanceKm;
  late List<String> _selectedServices;
  late String _selectedDate;
  late String _selectedTime;
  late final TextEditingController _minPriceController;
  late final TextEditingController _maxPriceController;
  String? _selectedRating;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _inputBg = Color(0xFFF7F8FA);

  List<CityEntity> _cities = [];

  @override
  void initState() {
    super.initState();
    _minPriceController = TextEditingController();
    _maxPriceController = TextEditingController();
    _resetTo(widget.initialCriteria);
    _cities = List.from(widget.availableCities ?? []);
    if (_cities.isEmpty) {
      _loadCities();
    }
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  Future<void> _loadCities() async {
    try {
      if (sl.isRegistered<GetCitiesUseCase>()) {
        final result = await sl<GetCitiesUseCase>()();
        result.fold((_) {}, (loaded) {
          if (mounted && loaded.isNotEmpty) {
            setState(() {
              _cities = loaded;
            });
          }
        });
      }
    } catch (_) {}
  }

  void _openCityPicker() {
    CitySelectionBottomSheet.show(
      context,
      cities: _cities,
      selectedCity: _location,
      onCitySelected: (selectedCity) {
        setState(() {
          _location = selectedCity;
        });
      },
    );
  }

  void _resetTo(SpaFilterCriteria criteria) {
    _location = criteria.location;
    _distanceKm = criteria.distanceKm;
    _selectedServices = List.from(criteria.services);
    _selectedDate = criteria.date;
    _selectedTime = criteria.time;
    _minPriceController.text = criteria.minPrice != null
        ? criteria.minPrice!.toInt().toString()
        : '';
    _maxPriceController.text = criteria.maxPrice != null
        ? criteria.maxPrice!.toInt().toString()
        : '';
    _selectedRating = (criteria.rating != null && criteria.rating != 'All')
        ? criteria.rating
        : null;
  }

  void _onReset() {
    setState(() {
      _resetTo(
        const SpaFilterCriteria(
          location: 'Ho Chi Minh City',
          distanceKm: 5.0,
          services: [],
          date: 'Today',
          time: 'Any Time',
          minPrice: null,
          maxPrice: null,
          priceRange: RangeValues(0, 500),
          rating: null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      constraints: BoxConstraints(maxHeight: mediaQuery.size.height * 0.88),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          // Top pill handle
          Center(
            child: Container(
              width: 44,
              height: 4.5,
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 32),
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                  ),
                ),
                IconButton(
                  icon: const Icon(LucideIcons.x, size: 20, color: _textDark),
                  splashRadius: 20,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),

          // Scrollable Filter Sections
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. City (Thành phố)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Thành phố (City)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                      GestureDetector(
                        onTap: _openCityPicker,
                        child: Text(
                          'Đổi thành phố',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: _coralColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: _openCityPicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: _inputBg,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFEDF0F3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              LucideIcons.map_pin,
                              color: _coralColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                _location.isNotEmpty
                                    ? _location
                                    : 'Chọn Tỉnh / Thành phố',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: _location.isNotEmpty
                                      ? _textDark
                                      : Colors.grey.shade400,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                LucideIcons.chevron_down,
                                color: Color(0xFF4B5563),
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // 2. Distance Slider (Max 20km)
                  AppFilterSlider(
                    value: _distanceKm > 20 ? 20 : _distanceKm,
                    min: 1,
                    max: 20,
                    label: 'Khoảng cách (Distance)',
                    valueDisplay:
                        'Trong vòng ${_distanceKm.toStringAsFixed(0)} km',
                    minDisplay: '1 km',
                    maxDisplay: '20 km',
                    onChanged: (val) {
                      setState(() {
                        _distanceKm = val;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  // 3. Date
                  const Text(
                    'Ngày hẹn (Date)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppOptionPicker<String>(
                    options: const [
                      OptionPickerItem(value: 'Today', label: 'Hôm nay'),
                      OptionPickerItem(value: 'Tomorrow', label: 'Ngày mai'),
                      OptionPickerItem(value: 'This Week', label: 'Tuần này'),
                      OptionPickerItem(
                        value: 'Custom Date',
                        label: 'Chọn ngày',
                        icon: Icon(LucideIcons.calendar, size: 14),
                      ),
                    ],
                    selectedValues: [_selectedDate],
                    onSelected: (val) {
                      setState(() {
                        _selectedDate = val;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  // 6. Price Range Input (Optional)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Khoảng giá (Price)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        'Tùy chọn',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _minPriceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          hint: 'Giá từ (đ)',
                          prefixIcon: const Icon(
                            LucideIcons.banknote,
                            size: 16,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '—',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: _maxPriceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          hint: 'Đến (đ)',
                          prefixIcon: const Icon(
                            LucideIcons.banknote,
                            size: 16,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // 7. Rating (Có thể bỏ chọn)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Đánh giá (Rating)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                      if (_selectedRating != null)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRating = null;
                            });
                          },
                          child: const Text(
                            'Bỏ chọn',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _coralColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppOptionPicker<String>(
                    options: const [
                      OptionPickerItem(
                        value: '4.0+',
                        label: '4.0+',
                        icon: Icon(
                          LucideIcons.star,
                          size: 13,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                      OptionPickerItem(
                        value: '4.5+',
                        label: '4.5+',
                        icon: Icon(
                          LucideIcons.star,
                          size: 13,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                      OptionPickerItem(
                        value: '5.0',
                        label: '5.0',
                        icon: Icon(
                          LucideIcons.star,
                          size: 13,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                    ],
                    selectedValues: _selectedRating != null
                        ? [_selectedRating!]
                        : const [],
                    onSelected: (val) {
                      setState(() {
                        if (_selectedRating == val) {
                          _selectedRating = null;
                        } else {
                          _selectedRating = val;
                        }
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom Action Buttons
          Container(
            padding: EdgeInsets.fromLTRB(
              20,
              14,
              20,
              mediaQuery.padding.bottom > 0 ? mediaQuery.padding.bottom : 18,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppButton(
                    text: 'Reset',
                    onPressed: _onReset,
                    backgroundColor: const Color(0xFFF3F4F6),
                    textColor: const Color(0xFF4B5563),
                    borderRadius: BorderRadius.circular(25),
                    height: 50,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  flex: 5,
                  child: AppButton(
                    text: 'Apply Filters',
                    onPressed: () {
                      final minP = double.tryParse(
                        _minPriceController.text.trim(),
                      );
                      final maxP = double.tryParse(
                        _maxPriceController.text.trim(),
                      );
                      widget.onApply(
                        SpaFilterCriteria(
                          location: _location,
                          distanceKm: _distanceKm,
                          services: _selectedServices,
                          date: _selectedDate,
                          time: _selectedTime,
                          minPrice: minP,
                          maxPrice: maxP,
                          priceRange: RangeValues(minP ?? 0, maxP ?? 500),
                          rating: _selectedRating,
                        ),
                      );
                    },
                    backgroundColor: _coralColor,
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
