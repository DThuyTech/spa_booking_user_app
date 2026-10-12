// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_availability_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingAvailabilityOptionItemModel {

 String get serviceId; String? get serviceName; int get durationMinutes; int get sequence; String? get startAt; String? get endAt; String? get startTime; String? get endTime; String? get staffProfileId; String? get staffName; double? get estimatedPrice; String? get currency;
/// Create a copy of BookingAvailabilityOptionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionItemModelCopyWith<BookingAvailabilityOptionItemModel> get copyWith => _$BookingAvailabilityOptionItemModelCopyWithImpl<BookingAvailabilityOptionItemModel>(this as BookingAvailabilityOptionItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityOptionItemModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceName,durationMinutes,sequence,startAt,endAt,startTime,endTime,staffProfileId,staffName,estimatedPrice,currency);

@override
String toString() {
  return 'BookingAvailabilityOptionItemModel(serviceId: $serviceId, serviceName: $serviceName, durationMinutes: $durationMinutes, sequence: $sequence, startAt: $startAt, endAt: $endAt, startTime: $startTime, endTime: $endTime, staffProfileId: $staffProfileId, staffName: $staffName, estimatedPrice: $estimatedPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityOptionItemModelCopyWith<$Res>  {
  factory $BookingAvailabilityOptionItemModelCopyWith(BookingAvailabilityOptionItemModel value, $Res Function(BookingAvailabilityOptionItemModel) _then) = _$BookingAvailabilityOptionItemModelCopyWithImpl;
@useResult
$Res call({
 String serviceId, String? serviceName, int durationMinutes, int sequence, String? startAt, String? endAt, String? startTime, String? endTime, String? staffProfileId, String? staffName, double? estimatedPrice, String? currency
});




}
/// @nodoc
class _$BookingAvailabilityOptionItemModelCopyWithImpl<$Res>
    implements $BookingAvailabilityOptionItemModelCopyWith<$Res> {
  _$BookingAvailabilityOptionItemModelCopyWithImpl(this._self, this._then);

  final BookingAvailabilityOptionItemModel _self;
  final $Res Function(BookingAvailabilityOptionItemModel) _then;

/// Create a copy of BookingAvailabilityOptionItemModel
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


/// Adds pattern-matching-related methods to [BookingAvailabilityOptionItemModel].
extension BookingAvailabilityOptionItemModelPatterns on BookingAvailabilityOptionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityOptionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionItemModel() when $default != null:
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
case _BookingAvailabilityOptionItemModel() when $default != null:
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
case _BookingAvailabilityOptionItemModel():
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
case _BookingAvailabilityOptionItemModel() when $default != null:
return $default(_that.serviceId,_that.serviceName,_that.durationMinutes,_that.sequence,_that.startAt,_that.endAt,_that.startTime,_that.endTime,_that.staffProfileId,_that.staffName,_that.estimatedPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityOptionItemModel implements BookingAvailabilityOptionItemModel {
  const _BookingAvailabilityOptionItemModel({required this.serviceId, this.serviceName, this.durationMinutes = 0, this.sequence = 1, this.startAt, this.endAt, this.startTime, this.endTime, this.staffProfileId, this.staffName, this.estimatedPrice, this.currency});
  

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

/// Create a copy of BookingAvailabilityOptionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityOptionItemModelCopyWith<_BookingAvailabilityOptionItemModel> get copyWith => __$BookingAvailabilityOptionItemModelCopyWithImpl<_BookingAvailabilityOptionItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityOptionItemModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.staffProfileId, staffProfileId) || other.staffProfileId == staffProfileId)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceName,durationMinutes,sequence,startAt,endAt,startTime,endTime,staffProfileId,staffName,estimatedPrice,currency);

@override
String toString() {
  return 'BookingAvailabilityOptionItemModel(serviceId: $serviceId, serviceName: $serviceName, durationMinutes: $durationMinutes, sequence: $sequence, startAt: $startAt, endAt: $endAt, startTime: $startTime, endTime: $endTime, staffProfileId: $staffProfileId, staffName: $staffName, estimatedPrice: $estimatedPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityOptionItemModelCopyWith<$Res> implements $BookingAvailabilityOptionItemModelCopyWith<$Res> {
  factory _$BookingAvailabilityOptionItemModelCopyWith(_BookingAvailabilityOptionItemModel value, $Res Function(_BookingAvailabilityOptionItemModel) _then) = __$BookingAvailabilityOptionItemModelCopyWithImpl;
@override @useResult
$Res call({
 String serviceId, String? serviceName, int durationMinutes, int sequence, String? startAt, String? endAt, String? startTime, String? endTime, String? staffProfileId, String? staffName, double? estimatedPrice, String? currency
});




}
/// @nodoc
class __$BookingAvailabilityOptionItemModelCopyWithImpl<$Res>
    implements _$BookingAvailabilityOptionItemModelCopyWith<$Res> {
  __$BookingAvailabilityOptionItemModelCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityOptionItemModel _self;
  final $Res Function(_BookingAvailabilityOptionItemModel) _then;

/// Create a copy of BookingAvailabilityOptionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? serviceName = freezed,Object? durationMinutes = null,Object? sequence = null,Object? startAt = freezed,Object? endAt = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? staffProfileId = freezed,Object? staffName = freezed,Object? estimatedPrice = freezed,Object? currency = freezed,}) {
  return _then(_BookingAvailabilityOptionItemModel(
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
mixin _$BookingAvailabilityOptionModel {

 String get date; String get startTime; String get endTime; String get startAt; String? get endAt; int get totalDurationMinutes; double? get estimatedPrice; String? get currency; int? get efficiencyScore; bool get isRecommended; String? get slotTag; List<BookingAvailabilityOptionItemModel> get items;
/// Create a copy of BookingAvailabilityOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityOptionModelCopyWith<BookingAvailabilityOptionModel> get copyWith => _$BookingAvailabilityOptionModelCopyWithImpl<BookingAvailabilityOptionModel>(this as BookingAvailabilityOptionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityOptionModel&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended)&&(identical(other.slotTag, slotTag) || other.slotTag == slotTag)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,date,startTime,endTime,startAt,endAt,totalDurationMinutes,estimatedPrice,currency,efficiencyScore,isRecommended,slotTag,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'BookingAvailabilityOptionModel(date: $date, startTime: $startTime, endTime: $endTime, startAt: $startAt, endAt: $endAt, totalDurationMinutes: $totalDurationMinutes, estimatedPrice: $estimatedPrice, currency: $currency, efficiencyScore: $efficiencyScore, isRecommended: $isRecommended, slotTag: $slotTag, items: $items)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityOptionModelCopyWith<$Res>  {
  factory $BookingAvailabilityOptionModelCopyWith(BookingAvailabilityOptionModel value, $Res Function(BookingAvailabilityOptionModel) _then) = _$BookingAvailabilityOptionModelCopyWithImpl;
@useResult
$Res call({
 String date, String startTime, String endTime, String startAt, String? endAt, int totalDurationMinutes, double? estimatedPrice, String? currency, int? efficiencyScore, bool isRecommended, String? slotTag, List<BookingAvailabilityOptionItemModel> items
});




}
/// @nodoc
class _$BookingAvailabilityOptionModelCopyWithImpl<$Res>
    implements $BookingAvailabilityOptionModelCopyWith<$Res> {
  _$BookingAvailabilityOptionModelCopyWithImpl(this._self, this._then);

  final BookingAvailabilityOptionModel _self;
  final $Res Function(BookingAvailabilityOptionModel) _then;

/// Create a copy of BookingAvailabilityOptionModel
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
as List<BookingAvailabilityOptionItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityOptionModel].
extension BookingAvailabilityOptionModelPatterns on BookingAvailabilityOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String startTime,  String endTime,  String startAt,  String? endAt,  int totalDurationMinutes,  double? estimatedPrice,  String? currency,  int? efficiencyScore,  bool isRecommended,  String? slotTag,  List<BookingAvailabilityOptionItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityOptionModel() when $default != null:
return $default(_that.date,_that.startTime,_that.endTime,_that.startAt,_that.endAt,_that.totalDurationMinutes,_that.estimatedPrice,_that.currency,_that.efficiencyScore,_that.isRecommended,_that.slotTag,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityOptionModel implements BookingAvailabilityOptionModel {
  const _BookingAvailabilityOptionModel({required this.date, required this.startTime, required this.endTime, required this.startAt, this.endAt, this.totalDurationMinutes = 0, this.estimatedPrice, this.currency, this.efficiencyScore, this.isRecommended = false, this.slotTag, final  List<BookingAvailabilityOptionItemModel> items = const []}): _items = items;
  

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
 final  List<BookingAvailabilityOptionItemModel> _items;
@override@JsonKey() List<BookingAvailabilityOptionItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of BookingAvailabilityOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityOptionModelCopyWith<_BookingAvailabilityOptionModel> get copyWith => __$BookingAvailabilityOptionModelCopyWithImpl<_BookingAvailabilityOptionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityOptionModel&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.estimatedPrice, estimatedPrice) || other.estimatedPrice == estimatedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended)&&(identical(other.slotTag, slotTag) || other.slotTag == slotTag)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,date,startTime,endTime,startAt,endAt,totalDurationMinutes,estimatedPrice,currency,efficiencyScore,isRecommended,slotTag,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'BookingAvailabilityOptionModel(date: $date, startTime: $startTime, endTime: $endTime, startAt: $startAt, endAt: $endAt, totalDurationMinutes: $totalDurationMinutes, estimatedPrice: $estimatedPrice, currency: $currency, efficiencyScore: $efficiencyScore, isRecommended: $isRecommended, slotTag: $slotTag, items: $items)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityOptionModelCopyWith<$Res> implements $BookingAvailabilityOptionModelCopyWith<$Res> {
  factory _$BookingAvailabilityOptionModelCopyWith(_BookingAvailabilityOptionModel value, $Res Function(_BookingAvailabilityOptionModel) _then) = __$BookingAvailabilityOptionModelCopyWithImpl;
@override @useResult
$Res call({
 String date, String startTime, String endTime, String startAt, String? endAt, int totalDurationMinutes, double? estimatedPrice, String? currency, int? efficiencyScore, bool isRecommended, String? slotTag, List<BookingAvailabilityOptionItemModel> items
});




}
/// @nodoc
class __$BookingAvailabilityOptionModelCopyWithImpl<$Res>
    implements _$BookingAvailabilityOptionModelCopyWith<$Res> {
  __$BookingAvailabilityOptionModelCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityOptionModel _self;
  final $Res Function(_BookingAvailabilityOptionModel) _then;

/// Create a copy of BookingAvailabilityOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? startTime = null,Object? endTime = null,Object? startAt = null,Object? endAt = freezed,Object? totalDurationMinutes = null,Object? estimatedPrice = freezed,Object? currency = freezed,Object? efficiencyScore = freezed,Object? isRecommended = null,Object? slotTag = freezed,Object? items = null,}) {
  return _then(_BookingAvailabilityOptionModel(
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
as List<BookingAvailabilityOptionItemModel>,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityDayModel {

 String get date; String get dayOfWeek; int get totalSlots; List<BookingAvailabilityOptionModel> get options;
/// Create a copy of BookingAvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityDayModelCopyWith<BookingAvailabilityDayModel> get copyWith => _$BookingAvailabilityDayModelCopyWithImpl<BookingAvailabilityDayModel>(this as BookingAvailabilityDayModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityDayModel&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,totalSlots,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'BookingAvailabilityDayModel(date: $date, dayOfWeek: $dayOfWeek, totalSlots: $totalSlots, options: $options)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityDayModelCopyWith<$Res>  {
  factory $BookingAvailabilityDayModelCopyWith(BookingAvailabilityDayModel value, $Res Function(BookingAvailabilityDayModel) _then) = _$BookingAvailabilityDayModelCopyWithImpl;
@useResult
$Res call({
 String date, String dayOfWeek, int totalSlots, List<BookingAvailabilityOptionModel> options
});




}
/// @nodoc
class _$BookingAvailabilityDayModelCopyWithImpl<$Res>
    implements $BookingAvailabilityDayModelCopyWith<$Res> {
  _$BookingAvailabilityDayModelCopyWithImpl(this._self, this._then);

  final BookingAvailabilityDayModel _self;
  final $Res Function(BookingAvailabilityDayModel) _then;

/// Create a copy of BookingAvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dayOfWeek = null,Object? totalSlots = null,Object? options = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityDayModel].
extension BookingAvailabilityDayModelPatterns on BookingAvailabilityDayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityDayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityDayModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityDayModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionModel> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionModel> options)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String dayOfWeek,  int totalSlots,  List<BookingAvailabilityOptionModel> options)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityDayModel() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.totalSlots,_that.options);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityDayModel implements BookingAvailabilityDayModel {
  const _BookingAvailabilityDayModel({required this.date, required this.dayOfWeek, this.totalSlots = 0, final  List<BookingAvailabilityOptionModel> options = const []}): _options = options;
  

@override final  String date;
@override final  String dayOfWeek;
@override@JsonKey() final  int totalSlots;
 final  List<BookingAvailabilityOptionModel> _options;
@override@JsonKey() List<BookingAvailabilityOptionModel> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of BookingAvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityDayModelCopyWith<_BookingAvailabilityDayModel> get copyWith => __$BookingAvailabilityDayModelCopyWithImpl<_BookingAvailabilityDayModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityDayModel&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,totalSlots,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'BookingAvailabilityDayModel(date: $date, dayOfWeek: $dayOfWeek, totalSlots: $totalSlots, options: $options)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityDayModelCopyWith<$Res> implements $BookingAvailabilityDayModelCopyWith<$Res> {
  factory _$BookingAvailabilityDayModelCopyWith(_BookingAvailabilityDayModel value, $Res Function(_BookingAvailabilityDayModel) _then) = __$BookingAvailabilityDayModelCopyWithImpl;
@override @useResult
$Res call({
 String date, String dayOfWeek, int totalSlots, List<BookingAvailabilityOptionModel> options
});




}
/// @nodoc
class __$BookingAvailabilityDayModelCopyWithImpl<$Res>
    implements _$BookingAvailabilityDayModelCopyWith<$Res> {
  __$BookingAvailabilityDayModelCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityDayModel _self;
  final $Res Function(_BookingAvailabilityDayModel) _then;

/// Create a copy of BookingAvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dayOfWeek = null,Object? totalSlots = null,Object? options = null,}) {
  return _then(_BookingAvailabilityDayModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionModel>,
  ));
}


}

/// @nodoc
mixin _$BookingSlotModel {

 String get time; bool get available; int? get availableStaffCount; String? get reason;
/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSlotModelCopyWith<BookingSlotModel> get copyWith => _$BookingSlotModelCopyWithImpl<BookingSlotModel>(this as BookingSlotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSlotModel&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotModel(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BookingSlotModelCopyWith<$Res>  {
  factory $BookingSlotModelCopyWith(BookingSlotModel value, $Res Function(BookingSlotModel) _then) = _$BookingSlotModelCopyWithImpl;
@useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class _$BookingSlotModelCopyWithImpl<$Res>
    implements $BookingSlotModelCopyWith<$Res> {
  _$BookingSlotModelCopyWithImpl(this._self, this._then);

  final BookingSlotModel _self;
  final $Res Function(BookingSlotModel) _then;

/// Create a copy of BookingSlotModel
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


/// Adds pattern-matching-related methods to [BookingSlotModel].
extension BookingSlotModelPatterns on BookingSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSlotModel() when $default != null:
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
case _BookingSlotModel() when $default != null:
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
case _BookingSlotModel():
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
case _BookingSlotModel() when $default != null:
return $default(_that.time,_that.available,_that.availableStaffCount,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _BookingSlotModel implements BookingSlotModel {
  const _BookingSlotModel({required this.time, required this.available, this.availableStaffCount, this.reason});
  

@override final  String time;
@override final  bool available;
@override final  int? availableStaffCount;
@override final  String? reason;

/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSlotModelCopyWith<_BookingSlotModel> get copyWith => __$BookingSlotModelCopyWithImpl<_BookingSlotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSlotModel&&(identical(other.time, time) || other.time == time)&&(identical(other.available, available) || other.available == available)&&(identical(other.availableStaffCount, availableStaffCount) || other.availableStaffCount == availableStaffCount)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,time,available,availableStaffCount,reason);

@override
String toString() {
  return 'BookingSlotModel(time: $time, available: $available, availableStaffCount: $availableStaffCount, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BookingSlotModelCopyWith<$Res> implements $BookingSlotModelCopyWith<$Res> {
  factory _$BookingSlotModelCopyWith(_BookingSlotModel value, $Res Function(_BookingSlotModel) _then) = __$BookingSlotModelCopyWithImpl;
@override @useResult
$Res call({
 String time, bool available, int? availableStaffCount, String? reason
});




}
/// @nodoc
class __$BookingSlotModelCopyWithImpl<$Res>
    implements _$BookingSlotModelCopyWith<$Res> {
  __$BookingSlotModelCopyWithImpl(this._self, this._then);

  final _BookingSlotModel _self;
  final $Res Function(_BookingSlotModel) _then;

/// Create a copy of BookingSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? available = null,Object? availableStaffCount = freezed,Object? reason = freezed,}) {
  return _then(_BookingSlotModel(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,availableStaffCount: freezed == availableStaffCount ? _self.availableStaffCount : availableStaffCount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingAvailabilityModel {

 String get storeId; String get date; int get totalDurationMinutes; String get currency; List<BookingAvailabilityDayModel> get days; List<BookingAvailabilityOptionModel> get options; List<BookingSlotModel> get slots;
/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAvailabilityModelCopyWith<BookingAvailabilityModel> get copyWith => _$BookingAvailabilityModelCopyWithImpl<BookingAvailabilityModel>(this as BookingAvailabilityModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAvailabilityModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.slots, slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,currency,const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'BookingAvailabilityModel(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, currency: $currency, days: $days, options: $options, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $BookingAvailabilityModelCopyWith<$Res>  {
  factory $BookingAvailabilityModelCopyWith(BookingAvailabilityModel value, $Res Function(BookingAvailabilityModel) _then) = _$BookingAvailabilityModelCopyWithImpl;
@useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, String currency, List<BookingAvailabilityDayModel> days, List<BookingAvailabilityOptionModel> options, List<BookingSlotModel> slots
});




}
/// @nodoc
class _$BookingAvailabilityModelCopyWithImpl<$Res>
    implements $BookingAvailabilityModelCopyWith<$Res> {
  _$BookingAvailabilityModelCopyWithImpl(this._self, this._then);

  final BookingAvailabilityModel _self;
  final $Res Function(BookingAvailabilityModel) _then;

/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? currency = null,Object? days = null,Object? options = null,Object? slots = null,}) {
  return _then(_self.copyWith(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityDayModel>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionModel>,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAvailabilityModel].
extension BookingAvailabilityModelPatterns on BookingAvailabilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAvailabilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAvailabilityModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAvailabilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayModel> days,  List<BookingAvailabilityOptionModel> options,  List<BookingSlotModel> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayModel> days,  List<BookingAvailabilityOptionModel> options,  List<BookingSlotModel> slots)  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeId,  String date,  int totalDurationMinutes,  String currency,  List<BookingAvailabilityDayModel> days,  List<BookingAvailabilityOptionModel> options,  List<BookingSlotModel> slots)?  $default,) {final _that = this;
switch (_that) {
case _BookingAvailabilityModel() when $default != null:
return $default(_that.storeId,_that.date,_that.totalDurationMinutes,_that.currency,_that.days,_that.options,_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _BookingAvailabilityModel implements BookingAvailabilityModel {
  const _BookingAvailabilityModel({required this.storeId, this.date = '', this.totalDurationMinutes = 0, this.currency = 'VND', final  List<BookingAvailabilityDayModel> days = const [], final  List<BookingAvailabilityOptionModel> options = const [], final  List<BookingSlotModel> slots = const []}): _days = days,_options = options,_slots = slots;
  

@override final  String storeId;
@override@JsonKey() final  String date;
@override@JsonKey() final  int totalDurationMinutes;
@override@JsonKey() final  String currency;
 final  List<BookingAvailabilityDayModel> _days;
@override@JsonKey() List<BookingAvailabilityDayModel> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

 final  List<BookingAvailabilityOptionModel> _options;
@override@JsonKey() List<BookingAvailabilityOptionModel> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  List<BookingSlotModel> _slots;
@override@JsonKey() List<BookingSlotModel> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAvailabilityModelCopyWith<_BookingAvailabilityModel> get copyWith => __$BookingAvailabilityModelCopyWithImpl<_BookingAvailabilityModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAvailabilityModel&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalDurationMinutes, totalDurationMinutes) || other.totalDurationMinutes == totalDurationMinutes)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,storeId,date,totalDurationMinutes,currency,const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'BookingAvailabilityModel(storeId: $storeId, date: $date, totalDurationMinutes: $totalDurationMinutes, currency: $currency, days: $days, options: $options, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$BookingAvailabilityModelCopyWith<$Res> implements $BookingAvailabilityModelCopyWith<$Res> {
  factory _$BookingAvailabilityModelCopyWith(_BookingAvailabilityModel value, $Res Function(_BookingAvailabilityModel) _then) = __$BookingAvailabilityModelCopyWithImpl;
@override @useResult
$Res call({
 String storeId, String date, int totalDurationMinutes, String currency, List<BookingAvailabilityDayModel> days, List<BookingAvailabilityOptionModel> options, List<BookingSlotModel> slots
});




}
/// @nodoc
class __$BookingAvailabilityModelCopyWithImpl<$Res>
    implements _$BookingAvailabilityModelCopyWith<$Res> {
  __$BookingAvailabilityModelCopyWithImpl(this._self, this._then);

  final _BookingAvailabilityModel _self;
  final $Res Function(_BookingAvailabilityModel) _then;

/// Create a copy of BookingAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? date = null,Object? totalDurationMinutes = null,Object? currency = null,Object? days = null,Object? options = null,Object? slots = null,}) {
  return _then(_BookingAvailabilityModel(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalDurationMinutes: null == totalDurationMinutes ? _self.totalDurationMinutes : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityDayModel>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<BookingAvailabilityOptionModel>,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,
  ));
}


}

// dart format on
