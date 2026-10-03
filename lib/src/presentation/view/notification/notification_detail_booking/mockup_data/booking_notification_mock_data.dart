import '../../models/notification_models.dart';

class BookingNotificationMockData {
  const BookingNotificationMockData._();

  static const BookingNotificationData defaultBooking = BookingNotificationData(
    salonName: 'MIMI Hair Salon',
    serviceName: 'HAIRCUT & STYLING',
    stylist: 'Emma',
    date: 'August 28, 2026',
    time: '6:30 PM',
    status: 'Confirmed',
    timestamp: 'Today, 10:32 AM',
  );
}
