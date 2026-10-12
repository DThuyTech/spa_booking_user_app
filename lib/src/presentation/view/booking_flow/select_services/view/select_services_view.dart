import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_services/store_services_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_staff/store_staff_bloc.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/booking_models.dart';
import '../../booking_schedule/view/booking_schedule_view.dart';
import '../../select_staff/view/select_staff_view.dart';
import '../body_view/select_services_body_view.dart';

@RoutePage()
class SelectServicesPage extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final String? initialSelectedServiceId;
  final List<BookingServiceItem>? initialServices;
  final List<BookingStaffItem>? initialStaffMembers;

  const SelectServicesPage({
    super.key,
    this.storeId,
    required this.salonName,
    this.initialSelectedServiceId,
    this.initialServices,
    this.initialStaffMembers,
  });

  @override
  Widget build(BuildContext context) {
    return SelectServicesView(
      storeId: storeId,
      salonName: salonName,
      initialSelectedServiceId: initialSelectedServiceId,
      initialServices: initialServices,
      initialStaffMembers: initialStaffMembers,
    );
  }
}

class SelectServicesView extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final String? initialSelectedServiceId;
  final List<BookingServiceItem>? initialServices;
  final List<BookingStaffItem>? initialStaffMembers;

  const SelectServicesView({
    super.key,
    this.storeId,
    required this.salonName,
    this.initialSelectedServiceId,
    this.initialServices,
    this.initialStaffMembers,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStoreId = storeId;
    final hasServicesBloc =
        context
            .findAncestorWidgetOfExactType<BlocProvider<StoreServicesBloc>>() !=
        null;
    final hasStaffBloc =
        context.findAncestorWidgetOfExactType<BlocProvider<StoreStaffBloc>>() !=
        null;
    final canResolveServices = sl.isRegistered<StoreServicesBloc>();
    final canResolveStaff = sl.isRegistered<StoreStaffBloc>();

    final providers = <BlocProvider>[];
    if (!hasServicesBloc &&
        canResolveServices &&
        effectiveStoreId != null &&
        effectiveStoreId.isNotEmpty) {
      providers.add(
        BlocProvider<StoreServicesBloc>(
          create: (_) => sl<StoreServicesBloc>()
            ..add(LoadCategoriesAndServicesEvent(storeId: effectiveStoreId)),
        ),
      );
    }
    if (!hasStaffBloc &&
        canResolveStaff &&
        effectiveStoreId != null &&
        effectiveStoreId.isNotEmpty) {
      providers.add(
        BlocProvider<StoreStaffBloc>(
          create: (_) =>
              sl<StoreStaffBloc>()
                ..add(FetchStaffEvent(storeId: effectiveStoreId)),
        ),
      );
    }

    if (providers.isNotEmpty) {
      return MultiBlocProvider(
        providers: providers,
        child: _SelectServicesContentView(
          storeId: effectiveStoreId,
          salonName: salonName,
          initialSelectedServiceId: initialSelectedServiceId,
          initialServices: initialServices,
          initialStaffMembers: initialStaffMembers,
        ),
      );
    }

    return _SelectServicesContentView(
      storeId: effectiveStoreId,
      salonName: salonName,
      initialSelectedServiceId: initialSelectedServiceId,
      initialServices: initialServices,
      initialStaffMembers: initialStaffMembers,
    );
  }
}

class _SelectServicesContentView extends StatefulWidget {
  final String? storeId;
  final String salonName;
  final String? initialSelectedServiceId;
  final List<BookingServiceItem>? initialServices;
  final List<BookingStaffItem>? initialStaffMembers;

  const _SelectServicesContentView({
    this.storeId,
    required this.salonName,
    this.initialSelectedServiceId,
    this.initialServices,
    this.initialStaffMembers,
  });

  @override
  State<_SelectServicesContentView> createState() =>
      _SelectServicesContentViewState();
}

class _SelectServicesContentViewState
    extends State<_SelectServicesContentView> {
  late final TextEditingController _customerSearchController;
  late List<BookingServiceItem> _services;
  late List<String> _categories;
  late List<BookingStaffItem> _staffMembers;
  final Set<String> _selectedServiceIds = {};
  String _selectedCategory = 'All';
  String? _selectedStaffId;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  void initState() {
    super.initState();
    _customerSearchController = TextEditingController();

    if (widget.initialSelectedServiceId != null &&
        widget.initialSelectedServiceId!.isNotEmpty) {
      _selectedServiceIds.add(widget.initialSelectedServiceId!);
    }

    if (widget.initialServices != null && widget.initialServices!.isNotEmpty) {
      _services = widget.initialServices!.map((s) {
        final isSelected = _selectedServiceIds.contains(s.id) || s.isSelected;
        if (isSelected) {
          _selectedServiceIds.add(s.id);
        }
        return s.copyWith(isSelected: isSelected);
      }).toList();
      _categories = [
        'All',
        ..._services
            .map((s) => s.category.trim())
            .where((c) => c.isNotEmpty)
            .toSet(),
      ];
    } else {
      _services = [];
      _categories = ['All'];
    }

    if (widget.initialStaffMembers != null &&
        widget.initialStaffMembers!.isNotEmpty) {
      _staffMembers = List.from(widget.initialStaffMembers!);
      _selectedStaffId = null;
    } else {
      _staffMembers = [];
      _selectedStaffId = null;
    }
  }

  @override
  void dispose() {
    _customerSearchController.dispose();
    super.dispose();
  }

  void _onServiceToggle(BookingServiceItem service) {
    setState(() {
      final index = _services.indexWhere((s) => s.id == service.id);
      if (index != -1) {
        final current = _services[index];
        final nextIsSelected = !current.isSelected;
        _services[index] = current.copyWith(isSelected: nextIsSelected);
        if (nextIsSelected) {
          _selectedServiceIds.add(service.id);
        } else {
          _selectedServiceIds.remove(service.id);
        }
      }
    });
  }

  int get _selectedCount => _services.where((s) => s.isSelected).length;

  double get _totalPrice => _services
      .where((s) => s.isSelected)
      .fold(0.0, (sum, item) => sum + item.price);

  String get _formattedTotalPrice => _totalPrice.toVnd();

  String get _totalDurationDisplay {
    int totalMinutes = 0;
    for (final s in _services.where((s) => s.isSelected)) {
      if (s.durationMinutes != null && s.durationMinutes! > 0) {
        totalMinutes += s.durationMinutes!;
      } else {
        final match = RegExp(r'(\d+)').firstMatch(s.duration);
        if (match != null) {
          totalMinutes += int.tryParse(match.group(1) ?? '0') ?? 0;
        }
      }
    }
    if (totalMinutes == 0) return '0 min';
    final hours = totalMinutes ~/ 60;
    final mins = totalMinutes % 60;
    if (hours > 0 && mins > 0) {
      return '${hours}h${mins}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '$mins min';
    }
  }

  String _getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return 'U';
    final parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return trimmed.substring(0, trimmed.length >= 2 ? 2 : 1).toUpperCase();
  }

  void _onConfirmBooking() {
    final selectedServicesList = _services.where((s) => s.isSelected).toList();
    if (selectedServicesList.isEmpty) {
      final isVi = Localizations.localeOf(context).languageCode == 'vi';
      AppToastHelper.showInfo(
        context,
        message: isVi
            ? 'Vui lòng chọn ít nhất một dịch vụ'
            : 'Please select at least one service',
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectStaffView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedServices: selectedServicesList,
          initialSelectedStaffId: _selectedStaffId,
        ),
      ),
    );
  }

  void _onQuickBook() {
    final selectedServicesList = _services.where((s) => s.isSelected).toList();
    if (selectedServicesList.isEmpty) {
      final isVi = Localizations.localeOf(context).languageCode == 'vi';
      AppToastHelper.showInfo(
        context,
        message: isVi
            ? 'Vui lòng chọn ít nhất một dịch vụ'
            : 'Please select at least one service',
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedServices: selectedServicesList,
          selectedStaffId: null,
          selectedStaffPerService: const {},
          isQuickBook: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasServicesBloc =
        context
            .findAncestorWidgetOfExactType<BlocProvider<StoreServicesBloc>>() !=
        null;
    final hasStaffBloc =
        context.findAncestorWidgetOfExactType<BlocProvider<StoreStaffBloc>>() !=
        null;

    final listeners = <BlocListener>[
      if (hasServicesBloc)
        BlocListener<StoreServicesBloc, StoreServicesState>(
          listener: (context, state) {
            if (state.isLoaded && state.services.isNotEmpty) {
              final categoryNames = {
                for (final cat in state.categories) cat.id: cat.name,
              };
              final newCategories = <String>['All'];
              for (final cat in state.categories) {
                if (!newCategories.contains(cat.name)) {
                  newCategories.add(cat.name);
                }
              }

              final mappedServices = state.services.map((s) {
                final catName =
                    (s.categoryId != null &&
                        categoryNames.containsKey(s.categoryId))
                    ? categoryNames[s.categoryId]!
                    : 'Services';
                final isSelected =
                    _selectedServiceIds.contains(s.id) ||
                    (widget.initialSelectedServiceId == s.id);
                if (isSelected) {
                  _selectedServiceIds.add(s.id);
                }
                return BookingServiceItem(
                  id: s.id,
                  category: catName,
                  name: s.name,
                  duration: '${s.durationMinutes} min',
                  durationMinutes: s.durationMinutes,
                  price: s.basePrice,
                  priceDisplay: s.basePrice.toVnd(),
                  isSelected: isSelected,
                );
              }).toList();

              setState(() {
                _services = mappedServices;
                _categories = newCategories;
              });
            } else if (state.isLoaded && state.services.isEmpty) {
              setState(() {
                _services = [];
                _categories = ['All'];
              });
            } else if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(context, error: state.failure);
            }
          },
        ),
      if (hasStaffBloc)
        BlocListener<StoreStaffBloc, StoreStaffState>(
          listener: (context, state) {
            if (state.isLoaded && state.staffList.isNotEmpty) {
              const colors = [
                Color(0xFFB2EBF2),
                Color(0xFFE1BEE7),
                Color(0xFFF8BBD0),
                Color(0xFFB2DFDB),
                Color(0xFFFFCCBC),
              ];
              final staffItems = state.staffList.asMap().entries.map((entry) {
                final index = entry.key;
                final staff = entry.value;
                return BookingStaffItem(
                  id: staff.staffProfileId,
                  name: staff.fullName,
                  initials: _getInitials(staff.fullName),
                  avatarBgColor: colors[index % colors.length],
                  photoUrl: staff.avatarUrl,
                  isOff: false,
                );
              }).toList();

              setState(() {
                _staffMembers = staffItems;
              });
            }
          },
        ),
    ];

    if (listeners.isEmpty) {
      return _buildScaffold(context, hasServicesBloc);
    }

    return MultiBlocListener(
      listeners: listeners,
      child: _buildScaffold(context, hasServicesBloc),
    );
  }

  Widget _buildScaffold(BuildContext context, bool hasServicesBloc) {
    StoreServicesState? servicesState;
    if (hasServicesBloc) {
      servicesState = context.watch<StoreServicesBloc>().state;
    }
    final isLoading = servicesState?.isLoading ?? false;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        showBackButton: false,
        title: context.l10n.newBooking,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AppIconButton(
              icon: LucideIcons.x,
              dimension: 40,
              iconSize: 18,
              backgroundColor: const Color(0xFFF1F5F9),
              iconColor: _textDark,
              borderRadius: BorderRadius.circular(20),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
        ],
      ),

      body: isLoading && _services.isEmpty
          ? const Center(child: CircularProgressIndicator(color: _coralColor))
          : SelectServicesBodyView(
              selectedServiceCount: _selectedCount,
              selectedDurationTotal: _totalDurationDisplay,
              selectedPriceTotal: _formattedTotalPrice,
              customerSearchController: _customerSearchController,
              selectedCategory: _selectedCategory,
              onCategorySelected: (cat) {
                setState(() {
                  _selectedCategory = cat;
                });
              },
              categories: _categories,
              services: _services,
              onServiceToggle: _onServiceToggle,
              staffMembers: _staffMembers,
              selectedStaffId: _selectedStaffId,
              onStaffSelected: (staff) {
                setState(() {
                  _selectedStaffId = staff.id;
                });
              },
            ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
          bottom: MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom + 8
              : 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Builder(
          builder: (context) {
            final isVi = Localizations.localeOf(context).languageCode == 'vi';
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.totalEst,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formattedTotalPrice,
                          style: const TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w800,
                            color: _textDark,
                          ),
                        ),
                      ],
                    ),
                    if (_selectedCount > 0)
                      Text(
                        '$_selectedCount ${isVi ? "dịch vụ" : "services"} • $_totalDurationDisplay',
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: OutlinedButton.icon(
                          onPressed: _selectedCount > 0 ? _onQuickBook : null,

                          label: Text(
                            isVi ? 'Đặt nhanh' : 'Quick Book',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: _selectedCount > 0
                                  ? const Color(0xFFB45309)
                                  : const Color(0xFF94A3B8),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: _selectedCount > 0
                                ? const Color(0xFFFFFBEB)
                                : const Color(0xFFF1F5F9),
                            side: BorderSide(
                              color: _selectedCount > 0
                                  ? const Color(0xFFFDE68A)
                                  : const Color(0xFFCBD5E1),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Nút 2: Tiếp tục chọn chuyên viên
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: AppButton(
                          text: isVi
                              ? 'Tiếp tục chọn chuyên viên'
                              : 'Select Specialist',
                          trailingIcon: const Icon(
                            LucideIcons.arrow_right,
                            size: 16,
                            color: Colors.white,
                          ),
                          backgroundColor: _coralColor,
                          onPressed: _selectedCount > 0
                              ? _onConfirmBooking
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),

                // Nút 1: Đặt nhanh (Không cần chọn chuyên viên)
              ],
            );
          },
        ),
      ),
    );
  }
}
