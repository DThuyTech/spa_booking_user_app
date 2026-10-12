import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../../shared/design_system/components/buttons/app_icon_button.dart';
import '../body_view/booking_result_body_view.dart';

@RoutePage()
class BookingResultPage extends StatelessWidget {
  final bool isSuccess;
  final String? bookingCode;
  final String? salonName;
  final String? dateDisplay;
  final String? timeDisplay;
  final double? totalAmount;

  const BookingResultPage({
    super.key,
    this.isSuccess = true,
    this.bookingCode,
    this.salonName,
    this.dateDisplay,
    this.timeDisplay,
    this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return BookingResultView(
      isSuccess: isSuccess,
      bookingCode: bookingCode ?? '',
      salonName: salonName ?? '',
      dateDisplay: dateDisplay ?? '',
      timeDisplay: timeDisplay ?? '',
      totalAmount: totalAmount ?? 0.0,
    );
  }
}

class BookingResultView extends StatefulWidget {
  final bool isSuccess;
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final double totalAmount;

  const BookingResultView({
    super.key,
    this.isSuccess = true,
    this.bookingCode = '',
    this.salonName = '',
    this.dateDisplay = '',
    this.timeDisplay = '',
    this.totalAmount = 0.0,
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

  void _navigateHome() {
    if (!mounted) return;
    try {
      context.router.replaceAll([const RootRoute()]);
    } catch (_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  void _onPrimaryAction() {
    if (_isSuccess) {
      _navigateHome();
    } else {
      // Try again -> pop back to schedule
      Navigator.of(context).maybePop();
    }
  }

  void _onSecondaryAction() {
    _navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isSuccess,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _navigateHome();
      },
      child: Scaffold(
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
                onPressed: _navigateHome,
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
      ),
    );
  }
}
