// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadGreeting value)?  loadGreeting,TResult Function( _RefreshGreeting value)?  refreshGreeting,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadGreeting() when loadGreeting != null:
return loadGreeting(_that);case _RefreshGreeting() when refreshGreeting != null:
return refreshGreeting(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadGreeting value)  loadGreeting,required TResult Function( _RefreshGreeting value)  refreshGreeting,}){
final _that = this;
switch (_that) {
case _LoadGreeting():
return loadGreeting(_that);case _RefreshGreeting():
return refreshGreeting(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadGreeting value)?  loadGreeting,TResult? Function( _RefreshGreeting value)?  refreshGreeting,}){
final _that = this;
switch (_that) {
case _LoadGreeting() when loadGreeting != null:
return loadGreeting(_that);case _RefreshGreeting() when refreshGreeting != null:
return refreshGreeting(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadGreeting,TResult Function()?  refreshGreeting,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadGreeting() when loadGreeting != null:
return loadGreeting();case _RefreshGreeting() when refreshGreeting != null:
return refreshGreeting();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadGreeting,required TResult Function()  refreshGreeting,}) {final _that = this;
switch (_that) {
case _LoadGreeting():
return loadGreeting();case _RefreshGreeting():
return refreshGreeting();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadGreeting,TResult? Function()?  refreshGreeting,}) {final _that = this;
switch (_that) {
case _LoadGreeting() when loadGreeting != null:
return loadGreeting();case _RefreshGreeting() when refreshGreeting != null:
return refreshGreeting();case _:
  return null;

}
}

}

/// @nodoc


class _LoadGreeting implements HomeEvent {
  const _LoadGreeting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadGreeting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.loadGreeting()';
}


}




/// @nodoc


class _RefreshGreeting implements HomeEvent {
  const _RefreshGreeting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshGreeting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refreshGreeting()';
}


}




// dart format on
