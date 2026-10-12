import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_availability_entity.dart';
import 'package:spa_booking/src/presentation/bloc/booking/create_booking/create_booking_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_staff/store_staff_bloc.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_item_param.dart';
import '../../../../../shared/shared.dart';
import '../../booking_result/view/booking_result_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_detail_body_view.dart';

@RoutePage()
class BookingDetailPage extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final Map<String, String?>? selectedStaffPerService;
  final DateTime? startAt;
  final BookingAvailabilityOptionEntity? selectedOption;
  final bool isQuickBook;

  const BookingDetailPage({
    super.key,
    this.storeId,
    this.salonName = '',
    this.selectedDate = '',
    this.selectedTime = '',
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.startAt,
    this.selectedOption,
    this.isQuickBook = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateBookingBloc>(
      create: (_) => GetIt.I<CreateBookingBloc>(),
      child: BookingDetailView(
        storeId: storeId,
        salonName: salonName,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        selectedServices: selectedServices,
        selectedStaffId: selectedStaffId,
        selectedStaffPerService: selectedStaffPerService,
        startAt: startAt,
        selectedOption: selectedOption,
        isQuickBook: isQuickBook,
      ),
    );
  }
}

class BookingDetailView extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final Map<String, String?>? selectedStaffPerService;
  final DateTime? startAt;
  final BookingAvailabilityOptionEntity? selectedOption;
  final bool isQuickBook;

  const BookingDetailView({
    super.key,
    this.storeId,
    this.salonName = '',
    this.selectedDate = '',
    this.selectedTime = '',
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.startAt,
    this.selectedOption,
    this.isQuickBook = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasBloc =
        context
            .findAncestorWidgetOfExactType<BlocProvider<CreateBookingBloc>>() !=
        null;
    final canResolveBloc = GetIt.I.isRegistered<CreateBookingBloc>();

    if (!hasBloc && canResolveBloc) {
      return BlocProvider<CreateBookingBloc>(
        create: (_) => GetIt.I<CreateBookingBloc>(),
        child: _BookingDetailContentView(
          storeId: storeId,
          salonName: salonName,
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          selectedServices: selectedServices,
          selectedStaffId: selectedStaffId,
          selectedStaffPerService: selectedStaffPerService,
          startAt: startAt,
          selectedOption: selectedOption,
          isQuickBook: isQuickBook,
        ),
      );
    }

    return _BookingDetailContentView(
      storeId: storeId,
      salonName: salonName,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      selectedServices: selectedServices,
      selectedStaffId: selectedStaffId,
      selectedStaffPerService: selectedStaffPerService,
      startAt: startAt,
      selectedOption: selectedOption,
      isQuickBook: isQuickBook,
    );
  }
}

class _BookingDetailContentView extends StatefulWidget {
  final String? storeId;
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final Map<String, String?>? selectedStaffPerService;
  final DateTime? startAt;
  final BookingAvailabilityOptionEntity? selectedOption;
  final bool isQuickBook;

  const _BookingDetailContentView({
    this.storeId,
    required this.salonName,
    required this.selectedDate,
    required this.selectedTime,
    this.selectedServices,
    this.selectedStaffId,
    this.selectedStaffPerService,
    this.startAt,
    this.selectedOption,
    this.isQuickBook = false,
  });

  @override
  State<_BookingDetailContentView> createState() =>
      _BookingDetailContentViewState();
}

class _BookingDetailContentViewState extends State<_BookingDetailContentView> {
  late final TextEditingController _noteController;
  late BookingDetailData _detail;

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();

    var activeServices =
        (widget.selectedServices != null && widget.selectedServices!.isNotEmpty)
        ? List<BookingServiceItem>.from(widget.selectedServices!)
        : <BookingServiceItem>[];

    final serviceStaffNames = <String, String>{};
    final staffList = sl.isRegistered<StoreStaffBloc>()
        ? sl<StoreStaffBloc>().state.staffList
        : const [];

    // Nếu có selectedOption từ API Tra Cứu Slot Khả Dụng (Availability):
    // Sắp xếp lại danh sách dịch vụ theo đúng thứ tự (sequence) và gán chuyên viên tương ứng
    if (widget.selectedOption != null &&
        widget.selectedOption!.items.isNotEmpty) {
      final sortedOptionItems = List<BookingAvailabilityOptionItemEntity>.from(
        widget.selectedOption!.items,
      )..sort((a, b) => a.sequence.compareTo(b.sequence));

      final orderedServices = <BookingServiceItem>[];
      for (final optItem in sortedOptionItems) {
        final match = activeServices
            .where((s) => s.id == optItem.serviceId)
            .firstOrNull;
        if (match != null) {
          orderedServices.add(match);
        } else {
          orderedServices.add(
            BookingServiceItem(
              id: optItem.serviceId,
              category: 'General',
              name: optItem.serviceName ?? 'Dịch vụ',
              priceDisplay: optItem.estimatedPrice != null
                  ? '${optItem.estimatedPrice!.toInt()}đ'
                  : '0đ',
              duration: '${optItem.durationMinutes} min',
              price: optItem.estimatedPrice ?? 0,
              durationMinutes: optItem.durationMinutes,
            ),
          );
        }

        // Tên nhân viên phụ trách dịch vụ này từ kết quả availability
        if (optItem.staffName != null && optItem.staffName!.isNotEmpty) {
          serviceStaffNames[optItem.serviceId] = optItem.staffName!;
        } else if (optItem.staffProfileId != null &&
            optItem.staffProfileId!.isNotEmpty) {
          final matchStaff = staffList
              .where((st) => st.staffProfileId == optItem.staffProfileId)
              .firstOrNull;
          serviceStaffNames[optItem.serviceId] =
              matchStaff?.fullName ?? 'Chuyên viên được phân công';
        }
      }

      // Thêm các dịch vụ còn lại (phòng trường hợp có dịch vụ chưa map)
      for (final s in activeServices) {
        if (!orderedServices.any((os) => os.id == s.id)) {
          orderedServices.add(s);
        }
      }
      activeServices = orderedServices;
    } else {
      // Fallback khi không có slot từ availability (ví dụ Quick Book)
      for (final s in activeServices) {
        final staffId =
            widget.selectedStaffPerService?[s.id] ?? widget.selectedStaffId;
        if (staffId != null &&
            staffId.isNotEmpty &&
            !staffId.startsWith('unassigned')) {
          final match = staffList
              .where((st) => st.staffProfileId == staffId)
              .firstOrNull;
          if (match != null) {
            serviceStaffNames[s.id] = match.fullName;
          } else {
            serviceStaffNames[s.id] = 'Chuyên viên đã chọn';
          }
        }
      }
    }

    final subtotal =
        (widget.selectedOption?.estimatedPrice != null &&
            widget.selectedOption!.estimatedPrice! > 0)
        ? widget.selectedOption!.estimatedPrice!
        : activeServices.fold(0.0, (sum, s) => sum + s.price);
    final discount = 0.0;
    final total = subtotal - discount;

    String? staffName;
    if (widget.selectedStaffId != null) {
      final match = staffList
          .where((s) => s.staffProfileId == widget.selectedStaffId)
          .firstOrNull;
      staffName = match?.fullName ?? 'Chuyên viên đã chọn';
    }

    _detail = BookingDetailData(
      bookingCode:
          'BK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      status: 'Chờ xác nhận',
      salonName: widget.salonName,
      salonAddress: '',
      salonPhone: '',
      dateDisplay: widget.selectedDate,
      timeDisplay: widget.selectedTime,
      durationDisplay: _durationFrom(activeServices) ?? '30 phút',
      services: activeServices,
      notes: const [],
      subtotal: subtotal,
      discount: discount,
      totalAmount: total,
      paymentStatus: 'Tại salon',
      staffName: staffName,
      serviceStaffNames: serviceStaffNames,
    );
  }

  String? _durationFrom(List<BookingServiceItem> services) {
    var total = 0;
    for (final s in services) {
      total +=
          s.durationMinutes ??
          int.tryParse(RegExp(r'\d+').firstMatch(s.duration)?.group(0) ?? '') ??
          0;
    }
    if (total <= 0) return null;
    final h = total ~/ 60;
    final m = total % 60;
    if (h == 0) return '$m min';
    return m == 0 ? '${h}h' : '${h}h ${m}min';
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _onAddNote() {
    final text = _noteController.text.trim();
    if (text.isEmpty) {
      AppToast.warning(context, message: 'Please write a note description');
      return;
    }

    setState(() {
      final updatedNotes = List<String>.from(_detail.notes)..add(text);
      _detail = BookingDetailData(
        bookingCode: _detail.bookingCode,
        status: _detail.status,
        salonName: _detail.salonName,
        salonAddress: _detail.salonAddress,
        salonPhone: _detail.salonPhone,
        dateDisplay: _detail.dateDisplay,
        timeDisplay: _detail.timeDisplay,
        durationDisplay: _detail.durationDisplay,
        services: _detail.services,
        notes: updatedNotes,
        subtotal: _detail.subtotal,
        discount: _detail.discount,
        totalAmount: _detail.totalAmount,
        paymentStatus: _detail.paymentStatus,
        staffName: _detail.staffName,
        serviceStaffNames: _detail.serviceStaffNames,
      );
      _noteController.clear();
    });
    AppToast.success(context, message: 'Note added to booking');
  }

  void _onConfirm() {
    // 1. startAt:
    // Ưu tiên giờ đã chọn từ availability API hoặc lịch hẹn
    final String? isoDate;
    if (widget.selectedOption != null &&
        widget.selectedOption!.startAt.isNotEmpty) {
      isoDate = widget.selectedOption!.startAt;
    } else if (widget.startAt != null) {
      isoDate = widget.startAt!.toUtc().toIso8601String();
    } else {
      isoDate = null;
    }

    // 2. Danh sách items: Sắp xếp theo đúng thứ tự (sequence) và thợ của availability API
    final List<BookingItemParam> items;
    if (widget.selectedOption != null &&
        widget.selectedOption!.items.isNotEmpty) {
      final sortedOptionItems = List<BookingAvailabilityOptionItemEntity>.from(
        widget.selectedOption!.items,
      )..sort((a, b) => a.sequence.compareTo(b.sequence));

      items = sortedOptionItems.map((optItem) {
        final staffId =
            (optItem.staffProfileId != null &&
                optItem.staffProfileId!.isNotEmpty &&
                !optItem.staffProfileId!.startsWith('unassigned'))
            ? optItem.staffProfileId
            : (widget.selectedStaffPerService?[optItem.serviceId] ??
                  widget.selectedStaffId);
        final cleanStaffId =
            (staffId != null &&
                staffId.isNotEmpty &&
                !staffId.startsWith('unassigned'))
            ? staffId
            : null;
        return BookingItemParam(
          serviceId: optItem.serviceId,
          staffProfileId: cleanStaffId,
        );
      }).toList();
    } else {
      final serviceList = _detail.services;
      items = serviceList.map((service) {
        final staffId =
            widget.selectedStaffPerService?[service.id] ??
            widget.selectedStaffId;
        final cleanStaffId =
            (staffId != null &&
                staffId.isNotEmpty &&
                !staffId.startsWith('unassigned'))
            ? staffId
            : null;
        return BookingItemParam(
          serviceId: service.id,
          staffProfileId: cleanStaffId,
        );
      }).toList();
    }

    final hasBloc =
        context
            .findAncestorWidgetOfExactType<BlocProvider<CreateBookingBloc>>() !=
        null;
    if (hasBloc) {
      context.read<CreateBookingBloc>().add(
        SubmitBookingEvent(
          storeId: widget.storeId ?? '',
          startAt: isoDate,
          items: items,
          note: _noteController.text.trim().isNotEmpty
              ? _noteController.text.trim()
              : (_detail.notes.isNotEmpty ? _detail.notes.join('; ') : null),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BookingResultView(
            isSuccess: true,
            bookingCode: _detail.bookingCode,
            salonName: _detail.salonName,
            dateDisplay: _detail.dateDisplay,
            timeDisplay: _detail.timeDisplay,
            totalAmount: _detail.totalAmount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasBloc =
        context
            .findAncestorWidgetOfExactType<BlocProvider<CreateBookingBloc>>() !=
        null;

    if (!hasBloc) {
      return _buildScaffold(context, isSubmitting: false);
    }

    return BlocConsumer<CreateBookingBloc, CreateBookingState>(
      listener: (context, state) {
        if (state.isSuccess && state.booking != null) {
          final booking = state.booking!;
          AppToast.success(
            context,
            message: 'Booking created successfully (#${booking.bookingCode})',
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => BookingResultView(
                isSuccess: true,
                bookingCode: booking.bookingCode,
                salonName: booking.store?.name ?? widget.salonName,
                dateDisplay: widget.selectedDate,
                timeDisplay: widget.selectedTime,
                totalAmount: booking.totalAmount > 0
                    ? booking.totalAmount
                    : _detail.totalAmount,
              ),
            ),
          );
        } else if (state.isFailure && state.failure != null) {
          AppToastHelper.showError(context, error: state.failure);
        }
      },
      builder: (context, state) {
        return _buildScaffold(context, isSubmitting: state.isSubmitting);
      },
    );
  }

  Widget _buildScaffold(BuildContext context, {required bool isSubmitting}) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        title: isVi ? 'Chi tiết lịch hẹn' : 'Booking Detail',
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrow_left, color: Color(0xFF1E2022)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: BookingDetailBodyView(
        detail: _detail,
        noteController: _noteController,
        onAddNote: _onAddNote,
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
          children: [
            // Outlined Back Button
            Expanded(
              child: AppButton(
                text: isVi ? 'Quay lại' : 'Back',
                onPressed: isSubmitting
                    ? null
                    : () => Navigator.of(context).maybePop(),
                variant: AppButtonVariant.outline,
                textColor: const Color(0xFFBA4A32),
                borderRadius: BorderRadius.circular(16),
                height: 48,
              ),
            ),
            const SizedBox(width: 14),

            // Coral Confirm Button
            Expanded(
              child: AppButton(
                text: isVi ? 'Xác nhận đặt lịch' : 'Confirm',
                isLoading: isSubmitting,
                backgroundColor: _coralColor,
                borderRadius: BorderRadius.circular(16),
                height: 48,
                onPressed: isSubmitting ? null : _onConfirm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
