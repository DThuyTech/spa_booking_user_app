// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingServiceItemModel {

 String get serviceId; String get name; double get price; int get duration;
/// Create a copy of BookingServiceItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingServiceItemModelCopyWith<BookingServiceItemModel> get copyWith => _$BookingServiceItemModelCopyWithImpl<BookingServiceItemModel>(this as BookingServiceItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingServiceItemModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,name,price,duration);

@override
String toString() {
  return 'BookingServiceItemModel(serviceId: $serviceId, name: $name, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $BookingServiceItemModelCopyWith<$Res>  {
  factory $BookingServiceItemModelCopyWith(BookingServiceItemModel value, $Res Function(BookingServiceItemModel) _then) = _$BookingServiceItemModelCopyWithImpl;
@useResult
$Res call({
 String serviceId, String name, double price, int duration
});




}
/// @nodoc
class _$BookingServiceItemModelCopyWithImpl<$Res>
    implements $BookingServiceItemModelCopyWith<$Res> {
  _$BookingServiceItemModelCopyWithImpl(this._self, this._then);

  final BookingServiceItemModel _self;
  final $Res Function(BookingServiceItemModel) _then;

/// Create a copy of BookingServiceItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? name = null,Object? price = null,Object? duration = null,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingServiceItemModel].
extension BookingServiceItemModelPatterns on BookingServiceItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingServiceItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingServiceItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingServiceItemModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingServiceItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingServiceItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingServiceItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceId,  String name,  double price,  int duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingServiceItemModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceId,  String name,  double price,  int duration)  $default,) {final _that = this;
switch (_that) {
case _BookingServiceItemModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceId,  String name,  double price,  int duration)?  $default,) {final _that = this;
switch (_that) {
case _BookingServiceItemModel() when $default != null:
return $default(_that.serviceId,_that.name,_that.price,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _BookingServiceItemModel implements BookingServiceItemModel {
  const _BookingServiceItemModel({required this.serviceId, required this.name, required this.price, this.duration = 60});
  

@override final  String serviceId;
@override final  String name;
@override final  double price;
@override@JsonKey() final  int duration;

/// Create a copy of BookingServiceItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingServiceItemModelCopyWith<_BookingServiceItemModel> get copyWith => __$BookingServiceItemModelCopyWithImpl<_BookingServiceItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingServiceItemModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,name,price,duration);

@override
String toString() {
  return 'BookingServiceItemModel(serviceId: $serviceId, name: $name, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$BookingServiceItemModelCopyWith<$Res> implements $BookingServiceItemModelCopyWith<$Res> {
  factory _$BookingServiceItemModelCopyWith(_BookingServiceItemModel value, $Res Function(_BookingServiceItemModel) _then) = __$BookingServiceItemModelCopyWithImpl;
@override @useResult
$Res call({
 String serviceId, String name, double price, int duration
});




}
/// @nodoc
class __$BookingServiceItemModelCopyWithImpl<$Res>
    implements _$BookingServiceItemModelCopyWith<$Res> {
  __$BookingServiceItemModelCopyWithImpl(this._self, this._then);

  final _BookingServiceItemModel _self;
  final $Res Function(_BookingServiceItemModel) _then;

/// Create a copy of BookingServiceItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? name = null,Object? price = null,Object? duration = null,}) {
  return _then(_BookingServiceItemModel(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookingStaffSnapshotModel {

 String get staffId; String get name;
/// Create a copy of BookingStaffSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStaffSnapshotModelCopyWith<BookingStaffSnapshotModel> get copyWith => _$BookingStaffSnapshotModelCopyWithImpl<BookingStaffSnapshotModel>(this as BookingStaffSnapshotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingStaffSnapshotModel&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,staffId,name);

@override
String toString() {
  return 'BookingStaffSnapshotModel(staffId: $staffId, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingStaffSnapshotModelCopyWith<$Res>  {
  factory $BookingStaffSnapshotModelCopyWith(BookingStaffSnapshotModel value, $Res Function(BookingStaffSnapshotModel) _then) = _$BookingStaffSnapshotModelCopyWithImpl;
@useResult
$Res call({
 String staffId, String name
});




}
/// @nodoc
class _$BookingStaffSnapshotModelCopyWithImpl<$Res>
    implements $BookingStaffSnapshotModelCopyWith<$Res> {
  _$BookingStaffSnapshotModelCopyWithImpl(this._self, this._then);

  final BookingStaffSnapshotModel _self;
  final $Res Function(BookingStaffSnapshotModel) _then;

/// Create a copy of BookingStaffSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? staffId = null,Object? name = null,}) {
  return _then(_self.copyWith(
staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingStaffSnapshotModel].
extension BookingStaffSnapshotModelPatterns on BookingStaffSnapshotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingStaffSnapshotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingStaffSnapshotModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingStaffSnapshotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingStaffSnapshotModel() when $default != null:
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
case _BookingStaffSnapshotModel() when $default != null:
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
case _BookingStaffSnapshotModel():
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
case _BookingStaffSnapshotModel() when $default != null:
return $default(_that.staffId,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _BookingStaffSnapshotModel implements BookingStaffSnapshotModel {
  const _BookingStaffSnapshotModel({required this.staffId, required this.name});
  

@override final  String staffId;
@override final  String name;

/// Create a copy of BookingStaffSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingStaffSnapshotModelCopyWith<_BookingStaffSnapshotModel> get copyWith => __$BookingStaffSnapshotModelCopyWithImpl<_BookingStaffSnapshotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingStaffSnapshotModel&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,staffId,name);

@override
String toString() {
  return 'BookingStaffSnapshotModel(staffId: $staffId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingStaffSnapshotModelCopyWith<$Res> implements $BookingStaffSnapshotModelCopyWith<$Res> {
  factory _$BookingStaffSnapshotModelCopyWith(_BookingStaffSnapshotModel value, $Res Function(_BookingStaffSnapshotModel) _then) = __$BookingStaffSnapshotModelCopyWithImpl;
@override @useResult
$Res call({
 String staffId, String name
});




}
/// @nodoc
class __$BookingStaffSnapshotModelCopyWithImpl<$Res>
    implements _$BookingStaffSnapshotModelCopyWith<$Res> {
  __$BookingStaffSnapshotModelCopyWithImpl(this._self, this._then);

  final _BookingStaffSnapshotModel _self;
  final $Res Function(_BookingStaffSnapshotModel) _then;

/// Create a copy of BookingStaffSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? staffId = null,Object? name = null,}) {
  return _then(_BookingStaffSnapshotModel(
staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingCustomerSnapshotModel {

 String get name; String get phoneNumber;
/// Create a copy of BookingCustomerSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotModelCopyWith<BookingCustomerSnapshotModel> get copyWith => _$BookingCustomerSnapshotModelCopyWithImpl<BookingCustomerSnapshotModel>(this as BookingCustomerSnapshotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCustomerSnapshotModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'BookingCustomerSnapshotModel(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $BookingCustomerSnapshotModelCopyWith<$Res>  {
  factory $BookingCustomerSnapshotModelCopyWith(BookingCustomerSnapshotModel value, $Res Function(BookingCustomerSnapshotModel) _then) = _$BookingCustomerSnapshotModelCopyWithImpl;
@useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class _$BookingCustomerSnapshotModelCopyWithImpl<$Res>
    implements $BookingCustomerSnapshotModelCopyWith<$Res> {
  _$BookingCustomerSnapshotModelCopyWithImpl(this._self, this._then);

  final BookingCustomerSnapshotModel _self;
  final $Res Function(BookingCustomerSnapshotModel) _then;

/// Create a copy of BookingCustomerSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCustomerSnapshotModel].
extension BookingCustomerSnapshotModelPatterns on BookingCustomerSnapshotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCustomerSnapshotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCustomerSnapshotModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCustomerSnapshotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCustomerSnapshotModel() when $default != null:
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
case _BookingCustomerSnapshotModel() when $default != null:
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
case _BookingCustomerSnapshotModel():
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
case _BookingCustomerSnapshotModel() when $default != null:
return $default(_that.name,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc


class _BookingCustomerSnapshotModel implements BookingCustomerSnapshotModel {
  const _BookingCustomerSnapshotModel({required this.name, required this.phoneNumber});
  

@override final  String name;
@override final  String phoneNumber;

/// Create a copy of BookingCustomerSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCustomerSnapshotModelCopyWith<_BookingCustomerSnapshotModel> get copyWith => __$BookingCustomerSnapshotModelCopyWithImpl<_BookingCustomerSnapshotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCustomerSnapshotModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'BookingCustomerSnapshotModel(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$BookingCustomerSnapshotModelCopyWith<$Res> implements $BookingCustomerSnapshotModelCopyWith<$Res> {
  factory _$BookingCustomerSnapshotModelCopyWith(_BookingCustomerSnapshotModel value, $Res Function(_BookingCustomerSnapshotModel) _then) = __$BookingCustomerSnapshotModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class __$BookingCustomerSnapshotModelCopyWithImpl<$Res>
    implements _$BookingCustomerSnapshotModelCopyWith<$Res> {
  __$BookingCustomerSnapshotModelCopyWithImpl(this._self, this._then);

  final _BookingCustomerSnapshotModel _self;
  final $Res Function(_BookingCustomerSnapshotModel) _then;

/// Create a copy of BookingCustomerSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_BookingCustomerSnapshotModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingStoreSnapshotModel {

 String get id; String get name; String? get slug; String? get logoUrl; String? get address; String? get phoneNumber;
/// Create a copy of BookingStoreSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStoreSnapshotModelCopyWith<BookingStoreSnapshotModel> get copyWith => _$BookingStoreSnapshotModelCopyWithImpl<BookingStoreSnapshotModel>(this as BookingStoreSnapshotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingStoreSnapshotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,address,phoneNumber);

@override
String toString() {
  return 'BookingStoreSnapshotModel(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, address: $address, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $BookingStoreSnapshotModelCopyWith<$Res>  {
  factory $BookingStoreSnapshotModelCopyWith(BookingStoreSnapshotModel value, $Res Function(BookingStoreSnapshotModel) _then) = _$BookingStoreSnapshotModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? slug, String? logoUrl, String? address, String? phoneNumber
});




}
/// @nodoc
class _$BookingStoreSnapshotModelCopyWithImpl<$Res>
    implements $BookingStoreSnapshotModelCopyWith<$Res> {
  _$BookingStoreSnapshotModelCopyWithImpl(this._self, this._then);

  final BookingStoreSnapshotModel _self;
  final $Res Function(BookingStoreSnapshotModel) _then;

/// Create a copy of BookingStoreSnapshotModel
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


/// Adds pattern-matching-related methods to [BookingStoreSnapshotModel].
extension BookingStoreSnapshotModelPatterns on BookingStoreSnapshotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingStoreSnapshotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingStoreSnapshotModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingStoreSnapshotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingStoreSnapshotModel() when $default != null:
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
case _BookingStoreSnapshotModel() when $default != null:
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
case _BookingStoreSnapshotModel():
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
case _BookingStoreSnapshotModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoUrl,_that.address,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc


class _BookingStoreSnapshotModel implements BookingStoreSnapshotModel {
  const _BookingStoreSnapshotModel({required this.id, required this.name, this.slug, this.logoUrl, this.address, this.phoneNumber});
  

@override final  String id;
@override final  String name;
@override final  String? slug;
@override final  String? logoUrl;
@override final  String? address;
@override final  String? phoneNumber;

/// Create a copy of BookingStoreSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingStoreSnapshotModelCopyWith<_BookingStoreSnapshotModel> get copyWith => __$BookingStoreSnapshotModelCopyWithImpl<_BookingStoreSnapshotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingStoreSnapshotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoUrl,address,phoneNumber);

@override
String toString() {
  return 'BookingStoreSnapshotModel(id: $id, name: $name, slug: $slug, logoUrl: $logoUrl, address: $address, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$BookingStoreSnapshotModelCopyWith<$Res> implements $BookingStoreSnapshotModelCopyWith<$Res> {
  factory _$BookingStoreSnapshotModelCopyWith(_BookingStoreSnapshotModel value, $Res Function(_BookingStoreSnapshotModel) _then) = __$BookingStoreSnapshotModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? slug, String? logoUrl, String? address, String? phoneNumber
});




}
/// @nodoc
class __$BookingStoreSnapshotModelCopyWithImpl<$Res>
    implements _$BookingStoreSnapshotModelCopyWith<$Res> {
  __$BookingStoreSnapshotModelCopyWithImpl(this._self, this._then);

  final _BookingStoreSnapshotModel _self;
  final $Res Function(_BookingStoreSnapshotModel) _then;

/// Create a copy of BookingStoreSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? logoUrl = freezed,Object? address = freezed,Object? phoneNumber = freezed,}) {
  return _then(_BookingStoreSnapshotModel(
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
mixin _$BookingActionsModel {

 bool get canCancel; bool get canReschedule; bool get canBookAgain; bool get canReview;
/// Create a copy of BookingActionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingActionsModelCopyWith<BookingActionsModel> get copyWith => _$BookingActionsModelCopyWithImpl<BookingActionsModel>(this as BookingActionsModel, _$identity);

  /// Serializes this BookingActionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingActionsModel&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canBookAgain, canBookAgain) || other.canBookAgain == canBookAgain)&&(identical(other.canReview, canReview) || other.canReview == canReview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canCancel,canReschedule,canBookAgain,canReview);

@override
String toString() {
  return 'BookingActionsModel(canCancel: $canCancel, canReschedule: $canReschedule, canBookAgain: $canBookAgain, canReview: $canReview)';
}


}

/// @nodoc
abstract mixin class $BookingActionsModelCopyWith<$Res>  {
  factory $BookingActionsModelCopyWith(BookingActionsModel value, $Res Function(BookingActionsModel) _then) = _$BookingActionsModelCopyWithImpl;
@useResult
$Res call({
 bool canCancel, bool canReschedule, bool canBookAgain, bool canReview
});




}
/// @nodoc
class _$BookingActionsModelCopyWithImpl<$Res>
    implements $BookingActionsModelCopyWith<$Res> {
  _$BookingActionsModelCopyWithImpl(this._self, this._then);

  final BookingActionsModel _self;
  final $Res Function(BookingActionsModel) _then;

/// Create a copy of BookingActionsModel
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


/// Adds pattern-matching-related methods to [BookingActionsModel].
extension BookingActionsModelPatterns on BookingActionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingActionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingActionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingActionsModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingActionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingActionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingActionsModel() when $default != null:
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
case _BookingActionsModel() when $default != null:
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
case _BookingActionsModel():
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
case _BookingActionsModel() when $default != null:
return $default(_that.canCancel,_that.canReschedule,_that.canBookAgain,_that.canReview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingActionsModel implements BookingActionsModel {
  const _BookingActionsModel({this.canCancel = false, this.canReschedule = false, this.canBookAgain = false, this.canReview = false});
  factory _BookingActionsModel.fromJson(Map<String, dynamic> json) => _$BookingActionsModelFromJson(json);

@override@JsonKey() final  bool canCancel;
@override@JsonKey() final  bool canReschedule;
@override@JsonKey() final  bool canBookAgain;
@override@JsonKey() final  bool canReview;

/// Create a copy of BookingActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingActionsModelCopyWith<_BookingActionsModel> get copyWith => __$BookingActionsModelCopyWithImpl<_BookingActionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingActionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingActionsModel&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canBookAgain, canBookAgain) || other.canBookAgain == canBookAgain)&&(identical(other.canReview, canReview) || other.canReview == canReview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canCancel,canReschedule,canBookAgain,canReview);

@override
String toString() {
  return 'BookingActionsModel(canCancel: $canCancel, canReschedule: $canReschedule, canBookAgain: $canBookAgain, canReview: $canReview)';
}


}

/// @nodoc
abstract mixin class _$BookingActionsModelCopyWith<$Res> implements $BookingActionsModelCopyWith<$Res> {
  factory _$BookingActionsModelCopyWith(_BookingActionsModel value, $Res Function(_BookingActionsModel) _then) = __$BookingActionsModelCopyWithImpl;
@override @useResult
$Res call({
 bool canCancel, bool canReschedule, bool canBookAgain, bool canReview
});




}
/// @nodoc
class __$BookingActionsModelCopyWithImpl<$Res>
    implements _$BookingActionsModelCopyWith<$Res> {
  __$BookingActionsModelCopyWithImpl(this._self, this._then);

  final _BookingActionsModel _self;
  final $Res Function(_BookingActionsModel) _then;

/// Create a copy of BookingActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canCancel = null,Object? canReschedule = null,Object? canBookAgain = null,Object? canReview = null,}) {
  return _then(_BookingActionsModel(
canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canBookAgain: null == canBookAgain ? _self.canBookAgain : canBookAgain // ignore: cast_nullable_to_non_nullable
as bool,canReview: null == canReview ? _self.canReview : canReview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BookingModel {

 String get id; String get bookingCode; String? get storeId; String? get customerId; String get status; String get paymentStatus; String get startAt; String get endAt; double get totalDuration; double get totalAmount; List<BookingServiceItemModel> get services; BookingStaffSnapshotModel? get staffSnapshot; BookingCustomerSnapshotModel? get customerSnapshot; BookingStoreSnapshotModel? get store; BookingActionsModel? get actions; String? get note; String? get cancellationReason; String? get cancelledAt; String? get createdAt;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.staffSnapshot, staffSnapshot) || other.staffSnapshot == staffSnapshot)&&(identical(other.customerSnapshot, customerSnapshot) || other.customerSnapshot == customerSnapshot)&&(identical(other.store, store) || other.store == store)&&(identical(other.actions, actions) || other.actions == actions)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,bookingCode,storeId,customerId,status,paymentStatus,startAt,endAt,totalDuration,totalAmount,const DeepCollectionEquality().hash(services),staffSnapshot,customerSnapshot,store,actions,note,cancellationReason,cancelledAt,createdAt]);

@override
String toString() {
  return 'BookingModel(id: $id, bookingCode: $bookingCode, storeId: $storeId, customerId: $customerId, status: $status, paymentStatus: $paymentStatus, startAt: $startAt, endAt: $endAt, totalDuration: $totalDuration, totalAmount: $totalAmount, services: $services, staffSnapshot: $staffSnapshot, customerSnapshot: $customerSnapshot, store: $store, actions: $actions, note: $note, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
 String id, String bookingCode, String? storeId, String? customerId, String status, String paymentStatus, String startAt, String endAt, double totalDuration, double totalAmount, List<BookingServiceItemModel> services, BookingStaffSnapshotModel? staffSnapshot, BookingCustomerSnapshotModel? customerSnapshot, BookingStoreSnapshotModel? store, BookingActionsModel? actions, String? note, String? cancellationReason, String? cancelledAt, String? createdAt
});


$BookingStaffSnapshotModelCopyWith<$Res>? get staffSnapshot;$BookingCustomerSnapshotModelCopyWith<$Res>? get customerSnapshot;$BookingStoreSnapshotModelCopyWith<$Res>? get store;$BookingActionsModelCopyWith<$Res>? get actions;

}
/// @nodoc
class _$BookingModelCopyWithImpl<$Res>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

/// Create a copy of BookingModel
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
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<BookingServiceItemModel>,staffSnapshot: freezed == staffSnapshot ? _self.staffSnapshot : staffSnapshot // ignore: cast_nullable_to_non_nullable
as BookingStaffSnapshotModel?,customerSnapshot: freezed == customerSnapshot ? _self.customerSnapshot : customerSnapshot // ignore: cast_nullable_to_non_nullable
as BookingCustomerSnapshotModel?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as BookingStoreSnapshotModel?,actions: freezed == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as BookingActionsModel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStaffSnapshotModelCopyWith<$Res>? get staffSnapshot {
    if (_self.staffSnapshot == null) {
    return null;
  }

  return $BookingStaffSnapshotModelCopyWith<$Res>(_self.staffSnapshot!, (value) {
    return _then(_self.copyWith(staffSnapshot: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotModelCopyWith<$Res>? get customerSnapshot {
    if (_self.customerSnapshot == null) {
    return null;
  }

  return $BookingCustomerSnapshotModelCopyWith<$Res>(_self.customerSnapshot!, (value) {
    return _then(_self.copyWith(customerSnapshot: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStoreSnapshotModelCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $BookingStoreSnapshotModelCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingActionsModelCopyWith<$Res>? get actions {
    if (_self.actions == null) {
    return null;
  }

  return $BookingActionsModelCopyWith<$Res>(_self.actions!, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingModel].
extension BookingModelPatterns on BookingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  String startAt,  String endAt,  double totalDuration,  double totalAmount,  List<BookingServiceItemModel> services,  BookingStaffSnapshotModel? staffSnapshot,  BookingCustomerSnapshotModel? customerSnapshot,  BookingStoreSnapshotModel? store,  BookingActionsModel? actions,  String? note,  String? cancellationReason,  String? cancelledAt,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  String startAt,  String endAt,  double totalDuration,  double totalAmount,  List<BookingServiceItemModel> services,  BookingStaffSnapshotModel? staffSnapshot,  BookingCustomerSnapshotModel? customerSnapshot,  BookingStoreSnapshotModel? store,  BookingActionsModel? actions,  String? note,  String? cancellationReason,  String? cancelledAt,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookingModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookingCode,  String? storeId,  String? customerId,  String status,  String paymentStatus,  String startAt,  String endAt,  double totalDuration,  double totalAmount,  List<BookingServiceItemModel> services,  BookingStaffSnapshotModel? staffSnapshot,  BookingCustomerSnapshotModel? customerSnapshot,  BookingStoreSnapshotModel? store,  BookingActionsModel? actions,  String? note,  String? cancellationReason,  String? cancelledAt,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.bookingCode,_that.storeId,_that.customerId,_that.status,_that.paymentStatus,_that.startAt,_that.endAt,_that.totalDuration,_that.totalAmount,_that.services,_that.staffSnapshot,_that.customerSnapshot,_that.store,_that.actions,_that.note,_that.cancellationReason,_that.cancelledAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _BookingModel implements BookingModel {
  const _BookingModel({required this.id, required this.bookingCode, this.storeId, this.customerId, required this.status, this.paymentStatus = 'UNPAID', required this.startAt, required this.endAt, this.totalDuration = 0, this.totalAmount = 0, final  List<BookingServiceItemModel> services = const [], this.staffSnapshot, this.customerSnapshot, this.store, this.actions, this.note, this.cancellationReason, this.cancelledAt, this.createdAt}): _services = services;
  

@override final  String id;
@override final  String bookingCode;
@override final  String? storeId;
@override final  String? customerId;
@override final  String status;
@override@JsonKey() final  String paymentStatus;
@override final  String startAt;
@override final  String endAt;
@override@JsonKey() final  double totalDuration;
@override@JsonKey() final  double totalAmount;
 final  List<BookingServiceItemModel> _services;
@override@JsonKey() List<BookingServiceItemModel> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  BookingStaffSnapshotModel? staffSnapshot;
@override final  BookingCustomerSnapshotModel? customerSnapshot;
@override final  BookingStoreSnapshotModel? store;
@override final  BookingActionsModel? actions;
@override final  String? note;
@override final  String? cancellationReason;
@override final  String? cancelledAt;
@override final  String? createdAt;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelCopyWith<_BookingModel> get copyWith => __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.staffSnapshot, staffSnapshot) || other.staffSnapshot == staffSnapshot)&&(identical(other.customerSnapshot, customerSnapshot) || other.customerSnapshot == customerSnapshot)&&(identical(other.store, store) || other.store == store)&&(identical(other.actions, actions) || other.actions == actions)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,bookingCode,storeId,customerId,status,paymentStatus,startAt,endAt,totalDuration,totalAmount,const DeepCollectionEquality().hash(_services),staffSnapshot,customerSnapshot,store,actions,note,cancellationReason,cancelledAt,createdAt]);

@override
String toString() {
  return 'BookingModel(id: $id, bookingCode: $bookingCode, storeId: $storeId, customerId: $customerId, status: $status, paymentStatus: $paymentStatus, startAt: $startAt, endAt: $endAt, totalDuration: $totalDuration, totalAmount: $totalAmount, services: $services, staffSnapshot: $staffSnapshot, customerSnapshot: $customerSnapshot, store: $store, actions: $actions, note: $note, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingCode, String? storeId, String? customerId, String status, String paymentStatus, String startAt, String endAt, double totalDuration, double totalAmount, List<BookingServiceItemModel> services, BookingStaffSnapshotModel? staffSnapshot, BookingCustomerSnapshotModel? customerSnapshot, BookingStoreSnapshotModel? store, BookingActionsModel? actions, String? note, String? cancellationReason, String? cancelledAt, String? createdAt
});


@override $BookingStaffSnapshotModelCopyWith<$Res>? get staffSnapshot;@override $BookingCustomerSnapshotModelCopyWith<$Res>? get customerSnapshot;@override $BookingStoreSnapshotModelCopyWith<$Res>? get store;@override $BookingActionsModelCopyWith<$Res>? get actions;

}
/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingCode = null,Object? storeId = freezed,Object? customerId = freezed,Object? status = null,Object? paymentStatus = null,Object? startAt = null,Object? endAt = null,Object? totalDuration = null,Object? totalAmount = null,Object? services = null,Object? staffSnapshot = freezed,Object? customerSnapshot = freezed,Object? store = freezed,Object? actions = freezed,Object? note = freezed,Object? cancellationReason = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,}) {
  return _then(_BookingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingCode: null == bookingCode ? _self.bookingCode : bookingCode // ignore: cast_nullable_to_non_nullable
as String,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<BookingServiceItemModel>,staffSnapshot: freezed == staffSnapshot ? _self.staffSnapshot : staffSnapshot // ignore: cast_nullable_to_non_nullable
as BookingStaffSnapshotModel?,customerSnapshot: freezed == customerSnapshot ? _self.customerSnapshot : customerSnapshot // ignore: cast_nullable_to_non_nullable
as BookingCustomerSnapshotModel?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as BookingStoreSnapshotModel?,actions: freezed == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as BookingActionsModel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStaffSnapshotModelCopyWith<$Res>? get staffSnapshot {
    if (_self.staffSnapshot == null) {
    return null;
  }

  return $BookingStaffSnapshotModelCopyWith<$Res>(_self.staffSnapshot!, (value) {
    return _then(_self.copyWith(staffSnapshot: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCustomerSnapshotModelCopyWith<$Res>? get customerSnapshot {
    if (_self.customerSnapshot == null) {
    return null;
  }

  return $BookingCustomerSnapshotModelCopyWith<$Res>(_self.customerSnapshot!, (value) {
    return _then(_self.copyWith(customerSnapshot: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingStoreSnapshotModelCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $BookingStoreSnapshotModelCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingActionsModelCopyWith<$Res>? get actions {
    if (_self.actions == null) {
    return null;
  }

  return $BookingActionsModelCopyWith<$Res>(_self.actions!, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}

// dart format on
