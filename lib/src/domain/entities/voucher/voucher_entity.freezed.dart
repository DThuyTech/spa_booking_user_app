// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoucherEntity {

 String get id; String get code; String? get storeId; String get title; String? get description; String get discountType; int get discountValue; int get minOrderValue; int? get maxDiscountAmount; DateTime? get startDate; DateTime? get endDate; bool get isActive;
/// Create a copy of VoucherEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherEntityCopyWith<VoucherEntity> get copyWith => _$VoucherEntityCopyWithImpl<VoucherEntity>(this as VoucherEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.minOrderValue, minOrderValue) || other.minOrderValue == minOrderValue)&&(identical(other.maxDiscountAmount, maxDiscountAmount) || other.maxDiscountAmount == maxDiscountAmount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,storeId,title,description,discountType,discountValue,minOrderValue,maxDiscountAmount,startDate,endDate,isActive);

@override
String toString() {
  return 'VoucherEntity(id: $id, code: $code, storeId: $storeId, title: $title, description: $description, discountType: $discountType, discountValue: $discountValue, minOrderValue: $minOrderValue, maxDiscountAmount: $maxDiscountAmount, startDate: $startDate, endDate: $endDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $VoucherEntityCopyWith<$Res>  {
  factory $VoucherEntityCopyWith(VoucherEntity value, $Res Function(VoucherEntity) _then) = _$VoucherEntityCopyWithImpl;
@useResult
$Res call({
 String id, String code, String? storeId, String title, String? description, String discountType, int discountValue, int minOrderValue, int? maxDiscountAmount, DateTime? startDate, DateTime? endDate, bool isActive
});




}
/// @nodoc
class _$VoucherEntityCopyWithImpl<$Res>
    implements $VoucherEntityCopyWith<$Res> {
  _$VoucherEntityCopyWithImpl(this._self, this._then);

  final VoucherEntity _self;
  final $Res Function(VoucherEntity) _then;

/// Create a copy of VoucherEntity
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
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherEntity].
extension VoucherEntityPatterns on VoucherEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherEntity value)  $default,){
final _that = this;
switch (_that) {
case _VoucherEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String? storeId,  String title,  String? description,  String discountType,  int discountValue,  int minOrderValue,  int? maxDiscountAmount,  DateTime? startDate,  DateTime? endDate,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String? storeId,  String title,  String? description,  String discountType,  int discountValue,  int minOrderValue,  int? maxDiscountAmount,  DateTime? startDate,  DateTime? endDate,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _VoucherEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String? storeId,  String title,  String? description,  String discountType,  int discountValue,  int minOrderValue,  int? maxDiscountAmount,  DateTime? startDate,  DateTime? endDate,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _VoucherEntity() when $default != null:
return $default(_that.id,_that.code,_that.storeId,_that.title,_that.description,_that.discountType,_that.discountValue,_that.minOrderValue,_that.maxDiscountAmount,_that.startDate,_that.endDate,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _VoucherEntity implements VoucherEntity {
  const _VoucherEntity({required this.id, required this.code, this.storeId, required this.title, this.description, this.discountType = 'FLAT', required this.discountValue, this.minOrderValue = 0, this.maxDiscountAmount, this.startDate, this.endDate, this.isActive = true});
  

@override final  String id;
@override final  String code;
@override final  String? storeId;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  String discountType;
@override final  int discountValue;
@override@JsonKey() final  int minOrderValue;
@override final  int? maxDiscountAmount;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isActive;

/// Create a copy of VoucherEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherEntityCopyWith<_VoucherEntity> get copyWith => __$VoucherEntityCopyWithImpl<_VoucherEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.minOrderValue, minOrderValue) || other.minOrderValue == minOrderValue)&&(identical(other.maxDiscountAmount, maxDiscountAmount) || other.maxDiscountAmount == maxDiscountAmount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,storeId,title,description,discountType,discountValue,minOrderValue,maxDiscountAmount,startDate,endDate,isActive);

@override
String toString() {
  return 'VoucherEntity(id: $id, code: $code, storeId: $storeId, title: $title, description: $description, discountType: $discountType, discountValue: $discountValue, minOrderValue: $minOrderValue, maxDiscountAmount: $maxDiscountAmount, startDate: $startDate, endDate: $endDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$VoucherEntityCopyWith<$Res> implements $VoucherEntityCopyWith<$Res> {
  factory _$VoucherEntityCopyWith(_VoucherEntity value, $Res Function(_VoucherEntity) _then) = __$VoucherEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String? storeId, String title, String? description, String discountType, int discountValue, int minOrderValue, int? maxDiscountAmount, DateTime? startDate, DateTime? endDate, bool isActive
});




}
/// @nodoc
class __$VoucherEntityCopyWithImpl<$Res>
    implements _$VoucherEntityCopyWith<$Res> {
  __$VoucherEntityCopyWithImpl(this._self, this._then);

  final _VoucherEntity _self;
  final $Res Function(_VoucherEntity) _then;

/// Create a copy of VoucherEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? storeId = freezed,Object? title = null,Object? description = freezed,Object? discountType = null,Object? discountValue = null,Object? minOrderValue = null,Object? maxDiscountAmount = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,}) {
  return _then(_VoucherEntity(
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
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AppliedVoucherEntity {

 bool get isValid; String get message; String get code; int get originalAmount; int get discountAmount; int get finalAmount;
/// Create a copy of AppliedVoucherEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppliedVoucherEntityCopyWith<AppliedVoucherEntity> get copyWith => _$AppliedVoucherEntityCopyWithImpl<AppliedVoucherEntity>(this as AppliedVoucherEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppliedVoucherEntity&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,isValid,message,code,originalAmount,discountAmount,finalAmount);

@override
String toString() {
  return 'AppliedVoucherEntity(isValid: $isValid, message: $message, code: $code, originalAmount: $originalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class $AppliedVoucherEntityCopyWith<$Res>  {
  factory $AppliedVoucherEntityCopyWith(AppliedVoucherEntity value, $Res Function(AppliedVoucherEntity) _then) = _$AppliedVoucherEntityCopyWithImpl;
@useResult
$Res call({
 bool isValid, String message, String code, int originalAmount, int discountAmount, int finalAmount
});




}
/// @nodoc
class _$AppliedVoucherEntityCopyWithImpl<$Res>
    implements $AppliedVoucherEntityCopyWith<$Res> {
  _$AppliedVoucherEntityCopyWithImpl(this._self, this._then);

  final AppliedVoucherEntity _self;
  final $Res Function(AppliedVoucherEntity) _then;

/// Create a copy of AppliedVoucherEntity
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


/// Adds pattern-matching-related methods to [AppliedVoucherEntity].
extension AppliedVoucherEntityPatterns on AppliedVoucherEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppliedVoucherEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppliedVoucherEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppliedVoucherEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppliedVoucherEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppliedVoucherEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppliedVoucherEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isValid,  String message,  String code,  int originalAmount,  int discountAmount,  int finalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppliedVoucherEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isValid,  String message,  String code,  int originalAmount,  int discountAmount,  int finalAmount)  $default,) {final _that = this;
switch (_that) {
case _AppliedVoucherEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isValid,  String message,  String code,  int originalAmount,  int discountAmount,  int finalAmount)?  $default,) {final _that = this;
switch (_that) {
case _AppliedVoucherEntity() when $default != null:
return $default(_that.isValid,_that.message,_that.code,_that.originalAmount,_that.discountAmount,_that.finalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _AppliedVoucherEntity implements AppliedVoucherEntity {
  const _AppliedVoucherEntity({required this.isValid, required this.message, required this.code, required this.originalAmount, required this.discountAmount, required this.finalAmount});
  

@override final  bool isValid;
@override final  String message;
@override final  String code;
@override final  int originalAmount;
@override final  int discountAmount;
@override final  int finalAmount;

/// Create a copy of AppliedVoucherEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppliedVoucherEntityCopyWith<_AppliedVoucherEntity> get copyWith => __$AppliedVoucherEntityCopyWithImpl<_AppliedVoucherEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppliedVoucherEntity&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,isValid,message,code,originalAmount,discountAmount,finalAmount);

@override
String toString() {
  return 'AppliedVoucherEntity(isValid: $isValid, message: $message, code: $code, originalAmount: $originalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class _$AppliedVoucherEntityCopyWith<$Res> implements $AppliedVoucherEntityCopyWith<$Res> {
  factory _$AppliedVoucherEntityCopyWith(_AppliedVoucherEntity value, $Res Function(_AppliedVoucherEntity) _then) = __$AppliedVoucherEntityCopyWithImpl;
@override @useResult
$Res call({
 bool isValid, String message, String code, int originalAmount, int discountAmount, int finalAmount
});




}
/// @nodoc
class __$AppliedVoucherEntityCopyWithImpl<$Res>
    implements _$AppliedVoucherEntityCopyWith<$Res> {
  __$AppliedVoucherEntityCopyWithImpl(this._self, this._then);

  final _AppliedVoucherEntity _self;
  final $Res Function(_AppliedVoucherEntity) _then;

/// Create a copy of AppliedVoucherEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? message = null,Object? code = null,Object? originalAmount = null,Object? discountAmount = null,Object? finalAmount = null,}) {
  return _then(_AppliedVoucherEntity(
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
