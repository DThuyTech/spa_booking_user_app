// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffModel {

 String get staffProfileId; String get fullName; String? get role; String? get avatarUrl; String? get bio; double get rating;
/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffModelCopyWith<StaffModel> get copyWith => _$StaffModelCopyWithImpl<StaffModel>(this as StaffModel, _$identity);

  /// Serializes this StaffModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffModel&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,staffProfileId,fullName,role,avatarUrl,bio,rating);

@override
String toString() {
  return 'StaffModel(staffProfileId: $staffProfileId, fullName: $fullName, role: $role, avatarUrl: $avatarUrl, bio: $bio, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $StaffModelCopyWith<$Res>  {
  factory $StaffModelCopyWith(StaffModel value, $Res Function(StaffModel) _then) = _$StaffModelCopyWithImpl;
@useResult
$Res call({
 String staffProfileId, String fullName, String? role, String? avatarUrl, String? bio, double rating
});




}
/// @nodoc
class _$StaffModelCopyWithImpl<$Res>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._self, this._then);

  final StaffModel _self;
  final $Res Function(StaffModel) _then;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? staffProfileId = null,Object? fullName = null,Object? role = freezed,Object? avatarUrl = freezed,Object? bio = freezed,Object? rating = null,}) {
  return _then(_self.copyWith(
staffProfileId: null == staffProfileId ? _self.staffProfileId : staffProfileId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffModel].
extension StaffModelPatterns on StaffModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffModel value)  $default,){
final _that = this;
switch (_that) {
case _StaffModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffModel value)?  $default,){
final _that = this;
switch (_that) {
case _StaffModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String staffProfileId,  String fullName,  String? role,  String? avatarUrl,  String? bio,  double rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffModel() when $default != null:
return $default(_that.staffProfileId,_that.fullName,_that.role,_that.avatarUrl,_that.bio,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String staffProfileId,  String fullName,  String? role,  String? avatarUrl,  String? bio,  double rating)  $default,) {final _that = this;
switch (_that) {
case _StaffModel():
return $default(_that.staffProfileId,_that.fullName,_that.role,_that.avatarUrl,_that.bio,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String staffProfileId,  String fullName,  String? role,  String? avatarUrl,  String? bio,  double rating)?  $default,) {final _that = this;
switch (_that) {
case _StaffModel() when $default != null:
return $default(_that.staffProfileId,_that.fullName,_that.role,_that.avatarUrl,_that.bio,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffModel implements StaffModel {
  const _StaffModel({required this.staffProfileId, required this.fullName, this.role, this.avatarUrl, this.bio, this.rating = 5.0});
  factory _StaffModel.fromJson(Map<String, dynamic> json) => _$StaffModelFromJson(json);

@override final  String staffProfileId;
@override final  String fullName;
@override final  String? role;
@override final  String? avatarUrl;
@override final  String? bio;
@override@JsonKey() final  double rating;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffModelCopyWith<_StaffModel> get copyWith => __$StaffModelCopyWithImpl<_StaffModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffModel&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,staffProfileId,fullName,role,avatarUrl,bio,rating);

@override
String toString() {
  return 'StaffModel(staffProfileId: $staffProfileId, fullName: $fullName, role: $role, avatarUrl: $avatarUrl, bio: $bio, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$StaffModelCopyWith<$Res> implements $StaffModelCopyWith<$Res> {
  factory _$StaffModelCopyWith(_StaffModel value, $Res Function(_StaffModel) _then) = __$StaffModelCopyWithImpl;
@override @useResult
$Res call({
 String staffProfileId, String fullName, String? role, String? avatarUrl, String? bio, double rating
});




}
/// @nodoc
class __$StaffModelCopyWithImpl<$Res>
    implements _$StaffModelCopyWith<$Res> {
  __$StaffModelCopyWithImpl(this._self, this._then);

  final _StaffModel _self;
  final $Res Function(_StaffModel) _then;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? staffProfileId = null,Object? fullName = null,Object? role = freezed,Object? avatarUrl = freezed,Object? bio = freezed,Object? rating = null,}) {
  return _then(_StaffModel(
staffProfileId: null == staffProfileId ? _self.staffProfileId : staffProfileId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
