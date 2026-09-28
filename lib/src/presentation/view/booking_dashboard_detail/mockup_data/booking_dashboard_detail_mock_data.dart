class DetailServiceItem {
  final String name;
  final String duration;
  final String price;

  const DetailServiceItem({
    required this.name,
    required this.duration,
    required this.price,
  });
}

class DetailUserNoteItem {
  final String timestamp;
  final String note;

  const DetailUserNoteItem({required this.timestamp, required this.note});
}

class BookingDashboardDetailMockData {
  const BookingDashboardDetailMockData._();

  static const String bookingCode = '#BK-20260826-0012';
  static const String status = 'CONFIRMED';

  static const String salonName = 'Aurus Salon';
  static const String salonAddress = '1 ward, 1234 city';
  static const String salonPhone = '+84 912 345 678';

  static const String appointmentDate = 'Aug 26, 2026';
  static const String appointmentTimeRange = '10:00 AM – 12:15 PM';
  static const String appointmentDurationBadge = '2h 15m';

  static const List<DetailServiceItem> services = [
    DetailServiceItem(name: 'Haircut', duration: '30m', price: '150,000 VND'),
    DetailServiceItem(
      name: 'Hair Coloring',
      duration: '1h 30m',
      price: '400,000 VND',
    ),
    DetailServiceItem(name: 'Hair Wash', duration: '15m', price: '50,000 VND'),
  ];

  static const List<DetailUserNoteItem> notes = [
    DetailUserNoteItem(
      timestamp: 'Aug 24, 2026',
      note: 'First time client. Prefers quiet appointment.',
    ),
    DetailUserNoteItem(
      timestamp: 'Just now',
      note: 'Allergic to specific hair spray brands.',
    ),
  ];

  static const String subtotal = '600,000 VND';
  static const String discount = '-60,000 VND';
  static const String discountBadge = '10% OFF';
  static const String totalAmount = '540,000 VND';
  static const String paymentStatus = 'UNPAID';
}
