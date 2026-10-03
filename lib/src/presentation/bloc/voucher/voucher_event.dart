import 'package:equatable/equatable.dart';

sealed class VoucherEvent extends Equatable {
  const VoucherEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreVouchersEvent extends VoucherEvent {
  final String storeId;

  const FetchStoreVouchersEvent(this.storeId);

  @override
  List<Object?> get props => [storeId];
}

class FetchCustomerVouchersEvent extends VoucherEvent {
  final String? storeId;

  const FetchCustomerVouchersEvent({this.storeId});

  @override
  List<Object?> get props => [storeId];
}

class ApplyVoucherCodeEvent extends VoucherEvent {
  final String code;
  final String storeId;
  final int orderAmount;

  const ApplyVoucherCodeEvent({
    required this.code,
    required this.storeId,
    required this.orderAmount,
  });

  @override
  List<Object?> get props => [code, storeId, orderAmount];
}

class RemoveAppliedVoucherEvent extends VoucherEvent {
  const RemoveAppliedVoucherEvent();
}
