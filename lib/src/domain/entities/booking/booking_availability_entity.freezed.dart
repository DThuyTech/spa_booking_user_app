// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_availability_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingAvailabilityOptionItemEntity {

 String get serviceId; String? get serviceName; int get durationMinutes; int get sequence; String? get startAt; String? get endAt; String? get startTime; String? get endTime; String? get staffProfileId; String? get staffName; double? get estimatedPrice; String? get currency;
/// Create a copy of BookingAvailabilityOptionItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionItemEntityCopyWith<BookingAvailabilityOptionItemEntity> get copyWith => _$BookingAvailabilityOptionItemEntityCopyWithImpl<BookingAvailabilityOptionItemEntity>(this as BookingAvailabilityOptionItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityOptionItemEntity&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceName,durationMinutes,sequence,startAt,endAt,startTime,endTime,staffProfileId,staffName,estimatedPrice,currency);

@override
String toString() {
  return 'BookingAvailabilityOptionItemEntity(serviceId: $serviceId, serviceName: $serviceName, durationMinutes: $durationMinutes, sequence: $sequence, startAt: $startAt, endAt: $endAt, startTime: $startTime, endTime: $endTime, staffProfileId: $staffProfileId, staffName: $staffName, estimatedPrice: $estimatedPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityOptionItemEntityCopyWith<$Res>  {
  factory $BookingAvailabilityOptionItemEntityCopyWith(BookingAvailabilityOptionItemEntity value, $Res Function(BookingAvailabilityOptionItemEntity) _then) = _$BookingAvailabilityOptionItemEntityCopyWithImpl;
@useResult
$Res call({
 String serviceId, String? serviceName, int durationMinutes, int sequence, String? startAt, String? endAt, String? startTime, String? endTime, String? staffProfileId, String? staffName, double? estimatedPrice, String? currency
});




}
/// @nodoc
class _$BookingAvailabilityOptionItemEntityCopyWithImpl<$Res>
    implements $BookingAvailabilityOptionItemEntityCopyWith<$Res> {
  _$BookingAvailabilityOptionItemEntityCopyWithImpl(this._self, this._then);

  final BookingAvailabilityOptionItemEntity _self;
  final $Res Function(BookingAvailabilityOptionItemEntity) _then;

/// Create a copy of BookingAvailabilityOptionItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? serviceName = freezed,Object? durationMinutes = null,Object? sequence = null,Object? startAt = freezed,Object? endAt = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? staffProfileId = freezed,Object? staffName = freezed,Object? estimatedPrice = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,staffProfileId: freezed == staffProfileId ? _self.staffProfileId : staffProfileId // ignore: cast_nullable_to_non_nullable
as String?,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,estimatedPrice: freezed == estimatedPrice ? _self.estimatedPrice : estimatedPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityOptionItemEntity].
extension BookingAvailabilityOptionItemEntityPatterns on BookingAvailabilityOptionItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityOptionItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceId,  String? serviceName,  int durationMinutes,  int sequence,  String? startAt,  String? endAt,  String? startTime,  String? endTime,  String? staffProfileId,  String? staffName,  double? estimatedPrice,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity() when $default != null:
return $default(_that.serviceId,_that.serviceName,_that.durationMinutes,_that.sequence,_that.startAt,_that.endAt,_that.startTime,_that.endTime,_that.staffProfileId,_that.staffName,_that.estimatedPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceId,  String? serviceName,  int durationMinutes,  int sequence,  String? startAt,  String? endAt,  String? startTime,  String? endTime,  String? staffProfileId,  String? staffName,  double? estimatedPrice,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity():
return $default(_that.serviceId,_that.serviceName,_that.durationMinutes,_that.sequence,_that.startAt,_that.endAt,_that.startTime,_that.endTime,_that.staffProfileId,_that.staffName,_that.estimatedPrice,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceId,  String? serviceName,  int durationMinutes,  int sequence,  String? startAt,  String? endAt,  String? startTime,  String? endTime,  String? staffProfileId,  String? staffName,  double? estimatedPrice,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemEntity() when $default != null:
return $default(_that.serviceId,_that.serviceName,_that.durationMinutes,_that.sequence,_that.startAt,_that.endAt,_that.startTime,_that.endTime,_that.staffProfileId,_that.staffName,_that.estimatedPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityOptionItemEntity implements BookingAvailabilityOptionItemEntity {
  const _BookingAvailabilityOptionItemEntity({required this.serviceId, this.serviceName, this.durationMinutes = 0, this.sequence = 1, this.startAt, this.endAt, this.startTime, this.endTime, this.staffProfileId, this.staffName, this.estimatedPrice, this.currency});
  

@override final  String serviceId;
@override final  String? serviceName;
@override@JsonKey() final  int durationMinutes;
@override@JsonKey() final  int sequence;
@override final  String? startAt;
@override final  String? endAt;
@override final  String? startTime;
@override final  String? endTime;
@override final  String? staffProfileId;
@override final  String? staffName;
@override final  double? estimatedPrice;
@override final  String? currency;

/// Create a copy of BookingAvailabilityOptionItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityOptionItemEntityCopyWith<_BookingAvailabilityOptionItemEntity> get copyWith => __$BookingAvailabilityOptionItemEntityCopyWithImpl<_BookingAvailabilityOptionItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityOptionItemEntity&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceName,durationMinutes,sequence,startAt,endAt,startTime,endTime,staffProfileId,staffName,estimatedPrice,currency);

@override
String toString() {
  return 'BookingAvailabilityOptionItemEntity(serviceId: $serviceId, serviceName: $serviceName, durationMinutes: $durationMinutes, sequence: $sequence, startAt: $startAt, endAt: $endAt, startTime: $startTime, endTime: $endTime, staffProfileId: $staffProfileId, staffName: $staffName, estimatedPrice: $estimatedPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityOptionItemEntityCopyWith<$Res> implements $BookingAvailabilityOptionItemEntityCopyWith<$Res> {
  factory _$BookingAvailabilityOptionItemEntityCopyWith(_BookingAvailabilityOptionItemEntity value, $Res Function(_BookingAvailabilityOptionItemEntity) _then) = __$BookingAvailabilityOptionItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String serviceId, String? serviceName, int durationMinutes, int sequence, String? startAt, String? endAt, String? startTime, String? endTime, String? staffProfileId, String? staffName, double? estimatedPrice, String? currency
});




}
/// @nodoc
class __$BookingAvailabilityOptionItemEntityCopyWithImpl<$Res>
    implements _$BookingAvailabilityOptionItemEntityCopyWith<$Res> {
  __$BookingAvailabilityOptionItemEntityCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityOptionItemEntity _self;
  final $Res Function(_BookingAvailabilityOptionItemEntity) _then;

/// Create a copy of BookingAvailabilityOptionItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? serviceName = freezed,Object? durationMinutes = null,Object? sequence = null,Object? startAt = freezed,Object? endAt = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? staffProfileId = freezed,Object? staffName = freezed,Object? estimatedPrice = freezed,Object? currency = freezed,}) {
  return _then(_BookingAvailabilityOptionItemEntity(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,staffProfileId: freezed == staffProfileId ? _self.staffProfileId : staffProfileId // ignore: cast_nullable_to_non_nullable
as String?,staffName: freezed == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String?,estimatedPrice: freezed == estimatedPrice ? _self.estimatedPrice : estimatedPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityOptionEntity {

 String get date; String get startTime; String get endTime; String get startAt; String? get endAt; int get totalDurationMinutes; double? get estimatedPrice; String? get currency; int? get efficiencyScore; bool get isRecommended; String? get slotTag; List<BookingAvailabilityOptionItemEntity> get items;
/// Create a copy of BookingAvailabilityOptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionEntityCopyWith<BookingAvailabilityOptionEntity> get copyWith => _$BookingAvailabilityOptionEntityCopyWithImpl<BookingAvailabilityOptionEntity>(this as BookingAvailabilityOptionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityOptionEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended)&&(identical(other.slotTag, slotTag) || other.slotTag == slotTag)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,date,startTime,endTime,startAt,endAt,totalDurationMinutes,estimatedPrice,currency,efficiencyScore,isRecommended,slotTag,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'BookingAvailabilityOptionEntity(date: $date, startTime: $startTime, endTime: $endTime, startAt: $startAt, endAt: $endAt, totalDurationMinutes: $totalDurationMinutes, estimatedPrice: $estimatedPrice, currency: $currency, efficiencyScore: $efficiencyScore, isRecommended: $isRecommended, slotTag: $slotTag, items: $items)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityOptionEntityCopyWith<$Res>  {
  factory $BookingAvailabilityOptionEntityCopyWith(BookingAvailabilityOptionEntity value, $Res Function(BookingAvailabilityOptionEntity) _then) = _$BookingAvailabilityOptionEntityCopyWithImpl;
@useResult
$Res call({
 String date, String startTime, String endTime, String startAt, String? endAt, int totalDurationMinutes, double? estimatedPrice, String? currency, int? efficiencyScore, bool isRecommended, String? slotTag, List<BookingAvailabilityOptionItemEntity> items
});




}
/// @nodoc
class _$BookingAvailabilityOptionEntityCopyWithImpl<$Res>
    implements $BookingAvailabilityOptionEntityCopyWith<$Res> {
  _$BookingAvailabilityOptionEntityCopyWithImpl(this._self, this._then);

  final BookingAvailabilityOptionEntity _self;
  final $Res Function(BookingAvailabilityOptionEntity) _then;

/// Create a copy of BookingAvailabilityOptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? startTime = null,Object? endTime = null,Object? startAt = null,Object? endAt = freezed,Object? totalDurationMinutes = null,Object? estimatedPrice = freezed,Object? currency = freezed,Object? efficiencyScore = freezed,Object? isRecommended = null,Object? slotTag = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPrice: freezed == estimatedPrice ? _self.estimatedPrice : estimatedPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,efficiencyScore: freezed == efficiencyScore ? _self.efficiencyScore : efficiencyScore // ignore: cast_nullable_to_non_nullable
as int?,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,slotTag: freezed == slotTag ? _self.slotTag : slotTag // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityOptionEntity].
extension BookingAvailabilityOptionEntityPatterns on BookingAvailabilityOptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityOptionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity() when $default != null:
return $default(_that.date,_that.startTime,_that.endTime,_that.startAt,_that.endAt,_that.totalDurationMinutes,_that.estimatedPrice,_that.currency,_that.efficiencyScore,_that.isRecommended,_that.slotTag,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemEntity> items)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity():
return $default(_that.date,_that.startTime,_that.endTime,_that.startAt,_that.endAt,_that.totalDurationMinutes,_that.estimatedPrice,_that.currency,_that.efficiencyScore,_that.isRecommended,_that.slotTag,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionEntity() when $default != null:
return $default(_that.date,_that.startTime,_that.endTime,_that.startAt,_that.endAt,_that.totalDurationMinutes,_that.estimatedPrice,_that.currency,_that.efficiencyScore,_that.isRecommended,_that.slotTag,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityOptionEntity implements BookingAvailabilityOptionEntity {
  const _BookingAvailabilityOptionEntity({required this.date, required this.startTime, required this.endTime, required this.startAt, this.endAt, this.totalDurationMinutes = 0, this.estimatedPrice, this.currency, this.efficiencyScore, this.isRecommended = false, this.slotTag, final  List<BookingAvailabilityOptionItemEntity> items = const []}): _items = items;
  

@override final  String date;
@override final  String startTime;
@override final  String endTime;
@override final  String startAt;
@override final  String? endAt;
@override@JsonKey() final  int totalDurationMinutes;
@override final  double? estimatedPrice;
@override final  String? currency;
@override final  int? efficiencyScore;
@override@JsonKey() final  bool isRecommended;
@override final  String? slotTag;
 final  List<BookingAvailabilityOptionItemEntity> _items;
@override@JsonKey() List<BookingAvailabilityOptionItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of BookingAvailabilityOptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityOptionEntityCopyWith<_BookingAvailabilityOptionEntity> get copyWith => __$BookingAvailabilityOptionEntityCopyWithImpl<_BookingAvailabilityOptionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityOptionEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended)&&(identical(other.slotTag, slotTag) || other.slotTag == slotTag)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,date,startTime,endTime,startAt,endAt,totalDurationMinutes,estimatedPrice,currency,efficiencyScore,isRecommended,slotTag,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'BookingAvailabilityOptionEntity(date: $date, startTime: $startTime, endTime: $endTime, startAt: $startAt, endAt: $endAt, totalDurationMinutes: $totalDurationMinutes, estimatedPrice: $estimatedPrice, currency: $currency, efficiencyScore: $efficiencyScore, isRecommended: $isRecommended, slotTag: $slotTag, items: $items)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityOptionEntityCopyWith<$Res> implements $BookingAvailabilityOptionEntityCopyWith<$Res> {
  factory _$BookingAvailabilityOptionEntityCopyWith(_BookingAvailabilityOptionEntity value, $Res Function(_BookingAvailabilityOptionEntity) _then) = __$BookingAvailabilityOptionEntityCopyWithImpl;
@override @useResult
$Res call({
 String date, String startTime, String endTime, String startAt, String? endAt, int totalDurationMinutes, double? estimatedPrice, String? currency, int? efficiencyScore, bool isRecommended, String? slotTag, List<BookingAvailabilityOptionItemEntity> items
});




}
/// @nodoc
class __$BookingAvailabilityOptionEntityCopyWithImpl<$Res>
    implements _$BookingAvailabilityOptionEntityCopyWith<$Res> {
  __$BookingAvailabilityOptionEntityCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityOptionEntity _self;
  final $Res Function(_BookingAvailabilityOptionEntity) _then;

/// Create a copy of BookingAvailabilityOptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? startTime = null,Object? endTime = null,Object? startAt = null,Object? endAt = freezed,Object? totalDurationMinutes = null,Object? estimatedPrice = freezed,Object? currency = freezed,Object? efficiencyScore = freezed,Object? isRecommended = null,Object? slotTag = freezed,Object? items = null,}) {
  return _then(_BookingAvailabilityOptionEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,estimatedPrice: freezed == estimatedPrice ? _self.estimatedPrice : estimatedPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,efficiencyScore: freezed == efficiencyScore ? _self.efficiencyScore : efficiencyScore // ignore: cast_nullable_to_non_nullable
as int?,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,slotTag: freezed == slotTag ? _self.slotTag : slotTag // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionItemEntity>,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityDayEntity {

 String get date; String get dayOfWeek; int get totalSlots; List<BookingAvailabilityOptionEntity> get options;
/// Create a copy of BookingAvailabilityDayEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityDayEntityCopyWith<BookingAvailabilityDayEntity> get copyWith => _$BookingAvailabilityDayEntityCopyWithImpl<BookingAvailabilityDayEntity>(this as BookingAvailabilityDayEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityDayEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,totalSlots,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'BookingAvailabilityDayEntity(date: $date, dayOfWeek: $dayOfWeek, totalSlots: $totalSlots, options: $options)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityDayEntityCopyWith<$Res>  {
  factory $BookingAvailabilityDayEntityCopyWith(BookingAvailabilityDayEntity value, $Res Function(BookingAvailabilityDayEntity) _then) = _$BookingAvailabilityDayEntityCopyWithImpl;
@useResult
$Res call({
 String date, String dayOfWeek, int totalSlots, List<BookingAvailabilityOptionEntity> options
});




}
/// @nodoc
class _$BookingAvailabilityDayEntityCopyWithImpl<$Res>
    implements $BookingAvailabilityDayEntityCopyWith<$Res> {
  _$BookingAvailabilityDayEntityCopyWithImpl(this._self, this._then);

  final BookingAvailabilityDayEntity _self;
  final $Res Function(BookingAvailabilityDayEntity) _then;

/// Create a copy of BookingAvailabilityDayEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dayOfWeek = null,Object? totalSlots = null,Object? options = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityDayEntity].
extension BookingAvailabilityDayEntityPatterns on BookingAvailabilityDayEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityDayEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityDayEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityDayEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionEntity> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.totalSlots,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionEntity> options)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity():
return $default(_that.date,_that.dayOfWeek,_that.totalSlots,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionEntity> options)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayEntity() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.totalSlots,_that.options);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityDayEntity implements BookingAvailabilityDayEntity {
  const _BookingAvailabilityDayEntity({required this.date, required this.dayOfWeek, this.totalSlots = 0, final  List<BookingAvailabilityOptionEntity> options = const []}): _options = options;
  

@override final  String date;
@override final  String dayOfWeek;
@override@JsonKey() final  int totalSlots;
 final  List<BookingAvailabilityOptionEntity> _options;
@override@JsonKey() List<BookingAvailabilityOptionEntity> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of BookingAvailabilityDayEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityDayEntityCopyWith<_BookingAvailabilityDayEntity> get copyWith => __$BookingAvailabilityDayEntityCopyWithImpl<_BookingAvailabilityDayEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityDayEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,totalSlots,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'BookingAvailabilityDayEntity(date: $date, dayOfWeek: $dayOfWeek, totalSlots: $totalSlots, options: $options)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityDayEntityCopyWith<$Res> implements $BookingAvailabilityDayEntityCopyWith<$Res> {
  factory _$BookingAvailabilityDayEntityCopyWith(_BookingAvailabilityDayEntity value, $Res Function(_BookingAvailabilityDayEntity) _then) = __$BookingAvailabilityDayEntityCopyWithImpl;
@override @useResult
$Res call({
 String date, String dayOfWeek, int totalSlots, List<BookingAvailabilityOptionEntity> options
});




}
/// @nodoc
class __$BookingAvailabilityDayEntityCopyWithImpl<$Res>
    implements _$BookingAvailabilityDayEntityCopyWith<$Res> {
  __$BookingAvailabilityDayEntityCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityDayEntity _self;
  final $Res Function(_BookingAvailabilityDayEntity) _then;

/// Create a copy of BookingAvailabilityDayEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dayOfWeek = null,Object? totalSlots = null,Object? options = null,}) {
  return _then(_BookingAvailabilityDayEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionEntity>,
  ));
}


}

/// @nodoc
mixin _$BookingSlotEntity {

 String get time; bool get available; int? get availableStaffCount; String? get reason;
/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSlotEntityCopyWith<BookingSlotEntity> get copyWith => _$BookingSlotEntityCopyWithImpl<BookingSlotEntity>(this as BookingSlotEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSlotEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotEntity(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BookingSlotEntityCopyWith<$Res>  {
  factory $BookingSlotEntityCopyWith(BookingSlotEntity value, $Res Function(BookingSlotEntity) _then) = _$BookingSlotEntityCopyWithImpl;
@useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class _$BookingSlotEntityCopyWithImpl<$Res>
    implements $BookingSlotEntityCopyWith<$Res> {
  _$BookingSlotEntityCopyWithImpl(this._self, this._then);

  final BookingSlotEntity _self;
  final $Res Function(BookingSlotEntity) _then;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingSlotEntity].
extension BookingSlotEntityPatterns on BookingSlotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSlotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSlotEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingSlotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSlotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  bool available,  int? availableStaffCount,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  bool available,  int? availableStaffCount,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _BookingSlotEntity():
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  bool available,  int? availableStaffCount,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _BookingSlotEntity() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _BookingSlotEntity implements BookingSlotEntity {
  const _BookingSlotEntity({required this.time, required this.available, this.availableStaffCount, this.reason});
  

@override final  String time;
@override final  bool available;
@override final  int? availableStaffCount;
@override final  String? reason;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSlotEntityCopyWith<_BookingSlotEntity> get copyWith => __$BookingSlotEntityCopyWithImpl<_BookingSlotEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSlotEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotEntity(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BookingSlotEntityCopyWith<$Res> implements $BookingSlotEntityCopyWith<$Res> {
  factory _$BookingSlotEntityCopyWith(_BookingSlotEntity value, $Res Function(_BookingSlotEntity) _then) = __$BookingSlotEntityCopyWithImpl;
@override @useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class __$BookingSlotEntityCopyWithImpl<$Res>
    implements _$BookingSlotEntityCopyWith<$Res> {
  __$BookingSlotEntityCopyWithImpl(this._self, this._then);

  final _BookingSlotEntity _self;
  final $Res Function(_BookingSlotEntity) _then;

/// Create a copy of BookingSlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_BookingSlotEntity(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityEntity {

 String get storeId; String get date; int get totalDurationMinutes; String get currency; List<BookingAvailabilityDayEntity> get days; List<BookingAvailabilityOptionEntity> get options; List<BookingSlotEntity> get slots;
/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityEntityCopyWith<BookingAvailabilityEntity> get copyWith => _$BookingAvailabilityEntityCopyWithImpl<BookingAvailabilityEntity>(this as BookingAvailabilityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.slots, slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,currency,const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'BookingAvailabilityEntity(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, currency: $currency, days: $days, options: $options, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityEntityCopyWith<$Res>  {
  factory $BookingAvailabilityEntityCopyWith(BookingAvailabilityEntity value, $Res Function(BookingAvailabilityEntity) _then) = _$BookingAvailabilityEntityCopyWithImpl;
@useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, String currency, List<BookingAvailabilityDayEntity> days, List<BookingAvailabilityOptionEntity> options, List<BookingSlotEntity> slots
});




}
/// @nodoc
class _$BookingAvailabilityEntityCopyWithImpl<$Res>
    implements $BookingAvailabilityEntityCopyWith<$Res> {
  _$BookingAvailabilityEntityCopyWithImpl(this._self, this._then);

  final BookingAvailabilityEntity _self;
  final $Res Function(BookingAvailabilityEntity) _then;

/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? currency = null,Object? days = null,Object? options = null,Object? slots = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityDayEntity>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionEntity>,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityEntity].
extension BookingAvailabilityEntityPatterns on BookingAvailabilityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayEntity> days,  List<BookingAvailabilityOptionEntity> options,  List<BookingSlotEntity> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.currency,_that.days,_that.options,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayEntity> days,  List<BookingAvailabilityOptionEntity> options,  List<BookingSlotEntity> slots)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity():
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.currency,_that.days,_that.options,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayEntity> days,  List<BookingAvailabilityOptionEntity> options,  List<BookingSlotEntity> slots)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityEntity() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.currency,_that.days,_that.options,_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityEntity implements BookingAvailabilityEntity {
  const _BookingAvailabilityEntity({required this.storeId, this.date = '', this.totalDurationMinutes = 0, this.currency = 'VND', final  List<BookingAvailabilityDayEntity> days = const [], final  List<BookingAvailabilityOptionEntity> options = const [], final  List<BookingSlotEntity> slots = const []}): _days = days,_options = options,_slots = slots;
  

@override final  String storeId;
@override@JsonKey() final  String date;
@override@JsonKey() final  int totalDurationMinutes;
@override@JsonKey() final  String currency;
 final  List<BookingAvailabilityDayEntity> _days;
@override@JsonKey() List<BookingAvailabilityDayEntity> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

 final  List<BookingAvailabilityOptionEntity> _options;
@override@JsonKey() List<BookingAvailabilityOptionEntity> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  List<BookingSlotEntity> _slots;
@override@JsonKey() List<BookingSlotEntity> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityEntityCopyWith<_BookingAvailabilityEntity> get copyWith => __$BookingAvailabilityEntityCopyWithImpl<_BookingAvailabilityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityEntity&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,currency,const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'BookingAvailabilityEntity(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, currency: $currency, days: $days, options: $options, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityEntityCopyWith<$Res> implements $BookingAvailabilityEntityCopyWith<$Res> {
  factory _$BookingAvailabilityEntityCopyWith(_BookingAvailabilityEntity value, $Res Function(_BookingAvailabilityEntity) _then) = __$BookingAvailabilityEntityCopyWithImpl;
@override @useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, String currency, List<BookingAvailabilityDayEntity> days, List<BookingAvailabilityOptionEntity> options, List<BookingSlotEntity> slots
});




}
/// @nodoc
class __$BookingAvailabilityEntityCopyWithImpl<$Res>
    implements _$BookingAvailabilityEntityCopyWith<$Res> {
  __$BookingAvailabilityEntityCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityEntity _self;
  final $Res Function(_BookingAvailabilityEntity) _then;

/// Create a copy of BookingAvailabilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? currency = null,Object? days = null,Object? options = null,Object? slots = null,}) {
  return _then(_BookingAvailabilityEntity(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityDayEntity>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionEntity>,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotEntity>,
  ));
}


}

// dart format on
