import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../booking_flow/booking_detail/view/booking_detail_view.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/notification_models.dart';
import '../body_view/booking_notification_body_view.dart';
import '../mockup_data/booking_notification_mock_data.dart';

@RoutePage()
class BookingNotificationPage extends StatelessWidget {
  final BookingNotificationData? booking;

  const BookingNotificationPage({
    super.key,
    this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return BookingNotificationView(
      booking: booking ?? BookingNotificationMockData.defaultBooking,
    );
  }
}

class BookingNotificationView extends StatelessWidget {
  final BookingNotificationData booking;

  const BookingNotificationView({
    super.key,
    this.booking = BookingNotificationMockData.defaultBooking,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  void _onViewBooking(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingDetailView(
          salonName: booking.salonName,
          selectedDate: booking.date,
          selectedTime: booking.time,
        ),
      ),
    );
  }

  void _onContactSalon(BuildContext context) {
    AppToast.info(
      context,
      message: 'Calling ${booking.salonName}: +84 912 345 678',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppAppBar(title: 'Detail', onMorePressed: () {}),
      body: BookingNotificationBodyView(booking: booking),
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
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Coral "View Booking" Button
            Expanded(
              child: AppButton(
                text: 'View Booking',
                onPressed: () => _onViewBooking(context),
                backgroundColor: _coralColor,
                textColor: Colors.white,
                borderRadius: BorderRadius.circular(24),
                height: 48,
              ),
            ),

            const SizedBox(width: 14),

            // Outlined "Contact Salon" Button
            Expanded(
              child: AppButton(
                text: 'Contact Salon',
                onPressed: () => _onContactSalon(context),
                variant: AppButtonVariant.outline,
                textColor: _textDark,
                borderRadius: BorderRadius.circular(24),
                height: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
