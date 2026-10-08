// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_review_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserReviewStoreEntity {

 String get id; String get name; String? get address; String? get logoUrl; String? get coverImageUrl;
/// Create a copy of UserReviewStoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserReviewStoreEntityCopyWith<UserReviewStoreEntity> get copyWith => _$UserReviewStoreEntityCopyWithImpl<UserReviewStoreEntity>(this as UserReviewStoreEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReviewStoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,logoUrl,coverImageUrl);

@override
String toString() {
  return 'UserReviewStoreEntity(id: $id, name: $name, address: $address, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl)';
}


}

/// @nodoc
abstract mixin class $UserReviewStoreEntityCopyWith<$Res>  {
  factory $UserReviewStoreEntityCopyWith(UserReviewStoreEntity value, $Res Function(UserReviewStoreEntity) _then) = _$UserReviewStoreEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? address, String? logoUrl, String? coverImageUrl
});




}
/// @nodoc
class _$UserReviewStoreEntityCopyWithImpl<$Res>
    implements $UserReviewStoreEntityCopyWith<$Res> {
  _$UserReviewStoreEntityCopyWithImpl(this._self, this._then);

  final UserReviewStoreEntity _self;
  final $Res Function(UserReviewStoreEntity) _then;

/// Create a copy of UserReviewStoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserReviewStoreEntity].
extension UserReviewStoreEntityPatterns on UserReviewStoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserReviewStoreEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserReviewStoreEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserReviewStoreEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserReviewStoreEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserReviewStoreEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserReviewStoreEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? address,  String? logoUrl,  String? coverImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserReviewStoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.logoUrl,_that.coverImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? address,  String? logoUrl,  String? coverImageUrl)  $default,) {final _that = this;
switch (_that) {
case _UserReviewStoreEntity():
return $default(_that.id,_that.name,_that.address,_that.logoUrl,_that.coverImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? address,  String? logoUrl,  String? coverImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserReviewStoreEntity() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.logoUrl,_that.coverImageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _UserReviewStoreEntity implements UserReviewStoreEntity {
  const _UserReviewStoreEntity({required this.id, required this.name, this.address, this.logoUrl, this.coverImageUrl});
  

@override final  String id;
@override final  String name;
@override final  String? address;
@override final  String? logoUrl;
@override final  String? coverImageUrl;

/// Create a copy of UserReviewStoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserReviewStoreEntityCopyWith<_UserReviewStoreEntity> get copyWith => __$UserReviewStoreEntityCopyWithImpl<_UserReviewStoreEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReviewStoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,logoUrl,coverImageUrl);

@override
String toString() {
  return 'UserReviewStoreEntity(id: $id, name: $name, address: $address, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl)';
}


}

/// @nodoc
abstract mixin class _$UserReviewStoreEntityCopyWith<$Res> implements $UserReviewStoreEntityCopyWith<$Res> {
  factory _$UserReviewStoreEntityCopyWith(_UserReviewStoreEntity value, $Res Function(_UserReviewStoreEntity) _then) = __$UserReviewStoreEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? address, String? logoUrl, String? coverImageUrl
});




}
/// @nodoc
class __$UserReviewStoreEntityCopyWithImpl<$Res>
    implements _$UserReviewStoreEntityCopyWith<$Res> {
  __$UserReviewStoreEntityCopyWithImpl(this._self, this._then);

  final _UserReviewStoreEntity _self;
  final $Res Function(_UserReviewStoreEntity) _then;

/// Create a copy of UserReviewStoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,}) {
  return _then(_UserReviewStoreEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$UserReviewEntity {

 String get id; String get storeId; UserReviewStoreEntity? get store; String? get bookingId; int get rating; String get comment; List<String> get images; List<String> get serviceNames; String? get staffName; String? get merchantReply; DateTime? get merchantRepliedAt; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserReviewEntityCopyWith<UserReviewEntity> get copyWith => _$UserReviewEntityCopyWithImpl<UserReviewEntity>(this as UserReviewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReviewEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.store, store) || other.store == store)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.serviceNames, serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.merchantReply, merchantReply) || other.merchantReply == merchantReply)&&(identical(other.merchantRepliedAt, merchantRepliedAt) || other.merchantRepliedAt == merchantRepliedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeId,store,bookingId,rating,comment,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(serviceNames),staffName,merchantReply,merchantRepliedAt,createdAt,updatedAt);

@override
String toString() {
  return 'UserReviewEntity(id: $id, storeId: $storeId, store: $store, bookingId: $bookingId, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, merchantReply: $merchantReply, merchantRepliedAt: $merchantRepliedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserReviewEntityCopyWith<$Res>  {
  factory $UserReviewEntityCopyWith(UserReviewEntity value, $Res Function(UserReviewEntity) _then) = _$UserReviewEntityCopyWithImpl;
@useResult
$Res call({
 String id, String storeId, UserReviewStoreEntity? store, String? bookingId, int rating, String comment, List<String> images, List<String> serviceNames, String? staffName, String? merchantReply, DateTime? merchantRepliedAt, DateTime createdAt, DateTime? updatedAt
});


$UserReviewStoreEntityCopyWith<$Res>? get store;

}
/// @nodoc
class _$UserReviewEntityCopyWithImpl<$Res>
    implements $UserReviewEntityCopyWith<$Res> {
  _$UserReviewEntityCopyWithImpl(this._self, this._then);

  final UserReviewEntity _self;
  final $Res Function(UserReviewEntity) _then;

/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storeId = null,Object? store = freezed,Object? bookingId = freezed,Object? rating = null,Object? comment = null,Object? images = null,Object? serviceNames = null,Object? staffName = freezed,Object? merchantReply = freezed,Object? merchantRepliedAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as UserReviewStoreEntity?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,serviceNames: null == serviceNames ? _self.serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,merchantReply: freezed == merchantReply ? _self.merchantReply : merchantReply // ignore: cast_nullable_to_non_nullable
as String?,merchantRepliedAt: freezed == merchantRepliedAt ? _self.merchantRepliedAt : merchantRepliedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReviewStoreEntityCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $UserReviewStoreEntityCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserReviewEntity].
extension UserReviewEntityPatterns on UserReviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserReviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserReviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserReviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserReviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserReviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserReviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String storeId,  UserReviewStoreEntity? store,  String? bookingId,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  String? merchantReply,  DateTime? merchantRepliedAt,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserReviewEntity() when $default != null:
return $default(_that.id,_that.storeId,_that.store,_that.bookingId,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.merchantReply,_that.merchantRepliedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String storeId,  UserReviewStoreEntity? store,  String? bookingId,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  String? merchantReply,  DateTime? merchantRepliedAt,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserReviewEntity():
return $default(_that.id,_that.storeId,_that.store,_that.bookingId,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.merchantReply,_that.merchantRepliedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String storeId,  UserReviewStoreEntity? store,  String? bookingId,  int rating,  String comment,  List<String> images,  List<String> serviceNames,  String? staffName,  String? merchantReply,  DateTime? merchantRepliedAt,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserReviewEntity() when $default != null:
return $default(_that.id,_that.storeId,_that.store,_that.bookingId,_that.rating,_that.comment,_that.images,_that.serviceNames,_that.staffName,_that.merchantReply,_that.merchantRepliedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserReviewEntity implements UserReviewEntity {
  const _UserReviewEntity({required this.id, required this.storeId, this.store, this.bookingId, required this.rating, required this.comment, final  List<String> images = const [], final  List<String> serviceNames = const [], this.staffName, this.merchantReply, this.merchantRepliedAt, required this.createdAt, this.updatedAt}): _images = images,_serviceNames = serviceNames;
  

@override final  String id;
@override final  String storeId;
@override final  UserReviewStoreEntity? store;
@override final  String? bookingId;
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
@override final  String? merchantReply;
@override final  DateTime? merchantRepliedAt;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserReviewEntityCopyWith<_UserReviewEntity> get copyWith => __$UserReviewEntityCopyWithImpl<_UserReviewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReviewEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.store, store) || other.store == store)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._serviceNames, _serviceNames)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.merchantReply, merchantReply) || other.merchantReply == merchantReply)&&(identical(other.merchantRepliedAt, merchantRepliedAt) || other.merchantRepliedAt == merchantRepliedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeId,store,bookingId,rating,comment,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_serviceNames),staffName,merchantReply,merchantRepliedAt,createdAt,updatedAt);

@override
String toString() {
  return 'UserReviewEntity(id: $id, storeId: $storeId, store: $store, bookingId: $bookingId, rating: $rating, comment: $comment, images: $images, serviceNames: $serviceNames, staffName: $staffName, merchantReply: $merchantReply, merchantRepliedAt: $merchantRepliedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserReviewEntityCopyWith<$Res> implements $UserReviewEntityCopyWith<$Res> {
  factory _$UserReviewEntityCopyWith(_UserReviewEntity value, $Res Function(_UserReviewEntity) _then) = __$UserReviewEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String storeId, UserReviewStoreEntity? store, String? bookingId, int rating, String comment, List<String> images, List<String> serviceNames, String? staffName, String? merchantReply, DateTime? merchantRepliedAt, DateTime createdAt, DateTime? updatedAt
});


@override $UserReviewStoreEntityCopyWith<$Res>? get store;

}
/// @nodoc
class __$UserReviewEntityCopyWithImpl<$Res>
    implements _$UserReviewEntityCopyWith<$Res> {
  __$UserReviewEntityCopyWithImpl(this._self, this._then);

  final _UserReviewEntity _self;
  final $Res Function(_UserReviewEntity) _then;

/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storeId = null,Object? store = freezed,Object? bookingId = freezed,Object? rating = null,Object? comment = null,Object? images = null,Object? serviceNames = null,Object? staffName = freezed,Object? merchantReply = freezed,Object? merchantRepliedAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_UserReviewEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as UserReviewStoreEntity?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,serviceNames: null == serviceNames ? _self._serviceNames : serviceNames // ignore: cast_nullable_to_non_nullable
as List<String>,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,merchantReply: freezed == merchantReply ? _self.merchantReply : merchantReply // ignore: cast_nullable_to_non_nullable
as String?,merchantRepliedAt: freezed == merchantRepliedAt ? _self.merchantRepliedAt : merchantRepliedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReviewStoreEntityCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $UserReviewStoreEntityCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}

/// @nodoc
mixin _$UserReviewListEntity {

 List<UserReviewEntity> get items; int get total; int get page; int get limit; int get totalPages;
/// Create a copy of UserReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserReviewListEntityCopyWith<UserReviewListEntity> get copyWith => _$UserReviewListEntityCopyWithImpl<UserReviewListEntity>(this as UserReviewListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReviewListEntity&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page,limit,totalPages);

@override
String toString() {
  return 'UserReviewListEntity(items: $items, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $UserReviewListEntityCopyWith<$Res>  {
  factory $UserReviewListEntityCopyWith(UserReviewListEntity value, $Res Function(UserReviewListEntity) _then) = _$UserReviewListEntityCopyWithImpl;
@useResult
$Res call({
 List<UserReviewEntity> items, int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$UserReviewListEntityCopyWithImpl<$Res>
    implements $UserReviewListEntityCopyWith<$Res> {
  _$UserReviewListEntityCopyWithImpl(this._self, this._then);

  final UserReviewListEntity _self;
  final $Res Function(UserReviewListEntity) _then;

/// Create a copy of UserReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<UserReviewEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserReviewListEntity].
extension UserReviewListEntityPatterns on UserReviewListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserReviewListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserReviewListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserReviewListEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserReviewListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserReviewListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserReviewListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserReviewEntity> items,  int total,  int page,  int limit,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserReviewListEntity() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserReviewEntity> items,  int total,  int page,  int limit,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _UserReviewListEntity():
return $default(_that.items,_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserReviewEntity> items,  int total,  int page,  int limit,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _UserReviewListEntity() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc


class _UserReviewListEntity implements UserReviewListEntity {
  const _UserReviewListEntity({final  List<UserReviewEntity> items = const [], this.total = 0, this.page = 1, this.limit = 10, this.totalPages = 1}): _items = items;
  

 final  List<UserReviewEntity> _items;
@override@JsonKey() List<UserReviewEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int totalPages;

/// Create a copy of UserReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserReviewListEntityCopyWith<_UserReviewListEntity> get copyWith => __$UserReviewListEntityCopyWithImpl<_UserReviewListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReviewListEntity&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page,limit,totalPages);

@override
String toString() {
  return 'UserReviewListEntity(items: $items, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UserReviewListEntityCopyWith<$Res> implements $UserReviewListEntityCopyWith<$Res> {
  factory _$UserReviewListEntityCopyWith(_UserReviewListEntity value, $Res Function(_UserReviewListEntity) _then) = __$UserReviewListEntityCopyWithImpl;
@override @useResult
$Res call({
 List<UserReviewEntity> items, int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$UserReviewListEntityCopyWithImpl<$Res>
    implements _$UserReviewListEntityCopyWith<$Res> {
  __$UserReviewListEntityCopyWithImpl(this._self, this._then);

  final _UserReviewListEntity _self;
  final $Res Function(_UserReviewListEntity) _then;

/// Create a copy of UserReviewListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_UserReviewListEntity(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<UserReviewEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
