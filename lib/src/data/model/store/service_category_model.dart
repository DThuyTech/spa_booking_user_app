import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/service_category_entity.dart';

part 'service_category_model.freezed.dart';
part 'service_category_model.g.dart';

@freezed
abstract class ServiceCategoryModel with _$ServiceCategoryModel {
  const factory ServiceCategoryModel({
    required String id,
    required String name,
    String? iconUrl,
    @Default(0) int displayOrder,
  }) = _ServiceCategoryModel;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);
}

extension ServiceCategoryModelX on ServiceCategoryModel {
  ServiceCategoryEntity toEntity() => ServiceCategoryEntity(
    id: id,
    name: name,
    iconUrl: iconUrl,
    displayOrder: displayOrder,
  );
}
