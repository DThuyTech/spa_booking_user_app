// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {

 String get id;@JsonKey(name: 'type', defaultValue: 'BOOKING') String get type;@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'message', defaultValue: '') String get message;@JsonKey(name: 'isRead', defaultValue: false) bool get isRead;@JsonKey(name: 'createdAt') String get createdAt;@JsonKey(name: 'reference') Map<String, dynamic>? get reference;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.reference, reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,message,isRead,createdAt,const DeepCollectionEquality().hash(reference));

@override
String toString() {
  return 'NotificationModel(id: $id, type: $type, title: $title, message: $message, isRead: $isRead, createdAt: $createdAt, reference: $reference)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'type', defaultValue: 'BOOKING') String type,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'message', defaultValue: '') String message,@JsonKey(name: 'isRead', defaultValue: false) bool isRead,@JsonKey(name: 'createdAt') String createdAt,@JsonKey(name: 'reference') Map<String, dynamic>? reference
});




}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? message = null,Object? isRead = null,Object? createdAt = null,Object? reference = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'type', defaultValue: 'BOOKING')  String type, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'isRead', defaultValue: false)  bool isRead, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'reference')  Map<String, dynamic>? reference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.message,_that.isRead,_that.createdAt,_that.reference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'type', defaultValue: 'BOOKING')  String type, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'isRead', defaultValue: false)  bool isRead, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'reference')  Map<String, dynamic>? reference)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.type,_that.title,_that.message,_that.isRead,_that.createdAt,_that.reference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'type', defaultValue: 'BOOKING')  String type, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'message', defaultValue: '')  String message, @JsonKey(name: 'isRead', defaultValue: false)  bool isRead, @JsonKey(name: 'createdAt')  String createdAt, @JsonKey(name: 'reference')  Map<String, dynamic>? reference)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.message,_that.isRead,_that.createdAt,_that.reference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel extends NotificationModel {
  const _NotificationModel({required this.id, @JsonKey(name: 'type', defaultValue: 'BOOKING') required this.type, @JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'message', defaultValue: '') required this.message, @JsonKey(name: 'isRead', defaultValue: false) required this.isRead, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'reference') final  Map<String, dynamic>? reference}): _reference = reference,super._();
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'type', defaultValue: 'BOOKING') final  String type;
@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'message', defaultValue: '') final  String message;
@override@JsonKey(name: 'isRead', defaultValue: false) final  bool isRead;
@override@JsonKey(name: 'createdAt') final  String createdAt;
 final  Map<String, dynamic>? _reference;
@override@JsonKey(name: 'reference') Map<String, dynamic>? get reference {
  final value = _reference;
  if (value == null) return null;
  if (_reference is EqualUnmodifiableMapView) return _reference;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._reference, _reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,message,isRead,createdAt,const DeepCollectionEquality().hash(_reference));

@override
String toString() {
  return 'NotificationModel(id: $id, type: $type, title: $title, message: $message, isRead: $isRead, createdAt: $createdAt, reference: $reference)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'type', defaultValue: 'BOOKING') String type,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'message', defaultValue: '') String message,@JsonKey(name: 'isRead', defaultValue: false) bool isRead,@JsonKey(name: 'createdAt') String createdAt,@JsonKey(name: 'reference') Map<String, dynamic>? reference
});




}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? message = null,Object? isRead = null,Object? createdAt = null,Object? reference = freezed,}) {
  return _then(_NotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self._reference : reference // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$NotificationListResponseModel {

 List<NotificationModel> get items; Map<String, dynamic>? get pagination;
/// Create a copy of NotificationListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationListResponseModelCopyWith<NotificationListResponseModel> get copyWith => _$NotificationListResponseModelCopyWithImpl<NotificationListResponseModel>(this as NotificationListResponseModel, _$identity);

  /// Serializes this NotificationListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationListResponseModel&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'NotificationListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $NotificationListResponseModelCopyWith<$Res>  {
  factory $NotificationListResponseModelCopyWith(NotificationListResponseModel value, $Res Function(NotificationListResponseModel) _then) = _$NotificationListResponseModelCopyWithImpl;
@useResult
$Res call({
 List<NotificationModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$NotificationListResponseModelCopyWithImpl<$Res>
    implements $NotificationListResponseModelCopyWith<$Res> {
  _$NotificationListResponseModelCopyWithImpl(this._self, this._then);

  final NotificationListResponseModel _self;
  final $Res Function(NotificationListResponseModel) _then;

/// Create a copy of NotificationListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationListResponseModel].
extension NotificationListResponseModelPatterns on NotificationListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationModel> items,  Map<String, dynamic>? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationModel> items,  Map<String, dynamic>? pagination)  $default,) {final _that = this;
switch (_that) {
case _NotificationListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationModel> items,  Map<String, dynamic>? pagination)?  $default,) {final _that = this;
switch (_that) {
case _NotificationListResponseModel() when $default != null:
return $default(_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationListResponseModel extends NotificationListResponseModel {
  const _NotificationListResponseModel({final  List<NotificationModel> items = const [], final  Map<String, dynamic>? pagination}): _items = items,_pagination = pagination,super._();
  factory _NotificationListResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationListResponseModelFromJson(json);

 final  List<NotificationModel> _items;
@override@JsonKey() List<NotificationModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Map<String, dynamic>? _pagination;
@override Map<String, dynamic>? get pagination {
  final value = _pagination;
  if (value == null) return null;
  if (_pagination is EqualUnmodifiableMapView) return _pagination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationListResponseModelCopyWith<_NotificationListResponseModel> get copyWith => __$NotificationListResponseModelCopyWithImpl<_NotificationListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationListResponseModel&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'NotificationListResponseModel(items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$NotificationListResponseModelCopyWith<$Res> implements $NotificationListResponseModelCopyWith<$Res> {
  factory _$NotificationListResponseModelCopyWith(_NotificationListResponseModel value, $Res Function(_NotificationListResponseModel) _then) = __$NotificationListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationModel> items, Map<String, dynamic>? pagination
});




}
/// @nodoc
class __$NotificationListResponseModelCopyWithImpl<$Res>
    implements _$NotificationListResponseModelCopyWith<$Res> {
  __$NotificationListResponseModelCopyWithImpl(this._self, this._then);

  final _NotificationListResponseModel _self;
  final $Res Function(_NotificationListResponseModel) _then;

/// Create a copy of NotificationListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? pagination = freezed,}) {
  return _then(_NotificationListResponseModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
