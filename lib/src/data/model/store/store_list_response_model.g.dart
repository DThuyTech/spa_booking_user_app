// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorePaginationModel _$StorePaginationModelFromJson(
  Map<String, dynamic> json,
) => _StorePaginationModel(
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$StorePaginationModelToJson(
  _StorePaginationModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};
