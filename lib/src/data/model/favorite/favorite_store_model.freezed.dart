// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteStoreModel {

@JsonKey(readValue: _readId) String get id;@JsonKey(readValue: _readName, defaultValue: '') String get name;@JsonKey(readValue: _readSlug, defaultValue: '') String get slug;@JsonKey(readValue: _readLogoUrl) String? get logoUrl;@JsonKey(readValue: _readCoverImageUrl) String? get coverImageUrl;@JsonKey(readValue: _readAddress, defaultValue: '') String get address;@JsonKey(readValue: _readPhoneNumber) String? get phoneNumber;@JsonKey(readValue: _readRating, fromJson: _ratingFromJson) double? get averageRating;@JsonKey(readValue: _readIsFavorite, defaultValue: true) bool get isFavorite;@JsonKey(readValue: _readFavoritedAt) String? get favoritedAt;
/// Create a copy of FavoriteStoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStoreModelCopyWith<FavoriteStoreModel> get copyWith => _$FavoriteStoreModelCopyWithImpl<FavoriteStoreModel>(this as FavoriteStoreModel, _$identity);

  /// Serializes this FavoriteStoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteStoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,coverImageUrl,address,phoneNumber,averageRating,isFavorite,favoritedAt);

@override
String toString() {
  return 'FavoriteStoreModel(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, address: $address, phoneNumber: $phoneNumber, averageRating: $averageRating, isFavorite: $isFavorite, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteStoreModelCopyWith<$Res>  {
  factory $FavoriteStoreModelCopyWith(FavoriteStoreModel value, $Res Function(FavoriteStoreModel) _then) = _$FavoriteStoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(readValue: _readName, defaultValue: '') String name,@JsonKey(readValue: _readSlug, defaultValue: '') String slug,@JsonKey(readValue: _readLogoUrl) String? logoUrl,@JsonKey(readValue: _readCoverImageUrl) String? coverImageUrl,@JsonKey(readValue: _readAddress, defaultValue: '') String address,@JsonKey(readValue: _readPhoneNumber) String? phoneNumber,@JsonKey(readValue: _readRating, fromJson: _ratingFromJson) double? averageRating,@JsonKey(readValue: _readIsFavorite, defaultValue: true) bool isFavorite,@JsonKey(readValue: _readFavoritedAt) String? favoritedAt
});




}
/// @nodoc
class _$FavoriteStoreModelCopyWithImpl<$Res>
    implements $FavoriteStoreModelCopyWith<$Res> {
  _$FavoriteStoreModelCopyWithImpl(this._self, this._then);

  final FavoriteStoreModel _self;
  final $Res Function(FavoriteStoreModel) _then;

/// Create a copy of FavoriteStoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? address = null,Object? phoneNumber = freezed,Object? averageRating = freezed,Object? isFavorite = null,Object? favoritedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoritedAt: freezed == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteStoreModel].
extension FavoriteStoreModelPatterns on FavoriteStoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteStoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteStoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteStoreModel value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteStoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName, defaultValue: '')  String name, @JsonKey(readValue: _readSlug, defaultValue: '')  String slug, @JsonKey(readValue: _readLogoUrl)  String? logoUrl, @JsonKey(readValue: _readCoverImageUrl)  String? coverImageUrl, @JsonKey(readValue: _readAddress, defaultValue: '')  String address, @JsonKey(readValue: _readPhoneNumber)  String? phoneNumber, @JsonKey(readValue: _readRating, fromJson: _ratingFromJson)  double? averageRating, @JsonKey(readValue: _readIsFavorite, defaultValue: true)  bool isFavorite, @JsonKey(readValue: _readFavoritedAt)  String? favoritedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteStoreModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.averageRating,_that.isFavorite,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName, defaultValue: '')  String name, @JsonKey(readValue: _readSlug, defaultValue: '')  String slug, @JsonKey(readValue: _readLogoUrl)  String? logoUrl, @JsonKey(readValue: _readCoverImageUrl)  String? coverImageUrl, @JsonKey(readValue: _readAddress, defaultValue: '')  String address, @JsonKey(readValue: _readPhoneNumber)  String? phoneNumber, @JsonKey(readValue: _readRating, fromJson: _ratingFromJson)  double? averageRating, @JsonKey(readValue: _readIsFavorite, defaultValue: true)  bool isFavorite, @JsonKey(readValue: _readFavoritedAt)  String? favoritedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoreModel():
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.averageRating,_that.isFavorite,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readId)  String id, @JsonKey(readValue: _readName, defaultValue: '')  String name, @JsonKey(readValue: _readSlug, defaultValue: '')  String slug, @JsonKey(readValue: _readLogoUrl)  String? logoUrl, @JsonKey(readValue: _readCoverImageUrl)  String? coverImageUrl, @JsonKey(readValue: _readAddress, defaultValue: '')  String address, @JsonKey(readValue: _readPhoneNumber)  String? phoneNumber, @JsonKey(readValue: _readRating, fromJson: _ratingFromJson)  double? averageRating, @JsonKey(readValue: _readIsFavorite, defaultValue: true)  bool isFavorite, @JsonKey(readValue: _readFavoritedAt)  String? favoritedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoreModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverImageUrl,_that.address,_that.phoneNumber,_that.averageRating,_that.isFavorite,_that.favoritedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteStoreModel extends FavoriteStoreModel {
  const _FavoriteStoreModel({@JsonKey(readValue: _readId) required this.id, @JsonKey(readValue: _readName, defaultValue: '') required this.name, @JsonKey(readValue: _readSlug, defaultValue: '') required this.slug, @JsonKey(readValue: _readLogoUrl) this.logoUrl, @JsonKey(readValue: _readCoverImageUrl) this.coverImageUrl, @JsonKey(readValue: _readAddress, defaultValue: '') required this.address, @JsonKey(readValue: _readPhoneNumber) this.phoneNumber, @JsonKey(readValue: _readRating, fromJson: _ratingFromJson) this.averageRating, @JsonKey(readValue: _readIsFavorite, defaultValue: true) required this.isFavorite, @JsonKey(readValue: _readFavoritedAt) this.favoritedAt}): super._();
  factory _FavoriteStoreModel.fromJson(Map<String, dynamic> json) => _$FavoriteStoreModelFromJson(json);

@override@JsonKey(readValue: _readId) final  String id;
@override@JsonKey(readValue: _readName, defaultValue: '') final  String name;
@override@JsonKey(readValue: _readSlug, defaultValue: '') final  String slug;
@override@JsonKey(readValue: _readLogoUrl) final  String? logoUrl;
@override@JsonKey(readValue: _readCoverImageUrl) final  String? coverImageUrl;
@override@JsonKey(readValue: _readAddress, defaultValue: '') final  String address;
@override@JsonKey(readValue: _readPhoneNumber) final  String? phoneNumber;
@override@JsonKey(readValue: _readRating, fromJson: _ratingFromJson) final  double? averageRating;
@override@JsonKey(readValue: _readIsFavorite, defaultValue: true) final  bool isFavorite;
@override@JsonKey(readValue: _readFavoritedAt) final  String? favoritedAt;

/// Create a copy of FavoriteStoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStoreModelCopyWith<_FavoriteStoreModel> get copyWith => __$FavoriteStoreModelCopyWithImpl<_FavoriteStoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteStoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteStoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,coverImageUrl,address,phoneNumber,averageRating,isFavorite,favoritedAt);

@override
String toString() {
  return 'FavoriteStoreModel(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, address: $address, phoneNumber: $phoneNumber, averageRating: $averageRating, isFavorite: $isFavorite, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStoreModelCopyWith<$Res> implements $FavoriteStoreModelCopyWith<$Res> {
  factory _$FavoriteStoreModelCopyWith(_FavoriteStoreModel value, $Res Function(_FavoriteStoreModel) _then) = __$FavoriteStoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(readValue: _readName, defaultValue: '') String name,@JsonKey(readValue: _readSlug, defaultValue: '') String slug,@JsonKey(readValue: _readLogoUrl) String? logoUrl,@JsonKey(readValue: _readCoverImageUrl) String? coverImageUrl,@JsonKey(readValue: _readAddress, defaultValue: '') String address,@JsonKey(readValue: _readPhoneNumber) String? phoneNumber,@JsonKey(readValue: _readRating, fromJson: _ratingFromJson) double? averageRating,@JsonKey(readValue: _readIsFavorite, defaultValue: true) bool isFavorite,@JsonKey(readValue: _readFavoritedAt) String? favoritedAt
});




}
/// @nodoc
class __$FavoriteStoreModelCopyWithImpl<$Res>
    implements _$FavoriteStoreModelCopyWith<$Res> {
  __$FavoriteStoreModelCopyWithImpl(this._self, this._then);

  final _FavoriteStoreModel _self;
  final $Res Function(_FavoriteStoreModel) _then;

/// Create a copy of FavoriteStoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? address = null,Object? phoneNumber = freezed,Object? averageRating = freezed,Object? isFavorite = null,Object? favoritedAt = freezed,}) {
  return _then(_FavoriteStoreModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoritedAt: freezed == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FavoriteListResponseModel {

@JsonKey(readValue: _readItems) List<FavoriteStoreModel> get items; Map<String, dynamic>? get pagination;
/// Create a copy of FavoriteListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteListResponseModelCopyWith<FavoriteListResponseModel> get copyWith => _$FavoriteListResponseModelCopyWithImpl<FavoriteListResponseModel>(this as FavoriteListResponseModel, _$identity);

  /// Serializes this FavoriteListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteListResponseModel&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'FavoriteListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $FavoriteListResponseModelCopyWith<$Res>  {
  factory $FavoriteListResponseModelCopyWith(FavoriteListResponseModel value, $Res Function(FavoriteListResponseModel) _then) = _$FavoriteListResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readItems) List<FavoriteStoreModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$FavoriteListResponseModelCopyWithImpl<$Res>
    implements $FavoriteListResponseModelCopyWith<$Res> {
  _$FavoriteListResponseModelCopyWithImpl(this._self, this._then);

  final FavoriteListResponseModel _self;
  final $Res Function(FavoriteListResponseModel) _then;

/// Create a copy of FavoriteListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FavoriteStoreModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteListResponseModel].
extension FavoriteListResponseModelPatterns on FavoriteListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readItems)  List<FavoriteStoreModel> items,  Map<String, dynamic>? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteListResponseModel() when $default != null:
return $default(_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readItems)  List<FavoriteStoreModel> items,  Map<String, dynamic>? pagination)  $default,) {final _that = this;
switch (_that) {
case _FavoriteListResponseModel():
return $default(_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readItems)  List<FavoriteStoreModel> items,  Map<String, dynamic>? pagination)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteListResponseModel() when $default != null:
return $default(_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteListResponseModel extends FavoriteListResponseModel {
  const _FavoriteListResponseModel({@JsonKey(readValue: _readItems) final  List<FavoriteStoreModel> items = const [], final  Map<String, dynamic>? pagination}): _items = items,_pagination = pagination,super._();
  factory _FavoriteListResponseModel.fromJson(Map<String, dynamic> json) => _$FavoriteListResponseModelFromJson(json);

 final  List<FavoriteStoreModel> _items;
@override@JsonKey(readValue: _readItems) List<FavoriteStoreModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Map<String, dynamic>? _pagination;
@override Map<String, dynamic>? get pagination {
  final value = _pagination;
  if (value == null) return null;
  if (_pagination is EqualUnmodifiableMapView) return _pagination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of FavoriteListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteListResponseModelCopyWith<_FavoriteListResponseModel> get copyWith => __$FavoriteListResponseModelCopyWithImpl<_FavoriteListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteListResponseModel&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'FavoriteListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$FavoriteListResponseModelCopyWith<$Res> implements $FavoriteListResponseModelCopyWith<$Res> {
  factory _$FavoriteListResponseModelCopyWith(_FavoriteListResponseModel value, $Res Function(_FavoriteListResponseModel) _then) = __$FavoriteListResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readItems) List<FavoriteStoreModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class __$FavoriteListResponseModelCopyWithImpl<$Res>
    implements _$FavoriteListResponseModelCopyWith<$Res> {
  __$FavoriteListResponseModelCopyWithImpl(this._self, this._then);

  final _FavoriteListResponseModel _self;
  final $Res Function(_FavoriteListResponseModel) _then;

/// Create a copy of FavoriteListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_FavoriteListResponseModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FavoriteStoreModel>,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
