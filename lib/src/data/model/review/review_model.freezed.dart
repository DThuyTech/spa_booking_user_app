// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewModel {

 String get id;@JsonKey(name: 'customerName', defaultValue: 'Customer') String get customerName;@JsonKey(name: 'avatarUrl') String? get avatarUrl;@JsonKey(name: 'rating', defaultValue: 5) int get rating;@JsonKey(name: 'comment', defaultValue: '') String get comment;@JsonKey(name: 'images', defaultValue: []) List<String>? get images;@JsonKey(name: 'serviceNames', defaultValue: []) List<String>? get serviceNames;@JsonKey(name: 'staffName') String? get staffName;@JsonKey(name: 'createdAt') String? get createdAt;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.serviceNames, serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,avatarUrl,rating,comment,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(serviceNames),staffName,createdAt);

@override
String toString() {
  return 'ReviewModel(id: $id, customerName: $customerName, avatarUrl: $avatarUrl, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'customerName', defaultValue: 'Customer') String customerName,@JsonKey(name: 'avatarUrl') String? avatarUrl,@JsonKey(name: 'rating', defaultValue: 5) int rating,@JsonKey(name: 'comment', defaultValue: '') String comment,@JsonKey(name: 'images', defaultValue: []) List<String>? images,@JsonKey(name: 'serviceNames', defaultValue: []) List<String>? serviceNames,@JsonKey(name: 'staffName') String? staffName,@JsonKey(name: 'createdAt') String? createdAt
});




}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? avatarUrl = freezed,Object? rating = null,Object? comment = null,Object? images = freezed,Object? serviceNames = freezed,Object? staffName = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,serviceNames: freezed == serviceNames ? _self.serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>?,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customerName', defaultValue: 'Customer')  String customerName, @JsonKey(name: 'avatarUrl')  String? avatarUrl, @JsonKey(name: 'rating', defaultValue: 5)  int rating, @JsonKey(name: 'comment', defaultValue: '')  String comment, @JsonKey(name: 'images', defaultValue: [])  List<String>? images, @JsonKey(name: 'serviceNames', defaultValue: [])  List<String>? serviceNames, @JsonKey(name: 'staffName')  String? staffName, @JsonKey(name: 'createdAt')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customerName', defaultValue: 'Customer')  String customerName, @JsonKey(name: 'avatarUrl')  String? avatarUrl, @JsonKey(name: 'rating', defaultValue: 5)  int rating, @JsonKey(name: 'comment', defaultValue: '')  String comment, @JsonKey(name: 'images', defaultValue: [])  List<String>? images, @JsonKey(name: 'serviceNames', defaultValue: [])  List<String>? serviceNames, @JsonKey(name: 'staffName')  String? staffName, @JsonKey(name: 'createdAt')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'customerName', defaultValue: 'Customer')  String customerName, @JsonKey(name: 'avatarUrl')  String? avatarUrl, @JsonKey(name: 'rating', defaultValue: 5)  int rating, @JsonKey(name: 'comment', defaultValue: '')  String comment, @JsonKey(name: 'images', defaultValue: [])  List<String>? images, @JsonKey(name: 'serviceNames', defaultValue: [])  List<String>? serviceNames, @JsonKey(name: 'staffName')  String? staffName, @JsonKey(name: 'createdAt')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.id,_that.customerName,_that.avatarUrl,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewModel extends ReviewModel {
  const _ReviewModel({required this.id, @JsonKey(name: 'customerName', defaultValue: 'Customer') required this.customerName, @JsonKey(name: 'avatarUrl') this.avatarUrl, @JsonKey(name: 'rating', defaultValue: 5) required this.rating, @JsonKey(name: 'comment', defaultValue: '') required this.comment, @JsonKey(name: 'images', defaultValue: []) final  List<String>? images, @JsonKey(name: 'serviceNames', defaultValue: []) final  List<String>? serviceNames, @JsonKey(name: 'staffName') this.staffName, @JsonKey(name: 'createdAt') this.createdAt}): _images = images,_serviceNames = serviceNames,super._();
  

@override final  String id;
@override@JsonKey(name: 'customerName', defaultValue: 'Customer') final  String customerName;
@override@JsonKey(name: 'avatarUrl') final  String? avatarUrl;
@override@JsonKey(name: 'rating', defaultValue: 5) final  int rating;
@override@JsonKey(name: 'comment', defaultValue: '') final  String comment;
 final  List<String>? _images;
@override@JsonKey(name: 'images', defaultValue: []) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _serviceNames;
@override@JsonKey(name: 'serviceNames', defaultValue: []) List<String>? get serviceNames {
  final value = _serviceNames;
  if (value == null) return null;
  if (_serviceNames is EqualUnmodifiableListView) return _serviceNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'staffName') final  String? staffName;
@override@JsonKey(name: 'createdAt') final  String? createdAt;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._serviceNames, _serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,avatarUrl,rating,comment,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_serviceNames),staffName,createdAt);

@override
String toString() {
  return 'ReviewModel(id: $id, customerName: $customerName, avatarUrl: $avatarUrl, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'customerName', defaultValue: 'Customer') String customerName,@JsonKey(name: 'avatarUrl') String? avatarUrl,@JsonKey(name: 'rating', defaultValue: 5) int rating,@JsonKey(name: 'comment', defaultValue: '') String comment,@JsonKey(name: 'images', defaultValue: []) List<String>? images,@JsonKey(name: 'serviceNames', defaultValue: []) List<String>? serviceNames,@JsonKey(name: 'staffName') String? staffName,@JsonKey(name: 'createdAt') String? createdAt
});




}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? avatarUrl = freezed,Object? rating = null,Object? comment = null,Object? images = freezed,Object? serviceNames = freezed,Object? staffName = freezed,Object? createdAt = freezed,}) {
  return _then(_ReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,serviceNames: freezed == serviceNames ? _self._serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>?,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ReviewListResponseModel {

 String get storeId; double get averageRating; int get totalReviews;@JsonKey(name: 'ratingDistribution') Map<String, dynamic>? get ratingDistribution; List<ReviewModel> get items; Map<String, dynamic>? get pagination;
/// Create a copy of ReviewListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewListResponseModelCopyWith<ReviewListResponseModel> get copyWith => _$ReviewListResponseModelCopyWithImpl<ReviewListResponseModel>(this as ReviewListResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewListResponseModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&const DeepCollectionEquality().equals(other.ratingDistribution, ratingDistribution)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,averageRating,totalReviews,const DeepCollectionEquality().hash(ratingDistribution),const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'ReviewListResponseModel(storeId: $storeId, averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $ReviewListResponseModelCopyWith<$Res>  {
  factory $ReviewListResponseModelCopyWith(ReviewListResponseModel value, $Res Function(ReviewListResponseModel) _then) = _$ReviewListResponseModelCopyWithImpl;
@useResult
$Res call({
 String storeId, double averageRating, int totalReviews,@JsonKey(name: 'ratingDistribution') Map<String, dynamic>? ratingDistribution, List<ReviewModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$ReviewListResponseModelCopyWithImpl<$Res>
    implements $ReviewListResponseModelCopyWith<$Res> {
  _$ReviewListResponseModelCopyWithImpl(this._self, this._then);

  final ReviewListResponseModel _self;
  final $Res Function(ReviewListResponseModel) _then;

/// Create a copy of ReviewListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = freezed,Object? items = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: freezed == ratingDistribution ? _self.ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewListResponseModel].
extension ReviewListResponseModelPatterns on ReviewListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  double averageRating,  int totalReviews, @JsonKey(name: 'ratingDistribution')  Map<String, dynamic>? ratingDistribution,  List<ReviewModel> items,  Map<String, dynamic>? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewListResponseModel() when $default != null:
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  double averageRating,  int totalReviews, @JsonKey(name: 'ratingDistribution')  Map<String, dynamic>? ratingDistribution,  List<ReviewModel> items,  Map<String, dynamic>? pagination)  $default,) {final _that = this;
switch (_that) {
case _ReviewListResponseModel():
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  double averageRating,  int totalReviews, @JsonKey(name: 'ratingDistribution')  Map<String, dynamic>? ratingDistribution,  List<ReviewModel> items,  Map<String, dynamic>? pagination)?  $default,) {final _that = this;
switch (_that) {
case _ReviewListResponseModel() when $default != null:
return $default(_that.storeId,_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewListResponseModel extends ReviewListResponseModel {
  const _ReviewListResponseModel({required this.storeId, this.averageRating = 5.0, this.totalReviews = 0, @JsonKey(name: 'ratingDistribution') final  Map<String, dynamic>? ratingDistribution, final  List<ReviewModel> items = const [], final  Map<String, dynamic>? pagination}): _ratingDistribution = ratingDistribution,_items = items,_pagination = pagination,super._();
  

@override final  String storeId;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int totalReviews;
 final  Map<String, dynamic>? _ratingDistribution;
@override@JsonKey(name: 'ratingDistribution') Map<String, dynamic>? get ratingDistribution {
  final value = _ratingDistribution;
  if (value == null) return null;
  if (_ratingDistribution is EqualUnmodifiableMapView) return _ratingDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<ReviewModel> _items;
@override@JsonKey() List<ReviewModel> get items {
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


/// Create a copy of ReviewListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewListResponseModelCopyWith<_ReviewListResponseModel> get copyWith => __$ReviewListResponseModelCopyWithImpl<_ReviewListResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewListResponseModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&const DeepCollectionEquality().equals(other._ratingDistribution, _ratingDistribution)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,averageRating,totalReviews,const DeepCollectionEquality().hash(_ratingDistribution),const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'ReviewListResponseModel(storeId: $storeId, averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$ReviewListResponseModelCopyWith<$Res> implements $ReviewListResponseModelCopyWith<$Res> {
  factory _$ReviewListResponseModelCopyWith(_ReviewListResponseModel value, $Res Function(_ReviewListResponseModel) _then) = __$ReviewListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String storeId, double averageRating, int totalReviews,@JsonKey(name: 'ratingDistribution') Map<String, dynamic>? ratingDistribution, List<ReviewModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class __$ReviewListResponseModelCopyWithImpl<$Res>
    implements _$ReviewListResponseModelCopyWith<$Res> {
  __$ReviewListResponseModelCopyWithImpl(this._self, this._then);

  final _ReviewListResponseModel _self;
  final $Res Function(_ReviewListResponseModel) _then;

/// Create a copy of ReviewListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = freezed,Object? items = null,Object? pagination = freezed,}) {
  return _then(_ReviewListResponseModel(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: freezed == ratingDistribution ? _self._ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
