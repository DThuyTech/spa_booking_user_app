import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/store/get_stores_usecase.dart';
import 'store_list_event.dart';
import 'store_list_state.dart';

export 'store_list_event.dart';
export 'store_list_state.dart';

class StoreListBloc extends Bloc<StoreListEvent, StoreListState> {
  final GetStoresUseCase getStoresUseCase;

  StoreListBloc({required this.getStoresUseCase})
    : super(const StoreListState()) {
    on<FetchStoresEvent>(_onFetchStores);
    on<LoadMoreStoresEvent>(_onLoadMore);
  }

  Future<void> _onFetchStores(
    FetchStoresEvent event,
    Emitter<StoreListState> emit,
  ) async {
    if (!event.isRefresh) {
      emit(state.copyWith(status: StoreListStatus.loading, failure: null));
    }

    final result = await getStoresUseCase(
      search: event.search,
      province: event.province,
      district: event.district,
      page: 1,
      limit: 10,
    );

    result.fold(
      (Failure failure) => emit(
        state.copyWith(status: StoreListStatus.failure, failure: failure),
      ),
      (stores) => emit(
        state.copyWith(
          status: StoreListStatus.loaded,
          stores: stores,
          hasMore: stores.length >= 10,
          currentPage: 1,
          search: event.search,
          province: event.province,
          district: event.district,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMoreStoresEvent event,
    Emitter<StoreListState> emit,
  ) async {
    if (!state.hasMore || state.isLoading) return;

    final nextPage = state.currentPage + 1;
    final result = await getStoresUseCase(
      search: state.search,
      province: state.province,
      district: state.district,
      page: nextPage,
      limit: 10,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(failure: failure)),
      (newStores) => emit(
        state.copyWith(
          stores: [...state.stores, ...newStores],
          hasMore: newStores.length >= 10,
          currentPage: nextPage,
        ),
      ),
    );
  }
}
