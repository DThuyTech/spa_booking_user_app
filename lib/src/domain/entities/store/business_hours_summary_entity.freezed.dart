// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_hours_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BusinessHoursSummaryEntity {

 String get storeId; List<StoreBusinessHourEntity> get days;
/// Create a copy of BusinessHoursSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessHoursSummaryEntityCopyWith<BusinessHoursSummaryEntity> get copyWith => _$BusinessHoursSummaryEntityCopyWithImpl<BusinessHoursSummaryEntity>(this as BusinessHoursSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessHoursSummaryEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other.days, days));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'BusinessHoursSummaryEntity(storeId: $storeId, days: $days)';
}


}

/// @nodoc
abstract mixin class $BusinessHoursSummaryEntityCopyWith<$Res>  {
  factory $BusinessHoursSummaryEntityCopyWith(BusinessHoursSummaryEntity value, $Res Function(BusinessHoursSummaryEntity) _then) = _$BusinessHoursSummaryEntityCopyWithImpl;
@useResult
$Res call({
 String storeId, List<StoreBusinessHourEntity> days
});




}
/// @nodoc
class _$BusinessHoursSummaryEntityCopyWithImpl<$Res>
    implements $BusinessHoursSummaryEntityCopyWith<$Res> {
  _$BusinessHoursSummaryEntityCopyWithImpl(this._self, this._then);

  final BusinessHoursSummaryEntity _self;
  final $Res Function(BusinessHoursSummaryEntity) _then;

/// Create a copy of BusinessHoursSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? days = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessHoursSummaryEntity].
extension BusinessHoursSummaryEntityPatterns on BusinessHoursSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessHoursSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessHoursSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessHoursSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  List<StoreBusinessHourEntity> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity() when $default != null:
return $default(_that.storeId,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  List<StoreBusinessHourEntity> days)  $default,) {final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity():
return $default(_that.storeId,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  List<StoreBusinessHourEntity> days)?  $default,) {final _that = this;
switch (_that) {
case _BusinessHoursSummaryEntity() when $default != null:
return $default(_that.storeId,_that.days);case _:
  return null;

}
}

}

/// @nodoc


class _BusinessHoursSummaryEntity implements BusinessHoursSummaryEntity {
  const _BusinessHoursSummaryEntity({required this.storeId, final  List<StoreBusinessHourEntity> days = const []}): _days = days;
  

@override final  String storeId;
 final  List<StoreBusinessHourEntity> _days;
@override@JsonKey() List<StoreBusinessHourEntity> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of BusinessHoursSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessHoursSummaryEntityCopyWith<_BusinessHoursSummaryEntity> get copyWith => __$BusinessHoursSummaryEntityCopyWithImpl<_BusinessHoursSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessHoursSummaryEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other._days, _days));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'BusinessHoursSummaryEntity(storeId: $storeId, days: $days)';
}


}

/// @nodoc
abstract mixin class _$BusinessHoursSummaryEntityCopyWith<$Res> implements $BusinessHoursSummaryEntityCopyWith<$Res> {
  factory _$BusinessHoursSummaryEntityCopyWith(_BusinessHoursSummaryEntity value, $Res Function(_BusinessHoursSummaryEntity) _then) = __$BusinessHoursSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 String storeId, List<StoreBusinessHourEntity> days
});




}
/// @nodoc
class __$BusinessHoursSummaryEntityCopyWithImpl<$Res>
    implements _$BusinessHoursSummaryEntityCopyWith<$Res> {
  __$BusinessHoursSummaryEntityCopyWithImpl(this._self, this._then);

  final _BusinessHoursSummaryEntity _self;
  final $Res Function(_BusinessHoursSummaryEntity) _then;

/// Create a copy of BusinessHoursSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? days = null,}) {
  return _then(_BusinessHoursSummaryEntity(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,
  ));
}


}

// dart format on
