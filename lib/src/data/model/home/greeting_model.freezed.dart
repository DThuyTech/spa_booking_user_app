// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'greeting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GreetingModel {

 String get id; String get title; String get message;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of GreetingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GreetingModelCopyWith<GreetingModel> get copyWith => _$GreetingModelCopyWithImpl<GreetingModel>(this as GreetingModel, _$identity);

  /// Serializes this GreetingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GreetingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,createdAt);

@override
String toString() {
  return 'GreetingModel(id: $id, title: $title, message: $message, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GreetingModelCopyWith<$Res>  {
  factory $GreetingModelCopyWith(GreetingModel value, $Res Function(GreetingModel) _then) = _$GreetingModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String message,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$GreetingModelCopyWithImpl<$Res>
    implements $GreetingModelCopyWith<$Res> {
  _$GreetingModelCopyWithImpl(this._self, this._then);

  final GreetingModel _self;
  final $Res Function(GreetingModel) _then;

/// Create a copy of GreetingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? message = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GreetingModel].
extension GreetingModelPatterns on GreetingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GreetingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GreetingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GreetingModel value)  $default,){
final _that = this;
switch (_that) {
case _GreetingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GreetingModel value)?  $default,){
final _that = this;
switch (_that) {
case _GreetingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String message, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GreetingModel() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String message, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _GreetingModel():
return $default(_that.id,_that.title,_that.message,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String message, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _GreetingModel() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GreetingModel implements GreetingModel {
  const _GreetingModel({required this.id, required this.title, required this.message, @JsonKey(name: 'created_at') required this.createdAt});
  factory _GreetingModel.fromJson(Map<String, dynamic> json) => _$GreetingModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String message;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of GreetingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GreetingModelCopyWith<_GreetingModel> get copyWith => __$GreetingModelCopyWithImpl<_GreetingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GreetingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GreetingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,createdAt);

@override
String toString() {
  return 'GreetingModel(id: $id, title: $title, message: $message, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GreetingModelCopyWith<$Res> implements $GreetingModelCopyWith<$Res> {
  factory _$GreetingModelCopyWith(_GreetingModel value, $Res Function(_GreetingModel) _then) = __$GreetingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String message,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$GreetingModelCopyWithImpl<$Res>
    implements _$GreetingModelCopyWith<$Res> {
  __$GreetingModelCopyWithImpl(this._self, this._then);

  final _GreetingModel _self;
  final $Res Function(_GreetingModel) _then;

/// Create a copy of GreetingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? message = null,Object? createdAt = null,}) {
  return _then(_GreetingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
