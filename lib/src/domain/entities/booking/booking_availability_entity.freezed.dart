// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_availability_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingSlotEntity {

 String get time; bool get available; int? get availableStaffCount; String? get reason;
/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSlotEntityCopyWith<BookingSlotEntity> get copyWith => _$BookingSlotEntityCopyWithImpl<BookingSlotEntity>(this as BookingSlotEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSlotEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotEntity(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BookingSlotEntityCopyWith<$Res>  {
  factory $BookingSlotEntityCopyWith(BookingSlotEntity value, $Res Function(BookingSlotEntity) _then) = _$BookingSlotEntityCopyWithImpl;
@useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class _$BookingSlotEntityCopyWithImpl<$Res>
    implements $BookingSlotEntityCopyWith<$Res> {
  _$BookingSlotEntityCopyWithImpl(this._self, this._then);

  final BookingSlotEntity _self;
  final $Res Function(BookingSlotEntity) _then;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingSlotEntity].
extension BookingSlotEntityPatterns on BookingSlotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSlotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSlotEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingSlotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSlotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  bool available,  int? availableStaffCount,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  bool available,  int? availableStaffCount,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _BookingSlotEntity():
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  bool available,  int? availableStaffCount,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _BookingSlotEntity implements BookingSlotEntity {
  const _BookingSlotEntity({required this.time, required this.available, this.availableStaffCount, this.reason});
  

@override final  String time;
@override final  bool available;
@override final  int? availableStaffCount;
@override final  String? reason;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSlotEntityCopyWith<_BookingSlotEntity> get copyWith => __$BookingSlotEntityCopyWithImpl<_BookingSlotEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSlotEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotEntity(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BookingSlotEntityCopyWith<$Res> implements $BookingSlotEntityCopyWith<$Res> {
  factory _$BookingSlotEntityCopyWith(_BookingSlotEntity value, $Res Function(_BookingSlotEntity) _then) = __$BookingSlotEntityCopyWithImpl;
@override @useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class __$BookingSlotEntityCopyWithImpl<$Res>
    implements _$BookingSlotEntityCopyWith<$Res> {
  __$BookingSlotEntityCopyWithImpl(this._self, this._then);

  final _BookingSlotEntity _self;
  final $Res Function(_BookingSlotEntity) _then;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_BookingSlotEntity(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityEntity {

 String get storeId; String get date; int get totalDurationMinutes; List<BookingSlotEntity> get slots;
/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityEntityCopyWith<BookingAvailabilityEntity> get copyWith => _$BookingAvailabilityEntityCopyWithImpl<BookingAvailabilityEntity>(this as BookingAvailabilityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&const DeepCollectionEquality().equals(other.slots, slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'BookingAvailabilityEntity(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityEntityCopyWith<$Res>  {
  factory $BookingAvailabilityEntityCopyWith(BookingAvailabilityEntity value, $Res Function(BookingAvailabilityEntity) _then) = _$BookingAvailabilityEntityCopyWithImpl;
@useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, List<BookingSlotEntity> slots
});




}
/// @nodoc
class _$BookingAvailabilityEntityCopyWithImpl<$Res>
    implements $BookingAvailabilityEntityCopyWith<$Res> {
  _$BookingAvailabilityEntityCopyWithImpl(this._self, this._then);

  final BookingAvailabilityEntity _self;
  final $Res Function(BookingAvailabilityEntity) _then;

/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? slots = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityEntity].
extension BookingAvailabilityEntityPatterns on BookingAvailabilityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotEntity> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotEntity> slots)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity():
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotEntity> slots)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityEntity implements BookingAvailabilityEntity {
  const _BookingAvailabilityEntity({required this.storeId, required this.date, this.totalDurationMinutes = 0, final  List<BookingSlotEntity> slots = const []}): _slots = slots;
  

@override final  String storeId;
@override final  String date;
@override@JsonKey() final  int totalDurationMinutes;
 final  List<BookingSlotEntity> _slots;
@override@JsonKey() List<BookingSlotEntity> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityEntityCopyWith<_BookingAvailabilityEntity> get copyWith => __$BookingAvailabilityEntityCopyWithImpl<_BookingAvailabilityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'BookingAvailabilityEntity(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityEntityCopyWith<$Res> implements $BookingAvailabilityEntityCopyWith<$Res> {
  factory _$BookingAvailabilityEntityCopyWith(_BookingAvailabilityEntity value, $Res Function(_BookingAvailabilityEntity) _then) = __$BookingAvailabilityEntityCopyWithImpl;
@override @useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, List<BookingSlotEntity> slots
});




}
/// @nodoc
class __$BookingAvailabilityEntityCopyWithImpl<$Res>
    implements _$BookingAvailabilityEntityCopyWith<$Res> {
  __$BookingAvailabilityEntityCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityEntity _self;
  final $Res Function(_BookingAvailabilityEntity) _then;

/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? slots = null,}) {
  return _then(_BookingAvailabilityEntity(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotEntity>,
  ));
}


}

// dart format on
