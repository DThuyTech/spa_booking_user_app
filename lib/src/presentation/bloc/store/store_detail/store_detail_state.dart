import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/store_detail_entity.dart';

part 'store_detail_state.freezed.dart';

enum StoreDetailStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreDetailState with _$StoreDetailState {
  const StoreDetailState._();

  const factory StoreDetailState({
    @Default(StoreDetailStatus.initial) StoreDetailStatus status,
    StoreDetailEntity? detail,
    Failure? failure,
  }) = _StoreDetailState;

  bool get isInitial => status == StoreDetailStatus.initial;
  bool get isLoading => status == StoreDetailStatus.loading;
  bool get isLoaded => status == StoreDetailStatus.loaded;
  bool get isFailure => status == StoreDetailStatus.failure;
}
