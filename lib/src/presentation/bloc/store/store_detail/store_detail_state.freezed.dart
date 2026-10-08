// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreDetailState {

 StoreDetailStatus get status; StoreFullDetailEntity? get detail; List<StoreBusinessHourEntity> get businessHours; List<ServiceCategoryEntity> get categories; List<ServiceEntity> get services; List<StaffEntity> get staff; List<ReviewEntity> get reviews; Failure? get failure;
/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailStateCopyWith<StoreDetailState> get copyWith => _$StoreDetailStateCopyWithImpl<StoreDetailState>(this as StoreDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.businessHours, businessHours)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.staff, staff)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,detail,const DeepCollectionEquality().hash(businessHours),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(staff),const DeepCollectionEquality().hash(reviews),failure);

@override
String toString() {
  return 'StoreDetailState(status: $status, detail: $detail, businessHours: $businessHours, categories: $categories, services: $services, staff: $staff, reviews: $reviews, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreDetailStateCopyWith<$Res>  {
  factory $StoreDetailStateCopyWith(StoreDetailState value, $Res Function(StoreDetailState) _then) = _$StoreDetailStateCopyWithImpl;
@useResult
$Res call({
 StoreDetailStatus status, StoreFullDetailEntity? detail, List<StoreBusinessHourEntity> businessHours, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, List<StaffEntity> staff, List<ReviewEntity> reviews, Failure? failure
});


$StoreFullDetailEntityCopyWith<$Res>? get detail;

}
/// @nodoc
class _$StoreDetailStateCopyWithImpl<$Res>
    implements $StoreDetailStateCopyWith<$Res> {
  _$StoreDetailStateCopyWithImpl(this._self, this._then);

  final StoreDetailState _self;
  final $Res Function(StoreDetailState) _then;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? detail = freezed,Object? businessHours = null,Object? categories = null,Object? services = null,Object? staff = null,Object? reviews = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreDetailStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StoreFullDetailEntity?,businessHours: null == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,staff: null == staff ? _self.staff : staff // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreFullDetailEntityCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $StoreFullDetailEntityCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreDetailState].
extension StoreDetailStatePatterns on StoreDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDetailState value)  $default,){
final _that = this;
switch (_that) {
case _StoreDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreDetailStatus status,  StoreFullDetailEntity? detail,  List<StoreBusinessHourEntity> businessHours,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  List<ReviewEntity> reviews,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
return $default(_that.status,_that.detail,_that.businessHours,_that.categories,_that.services,_that.staff,_that.reviews,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreDetailStatus status,  StoreFullDetailEntity? detail,  List<StoreBusinessHourEntity> businessHours,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  List<ReviewEntity> reviews,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreDetailState():
return $default(_that.status,_that.detail,_that.businessHours,_that.categories,_that.services,_that.staff,_that.reviews,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreDetailStatus status,  StoreFullDetailEntity? detail,  List<StoreBusinessHourEntity> businessHours,  List<ServiceCategoryEntity> categories,  List<ServiceEntity> services,  List<StaffEntity> staff,  List<ReviewEntity> reviews,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreDetailState() when $default != null:
return $default(_that.status,_that.detail,_that.businessHours,_that.categories,_that.services,_that.staff,_that.reviews,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreDetailState extends StoreDetailState {
  const _StoreDetailState({this.status = StoreDetailStatus.initial, this.detail, final  List<StoreBusinessHourEntity> businessHours = const [], final  List<ServiceCategoryEntity> categories = const [], final  List<ServiceEntity> services = const [], final  List<StaffEntity> staff = const [], final  List<ReviewEntity> reviews = const [], this.failure}): _businessHours = businessHours,_categories = categories,_services = services,_staff = staff,_reviews = reviews,super._();
  

@override@JsonKey() final  StoreDetailStatus status;
@override final  StoreFullDetailEntity? detail;
 final  List<StoreBusinessHourEntity> _businessHours;
@override@JsonKey() List<StoreBusinessHourEntity> get businessHours {
  if (_businessHours is EqualUnmodifiableListView) return _businessHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businessHours);
}

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

 final  List<ReviewEntity> _reviews;
@override@JsonKey() List<ReviewEntity> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  Failure? failure;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDetailStateCopyWith<_StoreDetailState> get copyWith => __$StoreDetailStateCopyWithImpl<_StoreDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other._businessHours, _businessHours)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._staff, _staff)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,detail,const DeepCollectionEquality().hash(_businessHours),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_staff),const DeepCollectionEquality().hash(_reviews),failure);

@override
String toString() {
  return 'StoreDetailState(status: $status, detail: $detail, businessHours: $businessHours, categories: $categories, services: $services, staff: $staff, reviews: $reviews, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreDetailStateCopyWith<$Res> implements $StoreDetailStateCopyWith<$Res> {
  factory _$StoreDetailStateCopyWith(_StoreDetailState value, $Res Function(_StoreDetailState) _then) = __$StoreDetailStateCopyWithImpl;
@override @useResult
$Res call({
 StoreDetailStatus status, StoreFullDetailEntity? detail, List<StoreBusinessHourEntity> businessHours, List<ServiceCategoryEntity> categories, List<ServiceEntity> services, List<StaffEntity> staff, List<ReviewEntity> reviews, Failure? failure
});


@override $StoreFullDetailEntityCopyWith<$Res>? get detail;

}
/// @nodoc
class __$StoreDetailStateCopyWithImpl<$Res>
    implements _$StoreDetailStateCopyWith<$Res> {
  __$StoreDetailStateCopyWithImpl(this._self, this._then);

  final _StoreDetailState _self;
  final $Res Function(_StoreDetailState) _then;

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? detail = freezed,Object? businessHours = null,Object? categories = null,Object? services = null,Object? staff = null,Object? reviews = null,Object? failure = freezed,}) {
  return _then(_StoreDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreDetailStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StoreFullDetailEntity?,businessHours: null == businessHours ? _self._businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourEntity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryEntity>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,staff: null == staff ? _self._staff : staff // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of StoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreFullDetailEntityCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $StoreFullDetailEntityCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on
