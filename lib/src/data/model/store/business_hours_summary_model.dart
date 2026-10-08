import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/business_hours_summary_entity.dart';
import 'store_business_hour_model.dart';

part 'business_hours_summary_model.g.dart';

@JsonSerializable()
class BusinessHoursSummaryModel {
  final String storeId;
  final List<StoreBusinessHourModel> days;

  const BusinessHoursSummaryModel({
    required this.storeId,
    this.days = const [],
  });

  factory BusinessHoursSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessHoursSummaryModelFromJson(json);

  BusinessHoursSummaryEntity toEntity() {
    return BusinessHoursSummaryEntity(
      storeId: storeId,
      days: days.map((e) => e.toEntity()).toList(),
    );
  }
}
