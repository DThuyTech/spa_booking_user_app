import '../../models/notification_models.dart';

class NotificationDashboardMockData {
  const NotificationDashboardMockData._();

  static const defaultVoucher = VoucherNotificationData(
    title: '20% OFF your next appointment',
    description:
        'Enjoy 20% off selected beauty services when you book before August 31. Treat yourself to a moment of relaxation and rejuvenation with our premium treatments.',
    discountPercent: '20% Off',
    validUntil: 'August 31',
    applicableServices: ['Hair', 'Nails', 'Facial'],
    imageUrl:
        'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
    code: 'BEAUTY20',
  );

  static const defaultBooking = BookingNotificationData(
    salonName: 'MIMI Hair Salon',
    serviceName: 'HAIRCUT & STYLING',
    stylist: 'Emma',
    date: 'August 28, 2026',
    time: '6:30 PM',
    status: 'Confirmed',
    timestamp: 'Today, 10:32 AM',
  );

  static final List<NotificationItem> notifications = [
    const NotificationItem(
      id: 'notif_1',
      type: NotificationType.booking,
      title: 'Booking Confirmed!',
      subtitle:
          'Your appointment at MIMI Hair Salon with Emma has been confirmed for Aug 28 at 6:30 PM.',
      timestamp: '10:32 AM',
      timeGroup: 'Today',
      isRead: false,
      bookingData: defaultBooking,
    ),
    const NotificationItem(
      id: 'notif_2',
      type: NotificationType.voucher,
      title: '20% OFF your next appointment',
      subtitle:
          'Special reward! Enjoy 20% off selected beauty services valid until August 31.',
      timestamp: '08:15 AM',
      timeGroup: 'Today',
      isRead: false,
      voucherData: defaultVoucher,
    ),
    const NotificationItem(
      id: 'notif_3',
      type: NotificationType.booking,
      title: 'Appointment Reminder',
      subtitle:
          'Reminder: You have an upcoming appointment tomorrow at Luminous Salon.',
      timestamp: 'Yesterday, 3:45 PM',
      timeGroup: 'Yesterday',
      isRead: true,
      bookingData: BookingNotificationData(
        salonName: 'Luminous Salon',
        serviceName: 'HAIRCUT & STYLING',
        stylist: 'Sarah J.',
        date: 'Wed, Aug 26, 2026',
        time: '10:00 AM - 11:00 AM',
        status: 'Confirmed',
        timestamp: 'Yesterday, 3:45 PM',
      ),
    ),
    const NotificationItem(
      id: 'notif_4',
      type: NotificationType.voucher,
      title: 'Weekend Spa Flash Deal',
      subtitle:
          'Get 15% discount on all Deluxe Massage and Facial treatments this weekend.',
      timestamp: '2 days ago',
      timeGroup: 'Earlier',
      isRead: true,
      voucherData: VoucherNotificationData(
        title: 'Weekend Spa Flash Deal',
        description:
            'Indulge in pure tranquility. Get 15% off on all spa and wellness packages this Saturday and Sunday.',
        discountPercent: '15% Off',
        validUntil: 'September 5',
        applicableServices: ['Massage', 'Body Scrub', 'Facial'],
        imageUrl:
            'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80',
        code: 'WEEKEND15',
      ),
    ),
    const NotificationItem(
      id: 'notif_5',
      type: NotificationType.system,
      title: 'Profile Updated',
      subtitle:
          'Your customer contact information has been updated successfully.',
      timestamp: '3 days ago',
      timeGroup: 'Earlier',
      isRead: true,
    ),
  ];
}
