// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingSummaryModel _$BookingSummaryModelFromJson(Map<String, dynamic> json) =>
    _BookingSummaryModel(
      total: (json['total'] as num?)?.toInt() ?? 0,
      upcoming: (json['upcoming'] as num?)?.toInt() ?? 0,
      past: (json['past'] as num?)?.toInt() ?? 0,
      cancelled: (json['cancelled'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BookingSummaryModelToJson(
  _BookingSummaryModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'upcoming': instance.upcoming,
  'past': instance.past,
  'cancelled': instance.cancelled,
};

_BookingPaginationModel _$BookingPaginationModelFromJson(
  Map<String, dynamic> json,
) => _BookingPaginationModel(
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$BookingPaginationModelToJson(
  _BookingPaginationModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};
