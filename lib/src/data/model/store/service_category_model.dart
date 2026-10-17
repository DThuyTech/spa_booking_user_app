import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/service_category_entity.dart';
import 'service_model.dart';

part 'service_category_model.freezed.dart';

@freezed
abstract class ServiceCategoryModel with _$ServiceCategoryModel {
  const ServiceCategoryModel._();

  const factory ServiceCategoryModel({
    required String id,
    required String name,
    String? description,
    String? iconUrl,
    @Default(0) int position,
    @Default(0) int displayOrder,
    @Default([]) List<ServiceModel> services,
  }) = _ServiceCategoryModel;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    final pos = (json['position'] as num?)?.toInt() ??
        (json['displayOrder'] as num?)?.toInt() ??
        0;

    final rawServices = json['services'];
    List<ServiceModel> parsedServices = [];
    if (rawServices is List) {
      parsedServices = rawServices
          .whereType<Map<String, dynamic>>()
          .map(ServiceModel.fromJson)
          .toList();
    }

    return ServiceCategoryModel(
      id: (json['id'] ?? json['_id'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      position: pos,
      displayOrder: pos,
      services: parsedServices,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    if (description != null) 'description': description,
    if (iconUrl != null) 'iconUrl': iconUrl,
    'position': position,
    'displayOrder': displayOrder,
    'services': services.map((e) => e.toJson()).toList(),
  };
}

extension ServiceCategoryModelX on ServiceCategoryModel {
  ServiceCategoryEntity toEntity() => ServiceCategoryEntity(
    id: id,
    name: name,
    description: description,
    iconUrl: iconUrl,
    position: position,
    displayOrder: displayOrder,
    services: services.map((e) => e.toEntity()).toList(),
  );
}
