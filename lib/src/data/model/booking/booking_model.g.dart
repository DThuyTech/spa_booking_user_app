// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
