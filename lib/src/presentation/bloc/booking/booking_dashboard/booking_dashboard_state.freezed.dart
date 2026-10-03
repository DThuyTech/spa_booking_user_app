// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingDashboardState {

 BookingDashboardStatus get status; BookingSummaryEntity get summary; List<BookingEntity> get items; String get currentTab; int get page; bool get hasMore; Failure? get failure;
/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDashboardStateCopyWith<BookingDashboardState> get copyWith => _$BookingDashboardStateCopyWithImpl<BookingDashboardState>(this as BookingDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDashboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(items),currentTab,page,hasMore,failure);

@override
String toString() {
  return 'BookingDashboardState(status: $status, summary: $summary, items: $items, currentTab: $currentTab, page: $page, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BookingDashboardStateCopyWith<$Res>  {
  factory $BookingDashboardStateCopyWith(BookingDashboardState value, $Res Function(BookingDashboardState) _then) = _$BookingDashboardStateCopyWithImpl;
@useResult
$Res call({
 BookingDashboardStatus status, BookingSummaryEntity summary, List<BookingEntity> items, String currentTab, int page, bool hasMore, Failure? failure
});


$BookingSummaryEntityCopyWith<$Res> get summary;

}
/// @nodoc
class _$BookingDashboardStateCopyWithImpl<$Res>
    implements $BookingDashboardStateCopyWith<$Res> {
  _$BookingDashboardStateCopyWithImpl(this._self, this._then);

  final BookingDashboardState _self;
  final $Res Function(BookingDashboardState) _then;

/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = null,Object? items = null,Object? currentTab = null,Object? page = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingDashboardStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryEntity,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryEntityCopyWith<$Res> get summary {
  
  return $BookingSummaryEntityCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDashboardState].
extension BookingDashboardStatePatterns on BookingDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _BookingDashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingDashboardStatus status,  BookingSummaryEntity summary,  List<BookingEntity> items,  String currentTab,  int page,  bool hasMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDashboardState() when $default != null:
return $default(_that.status,_that.summary,_that.items,_that.currentTab,_that.page,_that.hasMore,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingDashboardStatus status,  BookingSummaryEntity summary,  List<BookingEntity> items,  String currentTab,  int page,  bool hasMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _BookingDashboardState():
return $default(_that.status,_that.summary,_that.items,_that.currentTab,_that.page,_that.hasMore,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingDashboardStatus status,  BookingSummaryEntity summary,  List<BookingEntity> items,  String currentTab,  int page,  bool hasMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _BookingDashboardState() when $default != null:
return $default(_that.status,_that.summary,_that.items,_that.currentTab,_that.page,_that.hasMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDashboardState extends BookingDashboardState {
  const _BookingDashboardState({this.status = BookingDashboardStatus.initial, this.summary = const BookingSummaryEntity(), final  List<BookingEntity> items = const [], this.currentTab = 'UPCOMING', this.page = 1, this.hasMore = false, this.failure}): _items = items,super._();
  

@override@JsonKey() final  BookingDashboardStatus status;
@override@JsonKey() final  BookingSummaryEntity summary;
 final  List<BookingEntity> _items;
@override@JsonKey() List<BookingEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String currentTab;
@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;

/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDashboardStateCopyWith<_BookingDashboardState> get copyWith => __$BookingDashboardStateCopyWithImpl<_BookingDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDashboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(_items),currentTab,page,hasMore,failure);

@override
String toString() {
  return 'BookingDashboardState(status: $status, summary: $summary, items: $items, currentTab: $currentTab, page: $page, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BookingDashboardStateCopyWith<$Res> implements $BookingDashboardStateCopyWith<$Res> {
  factory _$BookingDashboardStateCopyWith(_BookingDashboardState value, $Res Function(_BookingDashboardState) _then) = __$BookingDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 BookingDashboardStatus status, BookingSummaryEntity summary, List<BookingEntity> items, String currentTab, int page, bool hasMore, Failure? failure
});


@override $BookingSummaryEntityCopyWith<$Res> get summary;

}
/// @nodoc
class __$BookingDashboardStateCopyWithImpl<$Res>
    implements _$BookingDashboardStateCopyWith<$Res> {
  __$BookingDashboardStateCopyWithImpl(this._self, this._then);

  final _BookingDashboardState _self;
  final $Res Function(_BookingDashboardState) _then;

/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = null,Object? items = null,Object? currentTab = null,Object? page = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_BookingDashboardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingDashboardStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryEntity,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BookingDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryEntityCopyWith<$Res> get summary {
  
  return $BookingSummaryEntityCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
