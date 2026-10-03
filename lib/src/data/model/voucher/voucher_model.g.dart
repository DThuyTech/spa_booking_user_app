// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) =>
    _VoucherModel(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      storeId: json['storeId'] as String?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      discountType: json['discountType'] as String? ?? 'FLAT',
      discountValue: (json['discountValue'] as num?)?.toInt() ?? 0,
      minOrderValue: (json['minOrderValue'] as num?)?.toInt() ?? 0,
      maxDiscountAmount: (json['maxDiscountAmount'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$VoucherModelToJson(_VoucherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'storeId': instance.storeId,
      'title': instance.title,
      'description': instance.description,
      'discountType': instance.discountType,
      'discountValue': instance.discountValue,
      'minOrderValue': instance.minOrderValue,
      'maxDiscountAmount': instance.maxDiscountAmount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isActive': instance.isActive,
    };

_AppliedVoucherModel _$AppliedVoucherModelFromJson(Map<String, dynamic> json) =>
    _AppliedVoucherModel(
      isValid: json['isValid'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      code: json['code'] as String? ?? '',
      originalAmount: (json['originalAmount'] as num?)?.toInt() ?? 0,
      discountAmount: (json['discountAmount'] as num?)?.toInt() ?? 0,
      finalAmount: (json['finalAmount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AppliedVoucherModelToJson(
  _AppliedVoucherModel instance,
) => <String, dynamic>{
  'isValid': instance.isValid,
  'message': instance.message,
  'code': instance.code,
  'originalAmount': instance.originalAmount,
  'discountAmount': instance.discountAmount,
  'finalAmount': instance.finalAmount,
};
