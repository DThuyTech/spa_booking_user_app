import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../../shared/design_system/components/buttons/app_icon_button.dart';
import '../body_view/booking_result_body_view.dart';
import '../mockup_data/booking_result_mock_data.dart';

@RoutePage()
class BookingResultPage extends StatelessWidget {
  final bool isSuccess;
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final int totalAmount;

  const BookingResultPage({
    super.key,
    this.isSuccess = true,
    this.bookingCode = BookingResultMockData.defaultBookingCode,
    this.salonName = BookingResultMockData.defaultSalonName,
    this.dateDisplay = BookingResultMockData.defaultDateDisplay,
    this.timeDisplay = BookingResultMockData.defaultTimeDisplay,
    this.totalAmount = BookingResultMockData.defaultTotalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return BookingResultView(
      isSuccess: isSuccess,
      bookingCode: bookingCode,
      salonName: salonName,
      dateDisplay: dateDisplay,
      timeDisplay: timeDisplay,
      totalAmount: totalAmount,
    );
  }
}

class BookingResultView extends StatefulWidget {
  final bool isSuccess;
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final int totalAmount;

  const BookingResultView({
    super.key,
    this.isSuccess = true,
    this.bookingCode = BookingResultMockData.defaultBookingCode,
    this.salonName = BookingResultMockData.defaultSalonName,
    this.dateDisplay = BookingResultMockData.defaultDateDisplay,
    this.timeDisplay = BookingResultMockData.defaultTimeDisplay,
    this.totalAmount = BookingResultMockData.defaultTotalAmount,
  });

  @override
  State<BookingResultView> createState() => _BookingResultViewState();
}

class _BookingResultViewState extends State<BookingResultView> {
  late bool _isSuccess;

  @override
  void initState() {
    super.initState();
    _isSuccess = widget.isSuccess;
  }

  void _onPrimaryAction() {
    if (_isSuccess) {
      // Pop back to root
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      // Try again -> pop back to schedule
      Navigator.of(context).maybePop();
    }
  }

  void _onSecondaryAction() {
    // Back to home
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        showBackButton: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AppIconButton(
              icon: LucideIcons.x,
              dimension: 40,
              iconSize: 18,
              backgroundColor: const Color(0xFFF1F5F9),
              iconColor: const Color(0xFF1E2022),
              borderRadius: BorderRadius.circular(20),
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ),
        ],
      ),
      body: BookingResultBodyView(
        isSuccess: _isSuccess,
        bookingCode: widget.bookingCode,
        salonName: widget.salonName,
        dateDisplay: widget.dateDisplay,
        timeDisplay: widget.timeDisplay,
        totalAmount: widget.totalAmount,
        onPrimaryAction: _onPrimaryAction,
        onSecondaryAction: _onSecondaryAction,
        onToggleState: () {
          setState(() {
            _isSuccess = !_isSuccess;
          });
        },
      ),
    );
  }
}
