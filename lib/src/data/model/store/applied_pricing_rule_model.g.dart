// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_pricing_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedPricingRuleModel _$AppliedPricingRuleModelFromJson(
  Map<String, dynamic> json,
) => AppliedPricingRuleModel(
  id: json['id'] as String,
  name: json['name'] as String,
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$AppliedPricingRuleModelToJson(
  AppliedPricingRuleModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'discountPercentage': instance.discountPercentage,
};
