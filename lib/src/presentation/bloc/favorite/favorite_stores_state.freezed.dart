// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_stores_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteStoresState {

 FavoriteStoresStatus get status; List<FavoriteStoreEntity> get items; int get page; int get totalPages; int get total; Failure? get failure;
/// Create a copy of FavoriteStoresState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStoresStateCopyWith<FavoriteStoresState> get copyWith => _$FavoriteStoresStateCopyWithImpl<FavoriteStoresState>(this as FavoriteStoresState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteStoresState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),page,totalPages,total,failure);

@override
String toString() {
  return 'FavoriteStoresState(status: $status, items: $items, page: $page, totalPages: $totalPages, total: $total, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FavoriteStoresStateCopyWith<$Res>  {
  factory $FavoriteStoresStateCopyWith(FavoriteStoresState value, $Res Function(FavoriteStoresState) _then) = _$FavoriteStoresStateCopyWithImpl;
@useResult
$Res call({
 FavoriteStoresStatus status, List<FavoriteStoreEntity> items, int page, int totalPages, int total, Failure? failure
});




}
/// @nodoc
class _$FavoriteStoresStateCopyWithImpl<$Res>
    implements $FavoriteStoresStateCopyWith<$Res> {
  _$FavoriteStoresStateCopyWithImpl(this._self, this._then);

  final FavoriteStoresState _self;
  final $Res Function(FavoriteStoresState) _then;

/// Create a copy of FavoriteStoresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStoresStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FavoriteStoreEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteStoresState].
extension FavoriteStoresStatePatterns on FavoriteStoresState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteStoresState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteStoresState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteStoresState value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoresState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteStoresState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteStoresState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoriteStoresStatus status,  List<FavoriteStoreEntity> items,  int page,  int totalPages,  int total,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteStoresState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.total,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoriteStoresStatus status,  List<FavoriteStoreEntity> items,  int page,  int totalPages,  int total,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoresState():
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.total,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoriteStoresStatus status,  List<FavoriteStoreEntity> items,  int page,  int totalPages,  int total,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteStoresState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.total,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteStoresState extends FavoriteStoresState {
  const _FavoriteStoresState({this.status = FavoriteStoresStatus.initial, final  List<FavoriteStoreEntity> items = const [], this.page = 1, this.totalPages = 1, this.total = 0, this.failure}): _items = items,super._();
  

@override@JsonKey() final  FavoriteStoresStatus status;
 final  List<FavoriteStoreEntity> _items;
@override@JsonKey() List<FavoriteStoreEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  int total;
@override final  Failure? failure;

/// Create a copy of FavoriteStoresState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStoresStateCopyWith<_FavoriteStoresState> get copyWith => __$FavoriteStoresStateCopyWithImpl<_FavoriteStoresState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteStoresState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),page,totalPages,total,failure);

@override
String toString() {
  return 'FavoriteStoresState(status: $status, items: $items, page: $page, totalPages: $totalPages, total: $total, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStoresStateCopyWith<$Res> implements $FavoriteStoresStateCopyWith<$Res> {
  factory _$FavoriteStoresStateCopyWith(_FavoriteStoresState value, $Res Function(_FavoriteStoresState) _then) = __$FavoriteStoresStateCopyWithImpl;
@override @useResult
$Res call({
 FavoriteStoresStatus status, List<FavoriteStoreEntity> items, int page, int totalPages, int total, Failure? failure
});




}
/// @nodoc
class __$FavoriteStoresStateCopyWithImpl<$Res>
    implements _$FavoriteStoresStateCopyWith<$Res> {
  __$FavoriteStoresStateCopyWithImpl(this._self, this._then);

  final _FavoriteStoresState _self;
  final $Res Function(_FavoriteStoresState) _then;

/// Create a copy of FavoriteStoresState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? failure = freezed,}) {
  return _then(_FavoriteStoresState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStoresStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FavoriteStoreEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
