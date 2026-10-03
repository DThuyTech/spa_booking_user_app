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

_StoreListResponseModel _$StoreListResponseModelFromJson(
  Map<String, dynamic> json,
) => _StoreListResponseModel(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: json['pagination'] == null
      ? null
      : StorePaginationModel.fromJson(
          json['pagination'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StoreListResponseModelToJson(
  _StoreListResponseModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'pagination': instance.pagination,
};
