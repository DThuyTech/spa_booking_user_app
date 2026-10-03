import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/usecases/favorite/get_favorites_usecase.dart';
import 'favorite_stores_event.dart';
import 'favorite_stores_state.dart';

export 'favorite_stores_event.dart';
export 'favorite_stores_state.dart';

class FavoriteStoresBloc
    extends Bloc<FavoriteStoresEvent, FavoriteStoresState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoriteStoresBloc({
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(const FavoriteStoresState()) {
    on<FetchFavoriteStoresEvent>(_onFetchFavorites);
    on<ToggleFavoriteStoreEvent>(_onToggleFavorite);
  }

  Future<void> _onFetchFavorites(
    FetchFavoriteStoresEvent event,
    Emitter<FavoriteStoresState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteStoresStatus.loading, failure: null));

    final result = await getFavoritesUseCase(page: 1, limit: 50);

    result.fold(
      (Failure failure) => emit(
        state.copyWith(status: FavoriteStoresStatus.failure, failure: failure),
      ),
      (stores) => emit(
        state.copyWith(
          status: FavoriteStoresStatus.loaded,
          items: stores,
          total: stores.length,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteStoreEvent event,
    Emitter<FavoriteStoresState> emit,
  ) async {
    final originalItems = state.items;
    final updatedItems = event.isFavorite
        ? state.items.where((e) => e.id != event.storeId).toList()
        : state.items;

    emit(state.copyWith(items: updatedItems));

    final result = await toggleFavoriteUseCase(
      storeId: event.storeId,
      isFavorite: !event.isFavorite,
    );

    result.fold(
      (Failure failure) =>
          emit(state.copyWith(items: originalItems, failure: failure)),
      (bool isFavorite) {
        // success
      },
    );
  }
}
