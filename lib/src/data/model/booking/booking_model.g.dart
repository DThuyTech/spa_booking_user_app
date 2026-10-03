// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingServiceItemModel _$BookingServiceItemModelFromJson(
  Map<String, dynamic> json,
) => _BookingServiceItemModel(
  serviceId: json['serviceId'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toInt(),
  duration: (json['duration'] as num?)?.toInt() ?? 60,
);

Map<String, dynamic> _$BookingServiceItemModelToJson(
  _BookingServiceItemModel instance,
) => <String, dynamic>{
  'serviceId': instance.serviceId,
  'name': instance.name,
  'price': instance.price,
  'duration': instance.duration,
};

_BookingCustomerSnapshotModel _$BookingCustomerSnapshotModelFromJson(
  Map<String, dynamic> json,
) => _BookingCustomerSnapshotModel(
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String,
);

Map<String, dynamic> _$BookingCustomerSnapshotModelToJson(
  _BookingCustomerSnapshotModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
};

_BookingActionsModel _$BookingActionsModelFromJson(Map<String, dynamic> json) =>
    _BookingActionsModel(
      canCancel: json['canCancel'] as bool? ?? false,
      canReschedule: json['canReschedule'] as bool? ?? false,
      canBookAgain: json['canBookAgain'] as bool? ?? false,
      canReview: json['canReview'] as bool? ?? false,
    );

Map<String, dynamic> _$BookingActionsModelToJson(
  _BookingActionsModel instance,
) => <String, dynamic>{
  'canCancel': instance.canCancel,
  'canReschedule': instance.canReschedule,
  'canBookAgain': instance.canBookAgain,
  'canReview': instance.canReview,
};
