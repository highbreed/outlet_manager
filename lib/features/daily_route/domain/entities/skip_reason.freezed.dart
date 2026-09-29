// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skip_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SkipReason {

 int get id; String get code; String get label; bool get requiresNotes; bool get isActive;
/// Create a copy of SkipReason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkipReasonCopyWith<SkipReason> get copyWith => _$SkipReasonCopyWithImpl<SkipReason>(this as SkipReason, _$identity);

  /// Serializes this SkipReason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkipReason&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.requiresNotes, requiresNotes) || other.requiresNotes == requiresNotes)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,requiresNotes,isActive);

@override
String toString() {
  return 'SkipReason(id: $id, code: $code, label: $label, requiresNotes: $requiresNotes, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $SkipReasonCopyWith<$Res>  {
  factory $SkipReasonCopyWith(SkipReason value, $Res Function(SkipReason) _then) = _$SkipReasonCopyWithImpl;
@useResult
$Res call({
 int id, String code, String label, bool requiresNotes, bool isActive
});




}
/// @nodoc
class _$SkipReasonCopyWithImpl<$Res>
    implements $SkipReasonCopyWith<$Res> {
  _$SkipReasonCopyWithImpl(this._self, this._then);

  final SkipReason _self;
  final $Res Function(SkipReason) _then;

/// Create a copy of SkipReason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? label = null,Object? requiresNotes = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,requiresNotes: null == requiresNotes ? _self.requiresNotes : requiresNotes // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SkipReason].
extension SkipReasonPatterns on SkipReason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SkipReason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SkipReason() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SkipReason value)  $default,){
final _that = this;
switch (_that) {
case _SkipReason():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SkipReason value)?  $default,){
final _that = this;
switch (_that) {
case _SkipReason() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String label,  bool requiresNotes,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SkipReason() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.requiresNotes,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String label,  bool requiresNotes,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _SkipReason():
return $default(_that.id,_that.code,_that.label,_that.requiresNotes,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String label,  bool requiresNotes,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _SkipReason() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.requiresNotes,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SkipReason implements SkipReason {
  const _SkipReason({required this.id, required this.code, required this.label, this.requiresNotes = false, this.isActive = true});
  factory _SkipReason.fromJson(Map<String, dynamic> json) => _$SkipReasonFromJson(json);

@override final  int id;
@override final  String code;
@override final  String label;
@override@JsonKey() final  bool requiresNotes;
@override@JsonKey() final  bool isActive;

/// Create a copy of SkipReason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkipReasonCopyWith<_SkipReason> get copyWith => __$SkipReasonCopyWithImpl<_SkipReason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkipReasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkipReason&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.requiresNotes, requiresNotes) || other.requiresNotes == requiresNotes)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,requiresNotes,isActive);

@override
String toString() {
  return 'SkipReason(id: $id, code: $code, label: $label, requiresNotes: $requiresNotes, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$SkipReasonCopyWith<$Res> implements $SkipReasonCopyWith<$Res> {
  factory _$SkipReasonCopyWith(_SkipReason value, $Res Function(_SkipReason) _then) = __$SkipReasonCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String label, bool requiresNotes, bool isActive
});




}
/// @nodoc
class __$SkipReasonCopyWithImpl<$Res>
    implements _$SkipReasonCopyWith<$Res> {
  __$SkipReasonCopyWithImpl(this._self, this._then);

  final _SkipReason _self;
  final $Res Function(_SkipReason) _then;

/// Create a copy of SkipReason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? label = null,Object? requiresNotes = null,Object? isActive = null,}) {
  return _then(_SkipReason(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,requiresNotes: null == requiresNotes ? _self.requiresNotes : requiresNotes // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
