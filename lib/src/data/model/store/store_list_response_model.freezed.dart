// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorePaginationModel {

 int get total; int get page; int get limit; int get totalPages;
/// Create a copy of StorePaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorePaginationModelCopyWith<StorePaginationModel> get copyWith => _$StorePaginationModelCopyWithImpl<StorePaginationModel>(this as StorePaginationModel, _$identity);

  /// Serializes this StorePaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorePaginationModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'StorePaginationModel(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $StorePaginationModelCopyWith<$Res>  {
  factory $StorePaginationModelCopyWith(StorePaginationModel value, $Res Function(StorePaginationModel) _then) = _$StorePaginationModelCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$StorePaginationModelCopyWithImpl<$Res>
    implements $StorePaginationModelCopyWith<$Res> {
  _$StorePaginationModelCopyWithImpl(this._self, this._then);

  final StorePaginationModel _self;
  final $Res Function(StorePaginationModel) _then;

/// Create a copy of StorePaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StorePaginationModel].
extension StorePaginationModelPatterns on StorePaginationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorePaginationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorePaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorePaginationModel value)  $default,){
final _that = this;
switch (_that) {
case _StorePaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorePaginationModel value)?  $default,){
final _that = this;
switch (_that) {
case _StorePaginationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorePaginationModel() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _StorePaginationModel():
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _StorePaginationModel() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorePaginationModel implements StorePaginationModel {
  const _StorePaginationModel({this.total = 0, this.page = 1, this.limit = 10, this.totalPages = 1});
  factory _StorePaginationModel.fromJson(Map<String, dynamic> json) => _$StorePaginationModelFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int totalPages;

/// Create a copy of StorePaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorePaginationModelCopyWith<_StorePaginationModel> get copyWith => __$StorePaginationModelCopyWithImpl<_StorePaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorePaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorePaginationModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'StorePaginationModel(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$StorePaginationModelCopyWith<$Res> implements $StorePaginationModelCopyWith<$Res> {
  factory _$StorePaginationModelCopyWith(_StorePaginationModel value, $Res Function(_StorePaginationModel) _then) = __$StorePaginationModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$StorePaginationModelCopyWithImpl<$Res>
    implements _$StorePaginationModelCopyWith<$Res> {
  __$StorePaginationModelCopyWithImpl(this._self, this._then);

  final _StorePaginationModel _self;
  final $Res Function(_StorePaginationModel) _then;

/// Create a copy of StorePaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_StorePaginationModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$StoreListResponseModel {

 List<StoreModel> get items; StorePaginationModel? get pagination;
/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreListResponseModelCopyWith<StoreListResponseModel> get copyWith => _$StoreListResponseModelCopyWithImpl<StoreListResponseModel>(this as StoreListResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreListResponseModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),pagination);

@override
String toString() {
  return 'StoreListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $StoreListResponseModelCopyWith<$Res>  {
  factory $StoreListResponseModelCopyWith(StoreListResponseModel value, $Res Function(StoreListResponseModel) _then) = _$StoreListResponseModelCopyWithImpl;
@useResult
$Res call({
 List<StoreModel> items, StorePaginationModel? pagination
});


$StorePaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$StoreListResponseModelCopyWithImpl<$Res>
    implements $StoreListResponseModelCopyWith<$Res> {
  _$StoreListResponseModelCopyWithImpl(this._self, this._then);

  final StoreListResponseModel _self;
  final $Res Function(StoreListResponseModel) _then;

/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<StoreModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as StorePaginationModel?,
  ));
}
/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StorePaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $StorePaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreListResponseModel].
extension StoreListResponseModelPatterns on StoreListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StoreModel> items,  StorePaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StoreModel> items,  StorePaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _StoreListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StoreModel> items,  StorePaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _StoreListResponseModel() when $default != null:
return $default(_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _StoreListResponseModel implements StoreListResponseModel {
  const _StoreListResponseModel({final  List<StoreModel> items = const [], this.pagination}): _items = items;
  

 final  List<StoreModel> _items;
@override@JsonKey() List<StoreModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  StorePaginationModel? pagination;

/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreListResponseModelCopyWith<_StoreListResponseModel> get copyWith => __$StoreListResponseModelCopyWithImpl<_StoreListResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreListResponseModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),pagination);

@override
String toString() {
  return 'StoreListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$StoreListResponseModelCopyWith<$Res> implements $StoreListResponseModelCopyWith<$Res> {
  factory _$StoreListResponseModelCopyWith(_StoreListResponseModel value, $Res Function(_StoreListResponseModel) _then) = __$StoreListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<StoreModel> items, StorePaginationModel? pagination
});


@override $StorePaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$StoreListResponseModelCopyWithImpl<$Res>
    implements _$StoreListResponseModelCopyWith<$Res> {
  __$StoreListResponseModelCopyWithImpl(this._self, this._then);

  final _StoreListResponseModel _self;
  final $Res Function(_StoreListResponseModel) _then;

/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_StoreListResponseModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<StoreModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as StorePaginationModel?,
  ));
}

/// Create a copy of StoreListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StorePaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $StorePaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
