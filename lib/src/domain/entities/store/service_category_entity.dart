import 'package:freezed_annotation/freezed_annotation.dart';
import 'service_entity.dart';

part 'service_category_entity.freezed.dart';

@freezed
abstract class ServiceCategoryEntity with _$ServiceCategoryEntity {
  const factory ServiceCategoryEntity({
    required String id,
    required String name,
    String? description,
    String? iconUrl,
    @Default(0) int position,
    @Default(0) int displayOrder,
    @Default([]) List<ServiceEntity> services,
  }) = _ServiceCategoryEntity;
}
