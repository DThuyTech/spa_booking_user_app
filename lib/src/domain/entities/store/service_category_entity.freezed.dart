// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceCategoryEntity {

 String get id; String get name; String? get description; String? get iconUrl; int get position; int get displayOrder; List<ServiceEntity> get services;
/// Create a copy of ServiceCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCategoryEntityCopyWith<ServiceCategoryEntity> get copyWith => _$ServiceCategoryEntityCopyWithImpl<ServiceCategoryEntity>(this as ServiceCategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.position, position) || other.position == position)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other.services, services));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl,position,displayOrder,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'ServiceCategoryEntity(id: $id, name: $name, description: $description, iconUrl: $iconUrl, position: $position, displayOrder: $displayOrder, services: $services)';
}


}

/// @nodoc
abstract mixin class $ServiceCategoryEntityCopyWith<$Res>  {
  factory $ServiceCategoryEntityCopyWith(ServiceCategoryEntity value, $Res Function(ServiceCategoryEntity) _then) = _$ServiceCategoryEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? iconUrl, int position, int displayOrder, List<ServiceEntity> services
});




}
/// @nodoc
class _$ServiceCategoryEntityCopyWithImpl<$Res>
    implements $ServiceCategoryEntityCopyWith<$Res> {
  _$ServiceCategoryEntityCopyWithImpl(this._self, this._then);

  final ServiceCategoryEntity _self;
  final $Res Function(ServiceCategoryEntity) _then;

/// Create a copy of ServiceCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,Object? position = null,Object? displayOrder = null,Object? services = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCategoryEntity].
extension ServiceCategoryEntityPatterns on ServiceCategoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? iconUrl,  int position,  int displayOrder,  List<ServiceEntity> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.position,_that.displayOrder,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? iconUrl,  int position,  int displayOrder,  List<ServiceEntity> services)  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryEntity():
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.position,_that.displayOrder,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? iconUrl,  int position,  int displayOrder,  List<ServiceEntity> services)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.position,_that.displayOrder,_that.services);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceCategoryEntity implements ServiceCategoryEntity {
  const _ServiceCategoryEntity({required this.id, required this.name, this.description, this.iconUrl, this.position = 0, this.displayOrder = 0, final  List<ServiceEntity> services = const []}): _services = services;
  

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? iconUrl;
@override@JsonKey() final  int position;
@override@JsonKey() final  int displayOrder;
 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of ServiceCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCategoryEntityCopyWith<_ServiceCategoryEntity> get copyWith => __$ServiceCategoryEntityCopyWithImpl<_ServiceCategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.position, position) || other.position == position)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other._services, _services));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl,position,displayOrder,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'ServiceCategoryEntity(id: $id, name: $name, description: $description, iconUrl: $iconUrl, position: $position, displayOrder: $displayOrder, services: $services)';
}


}

/// @nodoc
abstract mixin class _$ServiceCategoryEntityCopyWith<$Res> implements $ServiceCategoryEntityCopyWith<$Res> {
  factory _$ServiceCategoryEntityCopyWith(_ServiceCategoryEntity value, $Res Function(_ServiceCategoryEntity) _then) = __$ServiceCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? iconUrl, int position, int displayOrder, List<ServiceEntity> services
});




}
/// @nodoc
class __$ServiceCategoryEntityCopyWithImpl<$Res>
    implements _$ServiceCategoryEntityCopyWith<$Res> {
  __$ServiceCategoryEntityCopyWithImpl(this._self, this._then);

  final _ServiceCategoryEntity _self;
  final $Res Function(_ServiceCategoryEntity) _then;

/// Create a copy of ServiceCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,Object? position = null,Object? displayOrder = null,Object? services = null,}) {
  return _then(_ServiceCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,
  ));
}


}

// dart format on
