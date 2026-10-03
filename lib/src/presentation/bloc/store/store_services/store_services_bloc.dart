import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/store/get_store_categories_usecase.dart';
import '../../../../domain/usecases/store/get_store_services_usecase.dart';
import 'store_services_event.dart';
import 'store_services_state.dart';

export 'store_services_event.dart';
export 'store_services_state.dart';

class StoreServicesBloc extends Bloc<StoreServicesEvent, StoreServicesState> {
  final GetStoreCategoriesUseCase getCategoriesUseCase;
  final GetStoreServicesUseCase getServicesUseCase;

  StoreServicesBloc({
    required this.getCategoriesUseCase,
    required this.getServicesUseCase,
  }) : super(const StoreServicesState()) {
    on<LoadCategoriesAndServicesEvent>(_onLoadCategoriesAndServices);
    on<SelectCategoryEvent>(_onSelectCategory);
    on<SearchServicesEvent>(_onSearchServices);
  }

  Future<void> _onLoadCategoriesAndServices(
    LoadCategoriesAndServicesEvent event,
    Emitter<StoreServicesState> emit,
  ) async {
    emit(state.copyWith(status: StoreServicesStatus.loading, failure: null));

    final categoriesResult = await getCategoriesUseCase(event.storeId);
    final servicesResult = await getServicesUseCase(
      event.storeId,
      categoryId: event.categoryId,
      search: event.search,
    );

    categoriesResult.fold(
      (Failure failure) => emit(
        state.copyWith(status: StoreServicesStatus.failure, failure: failure),
      ),
      (categories) {
        servicesResult.fold(
          (Failure failure) => emit(
            state.copyWith(
              status: StoreServicesStatus.failure,
              failure: failure,
            ),
          ),
          (services) => emit(
            state.copyWith(
              status: StoreServicesStatus.loaded,
              categories: categories,
              services: services,
              storeId: event.storeId,
              selectedCategoryId: event.categoryId,
              searchQuery: event.search ?? '',
              failure: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<StoreServicesState> emit,
  ) async {
    if (state.storeId == null) return;

    final servicesResult = await getServicesUseCase(
      state.storeId!,
      categoryId: event.categoryId,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
    );

    servicesResult.fold(
      (Failure failure) => emit(
        state.copyWith(status: StoreServicesStatus.failure, failure: failure),
      ),
      (services) => emit(
        state.copyWith(
          services: services,
          selectedCategoryId: event.categoryId,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onSearchServices(
    SearchServicesEvent event,
    Emitter<StoreServicesState> emit,
  ) async {
    if (state.storeId == null) return;

    final servicesResult = await getServicesUseCase(
      state.storeId!,
      categoryId: state.selectedCategoryId,
      search: event.search.trim().isNotEmpty ? event.search.trim() : null,
    );

    servicesResult.fold(
      (Failure failure) => emit(
        state.copyWith(status: StoreServicesStatus.failure, failure: failure),
      ),
      (services) => emit(
        state.copyWith(
          services: services,
          searchQuery: event.search,
          failure: null,
        ),
      ),
    );
  }
}
