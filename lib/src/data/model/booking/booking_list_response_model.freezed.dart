// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingSummaryModel {

 int get total; int get upcoming; int get past; int get cancelled;
/// Create a copy of BookingSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSummaryModelCopyWith<BookingSummaryModel> get copyWith => _$BookingSummaryModelCopyWithImpl<BookingSummaryModel>(this as BookingSummaryModel, _$identity);

  /// Serializes this BookingSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.past, past) || other.past == past)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,upcoming,past,cancelled);

@override
String toString() {
  return 'BookingSummaryModel(total: $total, upcoming: $upcoming, past: $past, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class $BookingSummaryModelCopyWith<$Res>  {
  factory $BookingSummaryModelCopyWith(BookingSummaryModel value, $Res Function(BookingSummaryModel) _then) = _$BookingSummaryModelCopyWithImpl;
@useResult
$Res call({
 int total, int upcoming, int past, int cancelled
});




}
/// @nodoc
class _$BookingSummaryModelCopyWithImpl<$Res>
    implements $BookingSummaryModelCopyWith<$Res> {
  _$BookingSummaryModelCopyWithImpl(this._self, this._then);

  final BookingSummaryModel _self;
  final $Res Function(BookingSummaryModel) _then;

/// Create a copy of BookingSummaryModel
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


/// Adds pattern-matching-related methods to [BookingSummaryModel].
extension BookingSummaryModelPatterns on BookingSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSummaryModel() when $default != null:
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
case _BookingSummaryModel() when $default != null:
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
case _BookingSummaryModel():
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
case _BookingSummaryModel() when $default != null:
return $default(_that.total,_that.upcoming,_that.past,_that.cancelled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingSummaryModel implements BookingSummaryModel {
  const _BookingSummaryModel({this.total = 0, this.upcoming = 0, this.past = 0, this.cancelled = 0});
  factory _BookingSummaryModel.fromJson(Map<String, dynamic> json) => _$BookingSummaryModelFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int upcoming;
@override@JsonKey() final  int past;
@override@JsonKey() final  int cancelled;

/// Create a copy of BookingSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSummaryModelCopyWith<_BookingSummaryModel> get copyWith => __$BookingSummaryModelCopyWithImpl<_BookingSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&(identical(other.past, past) || other.past == past)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,upcoming,past,cancelled);

@override
String toString() {
  return 'BookingSummaryModel(total: $total, upcoming: $upcoming, past: $past, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class _$BookingSummaryModelCopyWith<$Res> implements $BookingSummaryModelCopyWith<$Res> {
  factory _$BookingSummaryModelCopyWith(_BookingSummaryModel value, $Res Function(_BookingSummaryModel) _then) = __$BookingSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int upcoming, int past, int cancelled
});




}
/// @nodoc
class __$BookingSummaryModelCopyWithImpl<$Res>
    implements _$BookingSummaryModelCopyWith<$Res> {
  __$BookingSummaryModelCopyWithImpl(this._self, this._then);

  final _BookingSummaryModel _self;
  final $Res Function(_BookingSummaryModel) _then;

/// Create a copy of BookingSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? upcoming = null,Object? past = null,Object? cancelled = null,}) {
  return _then(_BookingSummaryModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as int,past: null == past ? _self.past : past // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BookingPaginationModel {

 int get total; int get page; int get limit; int get totalPages;
/// Create a copy of BookingPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingPaginationModelCopyWith<BookingPaginationModel> get copyWith => _$BookingPaginationModelCopyWithImpl<BookingPaginationModel>(this as BookingPaginationModel, _$identity);

  /// Serializes this BookingPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingPaginationModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'BookingPaginationModel(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $BookingPaginationModelCopyWith<$Res>  {
  factory $BookingPaginationModelCopyWith(BookingPaginationModel value, $Res Function(BookingPaginationModel) _then) = _$BookingPaginationModelCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$BookingPaginationModelCopyWithImpl<$Res>
    implements $BookingPaginationModelCopyWith<$Res> {
  _$BookingPaginationModelCopyWithImpl(this._self, this._then);

  final BookingPaginationModel _self;
  final $Res Function(BookingPaginationModel) _then;

/// Create a copy of BookingPaginationModel
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


/// Adds pattern-matching-related methods to [BookingPaginationModel].
extension BookingPaginationModelPatterns on BookingPaginationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingPaginationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingPaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingPaginationModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingPaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingPaginationModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingPaginationModel() when $default != null:
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
case _BookingPaginationModel() when $default != null:
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
case _BookingPaginationModel():
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
case _BookingPaginationModel() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingPaginationModel implements BookingPaginationModel {
  const _BookingPaginationModel({this.total = 0, this.page = 1, this.limit = 20, this.totalPages = 1});
  factory _BookingPaginationModel.fromJson(Map<String, dynamic> json) => _$BookingPaginationModelFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int totalPages;

/// Create a copy of BookingPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingPaginationModelCopyWith<_BookingPaginationModel> get copyWith => __$BookingPaginationModelCopyWithImpl<_BookingPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingPaginationModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'BookingPaginationModel(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$BookingPaginationModelCopyWith<$Res> implements $BookingPaginationModelCopyWith<$Res> {
  factory _$BookingPaginationModelCopyWith(_BookingPaginationModel value, $Res Function(_BookingPaginationModel) _then) = __$BookingPaginationModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$BookingPaginationModelCopyWithImpl<$Res>
    implements _$BookingPaginationModelCopyWith<$Res> {
  __$BookingPaginationModelCopyWithImpl(this._self, this._then);

  final _BookingPaginationModel _self;
  final $Res Function(_BookingPaginationModel) _then;

/// Create a copy of BookingPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_BookingPaginationModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BookingListResponseModel {

 BookingSummaryModel? get summary; List<BookingModel> get items; BookingPaginationModel? get pagination;
/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingListResponseModelCopyWith<BookingListResponseModel> get copyWith => _$BookingListResponseModelCopyWithImpl<BookingListResponseModel>(this as BookingListResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingListResponseModel&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(items),pagination);

@override
String toString() {
  return 'BookingListResponseModel(summary: $summary, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BookingListResponseModelCopyWith<$Res>  {
  factory $BookingListResponseModelCopyWith(BookingListResponseModel value, $Res Function(BookingListResponseModel) _then) = _$BookingListResponseModelCopyWithImpl;
@useResult
$Res call({
 BookingSummaryModel? summary, List<BookingModel> items, BookingPaginationModel? pagination
});


$BookingSummaryModelCopyWith<$Res>? get summary;$BookingPaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$BookingListResponseModelCopyWithImpl<$Res>
    implements $BookingListResponseModelCopyWith<$Res> {
  _$BookingListResponseModelCopyWithImpl(this._self, this._then);

  final BookingListResponseModel _self;
  final $Res Function(BookingListResponseModel) _then;

/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? items = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryModel?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BookingModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as BookingPaginationModel?,
  ));
}
/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $BookingSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingPaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $BookingPaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingListResponseModel].
extension BookingListResponseModelPatterns on BookingListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingSummaryModel? summary,  List<BookingModel> items,  BookingPaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingSummaryModel? summary,  List<BookingModel> items,  BookingPaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _BookingListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingSummaryModel? summary,  List<BookingModel> items,  BookingPaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _BookingListResponseModel() when $default != null:
return $default(_that.summary,_that.items,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _BookingListResponseModel implements BookingListResponseModel {
  const _BookingListResponseModel({this.summary, final  List<BookingModel> items = const [], this.pagination}): _items = items;
  

@override final  BookingSummaryModel? summary;
 final  List<BookingModel> _items;
@override@JsonKey() List<BookingModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BookingPaginationModel? pagination;

/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingListResponseModelCopyWith<_BookingListResponseModel> get copyWith => __$BookingListResponseModelCopyWithImpl<_BookingListResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingListResponseModel&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_items),pagination);

@override
String toString() {
  return 'BookingListResponseModel(summary: $summary, items: $items, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BookingListResponseModelCopyWith<$Res> implements $BookingListResponseModelCopyWith<$Res> {
  factory _$BookingListResponseModelCopyWith(_BookingListResponseModel value, $Res Function(_BookingListResponseModel) _then) = __$BookingListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 BookingSummaryModel? summary, List<BookingModel> items, BookingPaginationModel? pagination
});


@override $BookingSummaryModelCopyWith<$Res>? get summary;@override $BookingPaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$BookingListResponseModelCopyWithImpl<$Res>
    implements _$BookingListResponseModelCopyWith<$Res> {
  __$BookingListResponseModelCopyWithImpl(this._self, this._then);

  final _BookingListResponseModel _self;
  final $Res Function(_BookingListResponseModel) _then;

/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? items = null,Object? pagination = freezed,}) {
  return _then(_BookingListResponseModel(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BookingSummaryModel?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BookingModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as BookingPaginationModel?,
  ));
}

/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $BookingSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of BookingListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingPaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $BookingPaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
