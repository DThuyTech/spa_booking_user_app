import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/domain/entities/review/review_entity.dart';
import 'package:spa_booking/src/domain/entities/store/service_category_entity.dart';
import 'package:spa_booking/src/domain/entities/store/service_entity.dart';
import 'package:spa_booking/src/domain/entities/store/staff_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_business_hour_enity.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import '../../../../core/error/failure.dart';

part 'store_detail_state.freezed.dart';

enum StoreDetailStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreDetailState with _$StoreDetailState {
  const StoreDetailState._();

  const factory StoreDetailState({
    @Default(StoreDetailStatus.initial) StoreDetailStatus status,
    StoreFullDetailEntity? detail,
    @Default([]) List<StoreBusinessHourEntity> businessHours,
    @Default([]) List<ServiceCategoryEntity> categories,
    @Default([]) List<ServiceEntity> services,
    @Default([]) List<StaffEntity> staff,
    @Default([]) List<ReviewEntity> reviews,
    Failure? failure,
  }) = _StoreDetailState;

  bool get isInitial => status == StoreDetailStatus.initial;
  bool get isLoading => status == StoreDetailStatus.loading;
  bool get isLoaded => status == StoreDetailStatus.loaded;
  bool get isFailure => status == StoreDetailStatus.failure;
}
