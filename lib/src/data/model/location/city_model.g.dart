// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => _CityModel(
  code: json['code'] as String? ?? '',
  name: json['name'] as String? ?? '',
  fullName: json['fullName'] as String? ?? '',
  divisionType: json['divisionType'] as String?,
  phoneCode: (json['phoneCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'fullName': instance.fullName,
      'divisionType': instance.divisionType,
      'phoneCode': instance.phoneCode,
    };
