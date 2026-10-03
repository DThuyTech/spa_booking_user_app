// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingSummaryEntity {

 int get total; int get upcoming; int get past; int get cancelled;
/// Create a copy of BookingSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSummaryEntityCopyWith<BookingSummaryEntity> get copyWith => _$BookingSummaryEntityCopyWithImpl<BookingSummaryEntity>(this as BookingSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSummaryEntity&&(identical(other.total, total) || other.total == total)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.past, past) || other.past == past)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}


@override
int get hashCode => Object.hash(runtimeType,total,upcoming,past,cancelled);

@override
String toString() {
  return 'BookingSummaryEntity(total: $total, upcoming: $upcoming, past: $past, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class $BookingSummaryEntityCopyWith<$Res>  {
  factory $BookingSummaryEntityCopyWith(BookingSummaryEntity value, $Res Function(BookingSummaryEntity) _then) = _$BookingSummaryEntityCopyWithImpl;
@useResult
$Res call({
 int total, int upcoming, int past, int cancelled
});




}
/// @nodoc
class _$BookingSummaryEntityCopyWithImpl<$Res>
    implements $BookingSummaryEntityCopyWith<$Res> {
  _$BookingSummaryEntityCopyWithImpl(this._self, this._then);

  final BookingSummaryEntity _self;
  final $Res Function(BookingSummaryEntity) _then;

/// Create a copy of BookingSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? upcoming = null,Object? past = null,Object? cancelled = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as int,past: null == past ? _self.past : past // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingSummaryEntity].
extension BookingSummaryEntityPatterns on BookingSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int upcoming,  int past,  int cancelled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingSummaryEntity() when $default != null:
return $default(_that.total,_that.upcoming,_that.past,_that.cancelled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int upcoming,  int past,  int cancelled)  $default,) {final _that = this;
switch (_that) {
case _BookingSummaryEntity():
return $default(_that.total,_that.upcoming,_that.past,_that.cancelled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int upcoming,  int past,  int cancelled)?  $default,) {final _that = this;
switch (_that) {
case _BookingSummaryEntity() when $default != null:
return $default(_that.total,_that.upcoming,_that.past,_that.cancelled);case _:
  return null;

}
}

}

/// @nodoc


class _BookingSummaryEntity implements BookingSummaryEntity {
  const _BookingSummaryEntity({this.total = 0, this.upcoming = 0, this.past = 0, this.cancelled = 0});
  

@override@JsonKey() final  int total;
@override@JsonKey() final  int upcoming;
@override@JsonKey() final  int past;
@override@JsonKey() final  int cancelled;

/// Create a copy of BookingSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSummaryEntityCopyWith<_BookingSummaryEntity> get copyWith => __$BookingSummaryEntityCopyWithImpl<_BookingSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSummaryEntity&&(identical(other.total, total) || other.total == total)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.past, past) || other.past == past)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}


@override
int get hashCode => Object.hash(runtimeType,total,upcoming,past,cancelled);

@override
String toString() {
  return 'BookingSummaryEntity(total: $total, upcoming: $upcoming, past: $past, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class _$BookingSummaryEntityCopyWith<$Res> implements $BookingSummaryEntityCopyWith<$Res> {
  factory _$BookingSummaryEntityCopyWith(_BookingSummaryEntity value, $Res Function(_BookingSummaryEntity) _then) = __$BookingSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int total, int upcoming, int past, int cancelled
});




}
/// @nodoc
class __$BookingSummaryEntityCopyWithImpl<$Res>
    implements _$BookingSummaryEntityCopyWith<$Res> {
  __$BookingSummaryEntityCopyWithImpl(this._self, this._then);

  final _BookingSummaryEntity _self;
  final $Res Function(_BookingSummaryEntity) _then;

/// Create a copy of BookingSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? upcoming = null,Object? past = null,Object? cancelled = null,}) {
  return _then(_BookingSummaryEntity(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as int,past: null == past ? _self.past : past // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookingPaginationEntity {

 int get total; int get page; int get limit; int get totalPages;
/// Create a copy of BookingPaginationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingPaginationEntityCopyWith<BookingPaginationEntity> get copyWith => _$BookingPaginationEntityCopyWithImpl<BookingPaginationEntity>(this as BookingPaginationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingPaginationEntity&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'BookingPaginationEntity(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $BookingPaginationEntityCopyWith<$Res>  {
  factory $BookingPaginationEntityCopyWith(BookingPaginationEntity value, $Res Function(BookingPaginationEntity) _then) = _$BookingPaginationEntityCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$BookingPaginationEntityCopyWithImpl<$Res>
    implements $BookingPaginationEntityCopyWith<$Res> {
  _$BookingPaginationEntityCopyWithImpl(this._self, this._then);

  final BookingPaginationEntity _self;
  final $Res Function(BookingPaginationEntity) _then;

/// Create a copy of BookingPaginationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingPaginationEntity].
extension BookingPaginationEntityPatterns on BookingPaginationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingPaginationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingPaginationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingPaginationEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingPaginationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingPaginationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingPaginationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingPaginationEntity() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _BookingPaginationEntity():
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _BookingPaginationEntity() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc


class _BookingPaginationEntity implements BookingPaginationEntity {
  const _BookingPaginationEntity({this.total = 0, this.page = 1, this.limit = 20, this.totalPages = 1});
  

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int totalPages;

/// Create a copy of BookingPaginationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingPaginationEntityCopyWith<_BookingPaginationEntity> get copyWith => __$BookingPaginationEntityCopyWithImpl<_BookingPaginationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingPaginationEntity&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'BookingPaginationEntity(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$BookingPaginationEntityCopyWith<$Res> implements $BookingPaginationEntityCopyWith<$Res> {
  factory _$BookingPaginationEntityCopyWith(_BookingPaginationEntity value, $Res Function(_BookingPaginationEntity) _then) = __$BookingPaginationEntityCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$BookingPaginationEntityCopyWithImpl<$Res>
    implements _$BookingPaginationEntityCopyWith<$Res> {
  __$BookingPaginationEntityCopyWithImpl(this._self, this._then);

  final _BookingPaginationEntity _self;
  final $Res Function(_BookingPaginationEntity) _then;

/// Create a copy of BookingPaginationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_BookingPaginationEntity(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookingListResponseEntity {

 BookingSummaryEntity get summary; List<BookingEntity> get items; BookingPaginationEntity get pagination;
/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingListResponseEntityCopyWith<BookingListResponseEntity> get copyWith => _$BookingListResponseEntityCopyWithImpl<BookingListResponseEntity>(this as BookingListResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingListResponseEntity&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(items),pagination);

@override
String toString() {
  return 'BookingListResponseEntity(summary: $summary, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BookingListResponseEntityCopyWith<$Res>  {
  factory $BookingListResponseEntityCopyWith(BookingListResponseEntity value, $Res Function(BookingListResponseEntity) _then) = _$BookingListResponseEntityCopyWithImpl;
@useResult
$Res call({
 BookingSummaryEntity summary, List<BookingEntity> items, BookingPaginationEntity pagination
});


$BookingSummaryEntityCopyWith<$Res> get summary;$BookingPaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class _$BookingListResponseEntityCopyWithImpl<$Res>
    implements $BookingListResponseEntityCopyWith<$Res> {
  _$BookingListResponseEntityCopyWithImpl(this._self, this._then);

  final BookingListResponseEntity _self;
  final $Res Function(BookingListResponseEntity) _then;

/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? items = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryEntity,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as BookingPaginationEntity,
  ));
}
/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryEntityCopyWith<$Res> get summary {
  
  return $BookingSummaryEntityCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingPaginationEntityCopyWith<$Res> get pagination {
  
  return $BookingPaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingListResponseEntity].
extension BookingListResponseEntityPatterns on BookingListResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingListResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingListResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingListResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingListResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingListResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingListResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingSummaryEntity summary,  List<BookingEntity> items,  BookingPaginationEntity pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingListResponseEntity() when $default != null:
return $default(_that.summary,_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingSummaryEntity summary,  List<BookingEntity> items,  BookingPaginationEntity pagination)  $default,) {final _that = this;
switch (_that) {
case _BookingListResponseEntity():
return $default(_that.summary,_that.items,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingSummaryEntity summary,  List<BookingEntity> items,  BookingPaginationEntity pagination)?  $default,) {final _that = this;
switch (_that) {
case _BookingListResponseEntity() when $default != null:
return $default(_that.summary,_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _BookingListResponseEntity implements BookingListResponseEntity {
  const _BookingListResponseEntity({this.summary = const BookingSummaryEntity(), final  List<BookingEntity> items = const [], this.pagination = const BookingPaginationEntity()}): _items = items;
  

@override@JsonKey() final  BookingSummaryEntity summary;
 final  List<BookingEntity> _items;
@override@JsonKey() List<BookingEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  BookingPaginationEntity pagination;

/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingListResponseEntityCopyWith<_BookingListResponseEntity> get copyWith => __$BookingListResponseEntityCopyWithImpl<_BookingListResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingListResponseEntity&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_items),pagination);

@override
String toString() {
  return 'BookingListResponseEntity(summary: $summary, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BookingListResponseEntityCopyWith<$Res> implements $BookingListResponseEntityCopyWith<$Res> {
  factory _$BookingListResponseEntityCopyWith(_BookingListResponseEntity value, $Res Function(_BookingListResponseEntity) _then) = __$BookingListResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 BookingSummaryEntity summary, List<BookingEntity> items, BookingPaginationEntity pagination
});


@override $BookingSummaryEntityCopyWith<$Res> get summary;@override $BookingPaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class __$BookingListResponseEntityCopyWithImpl<$Res>
    implements _$BookingListResponseEntityCopyWith<$Res> {
  __$BookingListResponseEntityCopyWithImpl(this._self, this._then);

  final _BookingListResponseEntity _self;
  final $Res Function(_BookingListResponseEntity) _then;

/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? items = null,Object? pagination = null,}) {
  return _then(_BookingListResponseEntity(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryEntity,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as BookingPaginationEntity,
  ));
}

/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryEntityCopyWith<$Res> get summary {
  
  return $BookingSummaryEntityCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of BookingListResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingPaginationEntityCopyWith<$Res> get pagination {
  
  return $BookingPaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
