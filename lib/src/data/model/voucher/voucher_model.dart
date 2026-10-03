import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/voucher/voucher_entity.dart';

part 'voucher_model.freezed.dart';
part 'voucher_model.g.dart';

@freezed
abstract class VoucherModel with _$VoucherModel {
  const VoucherModel._();

  const factory VoucherModel({
    required String id,
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'storeId') String? storeId,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'discountType', defaultValue: 'FLAT') required String discountType,
    @JsonKey(name: 'discountValue', defaultValue: 0) required int discountValue,
    @JsonKey(name: 'minOrderValue', defaultValue: 0) required int minOrderValue,
    @JsonKey(name: 'maxDiscountAmount') int? maxDiscountAmount,
    @JsonKey(name: 'startDate') String? startDate,
    @JsonKey(name: 'endDate') String? endDate,
    @JsonKey(name: 'isActive', defaultValue: true) required bool isActive,
  }) = _VoucherModel;

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);

  VoucherEntity toEntity() {
    return VoucherEntity(
      id: id,
      code: code,
      storeId: storeId,
      title: title,
      description: description,
      discountType: discountType,
      discountValue: discountValue,
      minOrderValue: minOrderValue,
      maxDiscountAmount: maxDiscountAmount,
      startDate: startDate != null ? DateTime.tryParse(startDate!) : null,
      endDate: endDate != null ? DateTime.tryParse(endDate!) : null,
      isActive: isActive,
    );
  }
}

@freezed
abstract class AppliedVoucherModel with _$AppliedVoucherModel {
  const AppliedVoucherModel._();

  const factory AppliedVoucherModel({
    @JsonKey(name: 'isValid', defaultValue: true) required bool isValid,
    @JsonKey(name: 'message', defaultValue: '') required String message,
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'originalAmount', defaultValue: 0) required int originalAmount,
    @JsonKey(name: 'discountAmount', defaultValue: 0) required int discountAmount,
    @JsonKey(name: 'finalAmount', defaultValue: 0) required int finalAmount,
  }) = _AppliedVoucherModel;

  factory AppliedVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$AppliedVoucherModelFromJson(json);

  AppliedVoucherEntity toEntity() {
    return AppliedVoucherEntity(
      isValid: isValid,
      message: message,
      code: code,
      originalAmount: originalAmount,
      discountAmount: discountAmount,
      finalAmount: finalAmount,
    );
  }
}
