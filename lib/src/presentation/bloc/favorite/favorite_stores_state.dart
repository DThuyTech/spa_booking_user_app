import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/favorite/favorite_store_entity.dart';

part 'favorite_stores_state.freezed.dart';

enum FavoriteStoresStatus { initial, loading, loaded, failure }

@freezed
abstract class FavoriteStoresState with _$FavoriteStoresState {
  const FavoriteStoresState._();

  const factory FavoriteStoresState({
    @Default(FavoriteStoresStatus.initial) FavoriteStoresStatus status,
    @Default([]) List<FavoriteStoreEntity> items,
    @Default(1) int page,
    @Default(1) int totalPages,
    @Default(0) int total,
    Failure? failure,
  }) = _FavoriteStoresState;

  bool get isInitial => status == FavoriteStoresStatus.initial;
  bool get isLoading => status == FavoriteStoresStatus.loading;
  bool get isLoaded => status == FavoriteStoresStatus.loaded;
  bool get isFailure => status == FavoriteStoresStatus.failure;
}
