import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/store_entity.dart';

part 'store_list_state.freezed.dart';

enum StoreListStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreListState with _$StoreListState {
  const StoreListState._();

  const factory StoreListState({
    @Default(StoreListStatus.initial) StoreListStatus status,
    @Default([]) List<StoreEntity> stores,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
    String? search,
    String? province,
    String? district,
    Failure? failure,
  }) = _StoreListState;

  bool get isInitial => status == StoreListStatus.initial;
  bool get isLoading => status == StoreListStatus.loading;
  bool get isLoaded => status == StoreListStatus.loaded;
  bool get isFailure => status == StoreListStatus.failure;
}
