import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/location/city_entity.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
abstract class CityModel with _$CityModel {
  const CityModel._();

  const factory CityModel({
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'divisionType') String? divisionType,
    @JsonKey(name: 'phoneCode') int? phoneCode,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  CityEntity toEntity() => CityEntity(
    code: code,
    name: name,
    fullName: fullName.isNotEmpty ? fullName : name,
    divisionType: divisionType,
    phoneCode: phoneCode,
  );
}
