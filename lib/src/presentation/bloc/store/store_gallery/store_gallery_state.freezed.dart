// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreGalleryState {

 StoreGalleryStatus get status; StoreGalleryEntity? get gallery; String get activeCategory; Failure? get failure;
/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreGalleryStateCopyWith<StoreGalleryState> get copyWith => _$StoreGalleryStateCopyWithImpl<StoreGalleryState>(this as StoreGalleryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreGalleryState&&(identical(other.status, status) || other.status == status)&&(identical(other.gallery, gallery) || other.gallery == gallery)&&(identical(other.activeCategory, activeCategory) || other.activeCategory == activeCategory)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,gallery,activeCategory,failure);

@override
String toString() {
  return 'StoreGalleryState(status: $status, gallery: $gallery, activeCategory: $activeCategory, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreGalleryStateCopyWith<$Res>  {
  factory $StoreGalleryStateCopyWith(StoreGalleryState value, $Res Function(StoreGalleryState) _then) = _$StoreGalleryStateCopyWithImpl;
@useResult
$Res call({
 StoreGalleryStatus status, StoreGalleryEntity? gallery, String activeCategory, Failure? failure
});


$StoreGalleryEntityCopyWith<$Res>? get gallery;

}
/// @nodoc
class _$StoreGalleryStateCopyWithImpl<$Res>
    implements $StoreGalleryStateCopyWith<$Res> {
  _$StoreGalleryStateCopyWithImpl(this._self, this._then);

  final StoreGalleryState _self;
  final $Res Function(StoreGalleryState) _then;

/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? gallery = freezed,Object? activeCategory = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreGalleryStatus,gallery: freezed == gallery ? _self.gallery : gallery // ignore: cast_nullable_to_non_nullable
as StoreGalleryEntity?,activeCategory: null == activeCategory ? _self.activeCategory : activeCategory // ignore: cast_nullable_to_non_nullable
as String,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreGalleryEntityCopyWith<$Res>? get gallery {
    if (_self.gallery == null) {
    return null;
  }

  return $StoreGalleryEntityCopyWith<$Res>(_self.gallery!, (value) {
    return _then(_self.copyWith(gallery: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreGalleryState].
extension StoreGalleryStatePatterns on StoreGalleryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreGalleryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreGalleryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreGalleryState value)  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreGalleryState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreGalleryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreGalleryStatus status,  StoreGalleryEntity? gallery,  String activeCategory,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreGalleryState() when $default != null:
return $default(_that.status,_that.gallery,_that.activeCategory,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreGalleryStatus status,  StoreGalleryEntity? gallery,  String activeCategory,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryState():
return $default(_that.status,_that.gallery,_that.activeCategory,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreGalleryStatus status,  StoreGalleryEntity? gallery,  String activeCategory,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreGalleryState() when $default != null:
return $default(_that.status,_that.gallery,_that.activeCategory,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreGalleryState extends StoreGalleryState {
  const _StoreGalleryState({this.status = StoreGalleryStatus.initial, this.gallery, this.activeCategory = 'ALL', this.failure}): super._();
  

@override@JsonKey() final  StoreGalleryStatus status;
@override final  StoreGalleryEntity? gallery;
@override@JsonKey() final  String activeCategory;
@override final  Failure? failure;

/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreGalleryStateCopyWith<_StoreGalleryState> get copyWith => __$StoreGalleryStateCopyWithImpl<_StoreGalleryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreGalleryState&&(identical(other.status, status) || other.status == status)&&(identical(other.gallery, gallery) || other.gallery == gallery)&&(identical(other.activeCategory, activeCategory) || other.activeCategory == activeCategory)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,gallery,activeCategory,failure);

@override
String toString() {
  return 'StoreGalleryState(status: $status, gallery: $gallery, activeCategory: $activeCategory, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreGalleryStateCopyWith<$Res> implements $StoreGalleryStateCopyWith<$Res> {
  factory _$StoreGalleryStateCopyWith(_StoreGalleryState value, $Res Function(_StoreGalleryState) _then) = __$StoreGalleryStateCopyWithImpl;
@override @useResult
$Res call({
 StoreGalleryStatus status, StoreGalleryEntity? gallery, String activeCategory, Failure? failure
});


@override $StoreGalleryEntityCopyWith<$Res>? get gallery;

}
/// @nodoc
class __$StoreGalleryStateCopyWithImpl<$Res>
    implements _$StoreGalleryStateCopyWith<$Res> {
  __$StoreGalleryStateCopyWithImpl(this._self, this._then);

  final _StoreGalleryState _self;
  final $Res Function(_StoreGalleryState) _then;

/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? gallery = freezed,Object? activeCategory = null,Object? failure = freezed,}) {
  return _then(_StoreGalleryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreGalleryStatus,gallery: freezed == gallery ? _self.gallery : gallery // ignore: cast_nullable_to_non_nullable
as StoreGalleryEntity?,activeCategory: null == activeCategory ? _self.activeCategory : activeCategory // ignore: cast_nullable_to_non_nullable
as String,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of StoreGalleryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreGalleryEntityCopyWith<$Res>? get gallery {
    if (_self.gallery == null) {
    return null;
  }

  return $StoreGalleryEntityCopyWith<$Res>(_self.gallery!, (value) {
    return _then(_self.copyWith(gallery: value));
  });
}
}

// dart format on
