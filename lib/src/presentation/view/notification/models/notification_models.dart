import 'package:spa_booking/src/domain/entities/notification/notification_entity.dart';

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
  final String? referenceType;
  final String? referenceId;

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
    this.referenceType,
    this.referenceId,
  });

  factory NotificationItem.fromEntity(NotificationEntity entity) {
    NotificationType nType = NotificationType.system;
    final upperType = entity.type.toUpperCase();
    if (upperType == 'BOOKING') {
      nType = NotificationType.booking;
    } else if (upperType == 'VOUCHER' || upperType == 'PAYMENT') {
      nType = NotificationType.voucher;
    } else {
      nType = NotificationType.system;
    }

    final createdAt = entity.createdAt;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final itemDate = DateTime(createdAt.year, createdAt.month, createdAt.day);
    final diffDays = today.difference(itemDate).inDays;

    String timeGroup = 'Earlier';
    if (diffDays == 0) {
      timeGroup = 'Today';
    } else if (diffDays == 1) {
      timeGroup = 'Yesterday';
    }

    final hour = createdAt.hour.toString().padLeft(2, '0');
    final minute = createdAt.minute.toString().padLeft(2, '0');
    final timeStr = diffDays == 0
        ? '$hour:$minute'
        : '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')} $hour:$minute';

    return NotificationItem(
      id: entity.id,
      type: nType,
      title: entity.title,
      subtitle: entity.message,
      timestamp: timeStr,
      timeGroup: timeGroup,
      isRead: entity.isRead,
      referenceType: entity.referenceType,
      referenceId: entity.referenceId,
      bookingData:
          nType == NotificationType.booking && entity.referenceId != null
          ? BookingNotificationData(
              salonName: entity.title,
              serviceName: entity.message,
              stylist: '',
              date: '${createdAt.day}/${createdAt.month}/${createdAt.year}',
              time: '$hour:$minute',
              timestamp: timeStr,
            )
          : null,
    );
  }

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
    String? referenceType,
    String? referenceId,
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
      referenceType: referenceType ?? this.referenceType,
      referenceId: referenceId ?? this.referenceId,
    );
  }
}
