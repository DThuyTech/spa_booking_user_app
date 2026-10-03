// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewEntity {

 String get id; String get customerName; String? get avatarUrl; int get rating; String get comment; List<String> get images; List<String> get serviceNames; String? get staffName; DateTime get createdAt;
/// Create a copy of ReviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewEntityCopyWith<ReviewEntity> get copyWith => _$ReviewEntityCopyWithImpl<ReviewEntity>(this as ReviewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.serviceNames, serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,avatarUrl,rating,comment,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(serviceNames),staffName,createdAt);

@override
String toString() {
  return 'ReviewEntity(id: $id, customerName: $customerName, avatarUrl: $avatarUrl, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReviewEntityCopyWith<$Res>  {
  factory $ReviewEntityCopyWith(ReviewEntity value, $Res Function(ReviewEntity) _then) = _$ReviewEntityCopyWithImpl;
@useResult
$Res call({
 String id, String customerName, String? avatarUrl, int rating, String comment, List<String> images, List<String> serviceNames, String? staffName, DateTime createdAt
});




}
/// @nodoc
class _$ReviewEntityCopyWithImpl<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._self, this._then);

  final ReviewEntity _self;
  final $Res Function(ReviewEntity) _then;

/// Create a copy of ReviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? avatarUrl = freezed,Object? rating = null,Object? comment = null,Object? images = null,Object? serviceNames = null,Object? staffName = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,serviceNames: null == serviceNames ? _self.serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewEntity].
extension ReviewEntityPatterns on ReviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerName,  String? avatarUrl,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewEntity() when $default != null:
return $default(_that.id,_that.customerName,_that.avatarUrl,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerName,  String? avatarUrl,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewEntity():
return $default(_that.id,_that.customerName,_that.avatarUrl,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerName,  String? avatarUrl,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewEntity() when $default != null:
return $default(_that.id,_that.customerName,_that.avatarUrl,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewEntity implements ReviewEntity {
  const _ReviewEntity({required this.id, required this.customerName, this.avatarUrl, required this.rating, required this.comment, final  List<String> images = const [], final  List<String> serviceNames = const [], this.staffName, required this.createdAt}): _images = images,_serviceNames = serviceNames;
  

@override final  String id;
@override final  String customerName;
@override final  String? avatarUrl;
@override final  int rating;
@override final  String comment;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<String> _serviceNames;
@override@JsonKey() List<String> get serviceNames {
  if (_serviceNames is EqualUnmodifiableListView) return _serviceNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceNames);
}

@override final  String? staffName;
@override final  DateTime createdAt;

/// Create a copy of ReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewEntityCopyWith<_ReviewEntity> get copyWith => __$ReviewEntityCopyWithImpl<_ReviewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._serviceNames, _serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,avatarUrl,rating,comment,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_serviceNames),staffName,createdAt);

@override
String toString() {
  return 'ReviewEntity(id: $id, customerName: $customerName, avatarUrl: $avatarUrl, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewEntityCopyWith<$Res> implements $ReviewEntityCopyWith<$Res> {
  factory _$ReviewEntityCopyWith(_ReviewEntity value, $Res Function(_ReviewEntity) _then) = __$ReviewEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerName, String? avatarUrl, int rating, String comment, List<String> images, List<String> serviceNames, String? staffName, DateTime createdAt
});




}
/// @nodoc
class __$ReviewEntityCopyWithImpl<$Res>
    implements _$ReviewEntityCopyWith<$Res> {
  __$ReviewEntityCopyWithImpl(this._self, this._then);

  final _ReviewEntity _self;
  final $Res Function(_ReviewEntity) _then;

/// Create a copy of ReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? avatarUrl = freezed,Object? rating = null,Object? comment = null,Object? images = null,Object? serviceNames = null,Object? staffName = freezed,Object? createdAt = null,}) {
  return _then(_ReviewEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,serviceNames: null == serviceNames ? _self._serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$StoreRatingDistributionEntity {

 int get star5; int get star4; int get star3; int get star2; int get star1;
/// Create a copy of StoreRatingDistributionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreRatingDistributionEntityCopyWith<StoreRatingDistributionEntity> get copyWith => _$StoreRatingDistributionEntityCopyWithImpl<StoreRatingDistributionEntity>(this as StoreRatingDistributionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreRatingDistributionEntity&&(identical(other.star5, star5) || other.star5 == star5)&&(identical(other.star4, star4) || other.star4 == star4)&&(identical(other.star3, star3) || other.star3 == star3)&&(identical(other.star2, star2) || other.star2 == star2)&&(identical(other.star1, star1) || other.star1 == star1));
}


@override
int get hashCode => Object.hash(runtimeType,star5,star4,star3,star2,star1);

@override
String toString() {
  return 'StoreRatingDistributionEntity(star5: $star5, star4: $star4, star3: $star3, star2: $star2, star1: $star1)';
}


}

/// @nodoc
abstract mixin class $StoreRatingDistributionEntityCopyWith<$Res>  {
  factory $StoreRatingDistributionEntityCopyWith(StoreRatingDistributionEntity value, $Res Function(StoreRatingDistributionEntity) _then) = _$StoreRatingDistributionEntityCopyWithImpl;
@useResult
$Res call({
 int star5, int star4, int star3, int star2, int star1
});




}
/// @nodoc
class _$StoreRatingDistributionEntityCopyWithImpl<$Res>
    implements $StoreRatingDistributionEntityCopyWith<$Res> {
  _$StoreRatingDistributionEntityCopyWithImpl(this._self, this._then);

  final StoreRatingDistributionEntity _self;
  final $Res Function(StoreRatingDistributionEntity) _then;

/// Create a copy of StoreRatingDistributionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? star5 = null,Object? star4 = null,Object? star3 = null,Object? star2 = null,Object? star1 = null,}) {
  return _then(_self.copyWith(
star5: null == star5 ? _self.star5 : star5 // ignore: cast_nullable_to_non_nullable
as int,star4: null == star4 ? _self.star4 : star4 // ignore: cast_nullable_to_non_nullable
as int,star3: null == star3 ? _self.star3 : star3 // ignore: cast_nullable_to_non_nullable
as int,star2: null == star2 ? _self.star2 : star2 // ignore: cast_nullable_to_non_nullable
as int,star1: null == star1 ? _self.star1 : star1 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreRatingDistributionEntity].
extension StoreRatingDistributionEntityPatterns on StoreRatingDistributionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreRatingDistributionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreRatingDistributionEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreRatingDistributionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int star5,  int star4,  int star3,  int star2,  int star1)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity() when $default != null:
return $default(_that.star5,_that.star4,_that.star3,_that.star2,_that.star1);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int star5,  int star4,  int star3,  int star2,  int star1)  $default,) {final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity():
return $default(_that.star5,_that.star4,_that.star3,_that.star2,_that.star1);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int star5,  int star4,  int star3,  int star2,  int star1)?  $default,) {final _that = this;
switch (_that) {
case _StoreRatingDistributionEntity() when $default != null:
return $default(_that.star5,_that.star4,_that.star3,_that.star2,_that.star1);case _:
  return null;

}
}

}

/// @nodoc


class _StoreRatingDistributionEntity implements StoreRatingDistributionEntity {
  const _StoreRatingDistributionEntity({this.star5 = 0, this.star4 = 0, this.star3 = 0, this.star2 = 0, this.star1 = 0});
  

@override@JsonKey() final  int star5;
@override@JsonKey() final  int star4;
@override@JsonKey() final  int star3;
@override@JsonKey() final  int star2;
@override@JsonKey() final  int star1;

/// Create a copy of StoreRatingDistributionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreRatingDistributionEntityCopyWith<_StoreRatingDistributionEntity> get copyWith => __$StoreRatingDistributionEntityCopyWithImpl<_StoreRatingDistributionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreRatingDistributionEntity&&(identical(other.star5, star5) || other.star5 == star5)&&(identical(other.star4, star4) || other.star4 == star4)&&(identical(other.star3, star3) || other.star3 == star3)&&(identical(other.star2, star2) || other.star2 == star2)&&(identical(other.star1, star1) || other.star1 == star1));
}


@override
int get hashCode => Object.hash(runtimeType,star5,star4,star3,star2,star1);

@override
String toString() {
  return 'StoreRatingDistributionEntity(star5: $star5, star4: $star4, star3: $star3, star2: $star2, star1: $star1)';
}


}

/// @nodoc
abstract mixin class _$StoreRatingDistributionEntityCopyWith<$Res> implements $StoreRatingDistributionEntityCopyWith<$Res> {
  factory _$StoreRatingDistributionEntityCopyWith(_StoreRatingDistributionEntity value, $Res Function(_StoreRatingDistributionEntity) _then) = __$StoreRatingDistributionEntityCopyWithImpl;
@override @useResult
$Res call({
 int star5, int star4, int star3, int star2, int star1
});




}
/// @nodoc
class __$StoreRatingDistributionEntityCopyWithImpl<$Res>
    implements _$StoreRatingDistributionEntityCopyWith<$Res> {
  __$StoreRatingDistributionEntityCopyWithImpl(this._self, this._then);

  final _StoreRatingDistributionEntity _self;
  final $Res Function(_StoreRatingDistributionEntity) _then;

/// Create a copy of StoreRatingDistributionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? star5 = null,Object? star4 = null,Object? star3 = null,Object? star2 = null,Object? star1 = null,}) {
  return _then(_StoreRatingDistributionEntity(
star5: null == star5 ? _self.star5 : star5 // ignore: cast_nullable_to_non_nullable
as int,star4: null == star4 ? _self.star4 : star4 // ignore: cast_nullable_to_non_nullable
as int,star3: null == star3 ? _self.star3 : star3 // ignore: cast_nullable_to_non_nullable
as int,star2: null == star2 ? _self.star2 : star2 // ignore: cast_nullable_to_non_nullable
as int,star1: null == star1 ? _self.star1 : star1 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ReviewListEntity {

 String get storeId; double get averageRating; int get totalReviews; StoreRatingDistributionEntity get ratingDistribution; List<ReviewEntity> get items; int get page; int get totalPages;
/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewListEntityCopyWith<ReviewListEntity> get copyWith => _$ReviewListEntityCopyWithImpl<ReviewListEntity>(this as ReviewListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewListEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.ratingDistribution, ratingDistribution) || other.ratingDistribution == ratingDistribution)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,averageRating,totalReviews,ratingDistribution,const DeepCollectionEquality().hash(items),page,totalPages);

@override
String toString() {
  return 'ReviewListEntity(storeId: $storeId, averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, items: $items, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ReviewListEntityCopyWith<$Res>  {
  factory $ReviewListEntityCopyWith(ReviewListEntity value, $Res Function(ReviewListEntity) _then) = _$ReviewListEntityCopyWithImpl;
@useResult
$Res call({
 String storeId, double averageRating, int totalReviews, StoreRatingDistributionEntity ratingDistribution, List<ReviewEntity> items, int page, int totalPages
});


$StoreRatingDistributionEntityCopyWith<$Res> get ratingDistribution;

}
/// @nodoc
class _$ReviewListEntityCopyWithImpl<$Res>
    implements $ReviewListEntityCopyWith<$Res> {
  _$ReviewListEntityCopyWithImpl(this._self, this._then);

  final ReviewListEntity _self;
  final $Res Function(ReviewListEntity) _then;

/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = null,Object? items = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: null == ratingDistribution ? _self.ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as StoreRatingDistributionEntity,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreRatingDistributionEntityCopyWith<$Res> get ratingDistribution {
  
  return $StoreRatingDistributionEntityCopyWith<$Res>(_self.ratingDistribution, (value) {
    return _then(_self.copyWith(ratingDistribution: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewListEntity].
extension ReviewListEntityPatterns on ReviewListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewListEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReviewListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  double averageRating,  int totalReviews,  StoreRatingDistributionEntity ratingDistribution,  List<ReviewEntity> items,  int page,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewListEntity() when $default != null:
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.page,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  double averageRating,  int totalReviews,  StoreRatingDistributionEntity ratingDistribution,  List<ReviewEntity> items,  int page,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _ReviewListEntity():
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.page,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  double averageRating,  int totalReviews,  StoreRatingDistributionEntity ratingDistribution,  List<ReviewEntity> items,  int page,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ReviewListEntity() when $default != null:
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.page,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewListEntity implements ReviewListEntity {
  const _ReviewListEntity({required this.storeId, this.averageRating = 5.0, this.totalReviews = 0, this.ratingDistribution = const StoreRatingDistributionEntity(), final  List<ReviewEntity> items = const [], this.page = 1, this.totalPages = 1}): _items = items;
  

@override final  String storeId;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  StoreRatingDistributionEntity ratingDistribution;
 final  List<ReviewEntity> _items;
@override@JsonKey() List<ReviewEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;

/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewListEntityCopyWith<_ReviewListEntity> get copyWith => __$ReviewListEntityCopyWithImpl<_ReviewListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewListEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.ratingDistribution, ratingDistribution) || other.ratingDistribution == ratingDistribution)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,averageRating,totalReviews,ratingDistribution,const DeepCollectionEquality().hash(_items),page,totalPages);

@override
String toString() {
  return 'ReviewListEntity(storeId: $storeId, averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, items: $items, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ReviewListEntityCopyWith<$Res> implements $ReviewListEntityCopyWith<$Res> {
  factory _$ReviewListEntityCopyWith(_ReviewListEntity value, $Res Function(_ReviewListEntity) _then) = __$ReviewListEntityCopyWithImpl;
@override @useResult
$Res call({
 String storeId, double averageRating, int totalReviews, StoreRatingDistributionEntity ratingDistribution, List<ReviewEntity> items, int page, int totalPages
});


@override $StoreRatingDistributionEntityCopyWith<$Res> get ratingDistribution;

}
/// @nodoc
class __$ReviewListEntityCopyWithImpl<$Res>
    implements _$ReviewListEntityCopyWith<$Res> {
  __$ReviewListEntityCopyWithImpl(this._self, this._then);

  final _ReviewListEntity _self;
  final $Res Function(_ReviewListEntity) _then;

/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = null,Object? items = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_ReviewListEntity(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: null == ratingDistribution ? _self.ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as StoreRatingDistributionEntity,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreRatingDistributionEntityCopyWith<$Res> get ratingDistribution {
  
  return $StoreRatingDistributionEntityCopyWith<$Res>(_self.ratingDistribution, (value) {
    return _then(_self.copyWith(ratingDistribution: value));
  });
}
}

// dart format on
