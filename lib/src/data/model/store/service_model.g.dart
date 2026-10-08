// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  basePrice: (json['basePrice'] as num).toDouble(),
  effectivePrice: (json['effectivePrice'] as num?)?.toInt(),
  hasDiscount: json['hasDiscount'] as bool? ?? false,
  discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  imageUrl: json['imageUrl'] as String?,
  categoryId: json['categoryId'] as String?,
  appliedPricingRule: json['appliedPricingRule'] == null
      ? null
      : AppliedPricingRuleModel.fromJson(
          json['appliedPricingRule'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'effectivePrice': instance.effectivePrice,
      'hasDiscount': instance.hasDiscount,
      'discountPercent': instance.discountPercent,
      'durationMinutes': instance.durationMinutes,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
      'appliedPricingRule': instance.appliedPricingRule,
    };
