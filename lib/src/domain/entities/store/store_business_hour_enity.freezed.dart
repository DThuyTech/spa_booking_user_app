// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_business_hour_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreBusinessHourEntity {

 int get dayOfWeek; String get dayName; bool get isOpen; List<TimeRangesEntity> get timeRanges;
/// Create a copy of StoreBusinessHourEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBusinessHourEntityCopyWith<StoreBusinessHourEntity> get copyWith => _$StoreBusinessHourEntityCopyWithImpl<StoreBusinessHourEntity>(this as StoreBusinessHourEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBusinessHourEntity&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&const DeepCollectionEquality().equals(other.timeRanges, timeRanges));
}


@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,dayName,isOpen,const DeepCollectionEquality().hash(timeRanges));

@override
String toString() {
  return 'StoreBusinessHourEntity(dayOfWeek: $dayOfWeek, dayName: $dayName, isOpen: $isOpen, timeRanges: $timeRanges)';
}


}

/// @nodoc
abstract mixin class $StoreBusinessHourEntityCopyWith<$Res>  {
  factory $StoreBusinessHourEntityCopyWith(StoreBusinessHourEntity value, $Res Function(StoreBusinessHourEntity) _then) = _$StoreBusinessHourEntityCopyWithImpl;
@useResult
$Res call({
 int dayOfWeek, String dayName, bool isOpen, List<TimeRangesEntity> timeRanges
});




}
/// @nodoc
class _$StoreBusinessHourEntityCopyWithImpl<$Res>
    implements $StoreBusinessHourEntityCopyWith<$Res> {
  _$StoreBusinessHourEntityCopyWithImpl(this._self, this._then);

  final StoreBusinessHourEntity _self;
  final $Res Function(StoreBusinessHourEntity) _then;

/// Create a copy of StoreBusinessHourEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayOfWeek = null,Object? dayName = null,Object? isOpen = null,Object? timeRanges = null,}) {
  return _then(_self.copyWith(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,timeRanges: null == timeRanges ? _self.timeRanges : timeRanges // ignore: cast_nullable_to_non_nullable
as List<TimeRangesEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreBusinessHourEntity].
extension StoreBusinessHourEntityPatterns on StoreBusinessHourEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreBusinessHourEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreBusinessHourEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreBusinessHourEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreBusinessHourEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreBusinessHourEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreBusinessHourEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dayOfWeek,  String dayName,  bool isOpen,  List<TimeRangesEntity> timeRanges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreBusinessHourEntity() when $default != null:
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.timeRanges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dayOfWeek,  String dayName,  bool isOpen,  List<TimeRangesEntity> timeRanges)  $default,) {final _that = this;
switch (_that) {
case _StoreBusinessHourEntity():
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.timeRanges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dayOfWeek,  String dayName,  bool isOpen,  List<TimeRangesEntity> timeRanges)?  $default,) {final _that = this;
switch (_that) {
case _StoreBusinessHourEntity() when $default != null:
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.timeRanges);case _:
  return null;

}
}

}

/// @nodoc


class _StoreBusinessHourEntity implements StoreBusinessHourEntity {
  const _StoreBusinessHourEntity({required this.dayOfWeek, required this.dayName, required this.isOpen, required final  List<TimeRangesEntity> timeRanges}): _timeRanges = timeRanges;
  

@override final  int dayOfWeek;
@override final  String dayName;
@override final  bool isOpen;
 final  List<TimeRangesEntity> _timeRanges;
@override List<TimeRangesEntity> get timeRanges {
  if (_timeRanges is EqualUnmodifiableListView) return _timeRanges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeRanges);
}


/// Create a copy of StoreBusinessHourEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreBusinessHourEntityCopyWith<_StoreBusinessHourEntity> get copyWith => __$StoreBusinessHourEntityCopyWithImpl<_StoreBusinessHourEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreBusinessHourEntity&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&const DeepCollectionEquality().equals(other._timeRanges, _timeRanges));
}


@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,dayName,isOpen,const DeepCollectionEquality().hash(_timeRanges));

@override
String toString() {
  return 'StoreBusinessHourEntity(dayOfWeek: $dayOfWeek, dayName: $dayName, isOpen: $isOpen, timeRanges: $timeRanges)';
}


}

/// @nodoc
abstract mixin class _$StoreBusinessHourEntityCopyWith<$Res> implements $StoreBusinessHourEntityCopyWith<$Res> {
  factory _$StoreBusinessHourEntityCopyWith(_StoreBusinessHourEntity value, $Res Function(_StoreBusinessHourEntity) _then) = __$StoreBusinessHourEntityCopyWithImpl;
@override @useResult
$Res call({
 int dayOfWeek, String dayName, bool isOpen, List<TimeRangesEntity> timeRanges
});




}
/// @nodoc
class __$StoreBusinessHourEntityCopyWithImpl<$Res>
    implements _$StoreBusinessHourEntityCopyWith<$Res> {
  __$StoreBusinessHourEntityCopyWithImpl(this._self, this._then);

  final _StoreBusinessHourEntity _self;
  final $Res Function(_StoreBusinessHourEntity) _then;

/// Create a copy of StoreBusinessHourEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayOfWeek = null,Object? dayName = null,Object? isOpen = null,Object? timeRanges = null,}) {
  return _then(_StoreBusinessHourEntity(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,timeRanges: null == timeRanges ? _self._timeRanges : timeRanges // ignore: cast_nullable_to_non_nullable
as List<TimeRangesEntity>,
  ));
}


}

/// @nodoc
mixin _$TimeRangesEntity {

 String get startTime; String get endTime;
/// Create a copy of TimeRangesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeRangesEntityCopyWith<TimeRangesEntity> get copyWith => _$TimeRangesEntityCopyWithImpl<TimeRangesEntity>(this as TimeRangesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeRangesEntity&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}


@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'TimeRangesEntity(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $TimeRangesEntityCopyWith<$Res>  {
  factory $TimeRangesEntityCopyWith(TimeRangesEntity value, $Res Function(TimeRangesEntity) _then) = _$TimeRangesEntityCopyWithImpl;
@useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class _$TimeRangesEntityCopyWithImpl<$Res>
    implements $TimeRangesEntityCopyWith<$Res> {
  _$TimeRangesEntityCopyWithImpl(this._self, this._then);

  final TimeRangesEntity _self;
  final $Res Function(TimeRangesEntity) _then;

/// Create a copy of TimeRangesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeRangesEntity].
extension TimeRangesEntityPatterns on TimeRangesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeRangesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeRangesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeRangesEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimeRangesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeRangesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimeRangesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeRangesEntity() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _TimeRangesEntity():
return $default(_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _TimeRangesEntity() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc


class _TimeRangesEntity implements TimeRangesEntity {
  const _TimeRangesEntity({required this.startTime, required this.endTime});
  

@override final  String startTime;
@override final  String endTime;

/// Create a copy of TimeRangesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeRangesEntityCopyWith<_TimeRangesEntity> get copyWith => __$TimeRangesEntityCopyWithImpl<_TimeRangesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeRangesEntity&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}


@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'TimeRangesEntity(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$TimeRangesEntityCopyWith<$Res> implements $TimeRangesEntityCopyWith<$Res> {
  factory _$TimeRangesEntityCopyWith(_TimeRangesEntity value, $Res Function(_TimeRangesEntity) _then) = __$TimeRangesEntityCopyWithImpl;
@override @useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class __$TimeRangesEntityCopyWithImpl<$Res>
    implements _$TimeRangesEntityCopyWith<$Res> {
  __$TimeRangesEntityCopyWithImpl(this._self, this._then);

  final _TimeRangesEntity _self;
  final $Res Function(_TimeRangesEntity) _then;

/// Create a copy of TimeRangesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_TimeRangesEntity(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
