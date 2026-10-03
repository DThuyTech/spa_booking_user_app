import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_category_entity.freezed.dart';

@freezed
abstract class ServiceCategoryEntity with _$ServiceCategoryEntity {
  const factory ServiceCategoryEntity({
    required String id,
    required String name,
    String? iconUrl,
    @Default(0) int displayOrder,
  }) = _ServiceCategoryEntity;
}
