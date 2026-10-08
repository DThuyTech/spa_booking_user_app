import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/applied_pricing_rule_enity.dart';

part 'service_entity.freezed.dart';

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    required String id,
    required String name,
    String? description,
    required double basePrice,
    int? effectivePrice,
    @Default(false) bool hasDiscount,
    @Default(0) double discountPercent,
    required int durationMinutes,
    String? imageUrl,
    String? categoryId,

    AppliedPricingRuleEntity? appliedPricingRule,
  }) = _ServiceEntity;
}
