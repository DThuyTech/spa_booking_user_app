import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_services/store_services_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_staff/store_staff_bloc.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../booking_schedule/view/booking_schedule_view.dart';
import '../../models/booking_models.dart';
import '../body_view/select_services_body_view.dart';
import '../mockup_data/select_services_mock_data.dart';

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
    this.salonName = 'LUXE SALON',
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
    this.salonName = 'LUXE SALON',
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
    this.salonName = 'LUXE SALON',
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
    } else if (widget.storeId == null || widget.storeId!.isEmpty) {
      _services = List.from(SelectServicesMockData.services);
      for (final s in _services) {
        if (s.isSelected) _selectedServiceIds.add(s.id);
      }
      _categories = ['All', 'Hair', 'Beauty', 'Team'];
    } else {
      _services = [];
      _categories = ['All'];
    }

    if (widget.initialStaffMembers != null &&
        widget.initialStaffMembers!.isNotEmpty) {
      _staffMembers = List.from(widget.initialStaffMembers!);
      _selectedStaffId = _staffMembers.first.id;
    } else if (widget.storeId == null || widget.storeId!.isEmpty) {
      _staffMembers = List.from(SelectServicesMockData.staffMembers);
      _selectedStaffId = _staffMembers.first.id;
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

  int get _totalPrice => _services
      .where((s) => s.isSelected)
      .fold(0, (sum, item) => sum + item.price);

  String get _formattedTotalPrice => _formatVnd(_totalPrice);

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

  String _formatVnd(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write(',');
      }
    }
    return '${buffer.toString().split('').reversed.join('')} VND';
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

  String get _subtitleText {
    final staff = _staffMembers.cast<BookingStaffItem?>().firstWhere(
      (s) => s?.id == _selectedStaffId,
      orElse: () => null,
    );
    final staffName =
        staff?.name ?? (widget.storeId == null ? 'Sarah' : widget.salonName);
    return '$staffName • 10:00 AM - 10:30 AM (30 min)';
  }

  void _onConfirmBooking() {
    final selectedServicesList = _services.where((s) => s.isSelected).toList();
    if (selectedServicesList.isEmpty) {
      AppToastHelper.showInfo(
        context,
        message: 'Please select at least one service',
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedServices: selectedServicesList,
          selectedStaffId: _selectedStaffId,
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
                  price: s.price,
                  priceDisplay: _formatVnd(s.price),
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
                if (_selectedStaffId == null ||
                    !staffItems.any((st) => st.id == _selectedStaffId)) {
                  _selectedStaffId = staffItems.first.id;
                }
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
        centerTitle: false,
        showBackButton: false,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Booking',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(
                  LucideIcons.calendar,
                  size: 13,
                  color: Color(0xFF71717A),
                ),
                const SizedBox(width: 4),
                Text(
                  _subtitleText,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF71717A),
                  ),
                ),
              ],
            ),
          ],
        ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Est.',
                  style: TextStyle(
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
            AppButton(
              text: 'Confirm Booking',
              trailingIcon: const Icon(
                LucideIcons.arrow_right,
                size: 16,
                color: Colors.white,
              ),
              backgroundColor: _coralColor,
              onPressed: _selectedCount > 0 ? _onConfirmBooking : null,
            ),
          ],
        ),
      ),
    );
  }
}
