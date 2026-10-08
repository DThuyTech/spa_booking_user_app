// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_booking_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreBookingSettingsEntity {

 int get minBookingNoticeMinutes; int get maxBookingAdvanceDays; int get minCancellationNoticeMinutes; int get minRescheduleNoticeMinutes; bool get autoConfirm;
/// Create a copy of StoreBookingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBookingSettingsEntityCopyWith<StoreBookingSettingsEntity> get copyWith => _$StoreBookingSettingsEntityCopyWithImpl<StoreBookingSettingsEntity>(this as StoreBookingSettingsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingSettingsEntity&&(identical(other.minBookingNoticeMinutes, minBookingNoticeMinutes) || other.minBookingNoticeMinutes == minBookingNoticeMinutes)&&(identical(other.maxBookingAdvanceDays, maxBookingAdvanceDays) || other.maxBookingAdvanceDays == maxBookingAdvanceDays)&&(identical(other.minCancellationNoticeMinutes, minCancellationNoticeMinutes) || other.minCancellationNoticeMinutes == minCancellationNoticeMinutes)&&(identical(other.minRescheduleNoticeMinutes, minRescheduleNoticeMinutes) || other.minRescheduleNoticeMinutes == minRescheduleNoticeMinutes)&&(identical(other.autoConfirm, autoConfirm) || other.autoConfirm == autoConfirm));
}


@override
int get hashCode => Object.hash(runtimeType,minBookingNoticeMinutes,maxBookingAdvanceDays,minCancellationNoticeMinutes,minRescheduleNoticeMinutes,autoConfirm);

@override
String toString() {
  return 'StoreBookingSettingsEntity(minBookingNoticeMinutes: $minBookingNoticeMinutes, maxBookingAdvanceDays: $maxBookingAdvanceDays, minCancellationNoticeMinutes: $minCancellationNoticeMinutes, minRescheduleNoticeMinutes: $minRescheduleNoticeMinutes, autoConfirm: $autoConfirm)';
}


}

/// @nodoc
abstract mixin class $StoreBookingSettingsEntityCopyWith<$Res>  {
  factory $StoreBookingSettingsEntityCopyWith(StoreBookingSettingsEntity value, $Res Function(StoreBookingSettingsEntity) _then) = _$StoreBookingSettingsEntityCopyWithImpl;
@useResult
$Res call({
 int minBookingNoticeMinutes, int maxBookingAdvanceDays, int minCancellationNoticeMinutes, int minRescheduleNoticeMinutes, bool autoConfirm
});




}
/// @nodoc
class _$StoreBookingSettingsEntityCopyWithImpl<$Res>
    implements $StoreBookingSettingsEntityCopyWith<$Res> {
  _$StoreBookingSettingsEntityCopyWithImpl(this._self, this._then);

  final StoreBookingSettingsEntity _self;
  final $Res Function(StoreBookingSettingsEntity) _then;

/// Create a copy of StoreBookingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minBookingNoticeMinutes = null,Object? maxBookingAdvanceDays = null,Object? minCancellationNoticeMinutes = null,Object? minRescheduleNoticeMinutes = null,Object? autoConfirm = null,}) {
  return _then(_self.copyWith(
minBookingNoticeMinutes: null == minBookingNoticeMinutes ? _self.minBookingNoticeMinutes : minBookingNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,maxBookingAdvanceDays: null == maxBookingAdvanceDays ? _self.maxBookingAdvanceDays : maxBookingAdvanceDays // ignore: cast_nullable_to_non_nullable
as int,minCancellationNoticeMinutes: null == minCancellationNoticeMinutes ? _self.minCancellationNoticeMinutes : minCancellationNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,minRescheduleNoticeMinutes: null == minRescheduleNoticeMinutes ? _self.minRescheduleNoticeMinutes : minRescheduleNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,autoConfirm: null == autoConfirm ? _self.autoConfirm : autoConfirm // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreBookingSettingsEntity].
extension StoreBookingSettingsEntityPatterns on StoreBookingSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreBookingSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreBookingSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreBookingSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity() when $default != null:
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)  $default,) {final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity():
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)?  $default,) {final _that = this;
switch (_that) {
case _StoreBookingSettingsEntity() when $default != null:
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
  return null;

}
}

}

/// @nodoc


class _StoreBookingSettingsEntity implements StoreBookingSettingsEntity {
  const _StoreBookingSettingsEntity({this.minBookingNoticeMinutes = 60, this.maxBookingAdvanceDays = 30, this.minCancellationNoticeMinutes = 120, this.minRescheduleNoticeMinutes = 120, this.autoConfirm = true});
  

@override@JsonKey() final  int minBookingNoticeMinutes;
@override@JsonKey() final  int maxBookingAdvanceDays;
@override@JsonKey() final  int minCancellationNoticeMinutes;
@override@JsonKey() final  int minRescheduleNoticeMinutes;
@override@JsonKey() final  bool autoConfirm;

/// Create a copy of StoreBookingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreBookingSettingsEntityCopyWith<_StoreBookingSettingsEntity> get copyWith => __$StoreBookingSettingsEntityCopyWithImpl<_StoreBookingSettingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreBookingSettingsEntity&&(identical(other.minBookingNoticeMinutes, minBookingNoticeMinutes) || other.minBookingNoticeMinutes == minBookingNoticeMinutes)&&(identical(other.maxBookingAdvanceDays, maxBookingAdvanceDays) || other.maxBookingAdvanceDays == maxBookingAdvanceDays)&&(identical(other.minCancellationNoticeMinutes, minCancellationNoticeMinutes) || other.minCancellationNoticeMinutes == minCancellationNoticeMinutes)&&(identical(other.minRescheduleNoticeMinutes, minRescheduleNoticeMinutes) || other.minRescheduleNoticeMinutes == minRescheduleNoticeMinutes)&&(identical(other.autoConfirm, autoConfirm) || other.autoConfirm == autoConfirm));
}


@override
int get hashCode => Object.hash(runtimeType,minBookingNoticeMinutes,maxBookingAdvanceDays,minCancellationNoticeMinutes,minRescheduleNoticeMinutes,autoConfirm);

@override
String toString() {
  return 'StoreBookingSettingsEntity(minBookingNoticeMinutes: $minBookingNoticeMinutes, maxBookingAdvanceDays: $maxBookingAdvanceDays, minCancellationNoticeMinutes: $minCancellationNoticeMinutes, minRescheduleNoticeMinutes: $minRescheduleNoticeMinutes, autoConfirm: $autoConfirm)';
}


}

/// @nodoc
abstract mixin class _$StoreBookingSettingsEntityCopyWith<$Res> implements $StoreBookingSettingsEntityCopyWith<$Res> {
  factory _$StoreBookingSettingsEntityCopyWith(_StoreBookingSettingsEntity value, $Res Function(_StoreBookingSettingsEntity) _then) = __$StoreBookingSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 int minBookingNoticeMinutes, int maxBookingAdvanceDays, int minCancellationNoticeMinutes, int minRescheduleNoticeMinutes, bool autoConfirm
});




}
/// @nodoc
class __$StoreBookingSettingsEntityCopyWithImpl<$Res>
    implements _$StoreBookingSettingsEntityCopyWith<$Res> {
  __$StoreBookingSettingsEntityCopyWithImpl(this._self, this._then);

  final _StoreBookingSettingsEntity _self;
  final $Res Function(_StoreBookingSettingsEntity) _then;

/// Create a copy of StoreBookingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minBookingNoticeMinutes = null,Object? maxBookingAdvanceDays = null,Object? minCancellationNoticeMinutes = null,Object? minRescheduleNoticeMinutes = null,Object? autoConfirm = null,}) {
  return _then(_StoreBookingSettingsEntity(
minBookingNoticeMinutes: null == minBookingNoticeMinutes ? _self.minBookingNoticeMinutes : minBookingNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,maxBookingAdvanceDays: null == maxBookingAdvanceDays ? _self.maxBookingAdvanceDays : maxBookingAdvanceDays // ignore: cast_nullable_to_non_nullable
as int,minCancellationNoticeMinutes: null == minCancellationNoticeMinutes ? _self.minCancellationNoticeMinutes : minCancellationNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,minRescheduleNoticeMinutes: null == minRescheduleNoticeMinutes ? _self.minRescheduleNoticeMinutes : minRescheduleNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,autoConfirm: null == autoConfirm ? _self.autoConfirm : autoConfirm // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
