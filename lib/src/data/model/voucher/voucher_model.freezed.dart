// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherModel {

 String get id;@JsonKey(name: 'code', defaultValue: '') String get code;@JsonKey(name: 'storeId') String? get storeId;@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'discountType', defaultValue: 'FLAT') String get discountType;@JsonKey(name: 'discountValue', defaultValue: 0) int get discountValue;@JsonKey(name: 'minOrderValue', defaultValue: 0) int get minOrderValue;@JsonKey(name: 'maxDiscountAmount') int? get maxDiscountAmount;@JsonKey(name: 'startDate') String? get startDate;@JsonKey(name: 'endDate') String? get endDate;@JsonKey(name: 'isActive', defaultValue: true) bool get isActive;
/// Create a copy of VoucherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherModelCopyWith<VoucherModel> get copyWith => _$VoucherModelCopyWithImpl<VoucherModel>(this as VoucherModel, _$identity);

  /// Serializes this VoucherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.minOrderValue, minOrderValue) || other.minOrderValue == minOrderValue)&&(identical(other.maxDiscountAmount, maxDiscountAmount) || other.maxDiscountAmount == maxDiscountAmount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,storeId,title,description,discountType,discountValue,minOrderValue,maxDiscountAmount,startDate,endDate,isActive);

@override
String toString() {
  return 'VoucherModel(id: $id, code: $code, storeId: $storeId, title: $title, description: $description, discountType: $discountType, discountValue: $discountValue, minOrderValue: $minOrderValue, maxDiscountAmount: $maxDiscountAmount, startDate: $startDate, endDate: $endDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $VoucherModelCopyWith<$Res>  {
  factory $VoucherModelCopyWith(VoucherModel value, $Res Function(VoucherModel) _then) = _$VoucherModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'code', defaultValue: '') String code,@JsonKey(name: 'storeId') String? storeId,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'description') String? description,@JsonKey(name: 'discountType', defaultValue: 'FLAT') String discountType,@JsonKey(name: 'discountValue', defaultValue: 0) int discountValue,@JsonKey(name: 'minOrderValue', defaultValue: 0) int minOrderValue,@JsonKey(name: 'maxDiscountAmount') int? maxDiscountAmount,@JsonKey(name: 'startDate') String? startDate,@JsonKey(name: 'endDate') String? endDate,@JsonKey(name: 'isActive', defaultValue: true) bool isActive
});




}
/// @nodoc
class _$VoucherModelCopyWithImpl<$Res>
    implements $VoucherModelCopyWith<$Res> {
  _$VoucherModelCopyWithImpl(this._self, this._then);

  final VoucherModel _self;
  final $Res Function(VoucherModel) _then;

/// Create a copy of VoucherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? storeId = freezed,Object? title = null,Object? description = freezed,Object? discountType = null,Object? discountValue = null,Object? minOrderValue = null,Object? maxDiscountAmount = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,discountValue: null == discountValue ? _self.discountValue : discountValue // ignore: cast_nullable_to_non_nullable
as int,minOrderValue: null == minOrderValue ? _self.minOrderValue : minOrderValue // ignore: cast_nullable_to_non_nullable
as int,maxDiscountAmount: freezed == maxDiscountAmount ? _self.maxDiscountAmount : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherModel].
extension VoucherModelPatterns on VoucherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherModel value)  $default,){
final _that = this;
switch (_that) {
case _VoucherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherModel value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'storeId')  String? storeId, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'discountType', defaultValue: 'FLAT')  String discountType, @JsonKey(name: 'discountValue', defaultValue: 0)  int discountValue, @JsonKey(name: 'minOrderValue', defaultValue: 0)  int minOrderValue, @JsonKey(name: 'maxDiscountAmount')  int? maxDiscountAmount, @JsonKey(name: 'startDate')  String? startDate, @JsonKey(name: 'endDate')  String? endDate, @JsonKey(name: 'isActive', defaultValue: true)  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherModel() when $default != null:
return $default(_that.id,_that.code,_that.storeId,_that.title,_that.description,_that.discountType,_that.discountValue,_that.minOrderValue,_that.maxDiscountAmount,_that.startDate,_that.endDate,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'storeId')  String? storeId, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'discountType', defaultValue: 'FLAT')  String discountType, @JsonKey(name: 'discountValue', defaultValue: 0)  int discountValue, @JsonKey(name: 'minOrderValue', defaultValue: 0)  int minOrderValue, @JsonKey(name: 'maxDiscountAmount')  int? maxDiscountAmount, @JsonKey(name: 'startDate')  String? startDate, @JsonKey(name: 'endDate')  String? endDate, @JsonKey(name: 'isActive', defaultValue: true)  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _VoucherModel():
return $default(_that.id,_that.code,_that.storeId,_that.title,_that.description,_that.discountType,_that.discountValue,_that.minOrderValue,_that.maxDiscountAmount,_that.startDate,_that.endDate,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'storeId')  String? storeId, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'discountType', defaultValue: 'FLAT')  String discountType, @JsonKey(name: 'discountValue', defaultValue: 0)  int discountValue, @JsonKey(name: 'minOrderValue', defaultValue: 0)  int minOrderValue, @JsonKey(name: 'maxDiscountAmount')  int? maxDiscountAmount, @JsonKey(name: 'startDate')  String? startDate, @JsonKey(name: 'endDate')  String? endDate, @JsonKey(name: 'isActive', defaultValue: true)  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _VoucherModel() when $default != null:
return $default(_that.id,_that.code,_that.storeId,_that.title,_that.description,_that.discountType,_that.discountValue,_that.minOrderValue,_that.maxDiscountAmount,_that.startDate,_that.endDate,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherModel extends VoucherModel {
  const _VoucherModel({required this.id, @JsonKey(name: 'code', defaultValue: '') required this.code, @JsonKey(name: 'storeId') this.storeId, @JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'description') this.description, @JsonKey(name: 'discountType', defaultValue: 'FLAT') required this.discountType, @JsonKey(name: 'discountValue', defaultValue: 0) required this.discountValue, @JsonKey(name: 'minOrderValue', defaultValue: 0) required this.minOrderValue, @JsonKey(name: 'maxDiscountAmount') this.maxDiscountAmount, @JsonKey(name: 'startDate') this.startDate, @JsonKey(name: 'endDate') this.endDate, @JsonKey(name: 'isActive', defaultValue: true) required this.isActive}): super._();
  factory _VoucherModel.fromJson(Map<String, dynamic> json) => _$VoucherModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'code', defaultValue: '') final  String code;
@override@JsonKey(name: 'storeId') final  String? storeId;
@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'discountType', defaultValue: 'FLAT') final  String discountType;
@override@JsonKey(name: 'discountValue', defaultValue: 0) final  int discountValue;
@override@JsonKey(name: 'minOrderValue', defaultValue: 0) final  int minOrderValue;
@override@JsonKey(name: 'maxDiscountAmount') final  int? maxDiscountAmount;
@override@JsonKey(name: 'startDate') final  String? startDate;
@override@JsonKey(name: 'endDate') final  String? endDate;
@override@JsonKey(name: 'isActive', defaultValue: true) final  bool isActive;

/// Create a copy of VoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherModelCopyWith<_VoucherModel> get copyWith => __$VoucherModelCopyWithImpl<_VoucherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.minOrderValue, minOrderValue) || other.minOrderValue == minOrderValue)&&(identical(other.maxDiscountAmount, maxDiscountAmount) || other.maxDiscountAmount == maxDiscountAmount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,storeId,title,description,discountType,discountValue,minOrderValue,maxDiscountAmount,startDate,endDate,isActive);

@override
String toString() {
  return 'VoucherModel(id: $id, code: $code, storeId: $storeId, title: $title, description: $description, discountType: $discountType, discountValue: $discountValue, minOrderValue: $minOrderValue, maxDiscountAmount: $maxDiscountAmount, startDate: $startDate, endDate: $endDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$VoucherModelCopyWith<$Res> implements $VoucherModelCopyWith<$Res> {
  factory _$VoucherModelCopyWith(_VoucherModel value, $Res Function(_VoucherModel) _then) = __$VoucherModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'code', defaultValue: '') String code,@JsonKey(name: 'storeId') String? storeId,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'description') String? description,@JsonKey(name: 'discountType', defaultValue: 'FLAT') String discountType,@JsonKey(name: 'discountValue', defaultValue: 0) int discountValue,@JsonKey(name: 'minOrderValue', defaultValue: 0) int minOrderValue,@JsonKey(name: 'maxDiscountAmount') int? maxDiscountAmount,@JsonKey(name: 'startDate') String? startDate,@JsonKey(name: 'endDate') String? endDate,@JsonKey(name: 'isActive', defaultValue: true) bool isActive
});




}
/// @nodoc
class __$VoucherModelCopyWithImpl<$Res>
    implements _$VoucherModelCopyWith<$Res> {
  __$VoucherModelCopyWithImpl(this._self, this._then);

  final _VoucherModel _self;
  final $Res Function(_VoucherModel) _then;

/// Create a copy of VoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? storeId = freezed,Object? title = null,Object? description = freezed,Object? discountType = null,Object? discountValue = null,Object? minOrderValue = null,Object? maxDiscountAmount = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,}) {
  return _then(_VoucherModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,discountValue: null == discountValue ? _self.discountValue : discountValue // ignore: cast_nullable_to_non_nullable
as int,minOrderValue: null == minOrderValue ? _self.minOrderValue : minOrderValue // ignore: cast_nullable_to_non_nullable
as int,maxDiscountAmount: freezed == maxDiscountAmount ? _self.maxDiscountAmount : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AppliedVoucherModel {

@JsonKey(name: 'isValid', defaultValue: true) bool get isValid;@JsonKey(name: 'message', defaultValue: '') String get message;@JsonKey(name: 'code', defaultValue: '') String get code;@JsonKey(name: 'originalAmount', defaultValue: 0) int get originalAmount;@JsonKey(name: 'discountAmount', defaultValue: 0) int get discountAmount;@JsonKey(name: 'finalAmount', defaultValue: 0) int get finalAmount;
/// Create a copy of AppliedVoucherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppliedVoucherModelCopyWith<AppliedVoucherModel> get copyWith => _$AppliedVoucherModelCopyWithImpl<AppliedVoucherModel>(this as AppliedVoucherModel, _$identity);

  /// Serializes this AppliedVoucherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppliedVoucherModel&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,message,code,originalAmount,discountAmount,finalAmount);

@override
String toString() {
  return 'AppliedVoucherModel(isValid: $isValid, message: $message, code: $code, originalAmount: $originalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class $AppliedVoucherModelCopyWith<$Res>  {
  factory $AppliedVoucherModelCopyWith(AppliedVoucherModel value, $Res Function(AppliedVoucherModel) _then) = _$AppliedVoucherModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isValid', defaultValue: true) bool isValid,@JsonKey(name: 'message', defaultValue: '') String message,@JsonKey(name: 'code', defaultValue: '') String code,@JsonKey(name: 'originalAmount', defaultValue: 0) int originalAmount,@JsonKey(name: 'discountAmount', defaultValue: 0) int discountAmount,@JsonKey(name: 'finalAmount', defaultValue: 0) int finalAmount
});




}
/// @nodoc
class _$AppliedVoucherModelCopyWithImpl<$Res>
    implements $AppliedVoucherModelCopyWith<$Res> {
  _$AppliedVoucherModelCopyWithImpl(this._self, this._then);

  final AppliedVoucherModel _self;
  final $Res Function(AppliedVoucherModel) _then;

/// Create a copy of AppliedVoucherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? message = null,Object? code = null,Object? originalAmount = null,Object? discountAmount = null,Object? finalAmount = null,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,originalAmount: null == originalAmount ? _self.originalAmount : originalAmount // ignore: cast_nullable_to_non_nullable
as int,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppliedVoucherModel].
extension AppliedVoucherModelPatterns on AppliedVoucherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppliedVoucherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppliedVoucherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppliedVoucherModel value)  $default,){
final _that = this;
switch (_that) {
case _AppliedVoucherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppliedVoucherModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppliedVoucherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'isValid', defaultValue: true)  bool isValid, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'originalAmount', defaultValue: 0)  int originalAmount, @JsonKey(name: 'discountAmount', defaultValue: 0)  int discountAmount, @JsonKey(name: 'finalAmount', defaultValue: 0)  int finalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppliedVoucherModel() when $default != null:
return $default(_that.isValid,_that.message,_that.code,_that.originalAmount,_that.discountAmount,_that.finalAmount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'isValid', defaultValue: true)  bool isValid, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'originalAmount', defaultValue: 0)  int originalAmount, @JsonKey(name: 'discountAmount', defaultValue: 0)  int discountAmount, @JsonKey(name: 'finalAmount', defaultValue: 0)  int finalAmount)  $default,) {final _that = this;
switch (_that) {
case _AppliedVoucherModel():
return $default(_that.isValid,_that.message,_that.code,_that.originalAmount,_that.discountAmount,_that.finalAmount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'isValid', defaultValue: true)  bool isValid, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'code', defaultValue: '')  String code, @JsonKey(name: 'originalAmount', defaultValue: 0)  int originalAmount, @JsonKey(name: 'discountAmount', defaultValue: 0)  int discountAmount, @JsonKey(name: 'finalAmount', defaultValue: 0)  int finalAmount)?  $default,) {final _that = this;
switch (_that) {
case _AppliedVoucherModel() when $default != null:
return $default(_that.isValid,_that.message,_that.code,_that.originalAmount,_that.discountAmount,_that.finalAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppliedVoucherModel extends AppliedVoucherModel {
  const _AppliedVoucherModel({@JsonKey(name: 'isValid', defaultValue: true) required this.isValid, @JsonKey(name: 'message', defaultValue: '') required this.message, @JsonKey(name: 'code', defaultValue: '') required this.code, @JsonKey(name: 'originalAmount', defaultValue: 0) required this.originalAmount, @JsonKey(name: 'discountAmount', defaultValue: 0) required this.discountAmount, @JsonKey(name: 'finalAmount', defaultValue: 0) required this.finalAmount}): super._();
  factory _AppliedVoucherModel.fromJson(Map<String, dynamic> json) => _$AppliedVoucherModelFromJson(json);

@override@JsonKey(name: 'isValid', defaultValue: true) final  bool isValid;
@override@JsonKey(name: 'message', defaultValue: '') final  String message;
@override@JsonKey(name: 'code', defaultValue: '') final  String code;
@override@JsonKey(name: 'originalAmount', defaultValue: 0) final  int originalAmount;
@override@JsonKey(name: 'discountAmount', defaultValue: 0) final  int discountAmount;
@override@JsonKey(name: 'finalAmount', defaultValue: 0) final  int finalAmount;

/// Create a copy of AppliedVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppliedVoucherModelCopyWith<_AppliedVoucherModel> get copyWith => __$AppliedVoucherModelCopyWithImpl<_AppliedVoucherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppliedVoucherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppliedVoucherModel&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,message,code,originalAmount,discountAmount,finalAmount);

@override
String toString() {
  return 'AppliedVoucherModel(isValid: $isValid, message: $message, code: $code, originalAmount: $originalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class _$AppliedVoucherModelCopyWith<$Res> implements $AppliedVoucherModelCopyWith<$Res> {
  factory _$AppliedVoucherModelCopyWith(_AppliedVoucherModel value, $Res Function(_AppliedVoucherModel) _then) = __$AppliedVoucherModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isValid', defaultValue: true) bool isValid,@JsonKey(name: 'message', defaultValue: '') String message,@JsonKey(name: 'code', defaultValue: '') String code,@JsonKey(name: 'originalAmount', defaultValue: 0) int originalAmount,@JsonKey(name: 'discountAmount', defaultValue: 0) int discountAmount,@JsonKey(name: 'finalAmount', defaultValue: 0) int finalAmount
});




}
/// @nodoc
class __$AppliedVoucherModelCopyWithImpl<$Res>
    implements _$AppliedVoucherModelCopyWith<$Res> {
  __$AppliedVoucherModelCopyWithImpl(this._self, this._then);

  final _AppliedVoucherModel _self;
  final $Res Function(_AppliedVoucherModel) _then;

/// Create a copy of AppliedVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? message = null,Object? code = null,Object? originalAmount = null,Object? discountAmount = null,Object? finalAmount = null,}) {
  return _then(_AppliedVoucherModel(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,originalAmount: null == originalAmount ? _self.originalAmount : originalAmount // ignore: cast_nullable_to_non_nullable
as int,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
