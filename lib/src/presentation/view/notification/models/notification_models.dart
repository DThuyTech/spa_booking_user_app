enum NotificationType { booking, voucher, system }

class VoucherNotificationData {
  final String title;
  final String description;
  final String discountPercent;
  final String validUntil;
  final List<String> applicableServices;
  final String imageUrl;
  final String code;

  const VoucherNotificationData({
    required this.title,
    required this.description,
    required this.discountPercent,
    required this.validUntil,
    required this.applicableServices,
    required this.imageUrl,
    this.code = 'BEAUTY20',
  });
}

class BookingNotificationData {
  final String salonName;
  final String serviceName;
  final String stylist;
  final String date;
  final String time;
  final String status;
  final String timestamp;

  const BookingNotificationData({
    required this.salonName,
    required this.serviceName,
    required this.stylist,
    required this.date,
    required this.time,
    this.status = 'Confirmed',
    required this.timestamp,
  });
}

class NotificationItem {
  final String id;
  final NotificationType type;
  final String title;
  final String subtitle;
  final String timestamp;
  final String timeGroup; // 'Today', 'Yesterday', 'Earlier'
  final bool isRead;
  final VoucherNotificationData? voucherData;
  final BookingNotificationData? bookingData;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.timeGroup,
    this.isRead = false,
    this.voucherData,
    this.bookingData,
  });

  NotificationItem copyWith({
    String? id,
    NotificationType? type,
    String? title,
    String? subtitle,
    String? timestamp,
    String? timeGroup,
    bool? isRead,
    VoucherNotificationData? voucherData,
    BookingNotificationData? bookingData,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      timestamp: timestamp ?? this.timestamp,
      timeGroup: timeGroup ?? this.timeGroup,
      isRead: isRead ?? this.isRead,
      voucherData: voucherData ?? this.voucherData,
      bookingData: bookingData ?? this.bookingData,
    );
  }
}
