// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_gallery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreGalleryItemModel {

 String get url;@JsonKey(name: 'thumbnailUrl') String? get thumbnailUrl;@JsonKey(name: 'category', defaultValue: 'INTERIOR') String get category;@JsonKey(name: 'caption') String? get caption;
/// Create a copy of StoreGalleryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreGalleryItemModelCopyWith<StoreGalleryItemModel> get copyWith => _$StoreGalleryItemModelCopyWithImpl<StoreGalleryItemModel>(this as StoreGalleryItemModel, _$identity);

  /// Serializes this StoreGalleryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreGalleryItemModel&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,category,caption);

@override
String toString() {
  return 'StoreGalleryItemModel(url: $url, thumbnailUrl: $thumbnailUrl, category: $category, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $StoreGalleryItemModelCopyWith<$Res>  {
  factory $StoreGalleryItemModelCopyWith(StoreGalleryItemModel value, $Res Function(StoreGalleryItemModel) _then) = _$StoreGalleryItemModelCopyWithImpl;
@useResult
$Res call({
 String url,@JsonKey(name: 'thumbnailUrl') String? thumbnailUrl,@JsonKey(name: 'category', defaultValue: 'INTERIOR') String category,@JsonKey(name: 'caption') String? caption
});




}
/// @nodoc
class _$StoreGalleryItemModelCopyWithImpl<$Res>
    implements $StoreGalleryItemModelCopyWith<$Res> {
  _$StoreGalleryItemModelCopyWithImpl(this._self, this._then);

  final StoreGalleryItemModel _self;
  final $Res Function(StoreGalleryItemModel) _then;

/// Create a copy of StoreGalleryItemModel
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


/// Adds pattern-matching-related methods to [StoreGalleryItemModel].
extension StoreGalleryItemModelPatterns on StoreGalleryItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreGalleryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreGalleryItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreGalleryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreGalleryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url, @JsonKey(name: 'thumbnailUrl')  String? thumbnailUrl, @JsonKey(name: 'category', defaultValue: 'INTERIOR')  String category, @JsonKey(name: 'caption')  String? caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreGalleryItemModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url, @JsonKey(name: 'thumbnailUrl')  String? thumbnailUrl, @JsonKey(name: 'category', defaultValue: 'INTERIOR')  String category, @JsonKey(name: 'caption')  String? caption)  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryItemModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url, @JsonKey(name: 'thumbnailUrl')  String? thumbnailUrl, @JsonKey(name: 'category', defaultValue: 'INTERIOR')  String category, @JsonKey(name: 'caption')  String? caption)?  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryItemModel() when $default != null:
return $default(_that.url,_that.thumbnailUrl,_that.category,_that.caption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreGalleryItemModel extends StoreGalleryItemModel {
  const _StoreGalleryItemModel({required this.url, @JsonKey(name: 'thumbnailUrl') this.thumbnailUrl, @JsonKey(name: 'category', defaultValue: 'INTERIOR') required this.category, @JsonKey(name: 'caption') this.caption}): super._();
  factory _StoreGalleryItemModel.fromJson(Map<String, dynamic> json) => _$StoreGalleryItemModelFromJson(json);

@override final  String url;
@override@JsonKey(name: 'thumbnailUrl') final  String? thumbnailUrl;
@override@JsonKey(name: 'category', defaultValue: 'INTERIOR') final  String category;
@override@JsonKey(name: 'caption') final  String? caption;

/// Create a copy of StoreGalleryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreGalleryItemModelCopyWith<_StoreGalleryItemModel> get copyWith => __$StoreGalleryItemModelCopyWithImpl<_StoreGalleryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreGalleryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreGalleryItemModel&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,category,caption);

@override
String toString() {
  return 'StoreGalleryItemModel(url: $url, thumbnailUrl: $thumbnailUrl, category: $category, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$StoreGalleryItemModelCopyWith<$Res> implements $StoreGalleryItemModelCopyWith<$Res> {
  factory _$StoreGalleryItemModelCopyWith(_StoreGalleryItemModel value, $Res Function(_StoreGalleryItemModel) _then) = __$StoreGalleryItemModelCopyWithImpl;
@override @useResult
$Res call({
 String url,@JsonKey(name: 'thumbnailUrl') String? thumbnailUrl,@JsonKey(name: 'category', defaultValue: 'INTERIOR') String category,@JsonKey(name: 'caption') String? caption
});




}
/// @nodoc
class __$StoreGalleryItemModelCopyWithImpl<$Res>
    implements _$StoreGalleryItemModelCopyWith<$Res> {
  __$StoreGalleryItemModelCopyWithImpl(this._self, this._then);

  final _StoreGalleryItemModel _self;
  final $Res Function(_StoreGalleryItemModel) _then;

/// Create a copy of StoreGalleryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? thumbnailUrl = freezed,Object? category = null,Object? caption = freezed,}) {
  return _then(_StoreGalleryItemModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StoreGalleryResponseModel {

 String get storeId;@JsonKey(name: 'categoryCounts') Map<String, dynamic>? get categoryCounts; List<StoreGalleryItemModel> get items;
/// Create a copy of StoreGalleryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreGalleryResponseModelCopyWith<StoreGalleryResponseModel> get copyWith => _$StoreGalleryResponseModelCopyWithImpl<StoreGalleryResponseModel>(this as StoreGalleryResponseModel, _$identity);

  /// Serializes this StoreGalleryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreGalleryResponseModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other.categoryCounts, categoryCounts)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(categoryCounts),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StoreGalleryResponseModel(storeId: $storeId, categoryCounts: $categoryCounts, items: $items)';
}


}

/// @nodoc
abstract mixin class $StoreGalleryResponseModelCopyWith<$Res>  {
  factory $StoreGalleryResponseModelCopyWith(StoreGalleryResponseModel value, $Res Function(StoreGalleryResponseModel) _then) = _$StoreGalleryResponseModelCopyWithImpl;
@useResult
$Res call({
 String storeId,@JsonKey(name: 'categoryCounts') Map<String, dynamic>? categoryCounts, List<StoreGalleryItemModel> items
});




}
/// @nodoc
class _$StoreGalleryResponseModelCopyWithImpl<$Res>
    implements $StoreGalleryResponseModelCopyWith<$Res> {
  _$StoreGalleryResponseModelCopyWithImpl(this._self, this._then);

  final StoreGalleryResponseModel _self;
  final $Res Function(StoreGalleryResponseModel) _then;

/// Create a copy of StoreGalleryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? categoryCounts = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,categoryCounts: freezed == categoryCounts ? _self.categoryCounts : categoryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<StoreGalleryItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreGalleryResponseModel].
extension StoreGalleryResponseModelPatterns on StoreGalleryResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreGalleryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreGalleryResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreGalleryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreGalleryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId, @JsonKey(name: 'categoryCounts')  Map<String, dynamic>? categoryCounts,  List<StoreGalleryItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreGalleryResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId, @JsonKey(name: 'categoryCounts')  Map<String, dynamic>? categoryCounts,  List<StoreGalleryItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId, @JsonKey(name: 'categoryCounts')  Map<String, dynamic>? categoryCounts,  List<StoreGalleryItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryResponseModel() when $default != null:
return $default(_that.storeId,_that.categoryCounts,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreGalleryResponseModel extends StoreGalleryResponseModel {
  const _StoreGalleryResponseModel({required this.storeId, @JsonKey(name: 'categoryCounts') final  Map<String, dynamic>? categoryCounts, final  List<StoreGalleryItemModel> items = const []}): _categoryCounts = categoryCounts,_items = items,super._();
  factory _StoreGalleryResponseModel.fromJson(Map<String, dynamic> json) => _$StoreGalleryResponseModelFromJson(json);

@override final  String storeId;
 final  Map<String, dynamic>? _categoryCounts;
@override@JsonKey(name: 'categoryCounts') Map<String, dynamic>? get categoryCounts {
  final value = _categoryCounts;
  if (value == null) return null;
  if (_categoryCounts is EqualUnmodifiableMapView) return _categoryCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<StoreGalleryItemModel> _items;
@override@JsonKey() List<StoreGalleryItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StoreGalleryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreGalleryResponseModelCopyWith<_StoreGalleryResponseModel> get copyWith => __$StoreGalleryResponseModelCopyWithImpl<_StoreGalleryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreGalleryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreGalleryResponseModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&const DeepCollectionEquality().equals(other._categoryCounts, _categoryCounts)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeId,const DeepCollectionEquality().hash(_categoryCounts),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StoreGalleryResponseModel(storeId: $storeId, categoryCounts: $categoryCounts, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StoreGalleryResponseModelCopyWith<$Res> implements $StoreGalleryResponseModelCopyWith<$Res> {
  factory _$StoreGalleryResponseModelCopyWith(_StoreGalleryResponseModel value, $Res Function(_StoreGalleryResponseModel) _then) = __$StoreGalleryResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String storeId,@JsonKey(name: 'categoryCounts') Map<String, dynamic>? categoryCounts, List<StoreGalleryItemModel> items
});




}
/// @nodoc
class __$StoreGalleryResponseModelCopyWithImpl<$Res>
    implements _$StoreGalleryResponseModelCopyWith<$Res> {
  __$StoreGalleryResponseModelCopyWithImpl(this._self, this._then);

  final _StoreGalleryResponseModel _self;
  final $Res Function(_StoreGalleryResponseModel) _then;

/// Create a copy of StoreGalleryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? categoryCounts = freezed,Object? items = null,}) {
  return _then(_StoreGalleryResponseModel(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,categoryCounts: freezed == categoryCounts ? _self._categoryCounts : categoryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<StoreGalleryItemModel>,
  ));
}


}

// dart format on
