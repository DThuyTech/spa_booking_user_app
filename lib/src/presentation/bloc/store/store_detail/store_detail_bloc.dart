import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/store/get_store_detail_usecase.dart';
import 'store_detail_event.dart';
import 'store_detail_state.dart';

export 'store_detail_event.dart';
export 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  final GetStoreDetailUseCase getStoreDetailUseCase;

  StoreDetailBloc({required this.getStoreDetailUseCase})
      : super(const StoreDetailState()) {
    on<FetchStoreDetailEvent>(_onFetchStoreDetail);
  }

  Future<void> _onFetchStoreDetail(
    FetchStoreDetailEvent event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(state.copyWith(status: StoreDetailStatus.loading, failure: null));
    final result = await getStoreDetailUseCase(event.storeId);
    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreDetailStatus.failure,
        failure: failure,
      )),
      (detail) => emit(state.copyWith(
        status: StoreDetailStatus.loaded,
        detail: detail,
        failure: null,
      )),
    );
  }
}
