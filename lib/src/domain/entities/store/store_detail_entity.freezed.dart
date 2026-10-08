// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreDetailEntity {

 String get id; String get name; String get slug; String? get description; String get address; String get phoneNumber; String? get logoUrl; String? get coverUrl; List<String> get images; List<StoreBusinessHourEntity> get businessHours; StoreBookingSettingsEntity? get bookingSettings; double? get latitude; double? get longitude; String? get district; String? get city; bool get isFavorite;
/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailEntityCopyWith<StoreDetailEntity> get copyWith => _$StoreDetailEntityCopyWithImpl<StoreDetailEntity>(this as StoreDetailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.businessHours, businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverUrl,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(businessHours),bookingSettings,latitude,longitude,district,city,isFavorite);

@override
String toString() {
  return 'StoreDetailEntity(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverUrl: $coverUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings, latitude: $latitude, longitude: $longitude, district: $district, city: $city, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $StoreDetailEntityCopyWith<$Res>  {
  factory $StoreDetailEntityCopyWith(StoreDetailEntity value, $Res Function(StoreDetailEntity) _then) = _$StoreDetailEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverUrl, List<String> images, List<StoreBusinessHourEntity> businessHours, StoreBookingSettingsEntity? bookingSettings, double? latitude, double? longitude, String? district, String? city, bool isFavorite
});


$StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings;

}
/// @nodoc
class _$StoreDetailEntityCopyWithImpl<$Res>
    implements $StoreDetailEntityCopyWith<$Res> {
  _$StoreDetailEntityCopyWithImpl(this._self, this._then);

  final StoreDetailEntity _self;
  final $Res Function(StoreDetailEntity) _then;

/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? images = null,Object? businessHours = null,Object? bookingSettings = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? district = freezed,Object? city = freezed,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: null == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsEntity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings {
    if (_self.bookingSettings == null) {
    return null;
  }

  return $StoreBookingSettingsEntityCopyWith<$Res>(_self.bookingSettings!, (value) {
    return _then(_self.copyWith(bookingSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreDetailEntity].
extension StoreDetailEntityPatterns on StoreDetailEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDetailEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDetailEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDetailEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreDetailEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDetailEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDetailEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourEntity> businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDetailEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourEntity> businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _StoreDetailEntity():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourEntity> businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _StoreDetailEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _StoreDetailEntity implements StoreDetailEntity {
  const _StoreDetailEntity({required this.id, required this.name, required this.slug, this.description, required this.address, required this.phoneNumber, this.logoUrl, this.coverUrl, final  List<String> images = const [], final  List<StoreBusinessHourEntity> businessHours = const [], this.bookingSettings, this.latitude, this.longitude, this.district, this.city, this.isFavorite = false}): _images = images,_businessHours = businessHours;
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String address;
@override final  String phoneNumber;
@override final  String? logoUrl;
@override final  String? coverUrl;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<StoreBusinessHourEntity> _businessHours;
@override@JsonKey() List<StoreBusinessHourEntity> get businessHours {
  if (_businessHours is EqualUnmodifiableListView) return _businessHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businessHours);
}

@override final  StoreBookingSettingsEntity? bookingSettings;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? district;
@override final  String? city;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDetailEntityCopyWith<_StoreDetailEntity> get copyWith => __$StoreDetailEntityCopyWithImpl<_StoreDetailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._businessHours, _businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverUrl,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_businessHours),bookingSettings,latitude,longitude,district,city,isFavorite);

@override
String toString() {
  return 'StoreDetailEntity(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverUrl: $coverUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings, latitude: $latitude, longitude: $longitude, district: $district, city: $city, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$StoreDetailEntityCopyWith<$Res> implements $StoreDetailEntityCopyWith<$Res> {
  factory _$StoreDetailEntityCopyWith(_StoreDetailEntity value, $Res Function(_StoreDetailEntity) _then) = __$StoreDetailEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverUrl, List<String> images, List<StoreBusinessHourEntity> businessHours, StoreBookingSettingsEntity? bookingSettings, double? latitude, double? longitude, String? district, String? city, bool isFavorite
});


@override $StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings;

}
/// @nodoc
class __$StoreDetailEntityCopyWithImpl<$Res>
    implements _$StoreDetailEntityCopyWith<$Res> {
  __$StoreDetailEntityCopyWithImpl(this._self, this._then);

  final _StoreDetailEntity _self;
  final $Res Function(_StoreDetailEntity) _then;

/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? images = null,Object? businessHours = null,Object? bookingSettings = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? district = freezed,Object? city = freezed,Object? isFavorite = null,}) {
  return _then(_StoreDetailEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: null == businessHours ? _self._businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsEntity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of StoreDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings {
    if (_self.bookingSettings == null) {
    return null;
  }

  return $StoreBookingSettingsEntityCopyWith<$Res>(_self.bookingSettings!, (value) {
    return _then(_self.copyWith(bookingSettings: value));
  });
}
}

// dart format on
