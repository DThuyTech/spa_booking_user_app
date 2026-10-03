// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCategoryModel _$ServiceCategoryModelFromJson(
  Map<String, dynamic> json,
) => _ServiceCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  iconUrl: json['iconUrl'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ServiceCategoryModelToJson(
  _ServiceCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'iconUrl': instance.iconUrl,
  'displayOrder': instance.displayOrder,
};
