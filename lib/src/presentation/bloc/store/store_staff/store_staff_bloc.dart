import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/store/get_store_staff_usecase.dart';
import 'store_staff_event.dart';
import 'store_staff_state.dart';

export 'store_staff_event.dart';
export 'store_staff_state.dart';

class StoreStaffBloc extends Bloc<StoreStaffEvent, StoreStaffState> {
  final GetStoreStaffUseCase getStoreStaffUseCase;

  StoreStaffBloc({required this.getStoreStaffUseCase})
      : super(const StoreStaffState()) {
    on<FetchStaffEvent>(_onFetchStaff);
  }

  Future<void> _onFetchStaff(
    FetchStaffEvent event,
    Emitter<StoreStaffState> emit,
  ) async {
    emit(state.copyWith(status: StoreStaffStatus.loading, failure: null));
    final result = await getStoreStaffUseCase(
      event.storeId,
      serviceId: event.serviceId,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreStaffStatus.failure,
        failure: failure,
      )),
      (staffList) => emit(state.copyWith(
        status: StoreStaffStatus.loaded,
        staffList: staffList,
        failure: null,
      )),
    );
  }
}
