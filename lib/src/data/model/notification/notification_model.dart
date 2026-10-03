import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/notification/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String id,
    @JsonKey(name: 'type', defaultValue: 'BOOKING') required String type,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'message', defaultValue: '') required String message,
    @JsonKey(name: 'isRead', defaultValue: false) required bool isRead,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'reference') Map<String, dynamic>? reference,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      type: type,
      title: title,
      message: message,
      isRead: isRead,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      referenceType: reference?['type']?.toString(),
      referenceId: reference?['id']?.toString(),
    );
  }
}

@freezed
abstract class NotificationListResponseModel
    with _$NotificationListResponseModel {
  const NotificationListResponseModel._();

  const factory NotificationListResponseModel({
    @Default([]) List<NotificationModel> items,
    Map<String, dynamic>? pagination,
  }) = _NotificationListResponseModel;

  factory NotificationListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseModelFromJson(json);

  NotificationListEntity toEntity() {
    return NotificationListEntity(
      items: items.map((e) => e.toEntity()).toList(),
      total: (pagination?['total'] as num?)?.toInt() ?? items.length,
      page: (pagination?['page'] as num?)?.toInt() ?? 1,
      limit: (pagination?['limit'] as num?)?.toInt() ?? 20,
      totalPages: (pagination?['totalPages'] as num?)?.toInt() ?? 1,
    );
  }
}
