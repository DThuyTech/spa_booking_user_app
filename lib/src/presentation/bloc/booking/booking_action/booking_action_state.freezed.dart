// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingActionState {

 BookingActionStatus get status; BookingEntity? get booking; Failure? get failure;
/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingActionStateCopyWith<BookingActionState> get copyWith => _$BookingActionStateCopyWithImpl<BookingActionState>(this as BookingActionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingActionState&&(identical(other.status, status) || other.status == status)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,booking,failure);

@override
String toString() {
  return 'BookingActionState(status: $status, booking: $booking, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BookingActionStateCopyWith<$Res>  {
  factory $BookingActionStateCopyWith(BookingActionState value, $Res Function(BookingActionState) _then) = _$BookingActionStateCopyWithImpl;
@useResult
$Res call({
 BookingActionStatus status, BookingEntity? booking, Failure? failure
});


$BookingEntityCopyWith<$Res>? get booking;

}
/// @nodoc
class _$BookingActionStateCopyWithImpl<$Res>
    implements $BookingActionStateCopyWith<$Res> {
  _$BookingActionStateCopyWithImpl(this._self, this._then);

  final BookingActionState _self;
  final $Res Function(BookingActionState) _then;

/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? booking = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingActionStatus,booking: freezed == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingEntityCopyWith<$Res>? get booking {
    if (_self.booking == null) {
    return null;
  }

  return $BookingEntityCopyWith<$Res>(_self.booking!, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingActionState].
extension BookingActionStatePatterns on BookingActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingActionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingActionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingActionState value)  $default,){
final _that = this;
switch (_that) {
case _BookingActionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingActionState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingActionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingActionStatus status,  BookingEntity? booking,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingActionState() when $default != null:
return $default(_that.status,_that.booking,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingActionStatus status,  BookingEntity? booking,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _BookingActionState():
return $default(_that.status,_that.booking,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingActionStatus status,  BookingEntity? booking,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _BookingActionState() when $default != null:
return $default(_that.status,_that.booking,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BookingActionState extends BookingActionState {
  const _BookingActionState({this.status = BookingActionStatus.initial, this.booking, this.failure}): super._();
  

@override@JsonKey() final  BookingActionStatus status;
@override final  BookingEntity? booking;
@override final  Failure? failure;

/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingActionStateCopyWith<_BookingActionState> get copyWith => __$BookingActionStateCopyWithImpl<_BookingActionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingActionState&&(identical(other.status, status) || other.status == status)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,booking,failure);

@override
String toString() {
  return 'BookingActionState(status: $status, booking: $booking, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BookingActionStateCopyWith<$Res> implements $BookingActionStateCopyWith<$Res> {
  factory _$BookingActionStateCopyWith(_BookingActionState value, $Res Function(_BookingActionState) _then) = __$BookingActionStateCopyWithImpl;
@override @useResult
$Res call({
 BookingActionStatus status, BookingEntity? booking, Failure? failure
});


@override $BookingEntityCopyWith<$Res>? get booking;

}
/// @nodoc
class __$BookingActionStateCopyWithImpl<$Res>
    implements _$BookingActionStateCopyWith<$Res> {
  __$BookingActionStateCopyWithImpl(this._self, this._then);

  final _BookingActionState _self;
  final $Res Function(_BookingActionState) _then;

/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? booking = freezed,Object? failure = freezed,}) {
  return _then(_BookingActionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingActionStatus,booking: freezed == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BookingActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingEntityCopyWith<$Res>? get booking {
    if (_self.booking == null) {
    return null;
  }

  return $BookingEntityCopyWith<$Res>(_self.booking!, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}

// dart format on
