// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_availability_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingSlotModel {

 String get time; bool get available; int? get availableStaffCount; String? get reason;
/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSlotModelCopyWith<BookingSlotModel> get copyWith => _$BookingSlotModelCopyWithImpl<BookingSlotModel>(this as BookingSlotModel, _$identity);

  /// Serializes this BookingSlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSlotModel&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotModel(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BookingSlotModelCopyWith<$Res>  {
  factory $BookingSlotModelCopyWith(BookingSlotModel value, $Res Function(BookingSlotModel) _then) = _$BookingSlotModelCopyWithImpl;
@useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class _$BookingSlotModelCopyWithImpl<$Res>
    implements $BookingSlotModelCopyWith<$Res> {
  _$BookingSlotModelCopyWithImpl(this._self, this._then);

  final BookingSlotModel _self;
  final $Res Function(BookingSlotModel) _then;

/// Create a copy of BookingSlotModel
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


/// Adds pattern-matching-related methods to [BookingSlotModel].
extension BookingSlotModelPatterns on BookingSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSlotModel() when $default != null:
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
case _BookingSlotModel() when $default != null:
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
case _BookingSlotModel():
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
case _BookingSlotModel() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingSlotModel implements BookingSlotModel {
  const _BookingSlotModel({required this.time, required this.available, this.availableStaffCount, this.reason});
  factory _BookingSlotModel.fromJson(Map<String, dynamic> json) => _$BookingSlotModelFromJson(json);

@override final  String time;
@override final  bool available;
@override final  int? availableStaffCount;
@override final  String? reason;

/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSlotModelCopyWith<_BookingSlotModel> get copyWith => __$BookingSlotModelCopyWithImpl<_BookingSlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingSlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSlotModel&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotModel(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BookingSlotModelCopyWith<$Res> implements $BookingSlotModelCopyWith<$Res> {
  factory _$BookingSlotModelCopyWith(_BookingSlotModel value, $Res Function(_BookingSlotModel) _then) = __$BookingSlotModelCopyWithImpl;
@override @useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class __$BookingSlotModelCopyWithImpl<$Res>
    implements _$BookingSlotModelCopyWith<$Res> {
  __$BookingSlotModelCopyWithImpl(this._self, this._then);

  final _BookingSlotModel _self;
  final $Res Function(_BookingSlotModel) _then;

/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_BookingSlotModel(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookingAvailabilityModel {

 String get storeId; String get date; int get totalDurationMinutes; List<BookingSlotModel> get slots;
/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityModelCopyWith<BookingAvailabilityModel> get copyWith => _$BookingAvailabilityModelCopyWithImpl<BookingAvailabilityModel>(this as BookingAvailabilityModel, _$identity);

  /// Serializes this BookingAvailabilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'BookingAvailabilityModel(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityModelCopyWith<$Res>  {
  factory $BookingAvailabilityModelCopyWith(BookingAvailabilityModel value, $Res Function(BookingAvailabilityModel) _then) = _$BookingAvailabilityModelCopyWithImpl;
@useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, List<BookingSlotModel> slots
});




}
/// @nodoc
class _$BookingAvailabilityModelCopyWithImpl<$Res>
    implements $BookingAvailabilityModelCopyWith<$Res> {
  _$BookingAvailabilityModelCopyWithImpl(this._self, this._then);

  final BookingAvailabilityModel _self;
  final $Res Function(BookingAvailabilityModel) _then;

/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? slots = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityModel].
extension BookingAvailabilityModelPatterns on BookingAvailabilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotModel> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotModel> slots)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  String date,  int totalDurationMinutes,  List<BookingSlotModel> slots)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingAvailabilityModel implements BookingAvailabilityModel {
  const _BookingAvailabilityModel({required this.storeId, required this.date, this.totalDurationMinutes = 0, final  List<BookingSlotModel> slots = const []}): _slots = slots;
  factory _BookingAvailabilityModel.fromJson(Map<String, dynamic> json) => _$BookingAvailabilityModelFromJson(json);

@override final  String storeId;
@override final  String date;
@override@JsonKey() final  int totalDurationMinutes;
 final  List<BookingSlotModel> _slots;
@override@JsonKey() List<BookingSlotModel> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityModelCopyWith<_BookingAvailabilityModel> get copyWith => __$BookingAvailabilityModelCopyWithImpl<_BookingAvailabilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingAvailabilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'BookingAvailabilityModel(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityModelCopyWith<$Res> implements $BookingAvailabilityModelCopyWith<$Res> {
  factory _$BookingAvailabilityModelCopyWith(_BookingAvailabilityModel value, $Res Function(_BookingAvailabilityModel) _then) = __$BookingAvailabilityModelCopyWithImpl;
@override @useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, List<BookingSlotModel> slots
});




}
/// @nodoc
class __$BookingAvailabilityModelCopyWithImpl<$Res>
    implements _$BookingAvailabilityModelCopyWith<$Res> {
  __$BookingAvailabilityModelCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityModel _self;
  final $Res Function(_BookingAvailabilityModel) _then;

/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? slots = null,}) {
  return _then(_BookingAvailabilityModel(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,
  ));
}


}

// dart format on
