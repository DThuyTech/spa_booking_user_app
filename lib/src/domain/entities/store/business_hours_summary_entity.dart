import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';

part 'business_hours_summary_entity.freezed.dart';

@freezed
abstract class BusinessHoursSummaryEntity with _$BusinessHoursSummaryEntity {
  const factory BusinessHoursSummaryEntity({
    required String storeId,
    @Default([]) List<StoreBusinessHourEntity> days,
  }) = _BusinessHoursSummaryEntity;
}
