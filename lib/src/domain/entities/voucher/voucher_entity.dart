import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_entity.freezed.dart';

@freezed
abstract class VoucherEntity with _$VoucherEntity {
  const factory VoucherEntity({
    required String id,
    required String code,
    String? storeId,
    required String title,
    String? description,
    @Default('FLAT') String discountType,
    required int discountValue,
    @Default(0) int minOrderValue,
    int? maxDiscountAmount,
    DateTime? startDate,
    DateTime? endDate,
    @Default(true) bool isActive,
  }) = _VoucherEntity;
}

@freezed
abstract class AppliedVoucherEntity with _$AppliedVoucherEntity {
  const factory AppliedVoucherEntity({
    required bool isValid,
    required String message,
    required String code,
    required int originalAmount,
    required int discountAmount,
    required int finalAmount,
  }) = _AppliedVoucherEntity;
}
