import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/usecases/voucher/voucher_usecases.dart';
import 'voucher_event.dart';
import 'voucher_state.dart';

export 'voucher_event.dart';
export 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final GetStoreVouchersUseCase getStoreVouchersUseCase;
  final GetCustomerVouchersUseCase getCustomerVouchersUseCase;
  final ApplyVoucherUseCase applyVoucherUseCase;

  VoucherBloc({
    required this.getStoreVouchersUseCase,
    required this.getCustomerVouchersUseCase,
    required this.applyVoucherUseCase,
  }) : super(const VoucherState()) {
    on<FetchStoreVouchersEvent>(_onFetchStoreVouchers);
    on<FetchCustomerVouchersEvent>(_onFetchCustomerVouchers);
    on<ApplyVoucherCodeEvent>(_onApplyVoucher);
    on<RemoveAppliedVoucherEvent>(_onRemoveAppliedVoucher);
  }

  Future<void> _onFetchStoreVouchers(
    FetchStoreVouchersEvent event,
    Emitter<VoucherState> emit,
  ) async {
    emit(state.copyWith(status: VoucherStatus.loading, failure: null));
    final result = await getStoreVouchersUseCase(event.storeId);
    result.fold(
      (Failure failure) =>
          emit(state.copyWith(status: VoucherStatus.failure, failure: failure)),
      (vouchers) => emit(
        state.copyWith(
          status: VoucherStatus.loaded,
          vouchers: vouchers,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onFetchCustomerVouchers(
    FetchCustomerVouchersEvent event,
    Emitter<VoucherState> emit,
  ) async {
    emit(state.copyWith(status: VoucherStatus.loading, failure: null));
    final result = await getCustomerVouchersUseCase(storeId: event.storeId);
    result.fold(
      (Failure failure) =>
          emit(state.copyWith(status: VoucherStatus.failure, failure: failure)),
      (vouchers) => emit(
        state.copyWith(
          status: VoucherStatus.loaded,
          vouchers: vouchers,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onApplyVoucher(
    ApplyVoucherCodeEvent event,
    Emitter<VoucherState> emit,
  ) async {
    emit(
      state.copyWith(
        applyStatus: ApplyVoucherStatus.loading,
        applyErrorMessage: null,
      ),
    );

    final result = await applyVoucherUseCase(
      code: event.code,
      storeId: event.storeId,
      orderAmount: event.orderAmount,
    );

    result.fold(
      (Failure failure) => emit(
        state.copyWith(
          applyStatus: ApplyVoucherStatus.failure,
          applyErrorMessage: failure.message,
        ),
      ),
      (applied) => emit(
        state.copyWith(
          applyStatus: ApplyVoucherStatus.success,
          appliedVoucher: applied,
          applyErrorMessage: null,
        ),
      ),
    );
  }

  void _onRemoveAppliedVoucher(
    RemoveAppliedVoucherEvent event,
    Emitter<VoucherState> emit,
  ) {
    emit(
      state.copyWith(
        applyStatus: ApplyVoucherStatus.initial,
        appliedVoucher: null,
        applyErrorMessage: null,
      ),
    );
  }
}
