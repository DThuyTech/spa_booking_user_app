// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreServicesState {

 StoreServicesStatus get status; List<ServiceCategoryEntity> get categories; List<ServiceEntity> get services; String? get storeId; String? get selectedCategoryId; String get searchQuery; Failure? get failure;
/// Create a copy of StoreServicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreServicesStateCopyWith<StoreServicesState> get copyWith => _$StoreServicesStateCopyWithImpl<StoreServicesState>(this as StoreServicesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreServicesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(services),storeId,selectedCategoryId,searchQuery,failure);

@override
String toString() {
  return 'StoreServicesState(status: $status, categories: $categories, services: $services, storeId: $storeId, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreServicesStateCopyWith<$Res>  {
  factory $StoreServicesStateCopyWith(StoreServicesState value, $Res Function(StoreServicesState) _then) = _$StoreServicesStateCopyWithImpl;
@useResult
$Res call({
 StoreServicesStatus status, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, String? storeId, String? selectedCategoryId, String searchQuery, Failure? failure
});




}
/// @nodoc
class _$StoreServicesStateCopyWithImpl<$Res>
    implements $StoreServicesStateCopyWith<$Res> {
  _$StoreServicesStateCopyWithImpl(this._self, this._then);

  final StoreServicesState _self;
  final $Res Function(StoreServicesState) _then;

/// Create a copy of StoreServicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? categories = null,Object? services = null,Object? storeId = freezed,Object? selectedCategoryId = freezed,Object? searchQuery = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreServicesStatus,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreServicesState].
extension StoreServicesStatePatterns on StoreServicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreServicesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreServicesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreServicesState value)  $default,){
final _that = this;
switch (_that) {
case _StoreServicesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreServicesState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreServicesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreServicesStatus status,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  String? storeId,  String? selectedCategoryId,  String searchQuery,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreServicesState() when $default != null:
return $default(_that.status,_that.categories,_that.services,_that.storeId,_that.selectedCategoryId,_that.searchQuery,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreServicesStatus status,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  String? storeId,  String? selectedCategoryId,  String searchQuery,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreServicesState():
return $default(_that.status,_that.categories,_that.services,_that.storeId,_that.selectedCategoryId,_that.searchQuery,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreServicesStatus status,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  String? storeId,  String? selectedCategoryId,  String searchQuery,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreServicesState() when $default != null:
return $default(_that.status,_that.categories,_that.services,_that.storeId,_that.selectedCategoryId,_that.searchQuery,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreServicesState extends StoreServicesState {
  const _StoreServicesState({this.status = StoreServicesStatus.initial, final  List<ServiceCategoryEntity> categories = const [], final  List<ServiceEntity> services = const [], this.storeId, this.selectedCategoryId, this.searchQuery = '', this.failure}): _categories = categories,_services = services,super._();
  

@override@JsonKey() final  StoreServicesStatus status;
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

@override final  String? storeId;
@override final  String? selectedCategoryId;
@override@JsonKey() final  String searchQuery;
@override final  Failure? failure;

/// Create a copy of StoreServicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreServicesStateCopyWith<_StoreServicesState> get copyWith => __$StoreServicesStateCopyWithImpl<_StoreServicesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreServicesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_services),storeId,selectedCategoryId,searchQuery,failure);

@override
String toString() {
  return 'StoreServicesState(status: $status, categories: $categories, services: $services, storeId: $storeId, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreServicesStateCopyWith<$Res> implements $StoreServicesStateCopyWith<$Res> {
  factory _$StoreServicesStateCopyWith(_StoreServicesState value, $Res Function(_StoreServicesState) _then) = __$StoreServicesStateCopyWithImpl;
@override @useResult
$Res call({
 StoreServicesStatus status, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, String? storeId, String? selectedCategoryId, String searchQuery, Failure? failure
});




}
/// @nodoc
class __$StoreServicesStateCopyWithImpl<$Res>
    implements _$StoreServicesStateCopyWith<$Res> {
  __$StoreServicesStateCopyWithImpl(this._self, this._then);

  final _StoreServicesState _self;
  final $Res Function(_StoreServicesState) _then;

/// Create a copy of StoreServicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? categories = null,Object? services = null,Object? storeId = freezed,Object? selectedCategoryId = freezed,Object? searchQuery = null,Object? failure = freezed,}) {
  return _then(_StoreServicesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreServicesStatus,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
