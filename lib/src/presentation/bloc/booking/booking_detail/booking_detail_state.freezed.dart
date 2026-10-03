// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingDetailState {

 BookingDetailStatus get status; BookingEntity? get booking; Failure? get failure;
/// Create a copy of BookingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDetailStateCopyWith<BookingDetailState> get copyWith => _$BookingDetailStateCopyWithImpl<BookingDetailState>(this as BookingDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,booking,failure);

@override
String toString() {
  return 'BookingDetailState(status: $status, booking: $booking, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BookingDetailStateCopyWith<$Res>  {
  factory $BookingDetailStateCopyWith(BookingDetailState value, $Res Function(BookingDetailState) _then) = _$BookingDetailStateCopyWithImpl;
@useResult
$Res call({
 BookingDetailStatus status, BookingEntity? booking, Failure? failure
});


$BookingEntityCopyWith<$Res>? get booking;

}
/// @nodoc
class _$BookingDetailStateCopyWithImpl<$Res>
    implements $BookingDetailStateCopyWith<$Res> {
  _$BookingDetailStateCopyWithImpl(this._self, this._then);

  final BookingDetailState _self;
  final $Res Function(BookingDetailState) _then;

/// Create a copy of BookingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? booking = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingDetailStatus,booking: freezed == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of BookingDetailState
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


/// Adds pattern-matching-related methods to [BookingDetailState].
extension BookingDetailStatePatterns on BookingDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDetailState value)  $default,){
final _that = this;
switch (_that) {
case _BookingDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingDetailStatus status,  BookingEntity? booking,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDetailState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingDetailStatus status,  BookingEntity? booking,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _BookingDetailState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingDetailStatus status,  BookingEntity? booking,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _BookingDetailState() when $default != null:
return $default(_that.status,_that.booking,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDetailState extends BookingDetailState {
  const _BookingDetailState({this.status = BookingDetailStatus.initial, this.booking, this.failure}): super._();
  

@override@JsonKey() final  BookingDetailStatus status;
@override final  BookingEntity? booking;
@override final  Failure? failure;

/// Create a copy of BookingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDetailStateCopyWith<_BookingDetailState> get copyWith => __$BookingDetailStateCopyWithImpl<_BookingDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,booking,failure);

@override
String toString() {
  return 'BookingDetailState(status: $status, booking: $booking, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BookingDetailStateCopyWith<$Res> implements $BookingDetailStateCopyWith<$Res> {
  factory _$BookingDetailStateCopyWith(_BookingDetailState value, $Res Function(_BookingDetailState) _then) = __$BookingDetailStateCopyWithImpl;
@override @useResult
$Res call({
 BookingDetailStatus status, BookingEntity? booking, Failure? failure
});


@override $BookingEntityCopyWith<$Res>? get booking;

}
/// @nodoc
class __$BookingDetailStateCopyWithImpl<$Res>
    implements _$BookingDetailStateCopyWith<$Res> {
  __$BookingDetailStateCopyWithImpl(this._self, this._then);

  final _BookingDetailState _self;
  final $Res Function(_BookingDetailState) _then;

/// Create a copy of BookingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? booking = freezed,Object? failure = freezed,}) {
  return _then(_BookingDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingDetailStatus,booking: freezed == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BookingDetailState
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
