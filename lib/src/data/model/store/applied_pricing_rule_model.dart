import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/applied_pricing_rule_enity.dart';

part 'applied_pricing_rule_model.g.dart';

@JsonSerializable()
class AppliedPricingRuleModel {
  final String id;
  final String name;
  final double discountPercentage;

  const AppliedPricingRuleModel({
    required this.id,
    required this.name,
    required this.discountPercentage,
  });

  factory AppliedPricingRuleModel.fromJson(Map<String, dynamic> json) =>
      _$AppliedPricingRuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppliedPricingRuleModelToJson(this);

  AppliedPricingRuleEntity toEntity() {
    return AppliedPricingRuleEntity(
      id: id,
      name: name,
      discountPercentage: discountPercentage,
    );
  }
}
