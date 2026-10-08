// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreEntity {

 String get id; String get name; String get slug; String? get logoUrl; String? get coverUrl; String get address; String get phoneNumber; double get rating; int get reviewCount; String? get priceRange; bool get isFavorite; String? get city; String? get district; String? get description; String? get email; double? get latitude; double? get longitude; double? get distanceKm; int? get minPrice; DateTime? get lastBookingAt; String? get lastBookingCode; String? get lastBookingStatus; int? get totalBookingsCount;
/// Create a copy of StoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreEntityCopyWith<StoreEntity> get copyWith => _$StoreEntityCopyWithImpl<StoreEntity>(this as StoreEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.priceRange, priceRange) || other.priceRange == priceRange)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.description, description) || other.description == description)&&(identical(other.email, email) || other.email == email)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.lastBookingAt, lastBookingAt) || other.lastBookingAt == lastBookingAt)&&(identical(other.lastBookingCode, lastBookingCode) || other.lastBookingCode == lastBookingCode)&&(identical(other.lastBookingStatus, lastBookingStatus) || other.lastBookingStatus == lastBookingStatus)&&(identical(other.totalBookingsCount, totalBookingsCount) || other.totalBookingsCount == totalBookingsCount));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,logoUrl,coverUrl,address,phoneNumber,rating,reviewCount,priceRange,isFavorite,city,district,description,email,latitude,longitude,distanceKm,minPrice,lastBookingAt,lastBookingCode,lastBookingStatus,totalBookingsCount]);

@override
String toString() {
  return 'StoreEntity(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, coverUrl: $coverUrl, address: $address, phoneNumber: $phoneNumber, rating: $rating, reviewCount: $reviewCount, priceRange: $priceRange, isFavorite: $isFavorite, city: $city, district: $district, description: $description, email: $email, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, minPrice: $minPrice, lastBookingAt: $lastBookingAt, lastBookingCode: $lastBookingCode, lastBookingStatus: $lastBookingStatus, totalBookingsCount: $totalBookingsCount)';
}


}

/// @nodoc
abstract mixin class $StoreEntityCopyWith<$Res>  {
  factory $StoreEntityCopyWith(StoreEntity value, $Res Function(StoreEntity) _then) = _$StoreEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? logoUrl, String? coverUrl, String address, String phoneNumber, double rating, int reviewCount, String? priceRange, bool isFavorite, String? city, String? district, String? description, String? email, double? latitude, double? longitude, double? distanceKm, int? minPrice, DateTime? lastBookingAt, String? lastBookingCode, String? lastBookingStatus, int? totalBookingsCount
});




}
/// @nodoc
class _$StoreEntityCopyWithImpl<$Res>
    implements $StoreEntityCopyWith<$Res> {
  _$StoreEntityCopyWithImpl(this._self, this._then);

  final StoreEntity _self;
  final $Res Function(StoreEntity) _then;

/// Create a copy of StoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? address = null,Object? phoneNumber = null,Object? rating = null,Object? reviewCount = null,Object? priceRange = freezed,Object? isFavorite = null,Object? city = freezed,Object? district = freezed,Object? description = freezed,Object? email = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? minPrice = freezed,Object? lastBookingAt = freezed,Object? lastBookingCode = freezed,Object? lastBookingStatus = freezed,Object? totalBookingsCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,priceRange: freezed == priceRange ? _self.priceRange : priceRange // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,lastBookingAt: freezed == lastBookingAt ? _self.lastBookingAt : lastBookingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastBookingCode: freezed == lastBookingCode ? _self.lastBookingCode : lastBookingCode // ignore: cast_nullable_to_non_nullable
as String?,lastBookingStatus: freezed == lastBookingStatus ? _self.lastBookingStatus : lastBookingStatus // ignore: cast_nullable_to_non_nullable
as String?,totalBookingsCount: freezed == totalBookingsCount ? _self.totalBookingsCount : totalBookingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreEntity].
extension StoreEntityPatterns on StoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? logoUrl,  String? coverUrl,  String address,  String phoneNumber,  double rating,  int reviewCount,  String? priceRange,  bool isFavorite,  String? city,  String? district,  String? description,  String? email,  double? latitude,  double? longitude,  double? distanceKm,  int? minPrice,  DateTime? lastBookingAt,  String? lastBookingCode,  String? lastBookingStatus,  int? totalBookingsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverUrl,_that.address,_that.phoneNumber,_that.rating,_that.reviewCount,_that.priceRange,_that.isFavorite,_that.city,_that.district,_that.description,_that.email,_that.latitude,_that.longitude,_that.distanceKm,_that.minPrice,_that.lastBookingAt,_that.lastBookingCode,_that.lastBookingStatus,_that.totalBookingsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? logoUrl,  String? coverUrl,  String address,  String phoneNumber,  double rating,  int reviewCount,  String? priceRange,  bool isFavorite,  String? city,  String? district,  String? description,  String? email,  double? latitude,  double? longitude,  double? distanceKm,  int? minPrice,  DateTime? lastBookingAt,  String? lastBookingCode,  String? lastBookingStatus,  int? totalBookingsCount)  $default,) {final _that = this;
switch (_that) {
case _StoreEntity():
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverUrl,_that.address,_that.phoneNumber,_that.rating,_that.reviewCount,_that.priceRange,_that.isFavorite,_that.city,_that.district,_that.description,_that.email,_that.latitude,_that.longitude,_that.distanceKm,_that.minPrice,_that.lastBookingAt,_that.lastBookingCode,_that.lastBookingStatus,_that.totalBookingsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? logoUrl,  String? coverUrl,  String address,  String phoneNumber,  double rating,  int reviewCount,  String? priceRange,  bool isFavorite,  String? city,  String? district,  String? description,  String? email,  double? latitude,  double? longitude,  double? distanceKm,  int? minPrice,  DateTime? lastBookingAt,  String? lastBookingCode,  String? lastBookingStatus,  int? totalBookingsCount)?  $default,) {final _that = this;
switch (_that) {
case _StoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.coverUrl,_that.address,_that.phoneNumber,_that.rating,_that.reviewCount,_that.priceRange,_that.isFavorite,_that.city,_that.district,_that.description,_that.email,_that.latitude,_that.longitude,_that.distanceKm,_that.minPrice,_that.lastBookingAt,_that.lastBookingCode,_that.lastBookingStatus,_that.totalBookingsCount);case _:
  return null;

}
}

}

/// @nodoc


class _StoreEntity implements StoreEntity {
  const _StoreEntity({required this.id, required this.name, required this.slug, this.logoUrl, this.coverUrl, required this.address, required this.phoneNumber, this.rating = 5.0, this.reviewCount = 0, this.priceRange, this.isFavorite = false, this.city, this.district, this.description, this.email, this.latitude, this.longitude, this.distanceKm, this.minPrice, this.lastBookingAt, this.lastBookingCode, this.lastBookingStatus, this.totalBookingsCount});
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? logoUrl;
@override final  String? coverUrl;
@override final  String address;
@override final  String phoneNumber;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
@override final  String? priceRange;
@override@JsonKey() final  bool isFavorite;
@override final  String? city;
@override final  String? district;
@override final  String? description;
@override final  String? email;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
@override final  int? minPrice;
@override final  DateTime? lastBookingAt;
@override final  String? lastBookingCode;
@override final  String? lastBookingStatus;
@override final  int? totalBookingsCount;

/// Create a copy of StoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreEntityCopyWith<_StoreEntity> get copyWith => __$StoreEntityCopyWithImpl<_StoreEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.priceRange, priceRange) || other.priceRange == priceRange)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.description, description) || other.description == description)&&(identical(other.email, email) || other.email == email)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.lastBookingAt, lastBookingAt) || other.lastBookingAt == lastBookingAt)&&(identical(other.lastBookingCode, lastBookingCode) || other.lastBookingCode == lastBookingCode)&&(identical(other.lastBookingStatus, lastBookingStatus) || other.lastBookingStatus == lastBookingStatus)&&(identical(other.totalBookingsCount, totalBookingsCount) || other.totalBookingsCount == totalBookingsCount));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,logoUrl,coverUrl,address,phoneNumber,rating,reviewCount,priceRange,isFavorite,city,district,description,email,latitude,longitude,distanceKm,minPrice,lastBookingAt,lastBookingCode,lastBookingStatus,totalBookingsCount]);

@override
String toString() {
  return 'StoreEntity(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, coverUrl: $coverUrl, address: $address, phoneNumber: $phoneNumber, rating: $rating, reviewCount: $reviewCount, priceRange: $priceRange, isFavorite: $isFavorite, city: $city, district: $district, description: $description, email: $email, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, minPrice: $minPrice, lastBookingAt: $lastBookingAt, lastBookingCode: $lastBookingCode, lastBookingStatus: $lastBookingStatus, totalBookingsCount: $totalBookingsCount)';
}


}

/// @nodoc
abstract mixin class _$StoreEntityCopyWith<$Res> implements $StoreEntityCopyWith<$Res> {
  factory _$StoreEntityCopyWith(_StoreEntity value, $Res Function(_StoreEntity) _then) = __$StoreEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? logoUrl, String? coverUrl, String address, String phoneNumber, double rating, int reviewCount, String? priceRange, bool isFavorite, String? city, String? district, String? description, String? email, double? latitude, double? longitude, double? distanceKm, int? minPrice, DateTime? lastBookingAt, String? lastBookingCode, String? lastBookingStatus, int? totalBookingsCount
});




}
/// @nodoc
class __$StoreEntityCopyWithImpl<$Res>
    implements _$StoreEntityCopyWith<$Res> {
  __$StoreEntityCopyWithImpl(this._self, this._then);

  final _StoreEntity _self;
  final $Res Function(_StoreEntity) _then;

/// Create a copy of StoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? address = null,Object? phoneNumber = null,Object? rating = null,Object? reviewCount = null,Object? priceRange = freezed,Object? isFavorite = null,Object? city = freezed,Object? district = freezed,Object? description = freezed,Object? email = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? minPrice = freezed,Object? lastBookingAt = freezed,Object? lastBookingCode = freezed,Object? lastBookingStatus = freezed,Object? totalBookingsCount = freezed,}) {
  return _then(_StoreEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,priceRange: freezed == priceRange ? _self.priceRange : priceRange // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,lastBookingAt: freezed == lastBookingAt ? _self.lastBookingAt : lastBookingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastBookingCode: freezed == lastBookingCode ? _self.lastBookingCode : lastBookingCode // ignore: cast_nullable_to_non_nullable
as String?,lastBookingStatus: freezed == lastBookingStatus ? _self.lastBookingStatus : lastBookingStatus // ignore: cast_nullable_to_non_nullable
as String?,totalBookingsCount: freezed == totalBookingsCount ? _self.totalBookingsCount : totalBookingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
