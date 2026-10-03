// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoucherState {

 VoucherStatus get status; List<VoucherEntity> get vouchers; ApplyVoucherStatus get applyStatus; AppliedVoucherEntity? get appliedVoucher; Failure? get failure; String? get applyErrorMessage;
/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherStateCopyWith<VoucherState> get copyWith => _$VoucherStateCopyWithImpl<VoucherState>(this as VoucherState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.vouchers, vouchers)&&(identical(other.applyStatus, applyStatus) || other.applyStatus == applyStatus)&&(identical(other.appliedVoucher, appliedVoucher) || other.appliedVoucher == appliedVoucher)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.applyErrorMessage, applyErrorMessage) || other.applyErrorMessage == applyErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(vouchers),applyStatus,appliedVoucher,failure,applyErrorMessage);

@override
String toString() {
  return 'VoucherState(status: $status, vouchers: $vouchers, applyStatus: $applyStatus, appliedVoucher: $appliedVoucher, failure: $failure, applyErrorMessage: $applyErrorMessage)';
}


}

/// @nodoc
abstract mixin class $VoucherStateCopyWith<$Res>  {
  factory $VoucherStateCopyWith(VoucherState value, $Res Function(VoucherState) _then) = _$VoucherStateCopyWithImpl;
@useResult
$Res call({
 VoucherStatus status, List<VoucherEntity> vouchers, ApplyVoucherStatus applyStatus, AppliedVoucherEntity? appliedVoucher, Failure? failure, String? applyErrorMessage
});


$AppliedVoucherEntityCopyWith<$Res>? get appliedVoucher;

}
/// @nodoc
class _$VoucherStateCopyWithImpl<$Res>
    implements $VoucherStateCopyWith<$Res> {
  _$VoucherStateCopyWithImpl(this._self, this._then);

  final VoucherState _self;
  final $Res Function(VoucherState) _then;

/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? vouchers = null,Object? applyStatus = null,Object? appliedVoucher = freezed,Object? failure = freezed,Object? applyErrorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VoucherStatus,vouchers: null == vouchers ? _self.vouchers : vouchers // ignore: cast_nullable_to_non_nullable
as List<VoucherEntity>,applyStatus: null == applyStatus ? _self.applyStatus : applyStatus // ignore: cast_nullable_to_non_nullable
as ApplyVoucherStatus,appliedVoucher: freezed == appliedVoucher ? _self.appliedVoucher : appliedVoucher // ignore: cast_nullable_to_non_nullable
as AppliedVoucherEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,applyErrorMessage: freezed == applyErrorMessage ? _self.applyErrorMessage : applyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedVoucherEntityCopyWith<$Res>? get appliedVoucher {
    if (_self.appliedVoucher == null) {
    return null;
  }

  return $AppliedVoucherEntityCopyWith<$Res>(_self.appliedVoucher!, (value) {
    return _then(_self.copyWith(appliedVoucher: value));
  });
}
}


/// Adds pattern-matching-related methods to [VoucherState].
extension VoucherStatePatterns on VoucherState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherState value)  $default,){
final _that = this;
switch (_that) {
case _VoucherState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherState value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VoucherStatus status,  List<VoucherEntity> vouchers,  ApplyVoucherStatus applyStatus,  AppliedVoucherEntity? appliedVoucher,  Failure? failure,  String? applyErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherState() when $default != null:
return $default(_that.status,_that.vouchers,_that.applyStatus,_that.appliedVoucher,_that.failure,_that.applyErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VoucherStatus status,  List<VoucherEntity> vouchers,  ApplyVoucherStatus applyStatus,  AppliedVoucherEntity? appliedVoucher,  Failure? failure,  String? applyErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _VoucherState():
return $default(_that.status,_that.vouchers,_that.applyStatus,_that.appliedVoucher,_that.failure,_that.applyErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VoucherStatus status,  List<VoucherEntity> vouchers,  ApplyVoucherStatus applyStatus,  AppliedVoucherEntity? appliedVoucher,  Failure? failure,  String? applyErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VoucherState() when $default != null:
return $default(_that.status,_that.vouchers,_that.applyStatus,_that.appliedVoucher,_that.failure,_that.applyErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VoucherState extends VoucherState {
  const _VoucherState({this.status = VoucherStatus.initial, final  List<VoucherEntity> vouchers = const [], this.applyStatus = ApplyVoucherStatus.initial, this.appliedVoucher, this.failure, this.applyErrorMessage}): _vouchers = vouchers,super._();
  

@override@JsonKey() final  VoucherStatus status;
 final  List<VoucherEntity> _vouchers;
@override@JsonKey() List<VoucherEntity> get vouchers {
  if (_vouchers is EqualUnmodifiableListView) return _vouchers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vouchers);
}

@override@JsonKey() final  ApplyVoucherStatus applyStatus;
@override final  AppliedVoucherEntity? appliedVoucher;
@override final  Failure? failure;
@override final  String? applyErrorMessage;

/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherStateCopyWith<_VoucherState> get copyWith => __$VoucherStateCopyWithImpl<_VoucherState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._vouchers, _vouchers)&&(identical(other.applyStatus, applyStatus) || other.applyStatus == applyStatus)&&(identical(other.appliedVoucher, appliedVoucher) || other.appliedVoucher == appliedVoucher)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.applyErrorMessage, applyErrorMessage) || other.applyErrorMessage == applyErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_vouchers),applyStatus,appliedVoucher,failure,applyErrorMessage);

@override
String toString() {
  return 'VoucherState(status: $status, vouchers: $vouchers, applyStatus: $applyStatus, appliedVoucher: $appliedVoucher, failure: $failure, applyErrorMessage: $applyErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$VoucherStateCopyWith<$Res> implements $VoucherStateCopyWith<$Res> {
  factory _$VoucherStateCopyWith(_VoucherState value, $Res Function(_VoucherState) _then) = __$VoucherStateCopyWithImpl;
@override @useResult
$Res call({
 VoucherStatus status, List<VoucherEntity> vouchers, ApplyVoucherStatus applyStatus, AppliedVoucherEntity? appliedVoucher, Failure? failure, String? applyErrorMessage
});


@override $AppliedVoucherEntityCopyWith<$Res>? get appliedVoucher;

}
/// @nodoc
class __$VoucherStateCopyWithImpl<$Res>
    implements _$VoucherStateCopyWith<$Res> {
  __$VoucherStateCopyWithImpl(this._self, this._then);

  final _VoucherState _self;
  final $Res Function(_VoucherState) _then;

/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? vouchers = null,Object? applyStatus = null,Object? appliedVoucher = freezed,Object? failure = freezed,Object? applyErrorMessage = freezed,}) {
  return _then(_VoucherState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VoucherStatus,vouchers: null == vouchers ? _self._vouchers : vouchers // ignore: cast_nullable_to_non_nullable
as List<VoucherEntity>,applyStatus: null == applyStatus ? _self.applyStatus : applyStatus // ignore: cast_nullable_to_non_nullable
as ApplyVoucherStatus,appliedVoucher: freezed == appliedVoucher ? _self.appliedVoucher : appliedVoucher // ignore: cast_nullable_to_non_nullable
as AppliedVoucherEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,applyErrorMessage: freezed == applyErrorMessage ? _self.applyErrorMessage : applyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VoucherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedVoucherEntityCopyWith<$Res>? get appliedVoucher {
    if (_self.appliedVoucher == null) {
    return null;
  }

  return $AppliedVoucherEntityCopyWith<$Res>(_self.appliedVoucher!, (value) {
    return _then(_self.copyWith(appliedVoucher: value));
  });
}
}

// dart format on
