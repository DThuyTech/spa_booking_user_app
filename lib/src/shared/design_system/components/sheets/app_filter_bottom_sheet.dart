import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../buttons/app_button.dart';
import '../chips/app_option_picker.dart';
import '../feedback/app_filter_slider.dart';

class SpaFilterCriteria {
  final String location;
  final double distanceKm;
  final List<String> services;
  final String date;
  final String time;
  final RangeValues priceRange;
  final String rating;

  const SpaFilterCriteria({
    this.location = 'Ho Chi Minh City',
    this.distanceKm = 5.0,
    this.services = const ['Hair', 'Massage'],
    this.date = 'This Week',
    this.time = 'Any Time',
    this.priceRange = const RangeValues(20, 150),
    this.rating = '4.5+',
  });

  SpaFilterCriteria copyWith({
    String? location,
    double? distanceKm,
    List<String>? services,
    String? date,
    String? time,
    RangeValues? priceRange,
    String? rating,
  }) {
    return SpaFilterCriteria(
      location: location ?? this.location,
      distanceKm: distanceKm ?? this.distanceKm,
      services: services ?? this.services,
      date: date ?? this.date,
      time: time ?? this.time,
      priceRange: priceRange ?? this.priceRange,
      rating: rating ?? this.rating,
    );
  }
}

class AppFilterBottomSheet extends StatefulWidget {
  final SpaFilterCriteria initialCriteria;
  final ValueChanged<SpaFilterCriteria> onApply;

  const AppFilterBottomSheet({
    super.key,
    required this.initialCriteria,
    required this.onApply,
  });

  static Future<SpaFilterCriteria?> show(
    BuildContext context, {
    SpaFilterCriteria? initialCriteria,
    ValueChanged<SpaFilterCriteria>? onApply,
  }) {
    return showModalBottomSheet<SpaFilterCriteria>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AppFilterBottomSheet(
        initialCriteria: initialCriteria ?? const SpaFilterCriteria(),
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
  late RangeValues _priceRange;
  late String _selectedRating;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _inputBg = Color(0xFFF7F8FA);

  @override
  void initState() {
    super.initState();
    _resetTo(widget.initialCriteria);
  }

  void _resetTo(SpaFilterCriteria criteria) {
    _location = criteria.location;
    _distanceKm = criteria.distanceKm;
    _selectedServices = List.from(criteria.services);
    _selectedDate = criteria.date;
    _selectedTime = criteria.time;
    _priceRange = criteria.priceRange;
    _selectedRating = criteria.rating;
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
          priceRange: RangeValues(10, 100),
          rating: '4.0+',
        ),
      );
    });
  }

  void _toggleService(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
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
                  // 1. Location
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
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
                            _location,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _textDark,
                            ),
                          ),
                        ),
                        const Icon(
                          LucideIcons.chevron_down,
                          color: Color(0xFF9CA3AF),
                          size: 18,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // 2. Distance Slider
                  AppFilterSlider(
                    value: _distanceKm,
                    min: 1,
                    max: 50,
                    label: 'Distance',
                    valueDisplay: 'Within ${_distanceKm.toStringAsFixed(0)} km',
                    minDisplay: '1 km',
                    maxDisplay: '50 km',
                    onChanged: (val) {
                      setState(() {
                        _distanceKm = val;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  // 3. Service
                  const Text(
                    'Service',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppOptionPicker<String>(
                    options: const [
                      OptionPickerItem(value: 'Hair', label: 'Hair'),
                      OptionPickerItem(
                        value: 'Hair Color',
                        label: 'Hair Color',
                      ),
                      OptionPickerItem(value: 'Facial', label: 'Facial'),
                      OptionPickerItem(value: 'Massage', label: 'Massage'),
                      OptionPickerItem(value: 'Nail', label: 'Nail'),
                    ],
                    selectedValues: _selectedServices,
                    isMultiSelect: true,
                    onSelected: _toggleService,
                  ),

                  const SizedBox(height: 22),

                  // 4. Date
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppOptionPicker<String>(
                    options: const [
                      OptionPickerItem(value: 'Today', label: 'Today'),
                      OptionPickerItem(value: 'Tomorrow', label: 'Tomorrow'),
                      OptionPickerItem(value: 'This Week', label: 'This Week'),
                      OptionPickerItem(
                        value: 'Custom Date',
                        label: 'Custom Date',
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

                  // 5. Time
                  const Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
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
                          LucideIcons.clock,
                          color: Color(0xFF6B7280),
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _selectedTime,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _textDark,
                            ),
                          ),
                        ),
                        const Icon(
                          LucideIcons.chevron_down,
                          color: Color(0xFF9CA3AF),
                          size: 18,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // 6. Price Range Slider
                  AppPriceRangeSlider(
                    values: _priceRange,
                    min: 0,
                    max: 200,
                    label: 'Price Range',
                    valueDisplay:
                        '\$${_priceRange.start.toStringAsFixed(0)} - \$${_priceRange.end.toStringAsFixed(0)}+',
                    onChanged: (values) {
                      setState(() {
                        _priceRange = values;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  // 7. Rating
                  const Text(
                    'Rating',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textDark,
                    ),
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
                    selectedValues: [_selectedRating],
                    onSelected: (val) {
                      setState(() {
                        _selectedRating = val;
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
                      widget.onApply(
                        SpaFilterCriteria(
                          location: _location,
                          distanceKm: _distanceKm,
                          services: _selectedServices,
                          date: _selectedDate,
                          time: _selectedTime,
                          priceRange: _priceRange,
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
