// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceEntity {

 String get id; String get name; String? get description; double get basePrice; int? get effectivePrice; bool get hasDiscount; double get discountPercent; int get durationMinutes; String? get imageUrl; String? get categoryId; AppliedPricingRuleEntity? get appliedPricingRule;
/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceEntityCopyWith<ServiceEntity> get copyWith => _$ServiceEntityCopyWithImpl<ServiceEntity>(this as ServiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.effectivePrice, effectivePrice) || other.effectivePrice == effectivePrice)&&(identical(other.hasDiscount, hasDiscount) || other.hasDiscount == hasDiscount)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.appliedPricingRule, appliedPricingRule) || other.appliedPricingRule == appliedPricingRule));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,basePrice,effectivePrice,hasDiscount,discountPercent,durationMinutes,imageUrl,categoryId,appliedPricingRule);

@override
String toString() {
  return 'ServiceEntity(id: $id, name: $name, description: $description, basePrice: $basePrice, effectivePrice: $effectivePrice, hasDiscount: $hasDiscount, discountPercent: $discountPercent, durationMinutes: $durationMinutes, imageUrl: $imageUrl, categoryId: $categoryId, appliedPricingRule: $appliedPricingRule)';
}


}

/// @nodoc
abstract mixin class $ServiceEntityCopyWith<$Res>  {
  factory $ServiceEntityCopyWith(ServiceEntity value, $Res Function(ServiceEntity) _then) = _$ServiceEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, double basePrice, int? effectivePrice, bool hasDiscount, double discountPercent, int durationMinutes, String? imageUrl, String? categoryId, AppliedPricingRuleEntity? appliedPricingRule
});


$AppliedPricingRuleEntityCopyWith<$Res>? get appliedPricingRule;

}
/// @nodoc
class _$ServiceEntityCopyWithImpl<$Res>
    implements $ServiceEntityCopyWith<$Res> {
  _$ServiceEntityCopyWithImpl(this._self, this._then);

  final ServiceEntity _self;
  final $Res Function(ServiceEntity) _then;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? basePrice = null,Object? effectivePrice = freezed,Object? hasDiscount = null,Object? discountPercent = null,Object? durationMinutes = null,Object? imageUrl = freezed,Object? categoryId = freezed,Object? appliedPricingRule = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,effectivePrice: freezed == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as int?,hasDiscount: null == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,appliedPricingRule: freezed == appliedPricingRule ? _self.appliedPricingRule : appliedPricingRule // ignore: cast_nullable_to_non_nullable
as AppliedPricingRuleEntity?,
  ));
}
/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedPricingRuleEntityCopyWith<$Res>? get appliedPricingRule {
    if (_self.appliedPricingRule == null) {
    return null;
  }

  return $AppliedPricingRuleEntityCopyWith<$Res>(_self.appliedPricingRule!, (value) {
    return _then(_self.copyWith(appliedPricingRule: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceEntity].
extension ServiceEntityPatterns on ServiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double basePrice,  int? effectivePrice,  bool hasDiscount,  double discountPercent,  int durationMinutes,  String? imageUrl,  String? categoryId,  AppliedPricingRuleEntity? appliedPricingRule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.basePrice,_that.effectivePrice,_that.hasDiscount,_that.discountPercent,_that.durationMinutes,_that.imageUrl,_that.categoryId,_that.appliedPricingRule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double basePrice,  int? effectivePrice,  bool hasDiscount,  double discountPercent,  int durationMinutes,  String? imageUrl,  String? categoryId,  AppliedPricingRuleEntity? appliedPricingRule)  $default,) {final _that = this;
switch (_that) {
case _ServiceEntity():
return $default(_that.id,_that.name,_that.description,_that.basePrice,_that.effectivePrice,_that.hasDiscount,_that.discountPercent,_that.durationMinutes,_that.imageUrl,_that.categoryId,_that.appliedPricingRule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  double basePrice,  int? effectivePrice,  bool hasDiscount,  double discountPercent,  int durationMinutes,  String? imageUrl,  String? categoryId,  AppliedPricingRuleEntity? appliedPricingRule)?  $default,) {final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.basePrice,_that.effectivePrice,_that.hasDiscount,_that.discountPercent,_that.durationMinutes,_that.imageUrl,_that.categoryId,_that.appliedPricingRule);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceEntity implements ServiceEntity {
  const _ServiceEntity({required this.id, required this.name, this.description, required this.basePrice, this.effectivePrice, this.hasDiscount = false, this.discountPercent = 0, required this.durationMinutes, this.imageUrl, this.categoryId, this.appliedPricingRule});
  

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  double basePrice;
@override final  int? effectivePrice;
@override@JsonKey() final  bool hasDiscount;
@override@JsonKey() final  double discountPercent;
@override final  int durationMinutes;
@override final  String? imageUrl;
@override final  String? categoryId;
@override final  AppliedPricingRuleEntity? appliedPricingRule;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceEntityCopyWith<_ServiceEntity> get copyWith => __$ServiceEntityCopyWithImpl<_ServiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.effectivePrice, effectivePrice) || other.effectivePrice == effectivePrice)&&(identical(other.hasDiscount, hasDiscount) || other.hasDiscount == hasDiscount)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.appliedPricingRule, appliedPricingRule) || other.appliedPricingRule == appliedPricingRule));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,basePrice,effectivePrice,hasDiscount,discountPercent,durationMinutes,imageUrl,categoryId,appliedPricingRule);

@override
String toString() {
  return 'ServiceEntity(id: $id, name: $name, description: $description, basePrice: $basePrice, effectivePrice: $effectivePrice, hasDiscount: $hasDiscount, discountPercent: $discountPercent, durationMinutes: $durationMinutes, imageUrl: $imageUrl, categoryId: $categoryId, appliedPricingRule: $appliedPricingRule)';
}


}

/// @nodoc
abstract mixin class _$ServiceEntityCopyWith<$Res> implements $ServiceEntityCopyWith<$Res> {
  factory _$ServiceEntityCopyWith(_ServiceEntity value, $Res Function(_ServiceEntity) _then) = __$ServiceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, double basePrice, int? effectivePrice, bool hasDiscount, double discountPercent, int durationMinutes, String? imageUrl, String? categoryId, AppliedPricingRuleEntity? appliedPricingRule
});


@override $AppliedPricingRuleEntityCopyWith<$Res>? get appliedPricingRule;

}
/// @nodoc
class __$ServiceEntityCopyWithImpl<$Res>
    implements _$ServiceEntityCopyWith<$Res> {
  __$ServiceEntityCopyWithImpl(this._self, this._then);

  final _ServiceEntity _self;
  final $Res Function(_ServiceEntity) _then;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? basePrice = null,Object? effectivePrice = freezed,Object? hasDiscount = null,Object? discountPercent = null,Object? durationMinutes = null,Object? imageUrl = freezed,Object? categoryId = freezed,Object? appliedPricingRule = freezed,}) {
  return _then(_ServiceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,effectivePrice: freezed == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as int?,hasDiscount: null == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,appliedPricingRule: freezed == appliedPricingRule ? _self.appliedPricingRule : appliedPricingRule // ignore: cast_nullable_to_non_nullable
as AppliedPricingRuleEntity?,
  ));
}

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedPricingRuleEntityCopyWith<$Res>? get appliedPricingRule {
    if (_self.appliedPricingRule == null) {
    return null;
  }

  return $AppliedPricingRuleEntityCopyWith<$Res>(_self.appliedPricingRule!, (value) {
    return _then(_self.copyWith(appliedPricingRule: value));
  });
}
}

// dart format on
