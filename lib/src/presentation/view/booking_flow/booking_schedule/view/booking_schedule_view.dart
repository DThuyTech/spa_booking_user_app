import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../../shared/widgets/toast/app_toast.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../../models/booking_models.dart';
import '../body_view/booking_schedule_body_view.dart';
import '../mockup_data/booking_schedule_mock_data.dart';

@RoutePage()
class BookingSchedulePage extends StatelessWidget {
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;

  const BookingSchedulePage({
    super.key,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  @override
  Widget build(BuildContext context) {
    return BookingScheduleView(
      salonName: salonName,
      selectedServices: selectedServices,
      selectedStaffId: selectedStaffId,
    );
  }
}

class BookingScheduleView extends StatefulWidget {
  final String salonName;
  final List<BookingServiceItem>? selectedServices;
  final String? selectedStaffId;

  const BookingScheduleView({
    super.key,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  @override
  State<BookingScheduleView> createState() => _BookingScheduleViewState();
}

class _BookingScheduleViewState extends State<BookingScheduleView> {
  String _selectedFilterChip = 'All Staff';
  late String? _selectedStaffId;
  String _selectedTime = '10:00 AM';
  final String _selectedDate = 'Aug 26, 2026';
  late List<BookingTimeSlotItem> _slots;

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  void initState() {
    super.initState();
    _selectedStaffId = widget.selectedStaffId ?? 'staff_sa';
    _slots = List.from(BookingScheduleMockData.defaultSlots);
  }

  void _onSelectSlot(String staffId, String time) {
    setState(() {
      _selectedStaffId = staffId;
      _selectedTime = time;
    });
    final staff = BookingScheduleMockData.staffMembers.firstWhere(
      (s) => s.id == staffId,
      orElse: () => BookingScheduleMockData.staffMembers.first,
    );
    AppToast.info(context, message: 'Selected ${staff.name} at $time');
  }

  void _onProceedToDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingDetailView(
          salonName: widget.salonName,
          selectedDate: _selectedDate,
          selectedTime: _selectedTime,
          selectedServices: widget.selectedServices,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(title: 'Booking', onMorePressed: () {}),
      body: BookingScheduleBodyView(
        salonName: widget.salonName,
        selectedDate: _selectedDate,
        selectedFilterChip: _selectedFilterChip,
        onFilterChipChanged: (chip) {
          setState(() {
            _selectedFilterChip = chip;
          });
        },
        staffMembers: BookingScheduleMockData.staffMembers,
        timeColumns: BookingScheduleMockData.timeColumns,
        slots: _slots,
        selectedStaffId: _selectedStaffId,
        selectedTime: _selectedTime,
        onSelectSlot: _onSelectSlot,
        onAddCustomBooking: () {
          AppToast.info(context, message: 'Add custom booking slot');
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
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: _onProceedToDetail,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Continue to Booking Detail ($_selectedTime)'),
                const SizedBox(width: 8),
                const Icon(LucideIcons.arrow_right, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
