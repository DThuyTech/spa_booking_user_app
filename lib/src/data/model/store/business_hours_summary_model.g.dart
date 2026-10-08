// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_hours_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessHoursSummaryModel _$BusinessHoursSummaryModelFromJson(
  Map<String, dynamic> json,
) => BusinessHoursSummaryModel(
  storeId: json['storeId'] as String,
  days:
      (json['days'] as List<dynamic>?)
          ?.map(
            (e) => StoreBusinessHourModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$BusinessHoursSummaryModelToJson(
  BusinessHoursSummaryModel instance,
) => <String, dynamic>{'storeId': instance.storeId, 'days': instance.days};
