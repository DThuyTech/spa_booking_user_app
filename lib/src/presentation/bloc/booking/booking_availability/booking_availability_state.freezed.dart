// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_availability_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingAvailabilityState {

 BookingAvailabilityStatus get status; BookingAvailabilityEntity? get availability; String? get selectedTime; BookingAvailabilityOptionEntity? get selectedOption; DateTime? get selectedStartAt; Failure? get failure;
/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityStateCopyWith<BookingAvailabilityState> get copyWith => _$BookingAvailabilityStateCopyWithImpl<BookingAvailabilityState>(this as BookingAvailabilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption)&&(identical(other.selectedStartAt, selectedStartAt) || other.selectedStartAt == selectedStartAt)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,availability,selectedTime,selectedOption,selectedStartAt,failure);

@override
String toString() {
  return 'BookingAvailabilityState(status: $status, availability: $availability, selectedTime: $selectedTime, selectedOption: $selectedOption, selectedStartAt: $selectedStartAt, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityStateCopyWith<$Res>  {
  factory $BookingAvailabilityStateCopyWith(BookingAvailabilityState value, $Res Function(BookingAvailabilityState) _then) = _$BookingAvailabilityStateCopyWithImpl;
@useResult
$Res call({
 BookingAvailabilityStatus status, BookingAvailabilityEntity? availability, String? selectedTime, BookingAvailabilityOptionEntity? selectedOption, DateTime? selectedStartAt, Failure? failure
});


$BookingAvailabilityEntityCopyWith<$Res>? get availability;$BookingAvailabilityOptionEntityCopyWith<$Res>? get selectedOption;

}
/// @nodoc
class _$BookingAvailabilityStateCopyWithImpl<$Res>
    implements $BookingAvailabilityStateCopyWith<$Res> {
  _$BookingAvailabilityStateCopyWithImpl(this._self, this._then);

  final BookingAvailabilityState _self;
  final $Res Function(BookingAvailabilityState) _then;

/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? availability = freezed,Object? selectedTime = freezed,Object? selectedOption = freezed,Object? selectedStartAt = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityStatus,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityEntity?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as String?,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityOptionEntity?,selectedStartAt: freezed == selectedStartAt ? _self.selectedStartAt : selectedStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAvailabilityEntityCopyWith<$Res>? get availability {
    if (_self.availability == null) {
    return null;
  }

  return $BookingAvailabilityEntityCopyWith<$Res>(_self.availability!, (value) {
    return _then(_self.copyWith(availability: value));
  });
}/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionEntityCopyWith<$Res>? get selectedOption {
    if (_self.selectedOption == null) {
    return null;
  }

  return $BookingAvailabilityOptionEntityCopyWith<$Res>(_self.selectedOption!, (value) {
    return _then(_self.copyWith(selectedOption: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingAvailabilityState].
extension BookingAvailabilityStatePatterns on BookingAvailabilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityState value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingAvailabilityStatus status,  BookingAvailabilityEntity? availability,  String? selectedTime,  BookingAvailabilityOptionEntity? selectedOption,  DateTime? selectedStartAt,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityState() when $default != null:
return $default(_that.status,_that.availability,_that.selectedTime,_that.selectedOption,_that.selectedStartAt,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingAvailabilityStatus status,  BookingAvailabilityEntity? availability,  String? selectedTime,  BookingAvailabilityOptionEntity? selectedOption,  DateTime? selectedStartAt,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityState():
return $default(_that.status,_that.availability,_that.selectedTime,_that.selectedOption,_that.selectedStartAt,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingAvailabilityStatus status,  BookingAvailabilityEntity? availability,  String? selectedTime,  BookingAvailabilityOptionEntity? selectedOption,  DateTime? selectedStartAt,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityState() when $default != null:
return $default(_that.status,_that.availability,_that.selectedTime,_that.selectedOption,_that.selectedStartAt,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityState extends BookingAvailabilityState {
  const _BookingAvailabilityState({this.status = BookingAvailabilityStatus.initial, this.availability, this.selectedTime, this.selectedOption, this.selectedStartAt, this.failure}): super._();
  

@override@JsonKey() final  BookingAvailabilityStatus status;
@override final  BookingAvailabilityEntity? availability;
@override final  String? selectedTime;
@override final  BookingAvailabilityOptionEntity? selectedOption;
@override final  DateTime? selectedStartAt;
@override final  Failure? failure;

/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityStateCopyWith<_BookingAvailabilityState> get copyWith => __$BookingAvailabilityStateCopyWithImpl<_BookingAvailabilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption)&&(identical(other.selectedStartAt, selectedStartAt) || other.selectedStartAt == selectedStartAt)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,availability,selectedTime,selectedOption,selectedStartAt,failure);

@override
String toString() {
  return 'BookingAvailabilityState(status: $status, availability: $availability, selectedTime: $selectedTime, selectedOption: $selectedOption, selectedStartAt: $selectedStartAt, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityStateCopyWith<$Res> implements $BookingAvailabilityStateCopyWith<$Res> {
  factory _$BookingAvailabilityStateCopyWith(_BookingAvailabilityState value, $Res Function(_BookingAvailabilityState) _then) = __$BookingAvailabilityStateCopyWithImpl;
@override @useResult
$Res call({
 BookingAvailabilityStatus status, BookingAvailabilityEntity? availability, String? selectedTime, BookingAvailabilityOptionEntity? selectedOption, DateTime? selectedStartAt, Failure? failure
});


@override $BookingAvailabilityEntityCopyWith<$Res>? get availability;@override $BookingAvailabilityOptionEntityCopyWith<$Res>? get selectedOption;

}
/// @nodoc
class __$BookingAvailabilityStateCopyWithImpl<$Res>
    implements _$BookingAvailabilityStateCopyWith<$Res> {
  __$BookingAvailabilityStateCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityState _self;
  final $Res Function(_BookingAvailabilityState) _then;

/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? availability = freezed,Object? selectedTime = freezed,Object? selectedOption = freezed,Object? selectedStartAt = freezed,Object? failure = freezed,}) {
  return _then(_BookingAvailabilityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityStatus,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityEntity?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as String?,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as BookingAvailabilityOptionEntity?,selectedStartAt: freezed == selectedStartAt ? _self.selectedStartAt : selectedStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAvailabilityEntityCopyWith<$Res>? get availability {
    if (_self.availability == null) {
    return null;
  }

  return $BookingAvailabilityEntityCopyWith<$Res>(_self.availability!, (value) {
    return _then(_self.copyWith(availability: value));
  });
}/// Create a copy of BookingAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionEntityCopyWith<$Res>? get selectedOption {
    if (_self.selectedOption == null) {
    return null;
  }

  return $BookingAvailabilityOptionEntityCopyWith<$Res>(_self.selectedOption!, (value) {
    return _then(_self.copyWith(selectedOption: value));
  });
}
}

// dart format on
