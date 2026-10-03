// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreListState {

 StoreListStatus get status; List<StoreEntity> get stores; bool get hasMore; int get currentPage; String? get search; String? get province; String? get district; Failure? get failure;
/// Create a copy of StoreListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreListStateCopyWith<StoreListState> get copyWith => _$StoreListStateCopyWithImpl<StoreListState>(this as StoreListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.stores, stores)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.district, district) || other.district == district)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(stores),hasMore,currentPage,search,province,district,failure);

@override
String toString() {
  return 'StoreListState(status: $status, stores: $stores, hasMore: $hasMore, currentPage: $currentPage, search: $search, province: $province, district: $district, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreListStateCopyWith<$Res>  {
  factory $StoreListStateCopyWith(StoreListState value, $Res Function(StoreListState) _then) = _$StoreListStateCopyWithImpl;
@useResult
$Res call({
 StoreListStatus status, List<StoreEntity> stores, bool hasMore, int currentPage, String? search, String? province, String? district, Failure? failure
});




}
/// @nodoc
class _$StoreListStateCopyWithImpl<$Res>
    implements $StoreListStateCopyWith<$Res> {
  _$StoreListStateCopyWithImpl(this._self, this._then);

  final StoreListState _self;
  final $Res Function(StoreListState) _then;

/// Create a copy of StoreListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stores = null,Object? hasMore = null,Object? currentPage = null,Object? search = freezed,Object? province = freezed,Object? district = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreListStatus,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreListState].
extension StoreListStatePatterns on StoreListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreListState value)  $default,){
final _that = this;
switch (_that) {
case _StoreListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreListState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreListStatus status,  List<StoreEntity> stores,  bool hasMore,  int currentPage,  String? search,  String? province,  String? district,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreListState() when $default != null:
return $default(_that.status,_that.stores,_that.hasMore,_that.currentPage,_that.search,_that.province,_that.district,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreListStatus status,  List<StoreEntity> stores,  bool hasMore,  int currentPage,  String? search,  String? province,  String? district,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreListState():
return $default(_that.status,_that.stores,_that.hasMore,_that.currentPage,_that.search,_that.province,_that.district,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreListStatus status,  List<StoreEntity> stores,  bool hasMore,  int currentPage,  String? search,  String? province,  String? district,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreListState() when $default != null:
return $default(_that.status,_that.stores,_that.hasMore,_that.currentPage,_that.search,_that.province,_that.district,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreListState extends StoreListState {
  const _StoreListState({this.status = StoreListStatus.initial, final  List<StoreEntity> stores = const [], this.hasMore = false, this.currentPage = 1, this.search, this.province, this.district, this.failure}): _stores = stores,super._();
  

@override@JsonKey() final  StoreListStatus status;
 final  List<StoreEntity> _stores;
@override@JsonKey() List<StoreEntity> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}

@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int currentPage;
@override final  String? search;
@override final  String? province;
@override final  String? district;
@override final  Failure? failure;

/// Create a copy of StoreListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreListStateCopyWith<_StoreListState> get copyWith => __$StoreListStateCopyWithImpl<_StoreListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._stores, _stores)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.district, district) || other.district == district)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_stores),hasMore,currentPage,search,province,district,failure);

@override
String toString() {
  return 'StoreListState(status: $status, stores: $stores, hasMore: $hasMore, currentPage: $currentPage, search: $search, province: $province, district: $district, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreListStateCopyWith<$Res> implements $StoreListStateCopyWith<$Res> {
  factory _$StoreListStateCopyWith(_StoreListState value, $Res Function(_StoreListState) _then) = __$StoreListStateCopyWithImpl;
@override @useResult
$Res call({
 StoreListStatus status, List<StoreEntity> stores, bool hasMore, int currentPage, String? search, String? province, String? district, Failure? failure
});




}
/// @nodoc
class __$StoreListStateCopyWithImpl<$Res>
    implements _$StoreListStateCopyWith<$Res> {
  __$StoreListStateCopyWithImpl(this._self, this._then);

  final _StoreListState _self;
  final $Res Function(_StoreListState) _then;

/// Create a copy of StoreListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stores = null,Object? hasMore = null,Object? currentPage = null,Object? search = freezed,Object? province = freezed,Object? district = freezed,Object? failure = freezed,}) {
  return _then(_StoreListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreListStatus,stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
