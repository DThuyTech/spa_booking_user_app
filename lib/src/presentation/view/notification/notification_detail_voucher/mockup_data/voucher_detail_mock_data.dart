import '../../models/notification_models.dart';

class VoucherDetailMockData {
  const VoucherDetailMockData._();

  static const VoucherNotificationData defaultVoucher = VoucherNotificationData(
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
}
