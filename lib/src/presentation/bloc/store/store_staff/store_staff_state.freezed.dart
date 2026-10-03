// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreStaffState {

 StoreStaffStatus get status; List<StaffEntity> get staffList; Failure? get failure;
/// Create a copy of StoreStaffState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreStaffStateCopyWith<StoreStaffState> get copyWith => _$StoreStaffStateCopyWithImpl<StoreStaffState>(this as StoreStaffState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreStaffState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.staffList, staffList)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(staffList),failure);

@override
String toString() {
  return 'StoreStaffState(status: $status, staffList: $staffList, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StoreStaffStateCopyWith<$Res>  {
  factory $StoreStaffStateCopyWith(StoreStaffState value, $Res Function(StoreStaffState) _then) = _$StoreStaffStateCopyWithImpl;
@useResult
$Res call({
 StoreStaffStatus status, List<StaffEntity> staffList, Failure? failure
});




}
/// @nodoc
class _$StoreStaffStateCopyWithImpl<$Res>
    implements $StoreStaffStateCopyWith<$Res> {
  _$StoreStaffStateCopyWithImpl(this._self, this._then);

  final StoreStaffState _self;
  final $Res Function(StoreStaffState) _then;

/// Create a copy of StoreStaffState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? staffList = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreStaffStatus,staffList: null == staffList ? _self.staffList : staffList // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreStaffState].
extension StoreStaffStatePatterns on StoreStaffState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreStaffState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreStaffState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreStaffState value)  $default,){
final _that = this;
switch (_that) {
case _StoreStaffState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreStaffState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreStaffState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreStaffStatus status,  List<StaffEntity> staffList,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreStaffState() when $default != null:
return $default(_that.status,_that.staffList,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreStaffStatus status,  List<StaffEntity> staffList,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StoreStaffState():
return $default(_that.status,_that.staffList,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreStaffStatus status,  List<StaffEntity> staffList,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StoreStaffState() when $default != null:
return $default(_that.status,_that.staffList,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StoreStaffState extends StoreStaffState {
  const _StoreStaffState({this.status = StoreStaffStatus.initial, final  List<StaffEntity> staffList = const [], this.failure}): _staffList = staffList,super._();
  

@override@JsonKey() final  StoreStaffStatus status;
 final  List<StaffEntity> _staffList;
@override@JsonKey() List<StaffEntity> get staffList {
  if (_staffList is EqualUnmodifiableListView) return _staffList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffList);
}

@override final  Failure? failure;

/// Create a copy of StoreStaffState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreStaffStateCopyWith<_StoreStaffState> get copyWith => __$StoreStaffStateCopyWithImpl<_StoreStaffState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreStaffState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._staffList, _staffList)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_staffList),failure);

@override
String toString() {
  return 'StoreStaffState(status: $status, staffList: $staffList, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StoreStaffStateCopyWith<$Res> implements $StoreStaffStateCopyWith<$Res> {
  factory _$StoreStaffStateCopyWith(_StoreStaffState value, $Res Function(_StoreStaffState) _then) = __$StoreStaffStateCopyWithImpl;
@override @useResult
$Res call({
 StoreStaffStatus status, List<StaffEntity> staffList, Failure? failure
});




}
/// @nodoc
class __$StoreStaffStateCopyWithImpl<$Res>
    implements _$StoreStaffStateCopyWith<$Res> {
  __$StoreStaffStateCopyWithImpl(this._self, this._then);

  final _StoreStaffState _self;
  final $Res Function(_StoreStaffState) _then;

/// Create a copy of StoreStaffState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? staffList = null,Object? failure = freezed,}) {
  return _then(_StoreStaffState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StoreStaffStatus,staffList: null == staffList ? _self._staffList : staffList // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
