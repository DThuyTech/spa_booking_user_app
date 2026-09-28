import '../../models/booking_models.dart';

class BookingDetailMockData {
  const BookingDetailMockData._();

  static const BookingDetailData defaultBookingDetail = BookingDetailData(
    bookingCode: '#BK-20260826-0012',
    status: 'CONFIRMED',
    salonName: 'Aurus Salon',
    salonAddress: '1 ward, 1234 city',
    salonPhone: '+84 912 345 678',
    dateDisplay: 'Aug 26, 2026',
    timeDisplay: '10:00 AM – 12:15 PM',
    durationDisplay: '2h 15m',
    services: [
      BookingServiceItem(
        id: 's_1',
        category: 'Hair',
        name: 'Haircut',
        duration: '30m',
        price: 150000,
        priceDisplay: '150,000 VND',
        isSelected: true,
      ),
      BookingServiceItem(
        id: 's_2',
        category: 'Hair',
        name: 'Hair Coloring',
        duration: '1h 30m',
        price: 400000,
        priceDisplay: '400,000 VND',
        isSelected: true,
      ),
      BookingServiceItem(
        id: 's_3',
        category: 'Hair',
        name: 'Hair Wash',
        duration: '15m',
        price: 50000,
        priceDisplay: '50,000 VND',
        isSelected: true,
      ),
    ],
    notes: [
      'Aug 24, 2026 • First time client. Prefers quiet appointment.',
      'Just now • Allergic to specific hair spray brands.',
    ],
    subtotal: 600000,
    discount: 60000,
    totalAmount: 540000,
    paymentStatus: 'UNPAID',
  );
}
