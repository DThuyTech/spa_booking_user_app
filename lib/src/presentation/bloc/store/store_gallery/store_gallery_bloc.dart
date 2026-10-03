import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/store/get_store_gallery_usecase.dart';
import 'store_gallery_event.dart';
import 'store_gallery_state.dart';

export 'store_gallery_event.dart';
export 'store_gallery_state.dart';

class StoreGalleryBloc extends Bloc<StoreGalleryEvent, StoreGalleryState> {
  final GetStoreGalleryUseCase getStoreGalleryUseCase;
  String? _currentStoreId;

  StoreGalleryBloc({required this.getStoreGalleryUseCase})
      : super(const StoreGalleryState()) {
    on<FetchStoreGalleryEvent>(_onFetchGallery);
    on<FilterGalleryCategoryEvent>(_onFilterCategory);
  }

  Future<void> _onFetchGallery(
    FetchStoreGalleryEvent event,
    Emitter<StoreGalleryState> emit,
  ) async {
    _currentStoreId = event.storeId;
    emit(state.copyWith(
      status: StoreGalleryStatus.loading,
      activeCategory: event.category,
      failure: null,
    ));

    final result = await getStoreGalleryUseCase(
      event.storeId,
      category: event.category,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreGalleryStatus.failure,
        failure: failure,
      )),
      (gallery) => emit(state.copyWith(
        status: StoreGalleryStatus.loaded,
        gallery: gallery,
        failure: null,
      )),
    );
  }

  Future<void> _onFilterCategory(
    FilterGalleryCategoryEvent event,
    Emitter<StoreGalleryState> emit,
  ) async {
    if (_currentStoreId == null) return;

    emit(state.copyWith(
      status: StoreGalleryStatus.loading,
      activeCategory: event.category,
      failure: null,
    ));

    final result = await getStoreGalleryUseCase(
      _currentStoreId!,
      category: event.category,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreGalleryStatus.failure,
        failure: failure,
      )),
      (gallery) => emit(state.copyWith(
        status: StoreGalleryStatus.loaded,
        gallery: gallery,
        failure: null,
      )),
    );
  }
}
