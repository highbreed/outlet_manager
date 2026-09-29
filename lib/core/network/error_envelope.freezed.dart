// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ErrorEnvelope {

 String get code; String get message; Map<String, dynamic>? get details; int? get retryAfter; String? get requestId;
/// Create a copy of ErrorEnvelope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorEnvelopeCopyWith<ErrorEnvelope> get copyWith => _$ErrorEnvelopeCopyWithImpl<ErrorEnvelope>(this as ErrorEnvelope, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorEnvelope&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.details, details)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(details),retryAfter,requestId);

@override
String toString() {
  return 'ErrorEnvelope(code: $code, message: $message, details: $details, retryAfter: $retryAfter, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ErrorEnvelopeCopyWith<$Res>  {
  factory $ErrorEnvelopeCopyWith(ErrorEnvelope value, $Res Function(ErrorEnvelope) _then) = _$ErrorEnvelopeCopyWithImpl;
@useResult
$Res call({
 String code, String message, Map<String, dynamic>? details, int? retryAfter, String? requestId
});




}
/// @nodoc
class _$ErrorEnvelopeCopyWithImpl<$Res>
    implements $ErrorEnvelopeCopyWith<$Res> {
  _$ErrorEnvelopeCopyWithImpl(this._self, this._then);

  final ErrorEnvelope _self;
  final $Res Function(ErrorEnvelope) _then;

/// Create a copy of ErrorEnvelope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? details = freezed,Object? retryAfter = freezed,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as int?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorEnvelope].
extension ErrorEnvelopePatterns on ErrorEnvelope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorEnvelope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorEnvelope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorEnvelope value)  $default,){
final _that = this;
switch (_that) {
case _ErrorEnvelope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorEnvelope value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorEnvelope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  Map<String, dynamic>? details,  int? retryAfter,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorEnvelope() when $default != null:
return $default(_that.code,_that.message,_that.details,_that.retryAfter,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  Map<String, dynamic>? details,  int? retryAfter,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _ErrorEnvelope():
return $default(_that.code,_that.message,_that.details,_that.retryAfter,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  Map<String, dynamic>? details,  int? retryAfter,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _ErrorEnvelope() when $default != null:
return $default(_that.code,_that.message,_that.details,_that.retryAfter,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _ErrorEnvelope implements ErrorEnvelope {
  const _ErrorEnvelope({required this.code, required this.message, final  Map<String, dynamic>? details, this.retryAfter, this.requestId}): _details = details;
  

@override final  String code;
@override final  String message;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int? retryAfter;
@override final  String? requestId;

/// Create a copy of ErrorEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorEnvelopeCopyWith<_ErrorEnvelope> get copyWith => __$ErrorEnvelopeCopyWithImpl<_ErrorEnvelope>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorEnvelope&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._details, _details)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_details),retryAfter,requestId);

@override
String toString() {
  return 'ErrorEnvelope(code: $code, message: $message, details: $details, retryAfter: $retryAfter, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$ErrorEnvelopeCopyWith<$Res> implements $ErrorEnvelopeCopyWith<$Res> {
  factory _$ErrorEnvelopeCopyWith(_ErrorEnvelope value, $Res Function(_ErrorEnvelope) _then) = __$ErrorEnvelopeCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, Map<String, dynamic>? details, int? retryAfter, String? requestId
});




}
/// @nodoc
class __$ErrorEnvelopeCopyWithImpl<$Res>
    implements _$ErrorEnvelopeCopyWith<$Res> {
  __$ErrorEnvelopeCopyWithImpl(this._self, this._then);

  final _ErrorEnvelope _self;
  final $Res Function(_ErrorEnvelope) _then;

/// Create a copy of ErrorEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? details = freezed,Object? retryAfter = freezed,Object? requestId = freezed,}) {
  return _then(_ErrorEnvelope(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as int?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
