import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../../shared/widgets/toast/app_toast.dart';
import '../../booking_result/view/booking_result_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_detail_body_view.dart';
import '../mockup_data/booking_detail_mock_data.dart';

@RoutePage()
class BookingDetailPage extends StatelessWidget {
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;

  const BookingDetailPage({
    super.key,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
  });

  @override
  Widget build(BuildContext context) {
    return BookingDetailView(
      salonName: salonName,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      selectedServices: selectedServices,
    );
  }
}

class BookingDetailView extends StatefulWidget {
  final String salonName;
  final String selectedDate;
  final String selectedTime;
  final List<BookingServiceItem>? selectedServices;

  const BookingDetailView({
    super.key,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
  });

  @override
  State<BookingDetailView> createState() => _BookingDetailViewState();
}

class _BookingDetailViewState extends State<BookingDetailView> {
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
      durationDisplay: base.durationDisplay,
      services: activeServices,
      notes: List.from(base.notes),
      subtotal: subtotal,
      discount: discount,
      totalAmount: total,
      paymentStatus: base.paymentStatus,
    );
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
        notes: [..._detail.notes, 'Just now • $text'],
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
    Navigator.of(context).push(
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

  @override
  Widget build(BuildContext context) {
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
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFBA4A32),
                    side: const BorderSide(
                      color: Color(0xFFFFB8A8),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('Back'),
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Coral Confirm Button
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coralColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('Confirm'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
