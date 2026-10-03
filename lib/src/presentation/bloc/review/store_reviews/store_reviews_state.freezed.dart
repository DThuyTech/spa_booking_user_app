// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_reviews_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreReviewsState {

 StoreReviewsStatus get status; ReviewListEntity? get reviewData; int? get selectedRatingFilter; Failure? get failure;
/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreReviewsStateCopyWith<StoreReviewsState> get copyWith => _$StoreReviewsStateCopyWithImpl<StoreReviewsState>(this as StoreReviewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreReviewsState&&(identical(other.status, status) || other.status == status)&&(identical(other.reviewData, reviewData) || other.reviewData == reviewData)&&(identical(other.selectedRatingFilter, selectedRatingFilter) || other.selectedRatingFilter == selectedRatingFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,reviewData,selectedRatingFilter,failure);

@override
String toString() {
  return 'StoreReviewsState(status: $status, reviewData: $reviewData, selectedRatingFilter: $selectedRatingFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreReviewsStateCopyWith<$Res>  {
  factory $StoreReviewsStateCopyWith(StoreReviewsState value, $Res Function(StoreReviewsState) _then) = _$StoreReviewsStateCopyWithImpl;
@useResult
$Res call({
 StoreReviewsStatus status, ReviewListEntity? reviewData, int? selectedRatingFilter, Failure? failure
});


$ReviewListEntityCopyWith<$Res>? get reviewData;

}
/// @nodoc
class _$StoreReviewsStateCopyWithImpl<$Res>
    implements $StoreReviewsStateCopyWith<$Res> {
  _$StoreReviewsStateCopyWithImpl(this._self, this._then);

  final StoreReviewsState _self;
  final $Res Function(StoreReviewsState) _then;

/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? reviewData = freezed,Object? selectedRatingFilter = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreReviewsStatus,reviewData: freezed == reviewData ? _self.reviewData : reviewData // ignore: cast_nullable_to_non_nullable
as ReviewListEntity?,selectedRatingFilter: freezed == selectedRatingFilter ? _self.selectedRatingFilter : selectedRatingFilter // ignore: cast_nullable_to_non_nullable
as int?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewListEntityCopyWith<$Res>? get reviewData {
    if (_self.reviewData == null) {
    return null;
  }

  return $ReviewListEntityCopyWith<$Res>(_self.reviewData!, (value) {
    return _then(_self.copyWith(reviewData: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreReviewsState].
extension StoreReviewsStatePatterns on StoreReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreReviewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreReviewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreReviewsState value)  $default,){
final _that = this;
switch (_that) {
case _StoreReviewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreReviewsState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreReviewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreReviewsStatus status,  ReviewListEntity? reviewData,  int? selectedRatingFilter,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreReviewsState() when $default != null:
return $default(_that.status,_that.reviewData,_that.selectedRatingFilter,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreReviewsStatus status,  ReviewListEntity? reviewData,  int? selectedRatingFilter,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreReviewsState():
return $default(_that.status,_that.reviewData,_that.selectedRatingFilter,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreReviewsStatus status,  ReviewListEntity? reviewData,  int? selectedRatingFilter,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreReviewsState() when $default != null:
return $default(_that.status,_that.reviewData,_that.selectedRatingFilter,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreReviewsState extends StoreReviewsState {
  const _StoreReviewsState({this.status = StoreReviewsStatus.initial, this.reviewData, this.selectedRatingFilter, this.failure}): super._();
  

@override@JsonKey() final  StoreReviewsStatus status;
@override final  ReviewListEntity? reviewData;
@override final  int? selectedRatingFilter;
@override final  Failure? failure;

/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreReviewsStateCopyWith<_StoreReviewsState> get copyWith => __$StoreReviewsStateCopyWithImpl<_StoreReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreReviewsState&&(identical(other.status, status) || other.status == status)&&(identical(other.reviewData, reviewData) || other.reviewData == reviewData)&&(identical(other.selectedRatingFilter, selectedRatingFilter) || other.selectedRatingFilter == selectedRatingFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,reviewData,selectedRatingFilter,failure);

@override
String toString() {
  return 'StoreReviewsState(status: $status, reviewData: $reviewData, selectedRatingFilter: $selectedRatingFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreReviewsStateCopyWith<$Res> implements $StoreReviewsStateCopyWith<$Res> {
  factory _$StoreReviewsStateCopyWith(_StoreReviewsState value, $Res Function(_StoreReviewsState) _then) = __$StoreReviewsStateCopyWithImpl;
@override @useResult
$Res call({
 StoreReviewsStatus status, ReviewListEntity? reviewData, int? selectedRatingFilter, Failure? failure
});


@override $ReviewListEntityCopyWith<$Res>? get reviewData;

}
/// @nodoc
class __$StoreReviewsStateCopyWithImpl<$Res>
    implements _$StoreReviewsStateCopyWith<$Res> {
  __$StoreReviewsStateCopyWithImpl(this._self, this._then);

  final _StoreReviewsState _self;
  final $Res Function(_StoreReviewsState) _then;

/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? reviewData = freezed,Object? selectedRatingFilter = freezed,Object? failure = freezed,}) {
  return _then(_StoreReviewsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreReviewsStatus,reviewData: freezed == reviewData ? _self.reviewData : reviewData // ignore: cast_nullable_to_non_nullable
as ReviewListEntity?,selectedRatingFilter: freezed == selectedRatingFilter ? _self.selectedRatingFilter : selectedRatingFilter // ignore: cast_nullable_to_non_nullable
as int?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of StoreReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewListEntityCopyWith<$Res>? get reviewData {
    if (_self.reviewData == null) {
    return null;
  }

  return $ReviewListEntityCopyWith<$Res>(_self.reviewData!, (value) {
    return _then(_self.copyWith(reviewData: value));
  });
}
}

// dart format on
