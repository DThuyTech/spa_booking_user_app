// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applied_pricing_rule_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppliedPricingRuleEntity {

 String get id; String get name; double get discountPercentage;
/// Create a copy of AppliedPricingRuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppliedPricingRuleEntityCopyWith<AppliedPricingRuleEntity> get copyWith => _$AppliedPricingRuleEntityCopyWithImpl<AppliedPricingRuleEntity>(this as AppliedPricingRuleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppliedPricingRuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,discountPercentage);

@override
String toString() {
  return 'AppliedPricingRuleEntity(id: $id, name: $name, discountPercentage: $discountPercentage)';
}


}

/// @nodoc
abstract mixin class $AppliedPricingRuleEntityCopyWith<$Res>  {
  factory $AppliedPricingRuleEntityCopyWith(AppliedPricingRuleEntity value, $Res Function(AppliedPricingRuleEntity) _then) = _$AppliedPricingRuleEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, double discountPercentage
});




}
/// @nodoc
class _$AppliedPricingRuleEntityCopyWithImpl<$Res>
    implements $AppliedPricingRuleEntityCopyWith<$Res> {
  _$AppliedPricingRuleEntityCopyWithImpl(this._self, this._then);

  final AppliedPricingRuleEntity _self;
  final $Res Function(AppliedPricingRuleEntity) _then;

/// Create a copy of AppliedPricingRuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? discountPercentage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AppliedPricingRuleEntity].
extension AppliedPricingRuleEntityPatterns on AppliedPricingRuleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppliedPricingRuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppliedPricingRuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppliedPricingRuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double discountPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity() when $default != null:
return $default(_that.id,_that.name,_that.discountPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double discountPercentage)  $default,) {final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity():
return $default(_that.id,_that.name,_that.discountPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double discountPercentage)?  $default,) {final _that = this;
switch (_that) {
case _AppliedPricingRuleEntity() when $default != null:
return $default(_that.id,_that.name,_that.discountPercentage);case _:
  return null;

}
}

}

/// @nodoc


class _AppliedPricingRuleEntity implements AppliedPricingRuleEntity {
  const _AppliedPricingRuleEntity({required this.id, required this.name, required this.discountPercentage});
  

@override final  String id;
@override final  String name;
@override final  double discountPercentage;

/// Create a copy of AppliedPricingRuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppliedPricingRuleEntityCopyWith<_AppliedPricingRuleEntity> get copyWith => __$AppliedPricingRuleEntityCopyWithImpl<_AppliedPricingRuleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppliedPricingRuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,discountPercentage);

@override
String toString() {
  return 'AppliedPricingRuleEntity(id: $id, name: $name, discountPercentage: $discountPercentage)';
}


}

/// @nodoc
abstract mixin class _$AppliedPricingRuleEntityCopyWith<$Res> implements $AppliedPricingRuleEntityCopyWith<$Res> {
  factory _$AppliedPricingRuleEntityCopyWith(_AppliedPricingRuleEntity value, $Res Function(_AppliedPricingRuleEntity) _then) = __$AppliedPricingRuleEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double discountPercentage
});




}
/// @nodoc
class __$AppliedPricingRuleEntityCopyWithImpl<$Res>
    implements _$AppliedPricingRuleEntityCopyWith<$Res> {
  __$AppliedPricingRuleEntityCopyWithImpl(this._self, this._then);

  final _AppliedPricingRuleEntity _self;
  final $Res Function(_AppliedPricingRuleEntity) _then;

/// Create a copy of AppliedPricingRuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? discountPercentage = null,}) {
  return _then(_AppliedPricingRuleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
