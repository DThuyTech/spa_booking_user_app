import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    @Default('BOOKING') String type,
    required String title,
    required String message,
    @Default(false) bool isRead,
    required DateTime createdAt,
    String? referenceType,
    String? referenceId,
  }) = _NotificationEntity;
}

@freezed
abstract class NotificationListEntity with _$NotificationListEntity {
  const factory NotificationListEntity({
    @Default([]) List<NotificationEntity> items,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(1) int totalPages,
  }) = _NotificationListEntity;
}
