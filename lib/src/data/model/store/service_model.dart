import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/store/service_entity.dart';
import 'applied_pricing_rule_model.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final String id;
  final String name;
  final String? description;

  final double basePrice;
  final int? effectivePrice;

  @JsonKey(defaultValue: false)
  final bool hasDiscount;

  @JsonKey(defaultValue: 0)
  final double discountPercent;

  final int durationMinutes;
  final String? imageUrl;
  final String? categoryId;

  final AppliedPricingRuleModel? appliedPricingRule;

  const ServiceModel({
    required this.id,
    required this.name,
    this.description,
    required this.basePrice,
    this.effectivePrice,
    this.hasDiscount = false,
    this.discountPercent = 0,
    required this.durationMinutes,
    this.imageUrl,
    this.categoryId,
    this.appliedPricingRule,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

extension ServiceModelX on ServiceModel {
  ServiceEntity toEntity() {
    return ServiceEntity(
      id: id,
      name: name,
      description: description,
      basePrice: basePrice,
      effectivePrice: effectivePrice,
      hasDiscount: hasDiscount,
      discountPercent: discountPercent,
      durationMinutes: durationMinutes,
      imageUrl: imageUrl,
      categoryId: categoryId,
      appliedPricingRule: appliedPricingRule?.toEntity(),
    );
  }
}
