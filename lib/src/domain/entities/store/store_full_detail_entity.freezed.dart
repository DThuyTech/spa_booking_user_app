// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_full_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreFullDetailEntity {

 String get id; String get name; String get slug; String? get description; String get address; String get phoneNumber; String? get logoUrl; String? get coverImageUrl; List<String> get images; BusinessHoursSummaryEntity? get businessHours; StoreBookingSettingsEntity? get bookingSettings; double? get latitude; double? get longitude; String? get district; String? get city; List<ServiceCategoryEntity> get categories; List<ServiceEntity> get services; List<StaffEntity> get staff; StoreReviewsOverviewEntity? get reviewSummary; bool get isFavorite; double get averageRating; double get minPrice;
/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreFullDetailEntityCopyWith<StoreFullDetailEntity> get copyWith => _$StoreFullDetailEntityCopyWithImpl<StoreFullDetailEntity>(this as StoreFullDetailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreFullDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.staff, staff)&&(identical(other.reviewSummary, reviewSummary) || other.reviewSummary == reviewSummary)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverImageUrl,const DeepCollectionEquality().hash(images),businessHours,bookingSettings,latitude,longitude,district,city,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(staff),reviewSummary,isFavorite,averageRating,minPrice]);

@override
String toString() {
  return 'StoreFullDetailEntity(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings, latitude: $latitude, longitude: $longitude, district: $district, city: $city, categories: $categories, services: $services, staff: $staff, reviewSummary: $reviewSummary, isFavorite: $isFavorite, averageRating: $averageRating, minPrice: $minPrice)';
}


}

/// @nodoc
abstract mixin class $StoreFullDetailEntityCopyWith<$Res>  {
  factory $StoreFullDetailEntityCopyWith(StoreFullDetailEntity value, $Res Function(StoreFullDetailEntity) _then) = _$StoreFullDetailEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverImageUrl, List<String> images, BusinessHoursSummaryEntity? businessHours, StoreBookingSettingsEntity? bookingSettings, double? latitude, double? longitude, String? district, String? city, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, List<StaffEntity> staff, StoreReviewsOverviewEntity? reviewSummary, bool isFavorite, double averageRating, double minPrice
});


$BusinessHoursSummaryEntityCopyWith<$Res>? get businessHours;$StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings;$StoreReviewsOverviewEntityCopyWith<$Res>? get reviewSummary;

}
/// @nodoc
class _$StoreFullDetailEntityCopyWithImpl<$Res>
    implements $StoreFullDetailEntityCopyWith<$Res> {
  _$StoreFullDetailEntityCopyWithImpl(this._self, this._then);

  final StoreFullDetailEntity _self;
  final $Res Function(StoreFullDetailEntity) _then;

/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? images = null,Object? businessHours = freezed,Object? bookingSettings = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? district = freezed,Object? city = freezed,Object? categories = null,Object? services = null,Object? staff = null,Object? reviewSummary = freezed,Object? isFavorite = null,Object? averageRating = null,Object? minPrice = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as BusinessHoursSummaryEntity?,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsEntity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,staff: null == staff ? _self.staff : staff // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,reviewSummary: freezed == reviewSummary ? _self.reviewSummary : reviewSummary // ignore: cast_nullable_to_non_nullable
as StoreReviewsOverviewEntity?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessHoursSummaryEntityCopyWith<$Res>? get businessHours {
    if (_self.businessHours == null) {
    return null;
  }

  return $BusinessHoursSummaryEntityCopyWith<$Res>(_self.businessHours!, (value) {
    return _then(_self.copyWith(businessHours: value));
  });
}/// Create a copy of StoreFullDetailEntity
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
}/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreReviewsOverviewEntityCopyWith<$Res>? get reviewSummary {
    if (_self.reviewSummary == null) {
    return null;
  }

  return $StoreReviewsOverviewEntityCopyWith<$Res>(_self.reviewSummary!, (value) {
    return _then(_self.copyWith(reviewSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreFullDetailEntity].
extension StoreFullDetailEntityPatterns on StoreFullDetailEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreFullDetailEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreFullDetailEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreFullDetailEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreFullDetailEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreFullDetailEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreFullDetailEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverImageUrl,  List<String> images,  BusinessHoursSummaryEntity? businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  StoreReviewsOverviewEntity? reviewSummary,  bool isFavorite,  double averageRating,  double minPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreFullDetailEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverImageUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.categories,_that.services,_that.staff,_that.reviewSummary,_that.isFavorite,_that.averageRating,_that.minPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverImageUrl,  List<String> images,  BusinessHoursSummaryEntity? businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  StoreReviewsOverviewEntity? reviewSummary,  bool isFavorite,  double averageRating,  double minPrice)  $default,) {final _that = this;
switch (_that) {
case _StoreFullDetailEntity():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverImageUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.categories,_that.services,_that.staff,_that.reviewSummary,_that.isFavorite,_that.averageRating,_that.minPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverImageUrl,  List<String> images,  BusinessHoursSummaryEntity? businessHours,  StoreBookingSettingsEntity? bookingSettings,  double? latitude,  double? longitude,  String? district,  String? city,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  StoreReviewsOverviewEntity? reviewSummary,  bool isFavorite,  double averageRating,  double minPrice)?  $default,) {final _that = this;
switch (_that) {
case _StoreFullDetailEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverImageUrl,_that.images,_that.businessHours,_that.bookingSettings,_that.latitude,_that.longitude,_that.district,_that.city,_that.categories,_that.services,_that.staff,_that.reviewSummary,_that.isFavorite,_that.averageRating,_that.minPrice);case _:
  return null;

}
}

}

/// @nodoc


class _StoreFullDetailEntity implements StoreFullDetailEntity {
  const _StoreFullDetailEntity({required this.id, required this.name, required this.slug, this.description, required this.address, required this.phoneNumber, this.logoUrl, this.coverImageUrl, final  List<String> images = const [], this.businessHours, this.bookingSettings, this.latitude, this.longitude, this.district, this.city, final  List<ServiceCategoryEntity> categories = const [], final  List<ServiceEntity> services = const [], final  List<StaffEntity> staff = const [], this.reviewSummary, this.isFavorite = false, this.averageRating = 0, this.minPrice = 0}): _images = images,_categories = categories,_services = services,_staff = staff;
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String address;
@override final  String phoneNumber;
@override final  String? logoUrl;
@override final  String? coverImageUrl;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  BusinessHoursSummaryEntity? businessHours;
@override final  StoreBookingSettingsEntity? bookingSettings;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? district;
@override final  String? city;
 final  List<ServiceCategoryEntity> _categories;
@override@JsonKey() List<ServiceCategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<StaffEntity> _staff;
@override@JsonKey() List<StaffEntity> get staff {
  if (_staff is EqualUnmodifiableListView) return _staff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staff);
}

@override final  StoreReviewsOverviewEntity? reviewSummary;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  double minPrice;

/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreFullDetailEntityCopyWith<_StoreFullDetailEntity> get copyWith => __$StoreFullDetailEntityCopyWithImpl<_StoreFullDetailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreFullDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._staff, _staff)&&(identical(other.reviewSummary, reviewSummary) || other.reviewSummary == reviewSummary)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverImageUrl,const DeepCollectionEquality().hash(_images),businessHours,bookingSettings,latitude,longitude,district,city,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_staff),reviewSummary,isFavorite,averageRating,minPrice]);

@override
String toString() {
  return 'StoreFullDetailEntity(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings, latitude: $latitude, longitude: $longitude, district: $district, city: $city, categories: $categories, services: $services, staff: $staff, reviewSummary: $reviewSummary, isFavorite: $isFavorite, averageRating: $averageRating, minPrice: $minPrice)';
}


}

/// @nodoc
abstract mixin class _$StoreFullDetailEntityCopyWith<$Res> implements $StoreFullDetailEntityCopyWith<$Res> {
  factory _$StoreFullDetailEntityCopyWith(_StoreFullDetailEntity value, $Res Function(_StoreFullDetailEntity) _then) = __$StoreFullDetailEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverImageUrl, List<String> images, BusinessHoursSummaryEntity? businessHours, StoreBookingSettingsEntity? bookingSettings, double? latitude, double? longitude, String? district, String? city, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, List<StaffEntity> staff, StoreReviewsOverviewEntity? reviewSummary, bool isFavorite, double averageRating, double minPrice
});


@override $BusinessHoursSummaryEntityCopyWith<$Res>? get businessHours;@override $StoreBookingSettingsEntityCopyWith<$Res>? get bookingSettings;@override $StoreReviewsOverviewEntityCopyWith<$Res>? get reviewSummary;

}
/// @nodoc
class __$StoreFullDetailEntityCopyWithImpl<$Res>
    implements _$StoreFullDetailEntityCopyWith<$Res> {
  __$StoreFullDetailEntityCopyWithImpl(this._self, this._then);

  final _StoreFullDetailEntity _self;
  final $Res Function(_StoreFullDetailEntity) _then;

/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? images = null,Object? businessHours = freezed,Object? bookingSettings = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? district = freezed,Object? city = freezed,Object? categories = null,Object? services = null,Object? staff = null,Object? reviewSummary = freezed,Object? isFavorite = null,Object? averageRating = null,Object? minPrice = null,}) {
  return _then(_StoreFullDetailEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as BusinessHoursSummaryEntity?,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsEntity?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,staff: null == staff ? _self._staff : staff // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,reviewSummary: freezed == reviewSummary ? _self.reviewSummary : reviewSummary // ignore: cast_nullable_to_non_nullable
as StoreReviewsOverviewEntity?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessHoursSummaryEntityCopyWith<$Res>? get businessHours {
    if (_self.businessHours == null) {
    return null;
  }

  return $BusinessHoursSummaryEntityCopyWith<$Res>(_self.businessHours!, (value) {
    return _then(_self.copyWith(businessHours: value));
  });
}/// Create a copy of StoreFullDetailEntity
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
}/// Create a copy of StoreFullDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreReviewsOverviewEntityCopyWith<$Res>? get reviewSummary {
    if (_self.reviewSummary == null) {
    return null;
  }

  return $StoreReviewsOverviewEntityCopyWith<$Res>(_self.reviewSummary!, (value) {
    return _then(_self.copyWith(reviewSummary: value));
  });
}
}

// dart format on
