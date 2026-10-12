import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_availability_entity.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_item_param.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_event.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_availability/booking_availability_state.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_schedule_grid/store_schedule_grid_bloc.dart';
import '../../../../../shared/shared.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_schedule_body_view.dart';
import '../utils/schedule_grid_mapper.dart';

@RoutePage()
class BookingSchedulePage extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final Map<String, String?>? selectedStaffPerService;
  final bool isQuickBook;

  const BookingSchedulePage({
    super.key,
    this.storeId,
    required this.salonName,
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.isQuickBook = false,
  });

  @override
  Widget build(BuildContext context) {
    return BookingScheduleView(
      storeId: storeId,
      salonName: salonName,
      selectedServices: selectedServices,
      selectedStaffId: selectedStaffId,
      selectedStaffPerService: selectedStaffPerService,
      isQuickBook: isQuickBook,
    );
  }
}

class BookingScheduleView extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final Map<String, String?>? selectedStaffPerService;
  final bool isQuickBook;

  const BookingScheduleView({
    super.key,
    this.storeId,
    required this.salonName,
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.isQuickBook = false,
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
      selectedStaffPerService: selectedStaffPerService,
      isQuickBook: isQuickBook,
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
  final Map<String, String?>? selectedStaffPerService;
  final bool isQuickBook;

  const _BookingScheduleContentView({
    this.storeId,
    required this.salonName,
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.isQuickBook = false,
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

  String? _selectedStaffId;
  String _selectedTime = '';
  late DateTime _selectedDate;

  // Latest API data
  ScheduleGridEntity? _grid;
  BookingAvailabilityEntity? _availability;
  BookingAvailabilityOptionEntity? _selectedOption;
  DateTime? _apiSelectedStartAt;
  Map<String, String?>? _effectiveStaffPerService;

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
      _selectedOption = null;
      _apiSelectedStartAt = null;
    });

    context.read<StoreScheduleGridBloc>().add(
      FetchScheduleGridEvent(storeId: widget.storeId!, date: date),
    );

    final serviceItems = (widget.selectedServices ?? []).map((s) {
      final staffId = widget.isQuickBook
          ? null
          : (widget.selectedStaffPerService?[s.id] ?? widget.selectedStaffId);
      final cleanStaffId =
          (staffId != null &&
              staffId.isNotEmpty &&
              !staffId.startsWith('unassigned'))
          ? staffId
          : null;
      return BookingItemParam(serviceId: s.id, staffProfileId: cleanStaffId);
    }).toList();

    if (_hasAvailabilityBloc && serviceItems.isNotEmpty) {
      context.read<BookingAvailabilityBloc>().add(
        CheckAvailabilitySlotsEvent(
          storeId: widget.storeId!,
          services: serviceItems,
          dateFrom: date,
          dateTo: date,
          stepMinutes: 15,
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
    setState(() {
      _selectedStaffId = staffId;
      _selectedTime = time;
    });
  }

  void _onSelectOption(BookingAvailabilityOptionEntity option) {
    setState(() {
      _selectedOption = option;
      _selectedTime = option.startTime;
      _apiSelectedStartAt = DateTime.tryParse(option.startAt);

      if (option.items.isNotEmpty) {
        final updatedMap = Map<String, String?>.from(
          widget.selectedStaffPerService ?? {},
        );
        for (final item in option.items) {
          if (item.staffProfileId != null && item.staffProfileId!.isNotEmpty) {
            updatedMap[item.serviceId] = item.staffProfileId;
          }
        }
        _effectiveStaffPerService = updatedMap;
      }
    });
  }

  DateTime? get _selectedStartAt {
    if (_apiSelectedStartAt != null) return _apiSelectedStartAt;
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
    if (_selectedOption != null) {
      return '${_selectedOption!.startTime} - ${_selectedOption!.endTime}';
    }
    final start = _selectedStartAt;
    if (start == null) return _selectedTime;
    final duration = _serviceDurationMinutes;
    if (duration <= 0) return _selectedTime;
    final end = start.add(Duration(minutes: duration));
    final fmt = DateFormat('hh:mm a', 'en_US');
    return '${fmt.format(start)} - ${fmt.format(end)}';
  }

  void _onProceedToDetail() {
    if (_useApi && _selectedTime.isEmpty) {
      final isVi = Localizations.localeOf(context).languageCode == 'vi';
      AppToastHelper.showInfo(
        context,
        message: isVi
            ? 'Vui lòng chọn một khung giờ'
            : 'Please pick a time slot',
      );
      return;
    }

    // Tìm option khớp với slot đã chọn nếu _selectedOption chưa được set
    BookingAvailabilityOptionEntity? effectiveOption = _selectedOption;
    if (effectiveOption == null && _availability != null) {
      final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
      final day = _availability!.days
          .where((d) => d.date == dateStr)
          .firstOrNull;
      final options = (day != null && day.options.isNotEmpty)
          ? day.options
          : _availability!.options;
      effectiveOption = options
          .where(
            (o) =>
                o.startTime == _selectedTime ||
                '${o.startTime} - ${o.endTime}' == _selectedTime,
          )
          .firstOrNull;
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
          selectedStaffPerService:
              _effectiveStaffPerService ?? widget.selectedStaffPerService,
          startAt: _useApi ? _selectedStartAt : null,
          selectedOption: effectiveOption,
          isQuickBook: widget.isQuickBook,
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
                setState(() {
                  _availability = state.availability;
                  if (state.selectedOption != null) {
                    _selectedOption = state.selectedOption;
                    _selectedTime = state.selectedOption!.startTime;
                    _apiSelectedStartAt = DateTime.tryParse(
                      state.selectedOption!.startAt,
                    );
                  } else if (widget.isQuickBook &&
                      _selectedTime.isEmpty &&
                      state.availability != null) {
                    final dateStr = DateFormat(
                      'yyyy-MM-dd',
                    ).format(_selectedDate);
                    final day = state.availability!.days
                        .where((d) => d.date == dateStr)
                        .firstOrNull;
                    final options = (day != null && day.options.isNotEmpty)
                        ? day.options
                        : state.availability!.options;
                    if (options.isNotEmpty) {
                      final earliest =
                          options
                              .where((o) => o.slotTag == 'EARLIEST')
                              .firstOrNull ??
                          options.first;
                      _onSelectOption(earliest);
                    }
                  }
                });
              }
            },
          ),
      ],
      child: _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    late final List<BookingStaffItem> staffMembers;
    late final List<String> timeColumns;
    late final List<BookingTimeSlotItem> slots;
    var isLoading = false;
    String? emptyMessage;
    String dateDisplay = 'Aug 26, 2026';

    if (_useApi) {
      final gridState = context.watch<StoreScheduleGridBloc>().state;
      final availState = _hasAvailabilityBloc
          ? context.watch<BookingAvailabilityBloc>().state
          : null;
      isLoading =
          gridState.isLoading ||
          (availState?.isLoading ?? false) ||
          (_grid == null && !gridState.isFailure);
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
      if (gridState.isFailure) {
        emptyMessage = isVi
            ? 'Không thể tải lịch hẹn. Vuốt xuống để thử lại.'
            : 'Could not load the schedule. Pull down to retry.';
      } else if (data.isStoreClosed) {
        emptyMessage = isVi
            ? 'Salon đóng cửa vào ngày này'
            : 'The store is closed on this day';
      } else if (data.isEmpty) {
        emptyMessage = isVi
            ? 'Chưa có khung giờ trống vào ngày này'
            : 'No booking slots available on this day';
      }
    } else {
      staffMembers = const [];
      timeColumns = const [];
      slots = const [];
      emptyMessage = isVi
          ? 'Không có khung giờ khả dụng'
          : 'No booking slots available';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        title: widget.isQuickBook
            ? (isVi ? 'Đặt nhanh - Chọn giờ' : 'Quick Book - Time')
            : (isVi ? 'Chọn ngày & giờ' : 'Select Date & Time'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrow_left, color: Color(0xFF1E2022)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: RefreshIndicator(
        color: _coralColor,
        onRefresh: () async => _loadSchedule(),
        child: BookingScheduleBodyView(
          salonName: widget.salonName,
          selectedDate: dateDisplay,
          selectedDateTime: _selectedDate,
          onDateSelected: _changeDate,
          staffMembers: staffMembers,
          timeColumns: timeColumns,
          slots: slots,
          selectedStaffId: _selectedStaffId,
          selectedTime: _selectedTime,
          onSelectSlot: _onSelectSlot,
          availability: _availability,
          onSelectOption: _onSelectOption,
          isToday: _useApi ? _isToday : true,
          isLoading: isLoading,
          emptyMessage: emptyMessage,
          onDateTap: _useApi ? _onPickDate : null,
          isQuickBook: widget.isQuickBook,
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
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_selectedTime.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.clock,
                          size: 15,
                          color: _coralColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _timeRangeDisplay,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E2022),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _displayDate.format(_selectedDate),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
              SizedBox(
                width: double.infinity,
                height: 50,
                child: AppButton(
                  text: isVi
                      ? 'Tiếp tục xem chi tiết lịch hẹn'
                      : 'Continue to Booking Detail',
                  backgroundColor: _selectedTime.isNotEmpty
                      ? _coralColor
                      : const Color(0xFFCBD5E1),
                  onPressed: _selectedTime.isNotEmpty
                      ? _onProceedToDetail
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
