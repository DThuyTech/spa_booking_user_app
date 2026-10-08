// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_store_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteStoreEntity {

 String get id; String get name; String get slug; double? get averageRating; String? get logoUrl; String? get coverImageUrl; String get address; String? get phoneNumber; bool get isFavorite; DateTime? get favoritedAt;
/// Create a copy of FavoriteStoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStoreEntityCopyWith<FavoriteStoreEntity> get copyWith => _$FavoriteStoreEntityCopyWithImpl<FavoriteStoreEntity>(this as FavoriteStoreEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteStoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,averageRating,logoUrl,coverImageUrl,address,phoneNumber,isFavorite,favoritedAt);

@override
String toString() {
  return 'FavoriteStoreEntity(id: $id, name: $name, slug: $slug, averageRating: $averageRating, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, address: $address, phoneNumber: $phoneNumber, isFavorite: $isFavorite, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteStoreEntityCopyWith<$Res>  {
  factory $FavoriteStoreEntityCopyWith(FavoriteStoreEntity value, $Res Function(FavoriteStoreEntity) _then) = _$FavoriteStoreEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, double? averageRating, String? logoUrl, String? coverImageUrl, String address, String? phoneNumber, bool isFavorite, DateTime? favoritedAt
});




}
/// @nodoc
class _$FavoriteStoreEntityCopyWithImpl<$Res>
    implements $FavoriteStoreEntityCopyWith<$Res> {
  _$FavoriteStoreEntityCopyWithImpl(this._self, this._then);

  final FavoriteStoreEntity _self;
  final $Res Function(FavoriteStoreEntity) _then;

/// Create a copy of FavoriteStoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? averageRating = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? address = null,Object? phoneNumber = freezed,Object? isFavorite = null,Object? favoritedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoritedAt: freezed == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteStoreEntity].
extension FavoriteStoreEntityPatterns on FavoriteStoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteStoreEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteStoreEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteStoreEntity value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoreEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteStoreEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoreEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  double? averageRating,  String? logoUrl,  String? coverImageUrl,  String address,  String? phoneNumber,  bool isFavorite,  DateTime? favoritedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteStoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.averageRating,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.isFavorite,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  double? averageRating,  String? logoUrl,  String? coverImageUrl,  String address,  String? phoneNumber,  bool isFavorite,  DateTime? favoritedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoreEntity():
return $default(_that.id,_that.name,_that.slug,_that.averageRating,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.isFavorite,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  double? averageRating,  String? logoUrl,  String? coverImageUrl,  String address,  String? phoneNumber,  bool isFavorite,  DateTime? favoritedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.averageRating,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.isFavorite,_that.favoritedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteStoreEntity implements FavoriteStoreEntity {
  const _FavoriteStoreEntity({required this.id, required this.name, required this.slug, this.averageRating, this.logoUrl, this.coverImageUrl, required this.address, this.phoneNumber, this.isFavorite = true, this.favoritedAt});
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  double? averageRating;
@override final  String? logoUrl;
@override final  String? coverImageUrl;
@override final  String address;
@override final  String? phoneNumber;
@override@JsonKey() final  bool isFavorite;
@override final  DateTime? favoritedAt;

/// Create a copy of FavoriteStoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStoreEntityCopyWith<_FavoriteStoreEntity> get copyWith => __$FavoriteStoreEntityCopyWithImpl<_FavoriteStoreEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteStoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,averageRating,logoUrl,coverImageUrl,address,phoneNumber,isFavorite,favoritedAt);

@override
String toString() {
  return 'FavoriteStoreEntity(id: $id, name: $name, slug: $slug, averageRating: $averageRating, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, address: $address, phoneNumber: $phoneNumber, isFavorite: $isFavorite, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStoreEntityCopyWith<$Res> implements $FavoriteStoreEntityCopyWith<$Res> {
  factory _$FavoriteStoreEntityCopyWith(_FavoriteStoreEntity value, $Res Function(_FavoriteStoreEntity) _then) = __$FavoriteStoreEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, double? averageRating, String? logoUrl, String? coverImageUrl, String address, String? phoneNumber, bool isFavorite, DateTime? favoritedAt
});




}
/// @nodoc
class __$FavoriteStoreEntityCopyWithImpl<$Res>
    implements _$FavoriteStoreEntityCopyWith<$Res> {
  __$FavoriteStoreEntityCopyWithImpl(this._self, this._then);

  final _FavoriteStoreEntity _self;
  final $Res Function(_FavoriteStoreEntity) _then;

/// Create a copy of FavoriteStoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? averageRating = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? address = null,Object? phoneNumber = freezed,Object? isFavorite = null,Object? favoritedAt = freezed,}) {
  return _then(_FavoriteStoreEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoritedAt: freezed == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
