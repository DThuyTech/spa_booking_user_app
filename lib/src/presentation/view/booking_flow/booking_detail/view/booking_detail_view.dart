import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spa_booking/src/presentation/bloc/booking/create_booking/create_booking_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/booking/create_booking/create_booking_event.dart';
import 'package:spa_booking/src/presentation/bloc/booking/create_booking/create_booking_state.dart';
import '../../../../../shared/shared.dart';
import '../../booking_result/view/booking_result_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_detail_body_view.dart';
import '../mockup_data/booking_detail_mock_data.dart';

@RoutePage()
class BookingDetailPage extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;
  final DateTime? startAt;

  const BookingDetailPage({
    super.key,
    this.storeId,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
    this.selectedStaffId,
    this.startAt,
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
        startAt: startAt,
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
  final DateTime? startAt;

  const BookingDetailView({
    super.key,
    this.storeId,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
    this.selectedStaffId,
    this.startAt,
  });

  @override
  Widget build(BuildContext context) {
    final hasBloc = context.findAncestorWidgetOfExactType<
            BlocProvider<CreateBookingBloc>>() !=
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
          startAt: startAt,
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
      startAt: startAt,
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
  final DateTime? startAt;

  const _BookingDetailContentView({
    this.storeId,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
    this.selectedStaffId,
    this.startAt,
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

    final base = BookingDetailMockData.defaultBookingDetail;
    final activeServices =
        (widget.selectedServices != null && widget.selectedServices!.isNotEmpty)
            ? widget.selectedServices!
            : base.services;

    final subtotal = activeServices.fold(0, (sum, s) => sum + s.price);
    final discount = (subtotal * 0.1).round();
    final total = subtotal - discount;

    _detail = BookingDetailData(
      bookingCode: base.bookingCode,
      status: base.status,
      salonName: widget.salonName,
      salonAddress: base.salonAddress,
      salonPhone: base.salonPhone,
      dateDisplay: widget.selectedDate,
      timeDisplay: widget.selectedTime,
      durationDisplay: _durationFrom(activeServices) ?? base.durationDisplay,
      services: activeServices,
      notes: List.from(base.notes),
      subtotal: subtotal,
      discount: discount,
      totalAmount: total,
      paymentStatus: base.paymentStatus,
    );
  }

  String? _durationFrom(List<BookingServiceItem> services) {
    var total = 0;
    for (final s in services) {
      total += s.durationMinutes ??
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
      );
      _noteController.clear();
    });
    AppToast.success(context, message: 'Note added to booking');
  }

  void _onConfirm() {
    final storeId = widget.storeId ?? 'default_store';
    final serviceIds = _detail.services.map((s) => s.id).toList();

    // Use the slot picked on the schedule table (sent as UTC ISO-8601).
    final isoDate =
        (widget.startAt ?? DateTime.now()).toUtc().toIso8601String();

    final hasBloc = context.findAncestorWidgetOfExactType<
            BlocProvider<CreateBookingBloc>>() !=
        null;
    if (hasBloc) {
      context.read<CreateBookingBloc>().add(
            SubmitBookingEvent(
              storeId: storeId,
              serviceIds: serviceIds.isNotEmpty ? serviceIds : ['srv_default'],
              startAt: isoDate,
              staffProfileId: widget.selectedStaffId,
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
    final hasBloc = context.findAncestorWidgetOfExactType<
            BlocProvider<CreateBookingBloc>>() !=
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
          Navigator.of(context).push(
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(title: 'Booking detail', onMorePressed: () {}),
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
                    text: 'Back',
                    onPressed: isSubmitting
                        ? null
                        : () => Navigator.of(context).maybePop(),
                    variant: AppButtonVariant.outline,
                    textColor: const Color(0xFFBA4A32),
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                  ),
                ),
                const SizedBox(width: 14),

                // Coral Confirm Button
                Expanded(
                  child: AppButton(
                    text: 'Confirm',
                    isLoading: isSubmitting,
                    backgroundColor: _coralColor,
                    onPressed: isSubmitting ? null : _onConfirm,
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
