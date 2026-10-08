// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityEntity {

 String get code; String get name; String get fullName; String? get divisionType; int? get phoneCode;
/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityEntityCopyWith<CityEntity> get copyWith => _$CityEntityCopyWithImpl<CityEntity>(this as CityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode));
}


@override
int get hashCode => Object.hash(runtimeType,code,name,fullName,divisionType,phoneCode);

@override
String toString() {
  return 'CityEntity(code: $code, name: $name, fullName: $fullName, divisionType: $divisionType, phoneCode: $phoneCode)';
}


}

/// @nodoc
abstract mixin class $CityEntityCopyWith<$Res>  {
  factory $CityEntityCopyWith(CityEntity value, $Res Function(CityEntity) _then) = _$CityEntityCopyWithImpl;
@useResult
$Res call({
 String code, String name, String fullName, String? divisionType, int? phoneCode
});




}
/// @nodoc
class _$CityEntityCopyWithImpl<$Res>
    implements $CityEntityCopyWith<$Res> {
  _$CityEntityCopyWithImpl(this._self, this._then);

  final CityEntity _self;
  final $Res Function(CityEntity) _then;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? fullName = null,Object? divisionType = freezed,Object? phoneCode = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,divisionType: freezed == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CityEntity].
extension CityEntityPatterns on CityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityEntity value)  $default,){
final _that = this;
switch (_that) {
case _CityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  String fullName,  String? divisionType,  int? phoneCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
return $default(_that.code,_that.name,_that.fullName,_that.divisionType,_that.phoneCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  String fullName,  String? divisionType,  int? phoneCode)  $default,) {final _that = this;
switch (_that) {
case _CityEntity():
return $default(_that.code,_that.name,_that.fullName,_that.divisionType,_that.phoneCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  String fullName,  String? divisionType,  int? phoneCode)?  $default,) {final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
return $default(_that.code,_that.name,_that.fullName,_that.divisionType,_that.phoneCode);case _:
  return null;

}
}

}

/// @nodoc


class _CityEntity implements CityEntity {
  const _CityEntity({required this.code, required this.name, required this.fullName, this.divisionType, this.phoneCode});
  

@override final  String code;
@override final  String name;
@override final  String fullName;
@override final  String? divisionType;
@override final  int? phoneCode;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityEntityCopyWith<_CityEntity> get copyWith => __$CityEntityCopyWithImpl<_CityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode));
}


@override
int get hashCode => Object.hash(runtimeType,code,name,fullName,divisionType,phoneCode);

@override
String toString() {
  return 'CityEntity(code: $code, name: $name, fullName: $fullName, divisionType: $divisionType, phoneCode: $phoneCode)';
}


}

/// @nodoc
abstract mixin class _$CityEntityCopyWith<$Res> implements $CityEntityCopyWith<$Res> {
  factory _$CityEntityCopyWith(_CityEntity value, $Res Function(_CityEntity) _then) = __$CityEntityCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, String fullName, String? divisionType, int? phoneCode
});




}
/// @nodoc
class __$CityEntityCopyWithImpl<$Res>
    implements _$CityEntityCopyWith<$Res> {
  __$CityEntityCopyWithImpl(this._self, this._then);

  final _CityEntity _self;
  final $Res Function(_CityEntity) _then;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? fullName = null,Object? divisionType = freezed,Object? phoneCode = freezed,}) {
  return _then(_CityEntity(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,divisionType: freezed == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
