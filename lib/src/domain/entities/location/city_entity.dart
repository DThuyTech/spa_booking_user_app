import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';

@freezed
abstract class CityEntity with _$CityEntity {
  const factory CityEntity({
    required String code,
    required String name,
    required String fullName,
    String? divisionType,
    int? phoneCode,
  }) = _CityEntity;
}
