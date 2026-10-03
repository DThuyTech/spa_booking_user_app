// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'BOOKING',
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['isRead'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
      reference: json['reference'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'reference': instance.reference,
    };

_NotificationListResponseModel _$NotificationListResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationListResponseModel(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$NotificationListResponseModelToJson(
  _NotificationListResponseModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'pagination': instance.pagination,
};
