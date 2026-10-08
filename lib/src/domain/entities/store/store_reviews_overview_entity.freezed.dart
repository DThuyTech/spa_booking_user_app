// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_reviews_overview_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreReviewsOverviewEntity {

 double get averageRating; int get totalReviews; Map<String, int> get ratingDistribution; List<ReviewEntity> get recentReviews;
/// Create a copy of StoreReviewsOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreReviewsOverviewEntityCopyWith<StoreReviewsOverviewEntity> get copyWith => _$StoreReviewsOverviewEntityCopyWithImpl<StoreReviewsOverviewEntity>(this as StoreReviewsOverviewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreReviewsOverviewEntity&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&const DeepCollectionEquality().equals(other.ratingDistribution, ratingDistribution)&&const DeepCollectionEquality().equals(other.recentReviews, recentReviews));
}


@override
int get hashCode => Object.hash(runtimeType,averageRating,totalReviews,const DeepCollectionEquality().hash(ratingDistribution),const DeepCollectionEquality().hash(recentReviews));

@override
String toString() {
  return 'StoreReviewsOverviewEntity(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class $StoreReviewsOverviewEntityCopyWith<$Res>  {
  factory $StoreReviewsOverviewEntityCopyWith(StoreReviewsOverviewEntity value, $Res Function(StoreReviewsOverviewEntity) _then) = _$StoreReviewsOverviewEntityCopyWithImpl;
@useResult
$Res call({
 double averageRating, int totalReviews, Map<String, int> ratingDistribution, List<ReviewEntity> recentReviews
});




}
/// @nodoc
class _$StoreReviewsOverviewEntityCopyWithImpl<$Res>
    implements $StoreReviewsOverviewEntityCopyWith<$Res> {
  _$StoreReviewsOverviewEntityCopyWithImpl(this._self, this._then);

  final StoreReviewsOverviewEntity _self;
  final $Res Function(StoreReviewsOverviewEntity) _then;

/// Create a copy of StoreReviewsOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = null,Object? recentReviews = null,}) {
  return _then(_self.copyWith(
averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: null == ratingDistribution ? _self.ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,recentReviews: null == recentReviews ? _self.recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreReviewsOverviewEntity].
extension StoreReviewsOverviewEntityPatterns on StoreReviewsOverviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreReviewsOverviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreReviewsOverviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreReviewsOverviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double averageRating,  int totalReviews,  Map<String, int> ratingDistribution,  List<ReviewEntity> recentReviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity() when $default != null:
return $default(_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.recentReviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double averageRating,  int totalReviews,  Map<String, int> ratingDistribution,  List<ReviewEntity> recentReviews)  $default,) {final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity():
return $default(_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.recentReviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double averageRating,  int totalReviews,  Map<String, int> ratingDistribution,  List<ReviewEntity> recentReviews)?  $default,) {final _that = this;
switch (_that) {
case _StoreReviewsOverviewEntity() when $default != null:
return $default(_that.averageRating,_that.totalReviews,_that.ratingDistribution,_that.recentReviews);case _:
  return null;

}
}

}

/// @nodoc


class _StoreReviewsOverviewEntity implements StoreReviewsOverviewEntity {
  const _StoreReviewsOverviewEntity({this.averageRating = 5.0, this.totalReviews = 0, final  Map<String, int> ratingDistribution = const {}, final  List<ReviewEntity> recentReviews = const []}): _ratingDistribution = ratingDistribution,_recentReviews = recentReviews;
  

@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int totalReviews;
 final  Map<String, int> _ratingDistribution;
@override@JsonKey() Map<String, int> get ratingDistribution {
  if (_ratingDistribution is EqualUnmodifiableMapView) return _ratingDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ratingDistribution);
}

 final  List<ReviewEntity> _recentReviews;
@override@JsonKey() List<ReviewEntity> get recentReviews {
  if (_recentReviews is EqualUnmodifiableListView) return _recentReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentReviews);
}


/// Create a copy of StoreReviewsOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreReviewsOverviewEntityCopyWith<_StoreReviewsOverviewEntity> get copyWith => __$StoreReviewsOverviewEntityCopyWithImpl<_StoreReviewsOverviewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreReviewsOverviewEntity&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&const DeepCollectionEquality().equals(other._ratingDistribution, _ratingDistribution)&&const DeepCollectionEquality().equals(other._recentReviews, _recentReviews));
}


@override
int get hashCode => Object.hash(runtimeType,averageRating,totalReviews,const DeepCollectionEquality().hash(_ratingDistribution),const DeepCollectionEquality().hash(_recentReviews));

@override
String toString() {
  return 'StoreReviewsOverviewEntity(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class _$StoreReviewsOverviewEntityCopyWith<$Res> implements $StoreReviewsOverviewEntityCopyWith<$Res> {
  factory _$StoreReviewsOverviewEntityCopyWith(_StoreReviewsOverviewEntity value, $Res Function(_StoreReviewsOverviewEntity) _then) = __$StoreReviewsOverviewEntityCopyWithImpl;
@override @useResult
$Res call({
 double averageRating, int totalReviews, Map<String, int> ratingDistribution, List<ReviewEntity> recentReviews
});




}
/// @nodoc
class __$StoreReviewsOverviewEntityCopyWithImpl<$Res>
    implements _$StoreReviewsOverviewEntityCopyWith<$Res> {
  __$StoreReviewsOverviewEntityCopyWithImpl(this._self, this._then);

  final _StoreReviewsOverviewEntity _self;
  final $Res Function(_StoreReviewsOverviewEntity) _then;

/// Create a copy of StoreReviewsOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? averageRating = null,Object? totalReviews = null,Object? ratingDistribution = null,Object? recentReviews = null,}) {
  return _then(_StoreReviewsOverviewEntity(
averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,ratingDistribution: null == ratingDistribution ? _self._ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,recentReviews: null == recentReviews ? _self._recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,
  ));
}


}

// dart format on
