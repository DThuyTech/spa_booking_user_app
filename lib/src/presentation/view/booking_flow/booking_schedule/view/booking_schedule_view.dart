import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_availability_entity.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_event.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_state.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_schedule_grid/store_schedule_grid_bloc.dart';
import '../../../../../shared/shared.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_schedule_body_view.dart';
import '../mockup_data/booking_schedule_mock_data.dart';
import '../utils/schedule_grid_mapper.dart';

@RoutePage()
class BookingSchedulePage extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;

  const BookingSchedulePage({
    super.key,
    this.storeId,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  @override
  Widget build(BuildContext context) {
    return BookingScheduleView(
      storeId: storeId,
      salonName: salonName,
      selectedServices: selectedServices,
      selectedStaffId: selectedStaffId,
    );
  }
}

class BookingScheduleView extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;

  const BookingScheduleView({
    super.key,
    this.storeId,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  @override
  Widget build(BuildContext context) {
    final isRealStore = storeId != null && storeId!.isNotEmpty;
    final getIt = GetIt.I;

    final providers = <BlocProvider>[
      if (isRealStore &&
          getIt.isRegistered<StoreScheduleGridBloc>() &&
          context
                  .findAncestorWidgetOfExactType<
                    BlocProvider<StoreScheduleGridBloc>
                  >() ==
              null)
        BlocProvider<StoreScheduleGridBloc>(
          create: (_) => getIt<StoreScheduleGridBloc>(),
        ),
      if (isRealStore &&
          getIt.isRegistered<BookingAvailabilityBloc>() &&
          context
                  .findAncestorWidgetOfExactType<
                    BlocProvider<BookingAvailabilityBloc>
                  >() ==
              null)
        BlocProvider<BookingAvailabilityBloc>(
          create: (_) => getIt<BookingAvailabilityBloc>(),
        ),
    ];

    final content = _BookingScheduleContentView(
      storeId: storeId,
      salonName: salonName,
      selectedServices: selectedServices,
      selectedStaffId: selectedStaffId,
    );

    if (providers.isEmpty) return content;
    return MultiBlocProvider(providers: providers, child: content);
  }
}

class _BookingScheduleContentView extends StatefulWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;

  const _BookingScheduleContentView({
    this.storeId,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  @override
  State<_BookingScheduleContentView> createState() =>
      _BookingScheduleContentViewState();
}

class _BookingScheduleContentViewState
    extends State<_BookingScheduleContentView> {
  static const Color _coralColor = Color(0xFFFF6F59);
  static final DateFormat _displayDate = DateFormat('MMM d, yyyy', 'en_US');
  static final DateFormat _apiDate = DateFormat('yyyy-MM-dd', 'en_US');

  String _selectedFilterChip = 'All Staff';
  String? _selectedStaffId;
  String _selectedTime = '';
  late DateTime _selectedDate;

  // Latest API data
  ScheduleGridEntity? _grid;
  BookingAvailabilityEntity? _availability;

  bool get _isRealStore => widget.storeId != null && widget.storeId!.isNotEmpty;

  bool get _hasGridBloc =>
      context
          .findAncestorWidgetOfExactType<
            BlocProvider<StoreScheduleGridBloc>
          >() !=
      null;

  bool get _hasAvailabilityBloc =>
      context
          .findAncestorWidgetOfExactType<
            BlocProvider<BookingAvailabilityBloc>
          >() !=
      null;

  bool get _useApi => _isRealStore && _hasGridBloc;

  int get _serviceDurationMinutes {
    var total = 0;
    for (final s in widget.selectedServices ?? const <BookingServiceItem>[]) {
      total +=
          s.durationMinutes ??
          int.tryParse(RegExp(r'\d+').firstMatch(s.duration)?.group(0) ?? '') ??
          0;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDate = DateTime(now.year, now.month, now.day);
    _selectedStaffId = widget.selectedStaffId;

    if (!_isRealStore) {
      // Preview / mock mode (no store context)
      _selectedStaffId ??= 'staff_sa';
      _selectedTime = '10:00 AM';
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _loadSchedule();
    });
  }

  void _loadSchedule() {
    if (!_useApi) return;
    final date = _apiDate.format(_selectedDate);

    setState(() {
      _grid = null;
      _availability = null;
      _selectedTime = '';
    });

    context.read<StoreScheduleGridBloc>().add(
      FetchScheduleGridEvent(storeId: widget.storeId!, date: date),
    );

    final serviceIds =
        widget.selectedServices?.map((s) => s.id).toList() ?? const [];
    if (_hasAvailabilityBloc && serviceIds.isNotEmpty) {
      context.read<BookingAvailabilityBloc>().add(
        CheckAvailabilitySlotsEvent(
          storeId: widget.storeId!,
          date: date,
          serviceIds: serviceIds,
        ),
      );
    }
  }

  Future<void> _onPickDate() async {
    final today = DateTime.now();
    final first = DateTime(today.year, today.month, today.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate.isBefore(first) ? first : _selectedDate,
      firstDate: first,
      lastDate: first.add(const Duration(days: 90)),
    );
    if (picked == null || !mounted) return;
    _changeDate(picked);
  }

  void _changeDate(DateTime date) {
    final normalized = DateTime(date.year, date.month, date.day);
    if (normalized == _selectedDate) return;
    setState(() => _selectedDate = normalized);
    _loadSchedule();
  }

  bool get _isToday {
    final now = DateTime.now();
    return _selectedDate == DateTime(now.year, now.month, now.day);
  }

  void _onSelectSlot(String staffId, String time) {
    // Don't allow picking a time that already passed today.
    if (_useApi && _isToday) {
      final mins = ScheduleGridMapper.displayToMinutes(time);
      final now = DateTime.now();
      if (mins != null && mins <= now.hour * 60 + now.minute) {
        AppToastHelper.showInfo(
          context,
          message: 'This time has already passed',
        );
        return;
      }
    }

    setState(() {
      _selectedStaffId = staffId;
      _selectedTime = time;
    });
  }

  DateTime? get _selectedStartAt {
    final mins = ScheduleGridMapper.displayToMinutes(_selectedTime);
    if (mins == null) return null;
    return DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      mins ~/ 60,
      mins % 60,
    );
  }

  String get _timeRangeDisplay {
    final start = _selectedStartAt;
    if (start == null) return _selectedTime;
    final duration = _serviceDurationMinutes;
    if (duration <= 0) return _selectedTime;
    final end = start.add(Duration(minutes: duration));
    final fmt = DateFormat('hh:mm a', 'en_US');
    return '${fmt.format(start)} – ${fmt.format(end)}';
  }

  void _onProceedToDetail() {
    if (_useApi && (_selectedTime.isEmpty || _selectedStaffId == null)) {
      AppToastHelper.showInfo(context, message: 'Please pick a time slot');
      return;
    }

    final isUnassigned =
        _selectedStaffId != null && _selectedStaffId!.startsWith('unassigned');
    final staffIdToSend = isUnassigned ? null : _selectedStaffId;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingDetailView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedDate: _useApi
              ? _displayDate.format(_selectedDate)
              : 'Aug 26, 2026',
          selectedTime: _timeRangeDisplay,
          selectedServices: widget.selectedServices,
          selectedStaffId: staffIdToSend,
          startAt: _useApi ? _selectedStartAt : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_useApi) return _buildScaffold(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreScheduleGridBloc, StoreScheduleGridState>(
          listener: (context, state) {
            if (state.isLoaded) {
              setState(() => _grid = state.grid);
            } else if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(context, error: state.failure);
            }
          },
        ),
        if (_hasAvailabilityBloc)
          BlocListener<BookingAvailabilityBloc, BookingAvailabilityState>(
            listener: (context, state) {
              if (state.isLoaded) {
                setState(() => _availability = state.availability);
              }
            },
          ),
      ],
      child: _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    late final List<BookingStaffItem> staffMembers;
    late final List<String> timeColumns;
    late final List<BookingTimeSlotItem> slots;
    var bookingCount = 3;
    var isLoading = false;
    String? emptyMessage;
    String dateDisplay = 'Aug 26, 2026';

    if (_useApi) {
      final gridState = context.watch<StoreScheduleGridBloc>().state;
      isLoading =
          gridState.isLoading || (_grid == null && !gridState.isFailure);
      dateDisplay = _displayDate.format(_selectedDate);

      final data = _grid == null
          ? const ScheduleGridViewData()
          : ScheduleGridMapper.build(
              grid: _grid!,
              date: _selectedDate,
              availability: _availability,
              serviceDurationMinutes: _serviceDurationMinutes,
            );
      staffMembers = data.staffMembers;
      timeColumns = data.timeColumns;
      slots = data.slots;
      bookingCount = data.bookingCount;
      if (gridState.isFailure) {
        emptyMessage = 'Could not load the schedule. Pull down to retry.';
      } else if (data.isStoreClosed) {
        emptyMessage = 'The store is closed on this day';
      } else if (data.isEmpty) {
        emptyMessage = 'No booking slots available on this day';
      }
    } else {
      staffMembers = BookingScheduleMockData.staffMembers;
      timeColumns = BookingScheduleMockData.timeColumns;
      slots = BookingScheduleMockData.defaultSlots;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(title: 'Booking', onMorePressed: () {}),
      body: RefreshIndicator(
        color: _coralColor,
        onRefresh: () async => _loadSchedule(),
        child: BookingScheduleBodyView(
          salonName: widget.salonName,
          selectedDate: dateDisplay,
          selectedFilterChip: _selectedFilterChip,
          onFilterChipChanged: (chip) {
            setState(() {
              _selectedFilterChip = chip;
            });
          },
          staffMembers: staffMembers,
          timeColumns: timeColumns,
          slots: slots,
          selectedStaffId: _selectedStaffId,
          selectedTime: _selectedTime,
          onSelectSlot: _onSelectSlot,
          onAddCustomBooking: () {
            AppToastHelper.showInfo(
              context,
              message: 'Add custom booking slot',
            );
          },
          bookingCount: bookingCount,
          isToday: _useApi ? _isToday : true,
          isLoading: isLoading,
          emptyMessage: emptyMessage,
          onTodayTap: _useApi ? () => _changeDate(DateTime.now()) : null,
          onDateTap: _useApi ? _onPickDate : null,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Add Custom Time Slot Button
            IconButton(
              onPressed: () {
                AppToastHelper.showInfo(
                  context,
                  message: 'Add custom booking slot',
                );
              },
              icon: const Icon(
                LucideIcons.circle_plus,
                color: Color(0xFF475569),
                size: 26,
              ),
            ),
            const SizedBox(width: 12),

            // Confirm and Proceed Button
            Expanded(
              child: AppButton(
                text: 'Continue to Booking Detail',
                backgroundColor: _coralColor,
                onPressed: _onProceedToDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
