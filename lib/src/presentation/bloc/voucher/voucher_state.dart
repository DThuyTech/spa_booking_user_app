import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/voucher/voucher_entity.dart';

part 'voucher_state.freezed.dart';

enum VoucherStatus { initial, loading, loaded, failure }

enum ApplyVoucherStatus { initial, loading, success, failure }

@freezed
abstract class VoucherState with _$VoucherState {
  const VoucherState._();

  const factory VoucherState({
    @Default(VoucherStatus.initial) VoucherStatus status,
    @Default([]) List<VoucherEntity> vouchers,
    @Default(ApplyVoucherStatus.initial) ApplyVoucherStatus applyStatus,
    AppliedVoucherEntity? appliedVoucher,
    Failure? failure,
    String? applyErrorMessage,
  }) = _VoucherState;

  bool get isInitial => status == VoucherStatus.initial;
  bool get isLoading => status == VoucherStatus.loading;
  bool get isLoaded => status == VoucherStatus.loaded;
  bool get isFailure => status == VoucherStatus.failure;

  bool get isApplyLoading => applyStatus == ApplyVoucherStatus.loading;
  bool get isApplySuccess => applyStatus == ApplyVoucherStatus.success;
  bool get isApplyFailure => applyStatus == ApplyVoucherStatus.failure;
}
