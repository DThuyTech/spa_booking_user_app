// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_gallery_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreGalleryItemEntity {

 String get url; String? get thumbnailUrl; String get category; String? get caption;
/// Create a copy of StoreGalleryItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreGalleryItemEntityCopyWith<StoreGalleryItemEntity> get copyWith => _$StoreGalleryItemEntityCopyWithImpl<StoreGalleryItemEntity>(this as StoreGalleryItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreGalleryItemEntity&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.caption, caption) || other.caption == caption));
}


@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,category,caption);

@override
String toString() {
  return 'StoreGalleryItemEntity(url: $url, thumbnailUrl: $thumbnailUrl, category: $category, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $StoreGalleryItemEntityCopyWith<$Res>  {
  factory $StoreGalleryItemEntityCopyWith(StoreGalleryItemEntity value, $Res Function(StoreGalleryItemEntity) _then) = _$StoreGalleryItemEntityCopyWithImpl;
@useResult
$Res call({
 String url, String? thumbnailUrl, String category, String? caption
});




}
/// @nodoc
class _$StoreGalleryItemEntityCopyWithImpl<$Res>
    implements $StoreGalleryItemEntityCopyWith<$Res> {
  _$StoreGalleryItemEntityCopyWithImpl(this._self, this._then);

  final StoreGalleryItemEntity _self;
  final $Res Function(StoreGalleryItemEntity) _then;

/// Create a copy of StoreGalleryItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? thumbnailUrl = freezed,Object? category = null,Object? caption = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreGalleryItemEntity].
extension StoreGalleryItemEntityPatterns on StoreGalleryItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreGalleryItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreGalleryItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreGalleryItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreGalleryItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl,  String category,  String? caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreGalleryItemEntity() when $default != null:
return $default(_that.url,_that.thumbnailUrl,_that.category,_that.caption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl,  String category,  String? caption)  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryItemEntity():
return $default(_that.url,_that.thumbnailUrl,_that.category,_that.caption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String? thumbnailUrl,  String category,  String? caption)?  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryItemEntity() when $default != null:
return $default(_that.url,_that.thumbnailUrl,_that.category,_that.caption);case _:
  return null;

}
}

}

/// @nodoc


class _StoreGalleryItemEntity implements StoreGalleryItemEntity {
  const _StoreGalleryItemEntity({required this.url, this.thumbnailUrl, this.category = 'INTERIOR', this.caption});
  

@override final  String url;
@override final  String? thumbnailUrl;
@override@JsonKey() final  String category;
@override final  String? caption;

/// Create a copy of StoreGalleryItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreGalleryItemEntityCopyWith<_StoreGalleryItemEntity> get copyWith => __$StoreGalleryItemEntityCopyWithImpl<_StoreGalleryItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreGalleryItemEntity&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.caption, caption) || other.caption == caption));
}


@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,category,caption);

@override
String toString() {
  return 'StoreGalleryItemEntity(url: $url, thumbnailUrl: $thumbnailUrl, category: $category, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$StoreGalleryItemEntityCopyWith<$Res> implements $StoreGalleryItemEntityCopyWith<$Res> {
  factory _$StoreGalleryItemEntityCopyWith(_StoreGalleryItemEntity value, $Res Function(_StoreGalleryItemEntity) _then) = __$StoreGalleryItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String url, String? thumbnailUrl, String category, String? caption
});




}
/// @nodoc
class __$StoreGalleryItemEntityCopyWithImpl<$Res>
    implements _$StoreGalleryItemEntityCopyWith<$Res> {
  __$StoreGalleryItemEntityCopyWithImpl(this._self, this._then);

  final _StoreGalleryItemEntity _self;
  final $Res Function(_StoreGalleryItemEntity) _then;

/// Create a copy of StoreGalleryItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? thumbnailUrl = freezed,Object? category = null,Object? caption = freezed,}) {
  return _then(_StoreGalleryItemEntity(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$StoreGalleryEntity {

 String get storeId; Map<String, int> get categoryCounts; List<StoreGalleryItemEntity> get items;
/// Create a copy of StoreGalleryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreGalleryEntityCopyWith<StoreGalleryEntity> get copyWith => _$StoreGalleryEntityCopyWithImpl<StoreGalleryEntity>(this as StoreGalleryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreGalleryEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other.categoryCounts, categoryCounts)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(categoryCounts),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StoreGalleryEntity(storeId: $storeId, categoryCounts: $categoryCounts, items: $items)';
}


}

/// @nodoc
abstract mixin class $StoreGalleryEntityCopyWith<$Res>  {
  factory $StoreGalleryEntityCopyWith(StoreGalleryEntity value, $Res Function(StoreGalleryEntity) _then) = _$StoreGalleryEntityCopyWithImpl;
@useResult
$Res call({
 String storeId, Map<String, int> categoryCounts, List<StoreGalleryItemEntity> items
});




}
/// @nodoc
class _$StoreGalleryEntityCopyWithImpl<$Res>
    implements $StoreGalleryEntityCopyWith<$Res> {
  _$StoreGalleryEntityCopyWithImpl(this._self, this._then);

  final StoreGalleryEntity _self;
  final $Res Function(StoreGalleryEntity) _then;

/// Create a copy of StoreGalleryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? categoryCounts = null,Object? items = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,categoryCounts: null == categoryCounts ? _self.categoryCounts : categoryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<StoreGalleryItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreGalleryEntity].
extension StoreGalleryEntityPatterns on StoreGalleryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreGalleryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreGalleryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreGalleryEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreGalleryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  Map<String, int> categoryCounts,  List<StoreGalleryItemEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreGalleryEntity() when $default != null:
return $default(_that.storeId,_that.categoryCounts,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  Map<String, int> categoryCounts,  List<StoreGalleryItemEntity> items)  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryEntity():
return $default(_that.storeId,_that.categoryCounts,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  Map<String, int> categoryCounts,  List<StoreGalleryItemEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryEntity() when $default != null:
return $default(_that.storeId,_that.categoryCounts,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _StoreGalleryEntity implements StoreGalleryEntity {
  const _StoreGalleryEntity({required this.storeId, final  Map<String, int> categoryCounts = const {}, final  List<StoreGalleryItemEntity> items = const []}): _categoryCounts = categoryCounts,_items = items;
  

@override final  String storeId;
 final  Map<String, int> _categoryCounts;
@override@JsonKey() Map<String, int> get categoryCounts {
  if (_categoryCounts is EqualUnmodifiableMapView) return _categoryCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categoryCounts);
}

 final  List<StoreGalleryItemEntity> _items;
@override@JsonKey() List<StoreGalleryItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StoreGalleryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreGalleryEntityCopyWith<_StoreGalleryEntity> get copyWith => __$StoreGalleryEntityCopyWithImpl<_StoreGalleryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreGalleryEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other._categoryCounts, _categoryCounts)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(_categoryCounts),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StoreGalleryEntity(storeId: $storeId, categoryCounts: $categoryCounts, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StoreGalleryEntityCopyWith<$Res> implements $StoreGalleryEntityCopyWith<$Res> {
  factory _$StoreGalleryEntityCopyWith(_StoreGalleryEntity value, $Res Function(_StoreGalleryEntity) _then) = __$StoreGalleryEntityCopyWithImpl;
@override @useResult
$Res call({
 String storeId, Map<String, int> categoryCounts, List<StoreGalleryItemEntity> items
});




}
/// @nodoc
class __$StoreGalleryEntityCopyWithImpl<$Res>
    implements _$StoreGalleryEntityCopyWith<$Res> {
  __$StoreGalleryEntityCopyWithImpl(this._self, this._then);

  final _StoreGalleryEntity _self;
  final $Res Function(_StoreGalleryEntity) _then;

/// Create a copy of StoreGalleryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? categoryCounts = null,Object? items = null,}) {
  return _then(_StoreGalleryEntity(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,categoryCounts: null == categoryCounts ? _self._categoryCounts : categoryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<StoreGalleryItemEntity>,
  ));
}


}

// dart format on
