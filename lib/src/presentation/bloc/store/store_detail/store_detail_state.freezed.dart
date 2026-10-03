// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreDetailState {

 StoreDetailStatus get status; StoreDetailEntity? get detail; Failure? get failure;
/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailStateCopyWith<StoreDetailState> get copyWith => _$StoreDetailStateCopyWithImpl<StoreDetailState>(this as StoreDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,detail,failure);

@override
String toString() {
  return 'StoreDetailState(status: $status, detail: $detail, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreDetailStateCopyWith<$Res>  {
  factory $StoreDetailStateCopyWith(StoreDetailState value, $Res Function(StoreDetailState) _then) = _$StoreDetailStateCopyWithImpl;
@useResult
$Res call({
 StoreDetailStatus status, StoreDetailEntity? detail, Failure? failure
});


$StoreDetailEntityCopyWith<$Res>? get detail;

}
/// @nodoc
class _$StoreDetailStateCopyWithImpl<$Res>
    implements $StoreDetailStateCopyWith<$Res> {
  _$StoreDetailStateCopyWithImpl(this._self, this._then);

  final StoreDetailState _self;
  final $Res Function(StoreDetailState) _then;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? detail = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreDetailStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StoreDetailEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreDetailEntityCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $StoreDetailEntityCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreDetailState].
extension StoreDetailStatePatterns on StoreDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDetailState value)  $default,){
final _that = this;
switch (_that) {
case _StoreDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreDetailStatus status,  StoreDetailEntity? detail,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
return $default(_that.status,_that.detail,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreDetailStatus status,  StoreDetailEntity? detail,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreDetailState():
return $default(_that.status,_that.detail,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreDetailStatus status,  StoreDetailEntity? detail,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
return $default(_that.status,_that.detail,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreDetailState extends StoreDetailState {
  const _StoreDetailState({this.status = StoreDetailStatus.initial, this.detail, this.failure}): super._();
  

@override@JsonKey() final  StoreDetailStatus status;
@override final  StoreDetailEntity? detail;
@override final  Failure? failure;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDetailStateCopyWith<_StoreDetailState> get copyWith => __$StoreDetailStateCopyWithImpl<_StoreDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,detail,failure);

@override
String toString() {
  return 'StoreDetailState(status: $status, detail: $detail, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreDetailStateCopyWith<$Res> implements $StoreDetailStateCopyWith<$Res> {
  factory _$StoreDetailStateCopyWith(_StoreDetailState value, $Res Function(_StoreDetailState) _then) = __$StoreDetailStateCopyWithImpl;
@override @useResult
$Res call({
 StoreDetailStatus status, StoreDetailEntity? detail, Failure? failure
});


@override $StoreDetailEntityCopyWith<$Res>? get detail;

}
/// @nodoc
class __$StoreDetailStateCopyWithImpl<$Res>
    implements _$StoreDetailStateCopyWith<$Res> {
  __$StoreDetailStateCopyWithImpl(this._self, this._then);

  final _StoreDetailState _self;
  final $Res Function(_StoreDetailState) _then;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? detail = freezed,Object? failure = freezed,}) {
  return _then(_StoreDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreDetailStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StoreDetailEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreDetailEntityCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $StoreDetailEntityCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on
