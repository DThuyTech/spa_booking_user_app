// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreBusinessHourModel {

 int get dayOfWeek; String get dayName; bool get isOpen; String get openTime; String get closeTime;
/// Create a copy of StoreBusinessHourModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBusinessHourModelCopyWith<StoreBusinessHourModel> get copyWith => _$StoreBusinessHourModelCopyWithImpl<StoreBusinessHourModel>(this as StoreBusinessHourModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBusinessHourModel&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.closeTime, closeTime) || other.closeTime == closeTime));
}


@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,dayName,isOpen,openTime,closeTime);

@override
String toString() {
  return 'StoreBusinessHourModel(dayOfWeek: $dayOfWeek, dayName: $dayName, isOpen: $isOpen, openTime: $openTime, closeTime: $closeTime)';
}


}

/// @nodoc
abstract mixin class $StoreBusinessHourModelCopyWith<$Res>  {
  factory $StoreBusinessHourModelCopyWith(StoreBusinessHourModel value, $Res Function(StoreBusinessHourModel) _then) = _$StoreBusinessHourModelCopyWithImpl;
@useResult
$Res call({
 int dayOfWeek, String dayName, bool isOpen, String openTime, String closeTime
});




}
/// @nodoc
class _$StoreBusinessHourModelCopyWithImpl<$Res>
    implements $StoreBusinessHourModelCopyWith<$Res> {
  _$StoreBusinessHourModelCopyWithImpl(this._self, this._then);

  final StoreBusinessHourModel _self;
  final $Res Function(StoreBusinessHourModel) _then;

/// Create a copy of StoreBusinessHourModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayOfWeek = null,Object? dayName = null,Object? isOpen = null,Object? openTime = null,Object? closeTime = null,}) {
  return _then(_self.copyWith(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as String,closeTime: null == closeTime ? _self.closeTime : closeTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreBusinessHourModel].
extension StoreBusinessHourModelPatterns on StoreBusinessHourModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreBusinessHourModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreBusinessHourModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreBusinessHourModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreBusinessHourModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreBusinessHourModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreBusinessHourModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dayOfWeek,  String dayName,  bool isOpen,  String openTime,  String closeTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreBusinessHourModel() when $default != null:
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.openTime,_that.closeTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dayOfWeek,  String dayName,  bool isOpen,  String openTime,  String closeTime)  $default,) {final _that = this;
switch (_that) {
case _StoreBusinessHourModel():
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.openTime,_that.closeTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dayOfWeek,  String dayName,  bool isOpen,  String openTime,  String closeTime)?  $default,) {final _that = this;
switch (_that) {
case _StoreBusinessHourModel() when $default != null:
return $default(_that.dayOfWeek,_that.dayName,_that.isOpen,_that.openTime,_that.closeTime);case _:
  return null;

}
}

}

/// @nodoc


class _StoreBusinessHourModel implements StoreBusinessHourModel {
  const _StoreBusinessHourModel({required this.dayOfWeek, required this.dayName, required this.isOpen, required this.openTime, required this.closeTime});
  

@override final  int dayOfWeek;
@override final  String dayName;
@override final  bool isOpen;
@override final  String openTime;
@override final  String closeTime;

/// Create a copy of StoreBusinessHourModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreBusinessHourModelCopyWith<_StoreBusinessHourModel> get copyWith => __$StoreBusinessHourModelCopyWithImpl<_StoreBusinessHourModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreBusinessHourModel&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.closeTime, closeTime) || other.closeTime == closeTime));
}


@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,dayName,isOpen,openTime,closeTime);

@override
String toString() {
  return 'StoreBusinessHourModel(dayOfWeek: $dayOfWeek, dayName: $dayName, isOpen: $isOpen, openTime: $openTime, closeTime: $closeTime)';
}


}

/// @nodoc
abstract mixin class _$StoreBusinessHourModelCopyWith<$Res> implements $StoreBusinessHourModelCopyWith<$Res> {
  factory _$StoreBusinessHourModelCopyWith(_StoreBusinessHourModel value, $Res Function(_StoreBusinessHourModel) _then) = __$StoreBusinessHourModelCopyWithImpl;
@override @useResult
$Res call({
 int dayOfWeek, String dayName, bool isOpen, String openTime, String closeTime
});




}
/// @nodoc
class __$StoreBusinessHourModelCopyWithImpl<$Res>
    implements _$StoreBusinessHourModelCopyWith<$Res> {
  __$StoreBusinessHourModelCopyWithImpl(this._self, this._then);

  final _StoreBusinessHourModel _self;
  final $Res Function(_StoreBusinessHourModel) _then;

/// Create a copy of StoreBusinessHourModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayOfWeek = null,Object? dayName = null,Object? isOpen = null,Object? openTime = null,Object? closeTime = null,}) {
  return _then(_StoreBusinessHourModel(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as String,closeTime: null == closeTime ? _self.closeTime : closeTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StoreBookingSettingsModel {

 int get minBookingNoticeMinutes; int get maxBookingAdvanceDays; int get minCancellationNoticeMinutes; int get minRescheduleNoticeMinutes; bool get autoConfirm;
/// Create a copy of StoreBookingSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBookingSettingsModelCopyWith<StoreBookingSettingsModel> get copyWith => _$StoreBookingSettingsModelCopyWithImpl<StoreBookingSettingsModel>(this as StoreBookingSettingsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingSettingsModel&&(identical(other.minBookingNoticeMinutes, minBookingNoticeMinutes) || other.minBookingNoticeMinutes == minBookingNoticeMinutes)&&(identical(other.maxBookingAdvanceDays, maxBookingAdvanceDays) || other.maxBookingAdvanceDays == maxBookingAdvanceDays)&&(identical(other.minCancellationNoticeMinutes, minCancellationNoticeMinutes) || other.minCancellationNoticeMinutes == minCancellationNoticeMinutes)&&(identical(other.minRescheduleNoticeMinutes, minRescheduleNoticeMinutes) || other.minRescheduleNoticeMinutes == minRescheduleNoticeMinutes)&&(identical(other.autoConfirm, autoConfirm) || other.autoConfirm == autoConfirm));
}


@override
int get hashCode => Object.hash(runtimeType,minBookingNoticeMinutes,maxBookingAdvanceDays,minCancellationNoticeMinutes,minRescheduleNoticeMinutes,autoConfirm);

@override
String toString() {
  return 'StoreBookingSettingsModel(minBookingNoticeMinutes: $minBookingNoticeMinutes, maxBookingAdvanceDays: $maxBookingAdvanceDays, minCancellationNoticeMinutes: $minCancellationNoticeMinutes, minRescheduleNoticeMinutes: $minRescheduleNoticeMinutes, autoConfirm: $autoConfirm)';
}


}

/// @nodoc
abstract mixin class $StoreBookingSettingsModelCopyWith<$Res>  {
  factory $StoreBookingSettingsModelCopyWith(StoreBookingSettingsModel value, $Res Function(StoreBookingSettingsModel) _then) = _$StoreBookingSettingsModelCopyWithImpl;
@useResult
$Res call({
 int minBookingNoticeMinutes, int maxBookingAdvanceDays, int minCancellationNoticeMinutes, int minRescheduleNoticeMinutes, bool autoConfirm
});




}
/// @nodoc
class _$StoreBookingSettingsModelCopyWithImpl<$Res>
    implements $StoreBookingSettingsModelCopyWith<$Res> {
  _$StoreBookingSettingsModelCopyWithImpl(this._self, this._then);

  final StoreBookingSettingsModel _self;
  final $Res Function(StoreBookingSettingsModel) _then;

/// Create a copy of StoreBookingSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minBookingNoticeMinutes = null,Object? maxBookingAdvanceDays = null,Object? minCancellationNoticeMinutes = null,Object? minRescheduleNoticeMinutes = null,Object? autoConfirm = null,}) {
  return _then(_self.copyWith(
minBookingNoticeMinutes: null == minBookingNoticeMinutes ? _self.minBookingNoticeMinutes : minBookingNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,maxBookingAdvanceDays: null == maxBookingAdvanceDays ? _self.maxBookingAdvanceDays : maxBookingAdvanceDays // ignore: cast_nullable_to_non_nullable
as int,minCancellationNoticeMinutes: null == minCancellationNoticeMinutes ? _self.minCancellationNoticeMinutes : minCancellationNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,minRescheduleNoticeMinutes: null == minRescheduleNoticeMinutes ? _self.minRescheduleNoticeMinutes : minRescheduleNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,autoConfirm: null == autoConfirm ? _self.autoConfirm : autoConfirm // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreBookingSettingsModel].
extension StoreBookingSettingsModelPatterns on StoreBookingSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreBookingSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreBookingSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreBookingSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreBookingSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreBookingSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreBookingSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreBookingSettingsModel() when $default != null:
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)  $default,) {final _that = this;
switch (_that) {
case _StoreBookingSettingsModel():
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minBookingNoticeMinutes,  int maxBookingAdvanceDays,  int minCancellationNoticeMinutes,  int minRescheduleNoticeMinutes,  bool autoConfirm)?  $default,) {final _that = this;
switch (_that) {
case _StoreBookingSettingsModel() when $default != null:
return $default(_that.minBookingNoticeMinutes,_that.maxBookingAdvanceDays,_that.minCancellationNoticeMinutes,_that.minRescheduleNoticeMinutes,_that.autoConfirm);case _:
  return null;

}
}

}

/// @nodoc


class _StoreBookingSettingsModel implements StoreBookingSettingsModel {
  const _StoreBookingSettingsModel({this.minBookingNoticeMinutes = 60, this.maxBookingAdvanceDays = 30, this.minCancellationNoticeMinutes = 120, this.minRescheduleNoticeMinutes = 120, this.autoConfirm = true});
  

@override@JsonKey() final  int minBookingNoticeMinutes;
@override@JsonKey() final  int maxBookingAdvanceDays;
@override@JsonKey() final  int minCancellationNoticeMinutes;
@override@JsonKey() final  int minRescheduleNoticeMinutes;
@override@JsonKey() final  bool autoConfirm;

/// Create a copy of StoreBookingSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreBookingSettingsModelCopyWith<_StoreBookingSettingsModel> get copyWith => __$StoreBookingSettingsModelCopyWithImpl<_StoreBookingSettingsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreBookingSettingsModel&&(identical(other.minBookingNoticeMinutes, minBookingNoticeMinutes) || other.minBookingNoticeMinutes == minBookingNoticeMinutes)&&(identical(other.maxBookingAdvanceDays, maxBookingAdvanceDays) || other.maxBookingAdvanceDays == maxBookingAdvanceDays)&&(identical(other.minCancellationNoticeMinutes, minCancellationNoticeMinutes) || other.minCancellationNoticeMinutes == minCancellationNoticeMinutes)&&(identical(other.minRescheduleNoticeMinutes, minRescheduleNoticeMinutes) || other.minRescheduleNoticeMinutes == minRescheduleNoticeMinutes)&&(identical(other.autoConfirm, autoConfirm) || other.autoConfirm == autoConfirm));
}


@override
int get hashCode => Object.hash(runtimeType,minBookingNoticeMinutes,maxBookingAdvanceDays,minCancellationNoticeMinutes,minRescheduleNoticeMinutes,autoConfirm);

@override
String toString() {
  return 'StoreBookingSettingsModel(minBookingNoticeMinutes: $minBookingNoticeMinutes, maxBookingAdvanceDays: $maxBookingAdvanceDays, minCancellationNoticeMinutes: $minCancellationNoticeMinutes, minRescheduleNoticeMinutes: $minRescheduleNoticeMinutes, autoConfirm: $autoConfirm)';
}


}

/// @nodoc
abstract mixin class _$StoreBookingSettingsModelCopyWith<$Res> implements $StoreBookingSettingsModelCopyWith<$Res> {
  factory _$StoreBookingSettingsModelCopyWith(_StoreBookingSettingsModel value, $Res Function(_StoreBookingSettingsModel) _then) = __$StoreBookingSettingsModelCopyWithImpl;
@override @useResult
$Res call({
 int minBookingNoticeMinutes, int maxBookingAdvanceDays, int minCancellationNoticeMinutes, int minRescheduleNoticeMinutes, bool autoConfirm
});




}
/// @nodoc
class __$StoreBookingSettingsModelCopyWithImpl<$Res>
    implements _$StoreBookingSettingsModelCopyWith<$Res> {
  __$StoreBookingSettingsModelCopyWithImpl(this._self, this._then);

  final _StoreBookingSettingsModel _self;
  final $Res Function(_StoreBookingSettingsModel) _then;

/// Create a copy of StoreBookingSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minBookingNoticeMinutes = null,Object? maxBookingAdvanceDays = null,Object? minCancellationNoticeMinutes = null,Object? minRescheduleNoticeMinutes = null,Object? autoConfirm = null,}) {
  return _then(_StoreBookingSettingsModel(
minBookingNoticeMinutes: null == minBookingNoticeMinutes ? _self.minBookingNoticeMinutes : minBookingNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,maxBookingAdvanceDays: null == maxBookingAdvanceDays ? _self.maxBookingAdvanceDays : maxBookingAdvanceDays // ignore: cast_nullable_to_non_nullable
as int,minCancellationNoticeMinutes: null == minCancellationNoticeMinutes ? _self.minCancellationNoticeMinutes : minCancellationNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,minRescheduleNoticeMinutes: null == minRescheduleNoticeMinutes ? _self.minRescheduleNoticeMinutes : minRescheduleNoticeMinutes // ignore: cast_nullable_to_non_nullable
as int,autoConfirm: null == autoConfirm ? _self.autoConfirm : autoConfirm // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StoreDetailModel {

 String get id; String get name; String get slug; String? get description; String get address; String get phoneNumber; String? get logoUrl; String? get coverUrl; List<String> get images; List<StoreBusinessHourModel> get businessHours; StoreBookingSettingsModel? get bookingSettings;
/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailModelCopyWith<StoreDetailModel> get copyWith => _$StoreDetailModelCopyWithImpl<StoreDetailModel>(this as StoreDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.businessHours, businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverUrl,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(businessHours),bookingSettings);

@override
String toString() {
  return 'StoreDetailModel(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverUrl: $coverUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings)';
}


}

/// @nodoc
abstract mixin class $StoreDetailModelCopyWith<$Res>  {
  factory $StoreDetailModelCopyWith(StoreDetailModel value, $Res Function(StoreDetailModel) _then) = _$StoreDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverUrl, List<String> images, List<StoreBusinessHourModel> businessHours, StoreBookingSettingsModel? bookingSettings
});


$StoreBookingSettingsModelCopyWith<$Res>? get bookingSettings;

}
/// @nodoc
class _$StoreDetailModelCopyWithImpl<$Res>
    implements $StoreDetailModelCopyWith<$Res> {
  _$StoreDetailModelCopyWithImpl(this._self, this._then);

  final StoreDetailModel _self;
  final $Res Function(StoreDetailModel) _then;

/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? images = null,Object? businessHours = null,Object? bookingSettings = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: null == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourModel>,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsModel?,
  ));
}
/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreBookingSettingsModelCopyWith<$Res>? get bookingSettings {
    if (_self.bookingSettings == null) {
    return null;
  }

  return $StoreBookingSettingsModelCopyWith<$Res>(_self.bookingSettings!, (value) {
    return _then(_self.copyWith(bookingSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreDetailModel].
extension StoreDetailModelPatterns on StoreDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourModel> businessHours,  StoreBookingSettingsModel? bookingSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourModel> businessHours,  StoreBookingSettingsModel? bookingSettings)  $default,) {final _that = this;
switch (_that) {
case _StoreDetailModel():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  String address,  String phoneNumber,  String? logoUrl,  String? coverUrl,  List<String> images,  List<StoreBusinessHourModel> businessHours,  StoreBookingSettingsModel? bookingSettings)?  $default,) {final _that = this;
switch (_that) {
case _StoreDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.address,_that.phoneNumber,_that.logoUrl,_that.coverUrl,_that.images,_that.businessHours,_that.bookingSettings);case _:
  return null;

}
}

}

/// @nodoc


class _StoreDetailModel implements StoreDetailModel {
  const _StoreDetailModel({required this.id, required this.name, required this.slug, this.description, required this.address, required this.phoneNumber, this.logoUrl, this.coverUrl, final  List<String> images = const [], final  List<StoreBusinessHourModel> businessHours = const [], this.bookingSettings}): _images = images,_businessHours = businessHours;
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String address;
@override final  String phoneNumber;
@override final  String? logoUrl;
@override final  String? coverUrl;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<StoreBusinessHourModel> _businessHours;
@override@JsonKey() List<StoreBusinessHourModel> get businessHours {
  if (_businessHours is EqualUnmodifiableListView) return _businessHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businessHours);
}

@override final  StoreBookingSettingsModel? bookingSettings;

/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDetailModelCopyWith<_StoreDetailModel> get copyWith => __$StoreDetailModelCopyWithImpl<_StoreDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._businessHours, _businessHours)&&(identical(other.bookingSettings, bookingSettings) || other.bookingSettings == bookingSettings));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,address,phoneNumber,logoUrl,coverUrl,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_businessHours),bookingSettings);

@override
String toString() {
  return 'StoreDetailModel(id: $id, name: $name, slug: $slug, description: $description, address: $address, phoneNumber: $phoneNumber, logoUrl: $logoUrl, coverUrl: $coverUrl, images: $images, businessHours: $businessHours, bookingSettings: $bookingSettings)';
}


}

/// @nodoc
abstract mixin class _$StoreDetailModelCopyWith<$Res> implements $StoreDetailModelCopyWith<$Res> {
  factory _$StoreDetailModelCopyWith(_StoreDetailModel value, $Res Function(_StoreDetailModel) _then) = __$StoreDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, String address, String phoneNumber, String? logoUrl, String? coverUrl, List<String> images, List<StoreBusinessHourModel> businessHours, StoreBookingSettingsModel? bookingSettings
});


@override $StoreBookingSettingsModelCopyWith<$Res>? get bookingSettings;

}
/// @nodoc
class __$StoreDetailModelCopyWithImpl<$Res>
    implements _$StoreDetailModelCopyWith<$Res> {
  __$StoreDetailModelCopyWithImpl(this._self, this._then);

  final _StoreDetailModel _self;
  final $Res Function(_StoreDetailModel) _then;

/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? address = null,Object? phoneNumber = null,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? images = null,Object? businessHours = null,Object? bookingSettings = freezed,}) {
  return _then(_StoreDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,businessHours: null == businessHours ? _self._businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as List<StoreBusinessHourModel>,bookingSettings: freezed == bookingSettings ? _self.bookingSettings : bookingSettings // ignore: cast_nullable_to_non_nullable
as StoreBookingSettingsModel?,
  ));
}

/// Create a copy of StoreDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreBookingSettingsModelCopyWith<$Res>? get bookingSettings {
    if (_self.bookingSettings == null) {
    return null;
  }

  return $StoreBookingSettingsModelCopyWith<$Res>(_self.bookingSettings!, (value) {
    return _then(_self.copyWith(bookingSettings: value));
  });
}
}

// dart format on
