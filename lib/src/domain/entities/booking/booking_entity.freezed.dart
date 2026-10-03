// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingServiceItemEntity {

 String get serviceId; String get name; int get price; int get duration;
/// Create a copy of BookingServiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingServiceItemEntityCopyWith<BookingServiceItemEntity> get copyWith => _$BookingServiceItemEntityCopyWithImpl<BookingServiceItemEntity>(this as BookingServiceItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingServiceItemEntity&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,name,price,duration);

@override
String toString() {
  return 'BookingServiceItemEntity(serviceId: $serviceId, name: $name, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $BookingServiceItemEntityCopyWith<$Res>  {
  factory $BookingServiceItemEntityCopyWith(BookingServiceItemEntity value, $Res Function(BookingServiceItemEntity) _then) = _$BookingServiceItemEntityCopyWithImpl;
@useResult
$Res call({
 String serviceId, String name, int price, int duration
});




}
/// @nodoc
class _$BookingServiceItemEntityCopyWithImpl<$Res>
    implements $BookingServiceItemEntityCopyWith<$Res> {
  _$BookingServiceItemEntityCopyWithImpl(this._self, this._then);

  final BookingServiceItemEntity _self;
  final $Res Function(BookingServiceItemEntity) _then;

/// Create a copy of BookingServiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? name = null,Object? price = null,Object? duration = null,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingServiceItemEntity].
extension BookingServiceItemEntityPatterns on BookingServiceItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingServiceItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingServiceItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingServiceItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingServiceItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingServiceItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingServiceItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceId,  String name,  int price,  int duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingServiceItemEntity() when $default != null:
return $default(_that.serviceId,_that.name,_that.price,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceId,  String name,  int price,  int duration)  $default,) {final _that = this;
switch (_that) {
case _BookingServiceItemEntity():
return $default(_that.serviceId,_that.name,_that.price,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceId,  String name,  int price,  int duration)?  $default,) {final _that = this;
switch (_that) {
case _BookingServiceItemEntity() when $default != null:
return $default(_that.serviceId,_that.name,_that.price,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _BookingServiceItemEntity implements BookingServiceItemEntity {
  const _BookingServiceItemEntity({required this.serviceId, required this.name, required this.price, this.duration = 60});
  

@override final  String serviceId;
@override final  String name;
@override final  int price;
@override@JsonKey() final  int duration;

/// Create a copy of BookingServiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingServiceItemEntityCopyWith<_BookingServiceItemEntity> get copyWith => __$BookingServiceItemEntityCopyWithImpl<_BookingServiceItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingServiceItemEntity&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,name,price,duration);

@override
String toString() {
  return 'BookingServiceItemEntity(serviceId: $serviceId, name: $name, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$BookingServiceItemEntityCopyWith<$Res> implements $BookingServiceItemEntityCopyWith<$Res> {
  factory _$BookingServiceItemEntityCopyWith(_BookingServiceItemEntity value, $Res Function(_BookingServiceItemEntity) _then) = __$BookingServiceItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String serviceId, String name, int price, int duration
});




}
/// @nodoc
class __$BookingServiceItemEntityCopyWithImpl<$Res>
    implements _$BookingServiceItemEntityCopyWith<$Res> {
  __$BookingServiceItemEntityCopyWithImpl(this._self, this._then);

  final _BookingServiceItemEntity _self;
  final $Res Function(_BookingServiceItemEntity) _then;

/// Create a copy of BookingServiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? name = null,Object? price = null,Object? duration = null,}) {
  return _then(_BookingServiceItemEntity(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookingStaffSnapshotEntity {

 String get staffId; String get name;
/// Create a copy of BookingStaffSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStaffSnapshotEntityCopyWith<BookingStaffSnapshotEntity> get copyWith => _$BookingStaffSnapshotEntityCopyWithImpl<BookingStaffSnapshotEntity>(this as BookingStaffSnapshotEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingStaffSnapshotEntity&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,staffId,name);

@override
String toString() {
  return 'BookingStaffSnapshotEntity(staffId: $staffId, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingStaffSnapshotEntityCopyWith<$Res>  {
  factory $BookingStaffSnapshotEntityCopyWith(BookingStaffSnapshotEntity value, $Res Function(BookingStaffSnapshotEntity) _then) = _$BookingStaffSnapshotEntityCopyWithImpl;
@useResult
$Res call({
 String staffId, String name
});




}
/// @nodoc
class _$BookingStaffSnapshotEntityCopyWithImpl<$Res>
    implements $BookingStaffSnapshotEntityCopyWith<$Res> {
  _$BookingStaffSnapshotEntityCopyWithImpl(this._self, this._then);

  final BookingStaffSnapshotEntity _self;
  final $Res Function(BookingStaffSnapshotEntity) _then;

/// Create a copy of BookingStaffSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? staffId = null,Object? name = null,}) {
  return _then(_self.copyWith(
staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingStaffSnapshotEntity].
extension BookingStaffSnapshotEntityPatterns on BookingStaffSnapshotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingStaffSnapshotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingStaffSnapshotEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingStaffSnapshotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String staffId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity() when $default != null:
return $default(_that.staffId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String staffId,  String name)  $default,) {final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity():
return $default(_that.staffId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String staffId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _BookingStaffSnapshotEntity() when $default != null:
return $default(_that.staffId,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _BookingStaffSnapshotEntity implements BookingStaffSnapshotEntity {
  const _BookingStaffSnapshotEntity({required this.staffId, required this.name});
  

@override final  String staffId;
@override final  String name;

/// Create a copy of BookingStaffSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingStaffSnapshotEntityCopyWith<_BookingStaffSnapshotEntity> get copyWith => __$BookingStaffSnapshotEntityCopyWithImpl<_BookingStaffSnapshotEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingStaffSnapshotEntity&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,staffId,name);

@override
String toString() {
  return 'BookingStaffSnapshotEntity(staffId: $staffId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingStaffSnapshotEntityCopyWith<$Res> implements $BookingStaffSnapshotEntityCopyWith<$Res> {
  factory _$BookingStaffSnapshotEntityCopyWith(_BookingStaffSnapshotEntity value, $Res Function(_BookingStaffSnapshotEntity) _then) = __$BookingStaffSnapshotEntityCopyWithImpl;
@override @useResult
$Res call({
 String staffId, String name
});




}
/// @nodoc
class __$BookingStaffSnapshotEntityCopyWithImpl<$Res>
    implements _$BookingStaffSnapshotEntityCopyWith<$Res> {
  __$BookingStaffSnapshotEntityCopyWithImpl(this._self, this._then);

  final _BookingStaffSnapshotEntity _self;
  final $Res Function(_BookingStaffSnapshotEntity) _then;

/// Create a copy of BookingStaffSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? staffId = null,Object? name = null,}) {
  return _then(_BookingStaffSnapshotEntity(
staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingCustomerSnapshotEntity {

 String get name; String get phoneNumber;
/// Create a copy of BookingCustomerSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotEntityCopyWith<BookingCustomerSnapshotEntity> get copyWith => _$BookingCustomerSnapshotEntityCopyWithImpl<BookingCustomerSnapshotEntity>(this as BookingCustomerSnapshotEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCustomerSnapshotEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'BookingCustomerSnapshotEntity(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $BookingCustomerSnapshotEntityCopyWith<$Res>  {
  factory $BookingCustomerSnapshotEntityCopyWith(BookingCustomerSnapshotEntity value, $Res Function(BookingCustomerSnapshotEntity) _then) = _$BookingCustomerSnapshotEntityCopyWithImpl;
@useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class _$BookingCustomerSnapshotEntityCopyWithImpl<$Res>
    implements $BookingCustomerSnapshotEntityCopyWith<$Res> {
  _$BookingCustomerSnapshotEntityCopyWithImpl(this._self, this._then);

  final BookingCustomerSnapshotEntity _self;
  final $Res Function(BookingCustomerSnapshotEntity) _then;

/// Create a copy of BookingCustomerSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCustomerSnapshotEntity].
extension BookingCustomerSnapshotEntityPatterns on BookingCustomerSnapshotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCustomerSnapshotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCustomerSnapshotEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCustomerSnapshotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity() when $default != null:
return $default(_that.name,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity():
return $default(_that.name,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _BookingCustomerSnapshotEntity() when $default != null:
return $default(_that.name,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc


class _BookingCustomerSnapshotEntity implements BookingCustomerSnapshotEntity {
  const _BookingCustomerSnapshotEntity({required this.name, required this.phoneNumber});
  

@override final  String name;
@override final  String phoneNumber;

/// Create a copy of BookingCustomerSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCustomerSnapshotEntityCopyWith<_BookingCustomerSnapshotEntity> get copyWith => __$BookingCustomerSnapshotEntityCopyWithImpl<_BookingCustomerSnapshotEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCustomerSnapshotEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'BookingCustomerSnapshotEntity(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$BookingCustomerSnapshotEntityCopyWith<$Res> implements $BookingCustomerSnapshotEntityCopyWith<$Res> {
  factory _$BookingCustomerSnapshotEntityCopyWith(_BookingCustomerSnapshotEntity value, $Res Function(_BookingCustomerSnapshotEntity) _then) = __$BookingCustomerSnapshotEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class __$BookingCustomerSnapshotEntityCopyWithImpl<$Res>
    implements _$BookingCustomerSnapshotEntityCopyWith<$Res> {
  __$BookingCustomerSnapshotEntityCopyWithImpl(this._self, this._then);

  final _BookingCustomerSnapshotEntity _self;
  final $Res Function(_BookingCustomerSnapshotEntity) _then;

/// Create a copy of BookingCustomerSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_BookingCustomerSnapshotEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingStoreSnapshotEntity {

 String get id; String get name; String? get slug; String? get logoUrl; String? get address; String? get phoneNumber;
/// Create a copy of BookingStoreSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStoreSnapshotEntityCopyWith<BookingStoreSnapshotEntity> get copyWith => _$BookingStoreSnapshotEntityCopyWithImpl<BookingStoreSnapshotEntity>(this as BookingStoreSnapshotEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingStoreSnapshotEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,address,phoneNumber);

@override
String toString() {
  return 'BookingStoreSnapshotEntity(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, address: $address, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $BookingStoreSnapshotEntityCopyWith<$Res>  {
  factory $BookingStoreSnapshotEntityCopyWith(BookingStoreSnapshotEntity value, $Res Function(BookingStoreSnapshotEntity) _then) = _$BookingStoreSnapshotEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? slug, String? logoUrl, String? address, String? phoneNumber
});




}
/// @nodoc
class _$BookingStoreSnapshotEntityCopyWithImpl<$Res>
    implements $BookingStoreSnapshotEntityCopyWith<$Res> {
  _$BookingStoreSnapshotEntityCopyWithImpl(this._self, this._then);

  final BookingStoreSnapshotEntity _self;
  final $Res Function(BookingStoreSnapshotEntity) _then;

/// Create a copy of BookingStoreSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? logoUrl = freezed,Object? address = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingStoreSnapshotEntity].
extension BookingStoreSnapshotEntityPatterns on BookingStoreSnapshotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingStoreSnapshotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingStoreSnapshotEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingStoreSnapshotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? slug,  String? logoUrl,  String? address,  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.address,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? slug,  String? logoUrl,  String? address,  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity():
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.address,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? slug,  String? logoUrl,  String? address,  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _BookingStoreSnapshotEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.address,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc


class _BookingStoreSnapshotEntity implements BookingStoreSnapshotEntity {
  const _BookingStoreSnapshotEntity({required this.id, required this.name, this.slug, this.logoUrl, this.address, this.phoneNumber});
  

@override final  String id;
@override final  String name;
@override final  String? slug;
@override final  String? logoUrl;
@override final  String? address;
@override final  String? phoneNumber;

/// Create a copy of BookingStoreSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingStoreSnapshotEntityCopyWith<_BookingStoreSnapshotEntity> get copyWith => __$BookingStoreSnapshotEntityCopyWithImpl<_BookingStoreSnapshotEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingStoreSnapshotEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,address,phoneNumber);

@override
String toString() {
  return 'BookingStoreSnapshotEntity(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, address: $address, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$BookingStoreSnapshotEntityCopyWith<$Res> implements $BookingStoreSnapshotEntityCopyWith<$Res> {
  factory _$BookingStoreSnapshotEntityCopyWith(_BookingStoreSnapshotEntity value, $Res Function(_BookingStoreSnapshotEntity) _then) = __$BookingStoreSnapshotEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? slug, String? logoUrl, String? address, String? phoneNumber
});




}
/// @nodoc
class __$BookingStoreSnapshotEntityCopyWithImpl<$Res>
    implements _$BookingStoreSnapshotEntityCopyWith<$Res> {
  __$BookingStoreSnapshotEntityCopyWithImpl(this._self, this._then);

  final _BookingStoreSnapshotEntity _self;
  final $Res Function(_BookingStoreSnapshotEntity) _then;

/// Create a copy of BookingStoreSnapshotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? logoUrl = freezed,Object? address = freezed,Object? phoneNumber = freezed,}) {
  return _then(_BookingStoreSnapshotEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingActionsEntity {

 bool get canCancel; bool get canReschedule; bool get canBookAgain; bool get canReview;
/// Create a copy of BookingActionsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingActionsEntityCopyWith<BookingActionsEntity> get copyWith => _$BookingActionsEntityCopyWithImpl<BookingActionsEntity>(this as BookingActionsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingActionsEntity&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canBookAgain, canBookAgain) || other.canBookAgain == canBookAgain)&&(identical(other.canReview, canReview) || other.canReview == canReview));
}


@override
int get hashCode => Object.hash(runtimeType,canCancel,canReschedule,canBookAgain,canReview);

@override
String toString() {
  return 'BookingActionsEntity(canCancel: $canCancel, canReschedule: $canReschedule, canBookAgain: $canBookAgain, canReview: $canReview)';
}


}

/// @nodoc
abstract mixin class $BookingActionsEntityCopyWith<$Res>  {
  factory $BookingActionsEntityCopyWith(BookingActionsEntity value, $Res Function(BookingActionsEntity) _then) = _$BookingActionsEntityCopyWithImpl;
@useResult
$Res call({
 bool canCancel, bool canReschedule, bool canBookAgain, bool canReview
});




}
/// @nodoc
class _$BookingActionsEntityCopyWithImpl<$Res>
    implements $BookingActionsEntityCopyWith<$Res> {
  _$BookingActionsEntityCopyWithImpl(this._self, this._then);

  final BookingActionsEntity _self;
  final $Res Function(BookingActionsEntity) _then;

/// Create a copy of BookingActionsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canCancel = null,Object? canReschedule = null,Object? canBookAgain = null,Object? canReview = null,}) {
  return _then(_self.copyWith(
canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canBookAgain: null == canBookAgain ? _self.canBookAgain : canBookAgain // ignore: cast_nullable_to_non_nullable
as bool,canReview: null == canReview ? _self.canReview : canReview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingActionsEntity].
extension BookingActionsEntityPatterns on BookingActionsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingActionsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingActionsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingActionsEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingActionsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingActionsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingActionsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canCancel,  bool canReschedule,  bool canBookAgain,  bool canReview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingActionsEntity() when $default != null:
return $default(_that.canCancel,_that.canReschedule,_that.canBookAgain,_that.canReview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canCancel,  bool canReschedule,  bool canBookAgain,  bool canReview)  $default,) {final _that = this;
switch (_that) {
case _BookingActionsEntity():
return $default(_that.canCancel,_that.canReschedule,_that.canBookAgain,_that.canReview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canCancel,  bool canReschedule,  bool canBookAgain,  bool canReview)?  $default,) {final _that = this;
switch (_that) {
case _BookingActionsEntity() when $default != null:
return $default(_that.canCancel,_that.canReschedule,_that.canBookAgain,_that.canReview);case _:
  return null;

}
}

}

/// @nodoc


class _BookingActionsEntity implements BookingActionsEntity {
  const _BookingActionsEntity({this.canCancel = false, this.canReschedule = false, this.canBookAgain = false, this.canReview = false});
  

@override@JsonKey() final  bool canCancel;
@override@JsonKey() final  bool canReschedule;
@override@JsonKey() final  bool canBookAgain;
@override@JsonKey() final  bool canReview;

/// Create a copy of BookingActionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingActionsEntityCopyWith<_BookingActionsEntity> get copyWith => __$BookingActionsEntityCopyWithImpl<_BookingActionsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingActionsEntity&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canBookAgain, canBookAgain) || other.canBookAgain == canBookAgain)&&(identical(other.canReview, canReview) || other.canReview == canReview));
}


@override
int get hashCode => Object.hash(runtimeType,canCancel,canReschedule,canBookAgain,canReview);

@override
String toString() {
  return 'BookingActionsEntity(canCancel: $canCancel, canReschedule: $canReschedule, canBookAgain: $canBookAgain, canReview: $canReview)';
}


}

/// @nodoc
abstract mixin class _$BookingActionsEntityCopyWith<$Res> implements $BookingActionsEntityCopyWith<$Res> {
  factory _$BookingActionsEntityCopyWith(_BookingActionsEntity value, $Res Function(_BookingActionsEntity) _then) = __$BookingActionsEntityCopyWithImpl;
@override @useResult
$Res call({
 bool canCancel, bool canReschedule, bool canBookAgain, bool canReview
});




}
/// @nodoc
class __$BookingActionsEntityCopyWithImpl<$Res>
    implements _$BookingActionsEntityCopyWith<$Res> {
  __$BookingActionsEntityCopyWithImpl(this._self, this._then);

  final _BookingActionsEntity _self;
  final $Res Function(_BookingActionsEntity) _then;

/// Create a copy of BookingActionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canCancel = null,Object? canReschedule = null,Object? canBookAgain = null,Object? canReview = null,}) {
  return _then(_BookingActionsEntity(
canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canBookAgain: null == canBookAgain ? _self.canBookAgain : canBookAgain // ignore: cast_nullable_to_non_nullable
as bool,canReview: null == canReview ? _self.canReview : canReview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BookingEntity {

 String get id; String get bookingCode; String? get storeId; String? get customerId; String get status; String get paymentStatus; DateTime get startAt; DateTime get endAt; int get totalDuration; int get totalAmount; List<BookingServiceItemEntity> get services; BookingStaffSnapshotEntity? get staffSnapshot; BookingCustomerSnapshotEntity? get customerSnapshot; BookingStoreSnapshotEntity? get store; BookingActionsEntity? get actions; String? get note; String? get cancellationReason; DateTime? get cancelledAt; DateTime? get createdAt;
/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingEntityCopyWith<BookingEntity> get copyWith => _$BookingEntityCopyWithImpl<BookingEntity>(this as BookingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.staffSnapshot, staffSnapshot) || other.staffSnapshot == staffSnapshot)&&(identical(other.customerSnapshot, customerSnapshot) || other.customerSnapshot == customerSnapshot)&&(identical(other.store, store) || other.store == store)&&(identical(other.actions, actions) || other.actions == actions)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,bookingCode,storeId,customerId,status,paymentStatus,startAt,endAt,totalDuration,totalAmount,const DeepCollectionEquality().hash(services),staffSnapshot,customerSnapshot,store,actions,note,cancellationReason,cancelledAt,createdAt]);

@override
String toString() {
  return 'BookingEntity(id: $id, bookingCode: $bookingCode, storeId: $storeId, customerId: $customerId, status: $status, paymentStatus: $paymentStatus, startAt: $startAt, endAt: $endAt, totalDuration: $totalDuration, totalAmount: $totalAmount, services: $services, staffSnapshot: $staffSnapshot, customerSnapshot: $customerSnapshot, store: $store, actions: $actions, note: $note, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookingEntityCopyWith<$Res>  {
  factory $BookingEntityCopyWith(BookingEntity value, $Res Function(BookingEntity) _then) = _$BookingEntityCopyWithImpl;
@useResult
$Res call({
 String id, String bookingCode, String? storeId, String? customerId, String status, String paymentStatus, DateTime startAt, DateTime endAt, int totalDuration, int totalAmount, List<BookingServiceItemEntity> services, BookingStaffSnapshotEntity? staffSnapshot, BookingCustomerSnapshotEntity? customerSnapshot, BookingStoreSnapshotEntity? store, BookingActionsEntity? actions, String? note, String? cancellationReason, DateTime? cancelledAt, DateTime? createdAt
});


$BookingStaffSnapshotEntityCopyWith<$Res>? get staffSnapshot;$BookingCustomerSnapshotEntityCopyWith<$Res>? get customerSnapshot;$BookingStoreSnapshotEntityCopyWith<$Res>? get store;$BookingActionsEntityCopyWith<$Res>? get actions;

}
/// @nodoc
class _$BookingEntityCopyWithImpl<$Res>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._self, this._then);

  final BookingEntity _self;
  final $Res Function(BookingEntity) _then;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingCode = null,Object? storeId = freezed,Object? customerId = freezed,Object? status = null,Object? paymentStatus = null,Object? startAt = null,Object? endAt = null,Object? totalDuration = null,Object? totalAmount = null,Object? services = null,Object? staffSnapshot = freezed,Object? customerSnapshot = freezed,Object? store = freezed,Object? actions = freezed,Object? note = freezed,Object? cancellationReason = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingCode: null == bookingCode ? _self.bookingCode : bookingCode // ignore: cast_nullable_to_non_nullable
as String,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<BookingServiceItemEntity>,staffSnapshot: freezed == staffSnapshot ? _self.staffSnapshot : staffSnapshot // ignore: cast_nullable_to_non_nullable
as BookingStaffSnapshotEntity?,customerSnapshot: freezed == customerSnapshot ? _self.customerSnapshot : customerSnapshot // ignore: cast_nullable_to_non_nullable
as BookingCustomerSnapshotEntity?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as BookingStoreSnapshotEntity?,actions: freezed == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as BookingActionsEntity?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStaffSnapshotEntityCopyWith<$Res>? get staffSnapshot {
    if (_self.staffSnapshot == null) {
    return null;
  }

  return $BookingStaffSnapshotEntityCopyWith<$Res>(_self.staffSnapshot!, (value) {
    return _then(_self.copyWith(staffSnapshot: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotEntityCopyWith<$Res>? get customerSnapshot {
    if (_self.customerSnapshot == null) {
    return null;
  }

  return $BookingCustomerSnapshotEntityCopyWith<$Res>(_self.customerSnapshot!, (value) {
    return _then(_self.copyWith(customerSnapshot: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStoreSnapshotEntityCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $BookingStoreSnapshotEntityCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingActionsEntityCopyWith<$Res>? get actions {
    if (_self.actions == null) {
    return null;
  }

  return $BookingActionsEntityCopyWith<$Res>(_self.actions!, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingEntity].
extension BookingEntityPatterns on BookingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  DateTime startAt,  DateTime endAt,  int totalDuration,  int totalAmount,  List<BookingServiceItemEntity> services,  BookingStaffSnapshotEntity? staffSnapshot,  BookingCustomerSnapshotEntity? customerSnapshot,  BookingStoreSnapshotEntity? store,  BookingActionsEntity? actions,  String? note,  String? cancellationReason,  DateTime? cancelledAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
return $default(_that.id,_that.bookingCode,_that.storeId,_that.customerId,_that.status,_that.paymentStatus,_that.startAt,_that.endAt,_that.totalDuration,_that.totalAmount,_that.services,_that.staffSnapshot,_that.customerSnapshot,_that.store,_that.actions,_that.note,_that.cancellationReason,_that.cancelledAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  DateTime startAt,  DateTime endAt,  int totalDuration,  int totalAmount,  List<BookingServiceItemEntity> services,  BookingStaffSnapshotEntity? staffSnapshot,  BookingCustomerSnapshotEntity? customerSnapshot,  BookingStoreSnapshotEntity? store,  BookingActionsEntity? actions,  String? note,  String? cancellationReason,  DateTime? cancelledAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookingEntity():
return $default(_that.id,_that.bookingCode,_that.storeId,_that.customerId,_that.status,_that.paymentStatus,_that.startAt,_that.endAt,_that.totalDuration,_that.totalAmount,_that.services,_that.staffSnapshot,_that.customerSnapshot,_that.store,_that.actions,_that.note,_that.cancellationReason,_that.cancelledAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  DateTime startAt,  DateTime endAt,  int totalDuration,  int totalAmount,  List<BookingServiceItemEntity> services,  BookingStaffSnapshotEntity? staffSnapshot,  BookingCustomerSnapshotEntity? customerSnapshot,  BookingStoreSnapshotEntity? store,  BookingActionsEntity? actions,  String? note,  String? cancellationReason,  DateTime? cancelledAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
return $default(_that.id,_that.bookingCode,_that.storeId,_that.customerId,_that.status,_that.paymentStatus,_that.startAt,_that.endAt,_that.totalDuration,_that.totalAmount,_that.services,_that.staffSnapshot,_that.customerSnapshot,_that.store,_that.actions,_that.note,_that.cancellationReason,_that.cancelledAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _BookingEntity implements BookingEntity {
  const _BookingEntity({required this.id, required this.bookingCode, this.storeId, this.customerId, required this.status, this.paymentStatus = 'UNPAID', required this.startAt, required this.endAt, this.totalDuration = 0, this.totalAmount = 0, final  List<BookingServiceItemEntity> services = const [], this.staffSnapshot, this.customerSnapshot, this.store, this.actions, this.note, this.cancellationReason, this.cancelledAt, this.createdAt}): _services = services;
  

@override final  String id;
@override final  String bookingCode;
@override final  String? storeId;
@override final  String? customerId;
@override final  String status;
@override@JsonKey() final  String paymentStatus;
@override final  DateTime startAt;
@override final  DateTime endAt;
@override@JsonKey() final  int totalDuration;
@override@JsonKey() final  int totalAmount;
 final  List<BookingServiceItemEntity> _services;
@override@JsonKey() List<BookingServiceItemEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  BookingStaffSnapshotEntity? staffSnapshot;
@override final  BookingCustomerSnapshotEntity? customerSnapshot;
@override final  BookingStoreSnapshotEntity? store;
@override final  BookingActionsEntity? actions;
@override final  String? note;
@override final  String? cancellationReason;
@override final  DateTime? cancelledAt;
@override final  DateTime? createdAt;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingEntityCopyWith<_BookingEntity> get copyWith => __$BookingEntityCopyWithImpl<_BookingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.staffSnapshot, staffSnapshot) || other.staffSnapshot == staffSnapshot)&&(identical(other.customerSnapshot, customerSnapshot) || other.customerSnapshot == customerSnapshot)&&(identical(other.store, store) || other.store == store)&&(identical(other.actions, actions) || other.actions == actions)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,bookingCode,storeId,customerId,status,paymentStatus,startAt,endAt,totalDuration,totalAmount,const DeepCollectionEquality().hash(_services),staffSnapshot,customerSnapshot,store,actions,note,cancellationReason,cancelledAt,createdAt]);

@override
String toString() {
  return 'BookingEntity(id: $id, bookingCode: $bookingCode, storeId: $storeId, customerId: $customerId, status: $status, paymentStatus: $paymentStatus, startAt: $startAt, endAt: $endAt, totalDuration: $totalDuration, totalAmount: $totalAmount, services: $services, staffSnapshot: $staffSnapshot, customerSnapshot: $customerSnapshot, store: $store, actions: $actions, note: $note, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookingEntityCopyWith<$Res> implements $BookingEntityCopyWith<$Res> {
  factory _$BookingEntityCopyWith(_BookingEntity value, $Res Function(_BookingEntity) _then) = __$BookingEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingCode, String? storeId, String? customerId, String status, String paymentStatus, DateTime startAt, DateTime endAt, int totalDuration, int totalAmount, List<BookingServiceItemEntity> services, BookingStaffSnapshotEntity? staffSnapshot, BookingCustomerSnapshotEntity? customerSnapshot, BookingStoreSnapshotEntity? store, BookingActionsEntity? actions, String? note, String? cancellationReason, DateTime? cancelledAt, DateTime? createdAt
});


@override $BookingStaffSnapshotEntityCopyWith<$Res>? get staffSnapshot;@override $BookingCustomerSnapshotEntityCopyWith<$Res>? get customerSnapshot;@override $BookingStoreSnapshotEntityCopyWith<$Res>? get store;@override $BookingActionsEntityCopyWith<$Res>? get actions;

}
/// @nodoc
class __$BookingEntityCopyWithImpl<$Res>
    implements _$BookingEntityCopyWith<$Res> {
  __$BookingEntityCopyWithImpl(this._self, this._then);

  final _BookingEntity _self;
  final $Res Function(_BookingEntity) _then;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingCode = null,Object? storeId = freezed,Object? customerId = freezed,Object? status = null,Object? paymentStatus = null,Object? startAt = null,Object? endAt = null,Object? totalDuration = null,Object? totalAmount = null,Object? services = null,Object? staffSnapshot = freezed,Object? customerSnapshot = freezed,Object? store = freezed,Object? actions = freezed,Object? note = freezed,Object? cancellationReason = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,}) {
  return _then(_BookingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingCode: null == bookingCode ? _self.bookingCode : bookingCode // ignore: cast_nullable_to_non_nullable
as String,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<BookingServiceItemEntity>,staffSnapshot: freezed == staffSnapshot ? _self.staffSnapshot : staffSnapshot // ignore: cast_nullable_to_non_nullable
as BookingStaffSnapshotEntity?,customerSnapshot: freezed == customerSnapshot ? _self.customerSnapshot : customerSnapshot // ignore: cast_nullable_to_non_nullable
as BookingCustomerSnapshotEntity?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as BookingStoreSnapshotEntity?,actions: freezed == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as BookingActionsEntity?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStaffSnapshotEntityCopyWith<$Res>? get staffSnapshot {
    if (_self.staffSnapshot == null) {
    return null;
  }

  return $BookingStaffSnapshotEntityCopyWith<$Res>(_self.staffSnapshot!, (value) {
    return _then(_self.copyWith(staffSnapshot: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotEntityCopyWith<$Res>? get customerSnapshot {
    if (_self.customerSnapshot == null) {
    return null;
  }

  return $BookingCustomerSnapshotEntityCopyWith<$Res>(_self.customerSnapshot!, (value) {
    return _then(_self.copyWith(customerSnapshot: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStoreSnapshotEntityCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $BookingStoreSnapshotEntityCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingActionsEntityCopyWith<$Res>? get actions {
    if (_self.actions == null) {
    return null;
  }

  return $BookingActionsEntityCopyWith<$Res>(_self.actions!, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}

// dart format on
