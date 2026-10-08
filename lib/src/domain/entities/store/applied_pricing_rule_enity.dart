import 'package:freezed_annotation/freezed_annotation.dart';

part 'applied_pricing_rule_enity.freezed.dart';

@freezed
abstract class AppliedPricingRuleEntity with _$AppliedPricingRuleEntity {
  const factory AppliedPricingRuleEntity({
    required String id,
    required String name,
    required double discountPercentage,
  }) = _AppliedPricingRuleEntity;
}
