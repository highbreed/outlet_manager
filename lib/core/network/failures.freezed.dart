// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {

 String get message; String? get requestId;
/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this as AuthFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'AuthFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>  {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InvalidCredentials value)?  invalidCredentials,TResult Function( TokenExpired value)?  tokenExpired,TResult Function( SessionRevoked value)?  sessionRevoked,TResult Function( BiometricFailed value)?  biometricFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case SessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that);case BiometricFailed() when biometricFailed != null:
return biometricFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InvalidCredentials value)  invalidCredentials,required TResult Function( TokenExpired value)  tokenExpired,required TResult Function( SessionRevoked value)  sessionRevoked,required TResult Function( BiometricFailed value)  biometricFailed,}){
final _that = this;
switch (_that) {
case InvalidCredentials():
return invalidCredentials(_that);case TokenExpired():
return tokenExpired(_that);case SessionRevoked():
return sessionRevoked(_that);case BiometricFailed():
return biometricFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InvalidCredentials value)?  invalidCredentials,TResult? Function( TokenExpired value)?  tokenExpired,TResult? Function( SessionRevoked value)?  sessionRevoked,TResult? Function( BiometricFailed value)?  biometricFailed,}){
final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case SessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that);case BiometricFailed() when biometricFailed != null:
return biometricFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? requestId)?  invalidCredentials,TResult Function( String message,  String? requestId)?  tokenExpired,TResult Function( String? reason,  String message,  String? requestId)?  sessionRevoked,TResult Function( String message,  String? requestId)?  biometricFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that.message,_that.requestId);case TokenExpired() when tokenExpired != null:
return tokenExpired(_that.message,_that.requestId);case SessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that.reason,_that.message,_that.requestId);case BiometricFailed() when biometricFailed != null:
return biometricFailed(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? requestId)  invalidCredentials,required TResult Function( String message,  String? requestId)  tokenExpired,required TResult Function( String? reason,  String message,  String? requestId)  sessionRevoked,required TResult Function( String message,  String? requestId)  biometricFailed,}) {final _that = this;
switch (_that) {
case InvalidCredentials():
return invalidCredentials(_that.message,_that.requestId);case TokenExpired():
return tokenExpired(_that.message,_that.requestId);case SessionRevoked():
return sessionRevoked(_that.reason,_that.message,_that.requestId);case BiometricFailed():
return biometricFailed(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? requestId)?  invalidCredentials,TResult? Function( String message,  String? requestId)?  tokenExpired,TResult? Function( String? reason,  String message,  String? requestId)?  sessionRevoked,TResult? Function( String message,  String? requestId)?  biometricFailed,}) {final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that.message,_that.requestId);case TokenExpired() when tokenExpired != null:
return tokenExpired(_that.message,_that.requestId);case SessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that.reason,_that.message,_that.requestId);case BiometricFailed() when biometricFailed != null:
return biometricFailed(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class InvalidCredentials extends AuthFailure {
  const InvalidCredentials({this.message = 'Invalid email or password', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCredentialsCopyWith<InvalidCredentials> get copyWith => _$InvalidCredentialsCopyWithImpl<InvalidCredentials>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidCredentials&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'AuthFailure.invalidCredentials(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InvalidCredentialsCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $InvalidCredentialsCopyWith(InvalidCredentials value, $Res Function(InvalidCredentials) _then) = _$InvalidCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$InvalidCredentialsCopyWithImpl<$Res>
    implements $InvalidCredentialsCopyWith<$Res> {
  _$InvalidCredentialsCopyWithImpl(this._self, this._then);

  final InvalidCredentials _self;
  final $Res Function(InvalidCredentials) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(InvalidCredentials(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TokenExpired extends AuthFailure {
  const TokenExpired({this.message = 'Session expired', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenExpiredCopyWith<TokenExpired> get copyWith => _$TokenExpiredCopyWithImpl<TokenExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenExpired&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'AuthFailure.tokenExpired(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $TokenExpiredCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $TokenExpiredCopyWith(TokenExpired value, $Res Function(TokenExpired) _then) = _$TokenExpiredCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$TokenExpiredCopyWithImpl<$Res>
    implements $TokenExpiredCopyWith<$Res> {
  _$TokenExpiredCopyWithImpl(this._self, this._then);

  final TokenExpired _self;
  final $Res Function(TokenExpired) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(TokenExpired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SessionRevoked extends AuthFailure {
  const SessionRevoked({this.reason, this.message = 'Session ended', this.requestId}): super._();
  

 final  String? reason;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionRevokedCopyWith<SessionRevoked> get copyWith => _$SessionRevokedCopyWithImpl<SessionRevoked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionRevoked&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,reason,message,requestId);

@override
String toString() {
  return 'AuthFailure.sessionRevoked(reason: $reason, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $SessionRevokedCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $SessionRevokedCopyWith(SessionRevoked value, $Res Function(SessionRevoked) _then) = _$SessionRevokedCopyWithImpl;
@override @useResult
$Res call({
 String? reason, String message, String? requestId
});




}
/// @nodoc
class _$SessionRevokedCopyWithImpl<$Res>
    implements $SessionRevokedCopyWith<$Res> {
  _$SessionRevokedCopyWithImpl(this._self, this._then);

  final SessionRevoked _self;
  final $Res Function(SessionRevoked) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,Object? message = null,Object? requestId = freezed,}) {
  return _then(SessionRevoked(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BiometricFailed extends AuthFailure {
  const BiometricFailed({this.message = 'Biometric authentication failed', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricFailedCopyWith<BiometricFailed> get copyWith => _$BiometricFailedCopyWithImpl<BiometricFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricFailed&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'AuthFailure.biometricFailed(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $BiometricFailedCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $BiometricFailedCopyWith(BiometricFailed value, $Res Function(BiometricFailed) _then) = _$BiometricFailedCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$BiometricFailedCopyWithImpl<$Res>
    implements $BiometricFailedCopyWith<$Res> {
  _$BiometricFailedCopyWithImpl(this._self, this._then);

  final BiometricFailed _self;
  final $Res Function(BiometricFailed) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(BiometricFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ForbiddenFailure {

 String get message; String? get requestId;
/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith => _$ForbiddenFailureCopyWithImpl<ForbiddenFailure>(this as ForbiddenFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ForbiddenFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ForbiddenFailureCopyWith<$Res>  {
  factory $ForbiddenFailureCopyWith(ForbiddenFailure value, $Res Function(ForbiddenFailure) _then) = _$ForbiddenFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._self, this._then);

  final ForbiddenFailure _self;
  final $Res Function(ForbiddenFailure) _then;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForbiddenFailure].
extension ForbiddenFailurePatterns on ForbiddenFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InsufficientPermissions value)?  insufficientPermissions,TResult Function( AccountDisabled value)?  accountDisabled,TResult Function( ResourceForbidden value)?  resourceForbidden,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InsufficientPermissions() when insufficientPermissions != null:
return insufficientPermissions(_that);case AccountDisabled() when accountDisabled != null:
return accountDisabled(_that);case ResourceForbidden() when resourceForbidden != null:
return resourceForbidden(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InsufficientPermissions value)  insufficientPermissions,required TResult Function( AccountDisabled value)  accountDisabled,required TResult Function( ResourceForbidden value)  resourceForbidden,}){
final _that = this;
switch (_that) {
case InsufficientPermissions():
return insufficientPermissions(_that);case AccountDisabled():
return accountDisabled(_that);case ResourceForbidden():
return resourceForbidden(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InsufficientPermissions value)?  insufficientPermissions,TResult? Function( AccountDisabled value)?  accountDisabled,TResult? Function( ResourceForbidden value)?  resourceForbidden,}){
final _that = this;
switch (_that) {
case InsufficientPermissions() when insufficientPermissions != null:
return insufficientPermissions(_that);case AccountDisabled() when accountDisabled != null:
return accountDisabled(_that);case ResourceForbidden() when resourceForbidden != null:
return resourceForbidden(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String requiredPermission,  String message,  String? requestId)?  insufficientPermissions,TResult Function( String message,  String? requestId)?  accountDisabled,TResult Function( String message,  String? requestId)?  resourceForbidden,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InsufficientPermissions() when insufficientPermissions != null:
return insufficientPermissions(_that.requiredPermission,_that.message,_that.requestId);case AccountDisabled() when accountDisabled != null:
return accountDisabled(_that.message,_that.requestId);case ResourceForbidden() when resourceForbidden != null:
return resourceForbidden(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String requiredPermission,  String message,  String? requestId)  insufficientPermissions,required TResult Function( String message,  String? requestId)  accountDisabled,required TResult Function( String message,  String? requestId)  resourceForbidden,}) {final _that = this;
switch (_that) {
case InsufficientPermissions():
return insufficientPermissions(_that.requiredPermission,_that.message,_that.requestId);case AccountDisabled():
return accountDisabled(_that.message,_that.requestId);case ResourceForbidden():
return resourceForbidden(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String requiredPermission,  String message,  String? requestId)?  insufficientPermissions,TResult? Function( String message,  String? requestId)?  accountDisabled,TResult? Function( String message,  String? requestId)?  resourceForbidden,}) {final _that = this;
switch (_that) {
case InsufficientPermissions() when insufficientPermissions != null:
return insufficientPermissions(_that.requiredPermission,_that.message,_that.requestId);case AccountDisabled() when accountDisabled != null:
return accountDisabled(_that.message,_that.requestId);case ResourceForbidden() when resourceForbidden != null:
return resourceForbidden(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class InsufficientPermissions extends ForbiddenFailure {
  const InsufficientPermissions({required this.requiredPermission, this.message = 'You do not have permission to perform this action', this.requestId}): super._();
  

 final  String requiredPermission;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsufficientPermissionsCopyWith<InsufficientPermissions> get copyWith => _$InsufficientPermissionsCopyWithImpl<InsufficientPermissions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsufficientPermissions&&(identical(other.requiredPermission, requiredPermission) || other.requiredPermission == requiredPermission)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requiredPermission,message,requestId);

@override
String toString() {
  return 'ForbiddenFailure.insufficientPermissions(requiredPermission: $requiredPermission, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InsufficientPermissionsCopyWith<$Res> implements $ForbiddenFailureCopyWith<$Res> {
  factory $InsufficientPermissionsCopyWith(InsufficientPermissions value, $Res Function(InsufficientPermissions) _then) = _$InsufficientPermissionsCopyWithImpl;
@override @useResult
$Res call({
 String requiredPermission, String message, String? requestId
});




}
/// @nodoc
class _$InsufficientPermissionsCopyWithImpl<$Res>
    implements $InsufficientPermissionsCopyWith<$Res> {
  _$InsufficientPermissionsCopyWithImpl(this._self, this._then);

  final InsufficientPermissions _self;
  final $Res Function(InsufficientPermissions) _then;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiredPermission = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(InsufficientPermissions(
requiredPermission: null == requiredPermission ? _self.requiredPermission : requiredPermission // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AccountDisabled extends ForbiddenFailure {
  const AccountDisabled({this.message = 'Your account has been disabled', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDisabledCopyWith<AccountDisabled> get copyWith => _$AccountDisabledCopyWithImpl<AccountDisabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDisabled&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ForbiddenFailure.accountDisabled(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $AccountDisabledCopyWith<$Res> implements $ForbiddenFailureCopyWith<$Res> {
  factory $AccountDisabledCopyWith(AccountDisabled value, $Res Function(AccountDisabled) _then) = _$AccountDisabledCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$AccountDisabledCopyWithImpl<$Res>
    implements $AccountDisabledCopyWith<$Res> {
  _$AccountDisabledCopyWithImpl(this._self, this._then);

  final AccountDisabled _self;
  final $Res Function(AccountDisabled) _then;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(AccountDisabled(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ResourceForbidden extends ForbiddenFailure {
  const ResourceForbidden({this.message = 'Access denied', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceForbiddenCopyWith<ResourceForbidden> get copyWith => _$ResourceForbiddenCopyWithImpl<ResourceForbidden>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceForbidden&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ForbiddenFailure.resourceForbidden(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ResourceForbiddenCopyWith<$Res> implements $ForbiddenFailureCopyWith<$Res> {
  factory $ResourceForbiddenCopyWith(ResourceForbidden value, $Res Function(ResourceForbidden) _then) = _$ResourceForbiddenCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ResourceForbiddenCopyWithImpl<$Res>
    implements $ResourceForbiddenCopyWith<$Res> {
  _$ResourceForbiddenCopyWithImpl(this._self, this._then);

  final ResourceForbidden _self;
  final $Res Function(ResourceForbidden) _then;

/// Create a copy of ForbiddenFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ResourceForbidden(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ValidationFailure {

 String get message; Map<String, List<String>> get fieldErrors; String? get requestId;
/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this as ValidationFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(fieldErrors),requestId);

@override
String toString() {
  return 'ValidationFailure(message: $message, fieldErrors: $fieldErrors, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res>  {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String message, Map<String, List<String>> fieldErrors, String? requestId
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? fieldErrors = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationFailure].
extension ValidationFailurePatterns on ValidationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationFailure value)  $default,){
final _that = this;
switch (_that) {
case _ValidationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationFailure value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  Map<String, List<String>> fieldErrors,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
return $default(_that.message,_that.fieldErrors,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  Map<String, List<String>> fieldErrors,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _ValidationFailure():
return $default(_that.message,_that.fieldErrors,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  Map<String, List<String>> fieldErrors,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
return $default(_that.message,_that.fieldErrors,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _ValidationFailure extends ValidationFailure {
  const _ValidationFailure({required this.message, required final  Map<String, List<String>> fieldErrors, this.requestId}): _fieldErrors = fieldErrors,super._();
  

@override final  String message;
 final  Map<String, List<String>> _fieldErrors;
@override Map<String, List<String>> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override final  String? requestId;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationFailureCopyWith<_ValidationFailure> get copyWith => __$ValidationFailureCopyWithImpl<_ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_fieldErrors),requestId);

@override
String toString() {
  return 'ValidationFailure(message: $message, fieldErrors: $fieldErrors, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$ValidationFailureCopyWith<$Res> implements $ValidationFailureCopyWith<$Res> {
  factory _$ValidationFailureCopyWith(_ValidationFailure value, $Res Function(_ValidationFailure) _then) = __$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, List<String>> fieldErrors, String? requestId
});




}
/// @nodoc
class __$ValidationFailureCopyWithImpl<$Res>
    implements _$ValidationFailureCopyWith<$Res> {
  __$ValidationFailureCopyWithImpl(this._self, this._then);

  final _ValidationFailure _self;
  final $Res Function(_ValidationFailure) _then;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? fieldErrors = null,Object? requestId = freezed,}) {
  return _then(_ValidationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NotFoundFailure {

 String get resourceType; String get resourceId; String get message; String? get requestId;
/// Create a copy of NotFoundFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this as NotFoundFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.resourceType, resourceType) || other.resourceType == resourceType)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,resourceType,resourceId,message,requestId);

@override
String toString() {
  return 'NotFoundFailure(resourceType: $resourceType, resourceId: $resourceId, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res>  {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@useResult
$Res call({
 String resourceType, String resourceId, String message, String? requestId
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of NotFoundFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resourceType = null,Object? resourceId = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
resourceType: null == resourceType ? _self.resourceType : resourceType // ignore: cast_nullable_to_non_nullable
as String,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotFoundFailure].
extension NotFoundFailurePatterns on NotFoundFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotFoundFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotFoundFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotFoundFailure value)  $default,){
final _that = this;
switch (_that) {
case _NotFoundFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotFoundFailure value)?  $default,){
final _that = this;
switch (_that) {
case _NotFoundFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String resourceType,  String resourceId,  String message,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotFoundFailure() when $default != null:
return $default(_that.resourceType,_that.resourceId,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String resourceType,  String resourceId,  String message,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _NotFoundFailure():
return $default(_that.resourceType,_that.resourceId,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String resourceType,  String resourceId,  String message,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _NotFoundFailure() when $default != null:
return $default(_that.resourceType,_that.resourceId,_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _NotFoundFailure extends NotFoundFailure {
  const _NotFoundFailure({required this.resourceType, required this.resourceId, this.message = 'Resource not found', this.requestId}): super._();
  

@override final  String resourceType;
@override final  String resourceId;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of NotFoundFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundFailureCopyWith<_NotFoundFailure> get copyWith => __$NotFoundFailureCopyWithImpl<_NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFoundFailure&&(identical(other.resourceType, resourceType) || other.resourceType == resourceType)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,resourceType,resourceId,message,requestId);

@override
String toString() {
  return 'NotFoundFailure(resourceType: $resourceType, resourceId: $resourceId, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$NotFoundFailureCopyWith<$Res> implements $NotFoundFailureCopyWith<$Res> {
  factory _$NotFoundFailureCopyWith(_NotFoundFailure value, $Res Function(_NotFoundFailure) _then) = __$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String resourceType, String resourceId, String message, String? requestId
});




}
/// @nodoc
class __$NotFoundFailureCopyWithImpl<$Res>
    implements _$NotFoundFailureCopyWith<$Res> {
  __$NotFoundFailureCopyWithImpl(this._self, this._then);

  final _NotFoundFailure _self;
  final $Res Function(_NotFoundFailure) _then;

/// Create a copy of NotFoundFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resourceType = null,Object? resourceId = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_NotFoundFailure(
resourceType: null == resourceType ? _self.resourceType : resourceType // ignore: cast_nullable_to_non_nullable
as String,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ConflictFailure {

 String get message; String? get requestId;
/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictFailureCopyWith<ConflictFailure> get copyWith => _$ConflictFailureCopyWithImpl<ConflictFailure>(this as ConflictFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ConflictFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ConflictFailureCopyWith<$Res>  {
  factory $ConflictFailureCopyWith(ConflictFailure value, $Res Function(ConflictFailure) _then) = _$ConflictFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ConflictFailureCopyWithImpl<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  _$ConflictFailureCopyWithImpl(this._self, this._then);

  final ConflictFailure _self;
  final $Res Function(ConflictFailure) _then;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConflictFailure].
extension ConflictFailurePatterns on ConflictFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VersionMismatch value)?  versionMismatch,TResult Function( DuplicateEntry value)?  duplicateEntry,TResult Function( ConcurrentSession value)?  concurrentSession,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VersionMismatch() when versionMismatch != null:
return versionMismatch(_that);case DuplicateEntry() when duplicateEntry != null:
return duplicateEntry(_that);case ConcurrentSession() when concurrentSession != null:
return concurrentSession(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VersionMismatch value)  versionMismatch,required TResult Function( DuplicateEntry value)  duplicateEntry,required TResult Function( ConcurrentSession value)  concurrentSession,}){
final _that = this;
switch (_that) {
case VersionMismatch():
return versionMismatch(_that);case DuplicateEntry():
return duplicateEntry(_that);case ConcurrentSession():
return concurrentSession(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VersionMismatch value)?  versionMismatch,TResult? Function( DuplicateEntry value)?  duplicateEntry,TResult? Function( ConcurrentSession value)?  concurrentSession,}){
final _that = this;
switch (_that) {
case VersionMismatch() when versionMismatch != null:
return versionMismatch(_that);case DuplicateEntry() when duplicateEntry != null:
return duplicateEntry(_that);case ConcurrentSession() when concurrentSession != null:
return concurrentSession(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int serverVersion,  String message,  String? requestId)?  versionMismatch,TResult Function( String field,  String message,  String? requestId)?  duplicateEntry,TResult Function( String message,  String? requestId)?  concurrentSession,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VersionMismatch() when versionMismatch != null:
return versionMismatch(_that.serverVersion,_that.message,_that.requestId);case DuplicateEntry() when duplicateEntry != null:
return duplicateEntry(_that.field,_that.message,_that.requestId);case ConcurrentSession() when concurrentSession != null:
return concurrentSession(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int serverVersion,  String message,  String? requestId)  versionMismatch,required TResult Function( String field,  String message,  String? requestId)  duplicateEntry,required TResult Function( String message,  String? requestId)  concurrentSession,}) {final _that = this;
switch (_that) {
case VersionMismatch():
return versionMismatch(_that.serverVersion,_that.message,_that.requestId);case DuplicateEntry():
return duplicateEntry(_that.field,_that.message,_that.requestId);case ConcurrentSession():
return concurrentSession(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int serverVersion,  String message,  String? requestId)?  versionMismatch,TResult? Function( String field,  String message,  String? requestId)?  duplicateEntry,TResult? Function( String message,  String? requestId)?  concurrentSession,}) {final _that = this;
switch (_that) {
case VersionMismatch() when versionMismatch != null:
return versionMismatch(_that.serverVersion,_that.message,_that.requestId);case DuplicateEntry() when duplicateEntry != null:
return duplicateEntry(_that.field,_that.message,_that.requestId);case ConcurrentSession() when concurrentSession != null:
return concurrentSession(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class VersionMismatch extends ConflictFailure {
  const VersionMismatch({required this.serverVersion, this.message = 'Data was modified by another user', this.requestId}): super._();
  

 final  int serverVersion;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionMismatchCopyWith<VersionMismatch> get copyWith => _$VersionMismatchCopyWithImpl<VersionMismatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionMismatch&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,serverVersion,message,requestId);

@override
String toString() {
  return 'ConflictFailure.versionMismatch(serverVersion: $serverVersion, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $VersionMismatchCopyWith<$Res> implements $ConflictFailureCopyWith<$Res> {
  factory $VersionMismatchCopyWith(VersionMismatch value, $Res Function(VersionMismatch) _then) = _$VersionMismatchCopyWithImpl;
@override @useResult
$Res call({
 int serverVersion, String message, String? requestId
});




}
/// @nodoc
class _$VersionMismatchCopyWithImpl<$Res>
    implements $VersionMismatchCopyWith<$Res> {
  _$VersionMismatchCopyWithImpl(this._self, this._then);

  final VersionMismatch _self;
  final $Res Function(VersionMismatch) _then;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverVersion = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(VersionMismatch(
serverVersion: null == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DuplicateEntry extends ConflictFailure {
  const DuplicateEntry({required this.field, this.message = 'This entry already exists', this.requestId}): super._();
  

 final  String field;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicateEntryCopyWith<DuplicateEntry> get copyWith => _$DuplicateEntryCopyWithImpl<DuplicateEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicateEntry&&(identical(other.field, field) || other.field == field)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,field,message,requestId);

@override
String toString() {
  return 'ConflictFailure.duplicateEntry(field: $field, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $DuplicateEntryCopyWith<$Res> implements $ConflictFailureCopyWith<$Res> {
  factory $DuplicateEntryCopyWith(DuplicateEntry value, $Res Function(DuplicateEntry) _then) = _$DuplicateEntryCopyWithImpl;
@override @useResult
$Res call({
 String field, String message, String? requestId
});




}
/// @nodoc
class _$DuplicateEntryCopyWithImpl<$Res>
    implements $DuplicateEntryCopyWith<$Res> {
  _$DuplicateEntryCopyWithImpl(this._self, this._then);

  final DuplicateEntry _self;
  final $Res Function(DuplicateEntry) _then;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(DuplicateEntry(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ConcurrentSession extends ConflictFailure {
  const ConcurrentSession({this.message = 'Logged in on another device', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConcurrentSessionCopyWith<ConcurrentSession> get copyWith => _$ConcurrentSessionCopyWithImpl<ConcurrentSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConcurrentSession&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ConflictFailure.concurrentSession(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ConcurrentSessionCopyWith<$Res> implements $ConflictFailureCopyWith<$Res> {
  factory $ConcurrentSessionCopyWith(ConcurrentSession value, $Res Function(ConcurrentSession) _then) = _$ConcurrentSessionCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ConcurrentSessionCopyWithImpl<$Res>
    implements $ConcurrentSessionCopyWith<$Res> {
  _$ConcurrentSessionCopyWithImpl(this._self, this._then);

  final ConcurrentSession _self;
  final $Res Function(ConcurrentSession) _then;

/// Create a copy of ConflictFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ConcurrentSession(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$RateLimitFailure {

 Duration get retryAfter; String get message; String? get requestId;
/// Create a copy of RateLimitFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitFailureCopyWith<RateLimitFailure> get copyWith => _$RateLimitFailureCopyWithImpl<RateLimitFailure>(this as RateLimitFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimitFailure&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfter,message,requestId);

@override
String toString() {
  return 'RateLimitFailure(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $RateLimitFailureCopyWith<$Res>  {
  factory $RateLimitFailureCopyWith(RateLimitFailure value, $Res Function(RateLimitFailure) _then) = _$RateLimitFailureCopyWithImpl;
@useResult
$Res call({
 Duration retryAfter, String message, String? requestId
});




}
/// @nodoc
class _$RateLimitFailureCopyWithImpl<$Res>
    implements $RateLimitFailureCopyWith<$Res> {
  _$RateLimitFailureCopyWithImpl(this._self, this._then);

  final RateLimitFailure _self;
  final $Res Function(RateLimitFailure) _then;

/// Create a copy of RateLimitFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retryAfter = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
retryAfter: null == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateLimitFailure].
extension RateLimitFailurePatterns on RateLimitFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateLimitFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateLimitFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateLimitFailure value)  $default,){
final _that = this;
switch (_that) {
case _RateLimitFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateLimitFailure value)?  $default,){
final _that = this;
switch (_that) {
case _RateLimitFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration retryAfter,  String message,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateLimitFailure() when $default != null:
return $default(_that.retryAfter,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration retryAfter,  String message,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _RateLimitFailure():
return $default(_that.retryAfter,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration retryAfter,  String message,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _RateLimitFailure() when $default != null:
return $default(_that.retryAfter,_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _RateLimitFailure extends RateLimitFailure {
  const _RateLimitFailure({required this.retryAfter, this.message = 'Too many requests. Please wait.', this.requestId}): super._();
  

@override final  Duration retryAfter;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of RateLimitFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitFailureCopyWith<_RateLimitFailure> get copyWith => __$RateLimitFailureCopyWithImpl<_RateLimitFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimitFailure&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfter,message,requestId);

@override
String toString() {
  return 'RateLimitFailure(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$RateLimitFailureCopyWith<$Res> implements $RateLimitFailureCopyWith<$Res> {
  factory _$RateLimitFailureCopyWith(_RateLimitFailure value, $Res Function(_RateLimitFailure) _then) = __$RateLimitFailureCopyWithImpl;
@override @useResult
$Res call({
 Duration retryAfter, String message, String? requestId
});




}
/// @nodoc
class __$RateLimitFailureCopyWithImpl<$Res>
    implements _$RateLimitFailureCopyWith<$Res> {
  __$RateLimitFailureCopyWithImpl(this._self, this._then);

  final _RateLimitFailure _self;
  final $Res Function(_RateLimitFailure) _then;

/// Create a copy of RateLimitFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryAfter = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_RateLimitFailure(
retryAfter: null == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ServerFailure {

 String get message; String? get requestId;
/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this as ServerFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ServerFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res>  {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerFailure].
extension ServerFailurePatterns on ServerFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InternalError value)?  internalError,TResult Function( ServiceUnavailable value)?  serviceUnavailable,TResult Function( BadGateway value)?  badGateway,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InternalError() when internalError != null:
return internalError(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case BadGateway() when badGateway != null:
return badGateway(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InternalError value)  internalError,required TResult Function( ServiceUnavailable value)  serviceUnavailable,required TResult Function( BadGateway value)  badGateway,}){
final _that = this;
switch (_that) {
case InternalError():
return internalError(_that);case ServiceUnavailable():
return serviceUnavailable(_that);case BadGateway():
return badGateway(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InternalError value)?  internalError,TResult? Function( ServiceUnavailable value)?  serviceUnavailable,TResult? Function( BadGateway value)?  badGateway,}){
final _that = this;
switch (_that) {
case InternalError() when internalError != null:
return internalError(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case BadGateway() when badGateway != null:
return badGateway(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? requestId)?  internalError,TResult Function( Duration? retryAfter,  String message,  String? requestId)?  serviceUnavailable,TResult Function( String message,  String? requestId)?  badGateway,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InternalError() when internalError != null:
return internalError(_that.message,_that.requestId);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.retryAfter,_that.message,_that.requestId);case BadGateway() when badGateway != null:
return badGateway(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? requestId)  internalError,required TResult Function( Duration? retryAfter,  String message,  String? requestId)  serviceUnavailable,required TResult Function( String message,  String? requestId)  badGateway,}) {final _that = this;
switch (_that) {
case InternalError():
return internalError(_that.message,_that.requestId);case ServiceUnavailable():
return serviceUnavailable(_that.retryAfter,_that.message,_that.requestId);case BadGateway():
return badGateway(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? requestId)?  internalError,TResult? Function( Duration? retryAfter,  String message,  String? requestId)?  serviceUnavailable,TResult? Function( String message,  String? requestId)?  badGateway,}) {final _that = this;
switch (_that) {
case InternalError() when internalError != null:
return internalError(_that.message,_that.requestId);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.retryAfter,_that.message,_that.requestId);case BadGateway() when badGateway != null:
return badGateway(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class InternalError extends ServerFailure {
  const InternalError({this.message = 'Server error. Please try again later.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternalErrorCopyWith<InternalError> get copyWith => _$InternalErrorCopyWithImpl<InternalError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalError&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ServerFailure.internalError(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InternalErrorCopyWith<$Res> implements $ServerFailureCopyWith<$Res> {
  factory $InternalErrorCopyWith(InternalError value, $Res Function(InternalError) _then) = _$InternalErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$InternalErrorCopyWithImpl<$Res>
    implements $InternalErrorCopyWith<$Res> {
  _$InternalErrorCopyWithImpl(this._self, this._then);

  final InternalError _self;
  final $Res Function(InternalError) _then;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(InternalError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ServiceUnavailable extends ServerFailure {
  const ServiceUnavailable({this.retryAfter, this.message = 'Service temporarily unavailable', this.requestId}): super._();
  

 final  Duration? retryAfter;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceUnavailableCopyWith<ServiceUnavailable> get copyWith => _$ServiceUnavailableCopyWithImpl<ServiceUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceUnavailable&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfter,message,requestId);

@override
String toString() {
  return 'ServerFailure.serviceUnavailable(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ServiceUnavailableCopyWith<$Res> implements $ServerFailureCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(ServiceUnavailable value, $Res Function(ServiceUnavailable) _then) = _$ServiceUnavailableCopyWithImpl;
@override @useResult
$Res call({
 Duration? retryAfter, String message, String? requestId
});




}
/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(this._self, this._then);

  final ServiceUnavailable _self;
  final $Res Function(ServiceUnavailable) _then;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryAfter = freezed,Object? message = null,Object? requestId = freezed,}) {
  return _then(ServiceUnavailable(
retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BadGateway extends ServerFailure {
  const BadGateway({this.message = 'Unable to reach server', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadGatewayCopyWith<BadGateway> get copyWith => _$BadGatewayCopyWithImpl<BadGateway>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadGateway&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'ServerFailure.badGateway(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $BadGatewayCopyWith<$Res> implements $ServerFailureCopyWith<$Res> {
  factory $BadGatewayCopyWith(BadGateway value, $Res Function(BadGateway) _then) = _$BadGatewayCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$BadGatewayCopyWithImpl<$Res>
    implements $BadGatewayCopyWith<$Res> {
  _$BadGatewayCopyWithImpl(this._self, this._then);

  final BadGateway _self;
  final $Res Function(BadGateway) _then;

/// Create a copy of ServerFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(BadGateway(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NetworkFailure {

 String get message; String? get requestId;
/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this as NetworkFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'NetworkFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res>  {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkFailure].
extension NetworkFailurePatterns on NetworkFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Offline value)?  offline,TResult Function( Timeout value)?  timeout,TResult Function( ConnectionError value)?  connectionError,TResult Function( SslError value)?  sslError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that);case Timeout() when timeout != null:
return timeout(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case SslError() when sslError != null:
return sslError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Offline value)  offline,required TResult Function( Timeout value)  timeout,required TResult Function( ConnectionError value)  connectionError,required TResult Function( SslError value)  sslError,}){
final _that = this;
switch (_that) {
case Offline():
return offline(_that);case Timeout():
return timeout(_that);case ConnectionError():
return connectionError(_that);case SslError():
return sslError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Offline value)?  offline,TResult? Function( Timeout value)?  timeout,TResult? Function( ConnectionError value)?  connectionError,TResult? Function( SslError value)?  sslError,}){
final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that);case Timeout() when timeout != null:
return timeout(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case SslError() when sslError != null:
return sslError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? requestId)?  offline,TResult Function( String message,  String? requestId)?  timeout,TResult Function( String? details,  String message,  String? requestId)?  connectionError,TResult Function( String message,  String? requestId)?  sslError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that.message,_that.requestId);case Timeout() when timeout != null:
return timeout(_that.message,_that.requestId);case ConnectionError() when connectionError != null:
return connectionError(_that.details,_that.message,_that.requestId);case SslError() when sslError != null:
return sslError(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? requestId)  offline,required TResult Function( String message,  String? requestId)  timeout,required TResult Function( String? details,  String message,  String? requestId)  connectionError,required TResult Function( String message,  String? requestId)  sslError,}) {final _that = this;
switch (_that) {
case Offline():
return offline(_that.message,_that.requestId);case Timeout():
return timeout(_that.message,_that.requestId);case ConnectionError():
return connectionError(_that.details,_that.message,_that.requestId);case SslError():
return sslError(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? requestId)?  offline,TResult? Function( String message,  String? requestId)?  timeout,TResult? Function( String? details,  String message,  String? requestId)?  connectionError,TResult? Function( String message,  String? requestId)?  sslError,}) {final _that = this;
switch (_that) {
case Offline() when offline != null:
return offline(_that.message,_that.requestId);case Timeout() when timeout != null:
return timeout(_that.message,_that.requestId);case ConnectionError() when connectionError != null:
return connectionError(_that.details,_that.message,_that.requestId);case SslError() when sslError != null:
return sslError(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class Offline extends NetworkFailure {
  const Offline({this.message = 'No internet connection', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineCopyWith<Offline> get copyWith => _$OfflineCopyWithImpl<Offline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Offline&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'NetworkFailure.offline(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OfflineCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $OfflineCopyWith(Offline value, $Res Function(Offline) _then) = _$OfflineCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OfflineCopyWithImpl<$Res>
    implements $OfflineCopyWith<$Res> {
  _$OfflineCopyWithImpl(this._self, this._then);

  final Offline _self;
  final $Res Function(Offline) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(Offline(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Timeout extends NetworkFailure {
  const Timeout({this.message = 'Request timed out', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutCopyWith<Timeout> get copyWith => _$TimeoutCopyWithImpl<Timeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeout&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'NetworkFailure.timeout(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $TimeoutCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $TimeoutCopyWith(Timeout value, $Res Function(Timeout) _then) = _$TimeoutCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$TimeoutCopyWithImpl<$Res>
    implements $TimeoutCopyWith<$Res> {
  _$TimeoutCopyWithImpl(this._self, this._then);

  final Timeout _self;
  final $Res Function(Timeout) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(Timeout(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ConnectionError extends NetworkFailure {
  const ConnectionError({this.details, this.message = 'Connection error', this.requestId}): super._();
  

 final  String? details;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionErrorCopyWith<ConnectionError> get copyWith => _$ConnectionErrorCopyWithImpl<ConnectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError&&(identical(other.details, details) || other.details == details)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,details,message,requestId);

@override
String toString() {
  return 'NetworkFailure.connectionError(details: $details, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ConnectionErrorCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $ConnectionErrorCopyWith(ConnectionError value, $Res Function(ConnectionError) _then) = _$ConnectionErrorCopyWithImpl;
@override @useResult
$Res call({
 String? details, String message, String? requestId
});




}
/// @nodoc
class _$ConnectionErrorCopyWithImpl<$Res>
    implements $ConnectionErrorCopyWith<$Res> {
  _$ConnectionErrorCopyWithImpl(this._self, this._then);

  final ConnectionError _self;
  final $Res Function(ConnectionError) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,Object? message = null,Object? requestId = freezed,}) {
  return _then(ConnectionError(
details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SslError extends NetworkFailure {
  const SslError({this.message = 'Security error', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SslErrorCopyWith<SslError> get copyWith => _$SslErrorCopyWithImpl<SslError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SslError&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'NetworkFailure.sslError(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $SslErrorCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $SslErrorCopyWith(SslError value, $Res Function(SslError) _then) = _$SslErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$SslErrorCopyWithImpl<$Res>
    implements $SslErrorCopyWith<$Res> {
  _$SslErrorCopyWithImpl(this._self, this._then);

  final SslError _self;
  final $Res Function(SslError) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(SslError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$UnknownFailure {

 String get message; Object? get originalError; String? get requestId;
/// Create a copy of UnknownFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this as UnknownFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.originalError, originalError)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(originalError),requestId);

@override
String toString() {
  return 'UnknownFailure(message: $message, originalError: $originalError, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res>  {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@useResult
$Res call({
 String message, Object? originalError, String? requestId
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of UnknownFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? originalError = freezed,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,originalError: freezed == originalError ? _self.originalError : originalError ,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UnknownFailure].
extension UnknownFailurePatterns on UnknownFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnknownFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnknownFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnknownFailure value)  $default,){
final _that = this;
switch (_that) {
case _UnknownFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnknownFailure value)?  $default,){
final _that = this;
switch (_that) {
case _UnknownFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  Object? originalError,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnknownFailure() when $default != null:
return $default(_that.message,_that.originalError,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  Object? originalError,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _UnknownFailure():
return $default(_that.message,_that.originalError,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  Object? originalError,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _UnknownFailure() when $default != null:
return $default(_that.message,_that.originalError,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _UnknownFailure extends UnknownFailure {
  const _UnknownFailure({required this.message, this.originalError, this.requestId}): super._();
  

@override final  String message;
@override final  Object? originalError;
@override final  String? requestId;

/// Create a copy of UnknownFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownFailureCopyWith<_UnknownFailure> get copyWith => __$UnknownFailureCopyWithImpl<_UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.originalError, originalError)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(originalError),requestId);

@override
String toString() {
  return 'UnknownFailure(message: $message, originalError: $originalError, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$UnknownFailureCopyWith<$Res> implements $UnknownFailureCopyWith<$Res> {
  factory _$UnknownFailureCopyWith(_UnknownFailure value, $Res Function(_UnknownFailure) _then) = __$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? originalError, String? requestId
});




}
/// @nodoc
class __$UnknownFailureCopyWithImpl<$Res>
    implements _$UnknownFailureCopyWith<$Res> {
  __$UnknownFailureCopyWithImpl(this._self, this._then);

  final _UnknownFailure _self;
  final $Res Function(_UnknownFailure) _then;

/// Create a copy of UnknownFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? originalError = freezed,Object? requestId = freezed,}) {
  return _then(_UnknownFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,originalError: freezed == originalError ? _self.originalError : originalError ,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$RouteBlockedFailure {

 String get blockedRouteId; DateTime get blockedRouteDate; String get blockedRouteStatus; bool get requiresSupervisorOverride; String get message; String? get requestId;
/// Create a copy of RouteBlockedFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteBlockedFailureCopyWith<RouteBlockedFailure> get copyWith => _$RouteBlockedFailureCopyWithImpl<RouteBlockedFailure>(this as RouteBlockedFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteBlockedFailure&&(identical(other.blockedRouteId, blockedRouteId) || other.blockedRouteId == blockedRouteId)&&(identical(other.blockedRouteDate, blockedRouteDate) || other.blockedRouteDate == blockedRouteDate)&&(identical(other.blockedRouteStatus, blockedRouteStatus) || other.blockedRouteStatus == blockedRouteStatus)&&(identical(other.requiresSupervisorOverride, requiresSupervisorOverride) || other.requiresSupervisorOverride == requiresSupervisorOverride)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,blockedRouteId,blockedRouteDate,blockedRouteStatus,requiresSupervisorOverride,message,requestId);

@override
String toString() {
  return 'RouteBlockedFailure(blockedRouteId: $blockedRouteId, blockedRouteDate: $blockedRouteDate, blockedRouteStatus: $blockedRouteStatus, requiresSupervisorOverride: $requiresSupervisorOverride, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $RouteBlockedFailureCopyWith<$Res>  {
  factory $RouteBlockedFailureCopyWith(RouteBlockedFailure value, $Res Function(RouteBlockedFailure) _then) = _$RouteBlockedFailureCopyWithImpl;
@useResult
$Res call({
 String blockedRouteId, DateTime blockedRouteDate, String blockedRouteStatus, bool requiresSupervisorOverride, String message, String? requestId
});




}
/// @nodoc
class _$RouteBlockedFailureCopyWithImpl<$Res>
    implements $RouteBlockedFailureCopyWith<$Res> {
  _$RouteBlockedFailureCopyWithImpl(this._self, this._then);

  final RouteBlockedFailure _self;
  final $Res Function(RouteBlockedFailure) _then;

/// Create a copy of RouteBlockedFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockedRouteId = null,Object? blockedRouteDate = null,Object? blockedRouteStatus = null,Object? requiresSupervisorOverride = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
blockedRouteId: null == blockedRouteId ? _self.blockedRouteId : blockedRouteId // ignore: cast_nullable_to_non_nullable
as String,blockedRouteDate: null == blockedRouteDate ? _self.blockedRouteDate : blockedRouteDate // ignore: cast_nullable_to_non_nullable
as DateTime,blockedRouteStatus: null == blockedRouteStatus ? _self.blockedRouteStatus : blockedRouteStatus // ignore: cast_nullable_to_non_nullable
as String,requiresSupervisorOverride: null == requiresSupervisorOverride ? _self.requiresSupervisorOverride : requiresSupervisorOverride // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteBlockedFailure].
extension RouteBlockedFailurePatterns on RouteBlockedFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteBlockedFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteBlockedFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteBlockedFailure value)  $default,){
final _that = this;
switch (_that) {
case _RouteBlockedFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteBlockedFailure value)?  $default,){
final _that = this;
switch (_that) {
case _RouteBlockedFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String blockedRouteId,  DateTime blockedRouteDate,  String blockedRouteStatus,  bool requiresSupervisorOverride,  String message,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteBlockedFailure() when $default != null:
return $default(_that.blockedRouteId,_that.blockedRouteDate,_that.blockedRouteStatus,_that.requiresSupervisorOverride,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String blockedRouteId,  DateTime blockedRouteDate,  String blockedRouteStatus,  bool requiresSupervisorOverride,  String message,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _RouteBlockedFailure():
return $default(_that.blockedRouteId,_that.blockedRouteDate,_that.blockedRouteStatus,_that.requiresSupervisorOverride,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String blockedRouteId,  DateTime blockedRouteDate,  String blockedRouteStatus,  bool requiresSupervisorOverride,  String message,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _RouteBlockedFailure() when $default != null:
return $default(_that.blockedRouteId,_that.blockedRouteDate,_that.blockedRouteStatus,_that.requiresSupervisorOverride,_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _RouteBlockedFailure extends RouteBlockedFailure {
  const _RouteBlockedFailure({required this.blockedRouteId, required this.blockedRouteDate, required this.blockedRouteStatus, this.requiresSupervisorOverride = true, this.message = 'You have an unclosed route from a previous day', this.requestId}): super._();
  

@override final  String blockedRouteId;
@override final  DateTime blockedRouteDate;
@override final  String blockedRouteStatus;
@override@JsonKey() final  bool requiresSupervisorOverride;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of RouteBlockedFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteBlockedFailureCopyWith<_RouteBlockedFailure> get copyWith => __$RouteBlockedFailureCopyWithImpl<_RouteBlockedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteBlockedFailure&&(identical(other.blockedRouteId, blockedRouteId) || other.blockedRouteId == blockedRouteId)&&(identical(other.blockedRouteDate, blockedRouteDate) || other.blockedRouteDate == blockedRouteDate)&&(identical(other.blockedRouteStatus, blockedRouteStatus) || other.blockedRouteStatus == blockedRouteStatus)&&(identical(other.requiresSupervisorOverride, requiresSupervisorOverride) || other.requiresSupervisorOverride == requiresSupervisorOverride)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,blockedRouteId,blockedRouteDate,blockedRouteStatus,requiresSupervisorOverride,message,requestId);

@override
String toString() {
  return 'RouteBlockedFailure(blockedRouteId: $blockedRouteId, blockedRouteDate: $blockedRouteDate, blockedRouteStatus: $blockedRouteStatus, requiresSupervisorOverride: $requiresSupervisorOverride, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$RouteBlockedFailureCopyWith<$Res> implements $RouteBlockedFailureCopyWith<$Res> {
  factory _$RouteBlockedFailureCopyWith(_RouteBlockedFailure value, $Res Function(_RouteBlockedFailure) _then) = __$RouteBlockedFailureCopyWithImpl;
@override @useResult
$Res call({
 String blockedRouteId, DateTime blockedRouteDate, String blockedRouteStatus, bool requiresSupervisorOverride, String message, String? requestId
});




}
/// @nodoc
class __$RouteBlockedFailureCopyWithImpl<$Res>
    implements _$RouteBlockedFailureCopyWith<$Res> {
  __$RouteBlockedFailureCopyWithImpl(this._self, this._then);

  final _RouteBlockedFailure _self;
  final $Res Function(_RouteBlockedFailure) _then;

/// Create a copy of RouteBlockedFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blockedRouteId = null,Object? blockedRouteDate = null,Object? blockedRouteStatus = null,Object? requiresSupervisorOverride = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_RouteBlockedFailure(
blockedRouteId: null == blockedRouteId ? _self.blockedRouteId : blockedRouteId // ignore: cast_nullable_to_non_nullable
as String,blockedRouteDate: null == blockedRouteDate ? _self.blockedRouteDate : blockedRouteDate // ignore: cast_nullable_to_non_nullable
as DateTime,blockedRouteStatus: null == blockedRouteStatus ? _self.blockedRouteStatus : blockedRouteStatus // ignore: cast_nullable_to_non_nullable
as String,requiresSupervisorOverride: null == requiresSupervisorOverride ? _self.requiresSupervisorOverride : requiresSupervisorOverride // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$GeofenceViolationFailure {

 double get userLatitude; double get userLongitude; double get outletLatitude; double get outletLongitude; double get distanceMeters; double get requiredRadiusMeters; bool get canRequestOverride; String? get requestId;
/// Create a copy of GeofenceViolationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeofenceViolationFailureCopyWith<GeofenceViolationFailure> get copyWith => _$GeofenceViolationFailureCopyWithImpl<GeofenceViolationFailure>(this as GeofenceViolationFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeofenceViolationFailure&&(identical(other.userLatitude, userLatitude) || other.userLatitude == userLatitude)&&(identical(other.userLongitude, userLongitude) || other.userLongitude == userLongitude)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.requiredRadiusMeters, requiredRadiusMeters) || other.requiredRadiusMeters == requiredRadiusMeters)&&(identical(other.canRequestOverride, canRequestOverride) || other.canRequestOverride == canRequestOverride)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,userLatitude,userLongitude,outletLatitude,outletLongitude,distanceMeters,requiredRadiusMeters,canRequestOverride,requestId);

@override
String toString() {
  return 'GeofenceViolationFailure(userLatitude: $userLatitude, userLongitude: $userLongitude, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, distanceMeters: $distanceMeters, requiredRadiusMeters: $requiredRadiusMeters, canRequestOverride: $canRequestOverride, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $GeofenceViolationFailureCopyWith<$Res>  {
  factory $GeofenceViolationFailureCopyWith(GeofenceViolationFailure value, $Res Function(GeofenceViolationFailure) _then) = _$GeofenceViolationFailureCopyWithImpl;
@useResult
$Res call({
 double userLatitude, double userLongitude, double outletLatitude, double outletLongitude, double distanceMeters, double requiredRadiusMeters, bool canRequestOverride, String? requestId
});




}
/// @nodoc
class _$GeofenceViolationFailureCopyWithImpl<$Res>
    implements $GeofenceViolationFailureCopyWith<$Res> {
  _$GeofenceViolationFailureCopyWithImpl(this._self, this._then);

  final GeofenceViolationFailure _self;
  final $Res Function(GeofenceViolationFailure) _then;

/// Create a copy of GeofenceViolationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userLatitude = null,Object? userLongitude = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? distanceMeters = null,Object? requiredRadiusMeters = null,Object? canRequestOverride = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
userLatitude: null == userLatitude ? _self.userLatitude : userLatitude // ignore: cast_nullable_to_non_nullable
as double,userLongitude: null == userLongitude ? _self.userLongitude : userLongitude // ignore: cast_nullable_to_non_nullable
as double,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,requiredRadiusMeters: null == requiredRadiusMeters ? _self.requiredRadiusMeters : requiredRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,canRequestOverride: null == canRequestOverride ? _self.canRequestOverride : canRequestOverride // ignore: cast_nullable_to_non_nullable
as bool,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeofenceViolationFailure].
extension GeofenceViolationFailurePatterns on GeofenceViolationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeofenceViolationFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeofenceViolationFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeofenceViolationFailure value)  $default,){
final _that = this;
switch (_that) {
case _GeofenceViolationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeofenceViolationFailure value)?  $default,){
final _that = this;
switch (_that) {
case _GeofenceViolationFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double userLatitude,  double userLongitude,  double outletLatitude,  double outletLongitude,  double distanceMeters,  double requiredRadiusMeters,  bool canRequestOverride,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeofenceViolationFailure() when $default != null:
return $default(_that.userLatitude,_that.userLongitude,_that.outletLatitude,_that.outletLongitude,_that.distanceMeters,_that.requiredRadiusMeters,_that.canRequestOverride,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double userLatitude,  double userLongitude,  double outletLatitude,  double outletLongitude,  double distanceMeters,  double requiredRadiusMeters,  bool canRequestOverride,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _GeofenceViolationFailure():
return $default(_that.userLatitude,_that.userLongitude,_that.outletLatitude,_that.outletLongitude,_that.distanceMeters,_that.requiredRadiusMeters,_that.canRequestOverride,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double userLatitude,  double userLongitude,  double outletLatitude,  double outletLongitude,  double distanceMeters,  double requiredRadiusMeters,  bool canRequestOverride,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _GeofenceViolationFailure() when $default != null:
return $default(_that.userLatitude,_that.userLongitude,_that.outletLatitude,_that.outletLongitude,_that.distanceMeters,_that.requiredRadiusMeters,_that.canRequestOverride,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _GeofenceViolationFailure extends GeofenceViolationFailure {
  const _GeofenceViolationFailure({required this.userLatitude, required this.userLongitude, required this.outletLatitude, required this.outletLongitude, required this.distanceMeters, required this.requiredRadiusMeters, this.canRequestOverride = true, this.requestId}): super._();
  

@override final  double userLatitude;
@override final  double userLongitude;
@override final  double outletLatitude;
@override final  double outletLongitude;
@override final  double distanceMeters;
@override final  double requiredRadiusMeters;
@override@JsonKey() final  bool canRequestOverride;
@override final  String? requestId;

/// Create a copy of GeofenceViolationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeofenceViolationFailureCopyWith<_GeofenceViolationFailure> get copyWith => __$GeofenceViolationFailureCopyWithImpl<_GeofenceViolationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeofenceViolationFailure&&(identical(other.userLatitude, userLatitude) || other.userLatitude == userLatitude)&&(identical(other.userLongitude, userLongitude) || other.userLongitude == userLongitude)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.requiredRadiusMeters, requiredRadiusMeters) || other.requiredRadiusMeters == requiredRadiusMeters)&&(identical(other.canRequestOverride, canRequestOverride) || other.canRequestOverride == canRequestOverride)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,userLatitude,userLongitude,outletLatitude,outletLongitude,distanceMeters,requiredRadiusMeters,canRequestOverride,requestId);

@override
String toString() {
  return 'GeofenceViolationFailure(userLatitude: $userLatitude, userLongitude: $userLongitude, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, distanceMeters: $distanceMeters, requiredRadiusMeters: $requiredRadiusMeters, canRequestOverride: $canRequestOverride, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$GeofenceViolationFailureCopyWith<$Res> implements $GeofenceViolationFailureCopyWith<$Res> {
  factory _$GeofenceViolationFailureCopyWith(_GeofenceViolationFailure value, $Res Function(_GeofenceViolationFailure) _then) = __$GeofenceViolationFailureCopyWithImpl;
@override @useResult
$Res call({
 double userLatitude, double userLongitude, double outletLatitude, double outletLongitude, double distanceMeters, double requiredRadiusMeters, bool canRequestOverride, String? requestId
});




}
/// @nodoc
class __$GeofenceViolationFailureCopyWithImpl<$Res>
    implements _$GeofenceViolationFailureCopyWith<$Res> {
  __$GeofenceViolationFailureCopyWithImpl(this._self, this._then);

  final _GeofenceViolationFailure _self;
  final $Res Function(_GeofenceViolationFailure) _then;

/// Create a copy of GeofenceViolationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userLatitude = null,Object? userLongitude = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? distanceMeters = null,Object? requiredRadiusMeters = null,Object? canRequestOverride = null,Object? requestId = freezed,}) {
  return _then(_GeofenceViolationFailure(
userLatitude: null == userLatitude ? _self.userLatitude : userLatitude // ignore: cast_nullable_to_non_nullable
as double,userLongitude: null == userLongitude ? _self.userLongitude : userLongitude // ignore: cast_nullable_to_non_nullable
as double,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,requiredRadiusMeters: null == requiredRadiusMeters ? _self.requiredRadiusMeters : requiredRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,canRequestOverride: null == canRequestOverride ? _self.canRequestOverride : canRequestOverride // ignore: cast_nullable_to_non_nullable
as bool,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$GpsAccuracyFailure {

 double get currentAccuracy; double get requiredAccuracy; String? get requestId;
/// Create a copy of GpsAccuracyFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsAccuracyFailureCopyWith<GpsAccuracyFailure> get copyWith => _$GpsAccuracyFailureCopyWithImpl<GpsAccuracyFailure>(this as GpsAccuracyFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsAccuracyFailure&&(identical(other.currentAccuracy, currentAccuracy) || other.currentAccuracy == currentAccuracy)&&(identical(other.requiredAccuracy, requiredAccuracy) || other.requiredAccuracy == requiredAccuracy)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentAccuracy,requiredAccuracy,requestId);

@override
String toString() {
  return 'GpsAccuracyFailure(currentAccuracy: $currentAccuracy, requiredAccuracy: $requiredAccuracy, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $GpsAccuracyFailureCopyWith<$Res>  {
  factory $GpsAccuracyFailureCopyWith(GpsAccuracyFailure value, $Res Function(GpsAccuracyFailure) _then) = _$GpsAccuracyFailureCopyWithImpl;
@useResult
$Res call({
 double currentAccuracy, double requiredAccuracy, String? requestId
});




}
/// @nodoc
class _$GpsAccuracyFailureCopyWithImpl<$Res>
    implements $GpsAccuracyFailureCopyWith<$Res> {
  _$GpsAccuracyFailureCopyWithImpl(this._self, this._then);

  final GpsAccuracyFailure _self;
  final $Res Function(GpsAccuracyFailure) _then;

/// Create a copy of GpsAccuracyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentAccuracy = null,Object? requiredAccuracy = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
currentAccuracy: null == currentAccuracy ? _self.currentAccuracy : currentAccuracy // ignore: cast_nullable_to_non_nullable
as double,requiredAccuracy: null == requiredAccuracy ? _self.requiredAccuracy : requiredAccuracy // ignore: cast_nullable_to_non_nullable
as double,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GpsAccuracyFailure].
extension GpsAccuracyFailurePatterns on GpsAccuracyFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GpsAccuracyFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GpsAccuracyFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GpsAccuracyFailure value)  $default,){
final _that = this;
switch (_that) {
case _GpsAccuracyFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GpsAccuracyFailure value)?  $default,){
final _that = this;
switch (_that) {
case _GpsAccuracyFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double currentAccuracy,  double requiredAccuracy,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GpsAccuracyFailure() when $default != null:
return $default(_that.currentAccuracy,_that.requiredAccuracy,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double currentAccuracy,  double requiredAccuracy,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _GpsAccuracyFailure():
return $default(_that.currentAccuracy,_that.requiredAccuracy,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double currentAccuracy,  double requiredAccuracy,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _GpsAccuracyFailure() when $default != null:
return $default(_that.currentAccuracy,_that.requiredAccuracy,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _GpsAccuracyFailure extends GpsAccuracyFailure {
  const _GpsAccuracyFailure({required this.currentAccuracy, this.requiredAccuracy = 200.0, this.requestId}): super._();
  

@override final  double currentAccuracy;
@override@JsonKey() final  double requiredAccuracy;
@override final  String? requestId;

/// Create a copy of GpsAccuracyFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GpsAccuracyFailureCopyWith<_GpsAccuracyFailure> get copyWith => __$GpsAccuracyFailureCopyWithImpl<_GpsAccuracyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GpsAccuracyFailure&&(identical(other.currentAccuracy, currentAccuracy) || other.currentAccuracy == currentAccuracy)&&(identical(other.requiredAccuracy, requiredAccuracy) || other.requiredAccuracy == requiredAccuracy)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentAccuracy,requiredAccuracy,requestId);

@override
String toString() {
  return 'GpsAccuracyFailure(currentAccuracy: $currentAccuracy, requiredAccuracy: $requiredAccuracy, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$GpsAccuracyFailureCopyWith<$Res> implements $GpsAccuracyFailureCopyWith<$Res> {
  factory _$GpsAccuracyFailureCopyWith(_GpsAccuracyFailure value, $Res Function(_GpsAccuracyFailure) _then) = __$GpsAccuracyFailureCopyWithImpl;
@override @useResult
$Res call({
 double currentAccuracy, double requiredAccuracy, String? requestId
});




}
/// @nodoc
class __$GpsAccuracyFailureCopyWithImpl<$Res>
    implements _$GpsAccuracyFailureCopyWith<$Res> {
  __$GpsAccuracyFailureCopyWithImpl(this._self, this._then);

  final _GpsAccuracyFailure _self;
  final $Res Function(_GpsAccuracyFailure) _then;

/// Create a copy of GpsAccuracyFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentAccuracy = null,Object? requiredAccuracy = null,Object? requestId = freezed,}) {
  return _then(_GpsAccuracyFailure(
currentAccuracy: null == currentAccuracy ? _self.currentAccuracy : currentAccuracy // ignore: cast_nullable_to_non_nullable
as double,requiredAccuracy: null == requiredAccuracy ? _self.requiredAccuracy : requiredAccuracy // ignore: cast_nullable_to_non_nullable
as double,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VisitInProgressFailure {

 String get activeVisitLocalId; String get activeOutletName; String? get requestId;
/// Create a copy of VisitInProgressFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitInProgressFailureCopyWith<VisitInProgressFailure> get copyWith => _$VisitInProgressFailureCopyWithImpl<VisitInProgressFailure>(this as VisitInProgressFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitInProgressFailure&&(identical(other.activeVisitLocalId, activeVisitLocalId) || other.activeVisitLocalId == activeVisitLocalId)&&(identical(other.activeOutletName, activeOutletName) || other.activeOutletName == activeOutletName)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,activeVisitLocalId,activeOutletName,requestId);

@override
String toString() {
  return 'VisitInProgressFailure(activeVisitLocalId: $activeVisitLocalId, activeOutletName: $activeOutletName, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $VisitInProgressFailureCopyWith<$Res>  {
  factory $VisitInProgressFailureCopyWith(VisitInProgressFailure value, $Res Function(VisitInProgressFailure) _then) = _$VisitInProgressFailureCopyWithImpl;
@useResult
$Res call({
 String activeVisitLocalId, String activeOutletName, String? requestId
});




}
/// @nodoc
class _$VisitInProgressFailureCopyWithImpl<$Res>
    implements $VisitInProgressFailureCopyWith<$Res> {
  _$VisitInProgressFailureCopyWithImpl(this._self, this._then);

  final VisitInProgressFailure _self;
  final $Res Function(VisitInProgressFailure) _then;

/// Create a copy of VisitInProgressFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeVisitLocalId = null,Object? activeOutletName = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
activeVisitLocalId: null == activeVisitLocalId ? _self.activeVisitLocalId : activeVisitLocalId // ignore: cast_nullable_to_non_nullable
as String,activeOutletName: null == activeOutletName ? _self.activeOutletName : activeOutletName // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitInProgressFailure].
extension VisitInProgressFailurePatterns on VisitInProgressFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitInProgressFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitInProgressFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitInProgressFailure value)  $default,){
final _that = this;
switch (_that) {
case _VisitInProgressFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitInProgressFailure value)?  $default,){
final _that = this;
switch (_that) {
case _VisitInProgressFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String activeVisitLocalId,  String activeOutletName,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitInProgressFailure() when $default != null:
return $default(_that.activeVisitLocalId,_that.activeOutletName,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String activeVisitLocalId,  String activeOutletName,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _VisitInProgressFailure():
return $default(_that.activeVisitLocalId,_that.activeOutletName,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String activeVisitLocalId,  String activeOutletName,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _VisitInProgressFailure() when $default != null:
return $default(_that.activeVisitLocalId,_that.activeOutletName,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _VisitInProgressFailure extends VisitInProgressFailure {
  const _VisitInProgressFailure({required this.activeVisitLocalId, required this.activeOutletName, this.requestId}): super._();
  

@override final  String activeVisitLocalId;
@override final  String activeOutletName;
@override final  String? requestId;

/// Create a copy of VisitInProgressFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitInProgressFailureCopyWith<_VisitInProgressFailure> get copyWith => __$VisitInProgressFailureCopyWithImpl<_VisitInProgressFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitInProgressFailure&&(identical(other.activeVisitLocalId, activeVisitLocalId) || other.activeVisitLocalId == activeVisitLocalId)&&(identical(other.activeOutletName, activeOutletName) || other.activeOutletName == activeOutletName)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,activeVisitLocalId,activeOutletName,requestId);

@override
String toString() {
  return 'VisitInProgressFailure(activeVisitLocalId: $activeVisitLocalId, activeOutletName: $activeOutletName, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$VisitInProgressFailureCopyWith<$Res> implements $VisitInProgressFailureCopyWith<$Res> {
  factory _$VisitInProgressFailureCopyWith(_VisitInProgressFailure value, $Res Function(_VisitInProgressFailure) _then) = __$VisitInProgressFailureCopyWithImpl;
@override @useResult
$Res call({
 String activeVisitLocalId, String activeOutletName, String? requestId
});




}
/// @nodoc
class __$VisitInProgressFailureCopyWithImpl<$Res>
    implements _$VisitInProgressFailureCopyWith<$Res> {
  __$VisitInProgressFailureCopyWithImpl(this._self, this._then);

  final _VisitInProgressFailure _self;
  final $Res Function(_VisitInProgressFailure) _then;

/// Create a copy of VisitInProgressFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeVisitLocalId = null,Object? activeOutletName = null,Object? requestId = freezed,}) {
  return _then(_VisitInProgressFailure(
activeVisitLocalId: null == activeVisitLocalId ? _self.activeVisitLocalId : activeVisitLocalId // ignore: cast_nullable_to_non_nullable
as String,activeOutletName: null == activeOutletName ? _self.activeOutletName : activeOutletName // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$InvalidVisitStateFailure {

 String get currentStatus; String get operation; String? get requestId;
/// Create a copy of InvalidVisitStateFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidVisitStateFailureCopyWith<InvalidVisitStateFailure> get copyWith => _$InvalidVisitStateFailureCopyWithImpl<InvalidVisitStateFailure>(this as InvalidVisitStateFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidVisitStateFailure&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,operation,requestId);

@override
String toString() {
  return 'InvalidVisitStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InvalidVisitStateFailureCopyWith<$Res>  {
  factory $InvalidVisitStateFailureCopyWith(InvalidVisitStateFailure value, $Res Function(InvalidVisitStateFailure) _then) = _$InvalidVisitStateFailureCopyWithImpl;
@useResult
$Res call({
 String currentStatus, String operation, String? requestId
});




}
/// @nodoc
class _$InvalidVisitStateFailureCopyWithImpl<$Res>
    implements $InvalidVisitStateFailureCopyWith<$Res> {
  _$InvalidVisitStateFailureCopyWithImpl(this._self, this._then);

  final InvalidVisitStateFailure _self;
  final $Res Function(InvalidVisitStateFailure) _then;

/// Create a copy of InvalidVisitStateFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStatus = null,Object? operation = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvalidVisitStateFailure].
extension InvalidVisitStateFailurePatterns on InvalidVisitStateFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvalidVisitStateFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvalidVisitStateFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvalidVisitStateFailure value)  $default,){
final _that = this;
switch (_that) {
case _InvalidVisitStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvalidVisitStateFailure value)?  $default,){
final _that = this;
switch (_that) {
case _InvalidVisitStateFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentStatus,  String operation,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvalidVisitStateFailure() when $default != null:
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentStatus,  String operation,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _InvalidVisitStateFailure():
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentStatus,  String operation,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _InvalidVisitStateFailure() when $default != null:
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _InvalidVisitStateFailure extends InvalidVisitStateFailure {
  const _InvalidVisitStateFailure({required this.currentStatus, required this.operation, this.requestId}): super._();
  

@override final  String currentStatus;
@override final  String operation;
@override final  String? requestId;

/// Create a copy of InvalidVisitStateFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidVisitStateFailureCopyWith<_InvalidVisitStateFailure> get copyWith => __$InvalidVisitStateFailureCopyWithImpl<_InvalidVisitStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidVisitStateFailure&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,operation,requestId);

@override
String toString() {
  return 'InvalidVisitStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$InvalidVisitStateFailureCopyWith<$Res> implements $InvalidVisitStateFailureCopyWith<$Res> {
  factory _$InvalidVisitStateFailureCopyWith(_InvalidVisitStateFailure value, $Res Function(_InvalidVisitStateFailure) _then) = __$InvalidVisitStateFailureCopyWithImpl;
@override @useResult
$Res call({
 String currentStatus, String operation, String? requestId
});




}
/// @nodoc
class __$InvalidVisitStateFailureCopyWithImpl<$Res>
    implements _$InvalidVisitStateFailureCopyWith<$Res> {
  __$InvalidVisitStateFailureCopyWithImpl(this._self, this._then);

  final _InvalidVisitStateFailure _self;
  final $Res Function(_InvalidVisitStateFailure) _then;

/// Create a copy of InvalidVisitStateFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStatus = null,Object? operation = null,Object? requestId = freezed,}) {
  return _then(_InvalidVisitStateFailure(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$InvalidRouteStateFailure {

 String get currentStatus; String get operation; String? get requestId;
/// Create a copy of InvalidRouteStateFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidRouteStateFailureCopyWith<InvalidRouteStateFailure> get copyWith => _$InvalidRouteStateFailureCopyWithImpl<InvalidRouteStateFailure>(this as InvalidRouteStateFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidRouteStateFailure&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,operation,requestId);

@override
String toString() {
  return 'InvalidRouteStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InvalidRouteStateFailureCopyWith<$Res>  {
  factory $InvalidRouteStateFailureCopyWith(InvalidRouteStateFailure value, $Res Function(InvalidRouteStateFailure) _then) = _$InvalidRouteStateFailureCopyWithImpl;
@useResult
$Res call({
 String currentStatus, String operation, String? requestId
});




}
/// @nodoc
class _$InvalidRouteStateFailureCopyWithImpl<$Res>
    implements $InvalidRouteStateFailureCopyWith<$Res> {
  _$InvalidRouteStateFailureCopyWithImpl(this._self, this._then);

  final InvalidRouteStateFailure _self;
  final $Res Function(InvalidRouteStateFailure) _then;

/// Create a copy of InvalidRouteStateFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStatus = null,Object? operation = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvalidRouteStateFailure].
extension InvalidRouteStateFailurePatterns on InvalidRouteStateFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvalidRouteStateFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvalidRouteStateFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvalidRouteStateFailure value)  $default,){
final _that = this;
switch (_that) {
case _InvalidRouteStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvalidRouteStateFailure value)?  $default,){
final _that = this;
switch (_that) {
case _InvalidRouteStateFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentStatus,  String operation,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvalidRouteStateFailure() when $default != null:
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentStatus,  String operation,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _InvalidRouteStateFailure():
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentStatus,  String operation,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _InvalidRouteStateFailure() when $default != null:
return $default(_that.currentStatus,_that.operation,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _InvalidRouteStateFailure extends InvalidRouteStateFailure {
  const _InvalidRouteStateFailure({required this.currentStatus, required this.operation, this.requestId}): super._();
  

@override final  String currentStatus;
@override final  String operation;
@override final  String? requestId;

/// Create a copy of InvalidRouteStateFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidRouteStateFailureCopyWith<_InvalidRouteStateFailure> get copyWith => __$InvalidRouteStateFailureCopyWithImpl<_InvalidRouteStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidRouteStateFailure&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,operation,requestId);

@override
String toString() {
  return 'InvalidRouteStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$InvalidRouteStateFailureCopyWith<$Res> implements $InvalidRouteStateFailureCopyWith<$Res> {
  factory _$InvalidRouteStateFailureCopyWith(_InvalidRouteStateFailure value, $Res Function(_InvalidRouteStateFailure) _then) = __$InvalidRouteStateFailureCopyWithImpl;
@override @useResult
$Res call({
 String currentStatus, String operation, String? requestId
});




}
/// @nodoc
class __$InvalidRouteStateFailureCopyWithImpl<$Res>
    implements _$InvalidRouteStateFailureCopyWith<$Res> {
  __$InvalidRouteStateFailureCopyWithImpl(this._self, this._then);

  final _InvalidRouteStateFailure _self;
  final $Res Function(_InvalidRouteStateFailure) _then;

/// Create a copy of InvalidRouteStateFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStatus = null,Object? operation = null,Object? requestId = freezed,}) {
  return _then(_InvalidRouteStateFailure(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BiometricVerificationFailure {

 String get message; String? get requestId;
/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricVerificationFailureCopyWith<BiometricVerificationFailure> get copyWith => _$BiometricVerificationFailureCopyWithImpl<BiometricVerificationFailure>(this as BiometricVerificationFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricVerificationFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $BiometricVerificationFailureCopyWith<$Res>  {
  factory $BiometricVerificationFailureCopyWith(BiometricVerificationFailure value, $Res Function(BiometricVerificationFailure) _then) = _$BiometricVerificationFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$BiometricVerificationFailureCopyWithImpl<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  _$BiometricVerificationFailureCopyWithImpl(this._self, this._then);

  final BiometricVerificationFailure _self;
  final $Res Function(BiometricVerificationFailure) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiometricVerificationFailure].
extension BiometricVerificationFailurePatterns on BiometricVerificationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FaceNotMatched value)?  faceNotMatched,TResult Function( ChallengeExpired value)?  challengeExpired,TResult Function( NotEnrolled value)?  notEnrolled,TResult Function( NoProfile value)?  noProfile,TResult Function( ReEnrollmentRequired value)?  reEnrollmentRequired,TResult Function( ProfileRevoked value)?  profileRevoked,TResult Function( NoTemplate value)?  noTemplate,TResult Function( EnrollmentNotAllowed value)?  enrollmentNotAllowed,TResult Function( ModelVersionMismatch value)?  modelVersionMismatch,TResult Function( BiometricsDisabled value)?  biometricsDisabled,TResult Function( ChallengeInvalid value)?  challengeInvalid,TResult Function( ChallengeUsed value)?  challengeUsed,TResult Function( EnrollmentConflict value)?  enrollmentConflict,TResult Function( VerificationRequestConflict value)?  verificationRequestConflict,TResult Function( InvalidImage value)?  invalidImage,TResult Function( ImageTooLarge value)?  imageTooLarge,TResult Function( TechnicallyUnavailable value)?  technicallyUnavailable,TResult Function( DeviceNotRegistered value)?  deviceNotRegistered,TResult Function( BiometricRateLimited value)?  biometricRateLimited,TResult Function( ClockInRejected value)?  clockInRejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FaceNotMatched() when faceNotMatched != null:
return faceNotMatched(_that);case ChallengeExpired() when challengeExpired != null:
return challengeExpired(_that);case NotEnrolled() when notEnrolled != null:
return notEnrolled(_that);case NoProfile() when noProfile != null:
return noProfile(_that);case ReEnrollmentRequired() when reEnrollmentRequired != null:
return reEnrollmentRequired(_that);case ProfileRevoked() when profileRevoked != null:
return profileRevoked(_that);case NoTemplate() when noTemplate != null:
return noTemplate(_that);case EnrollmentNotAllowed() when enrollmentNotAllowed != null:
return enrollmentNotAllowed(_that);case ModelVersionMismatch() when modelVersionMismatch != null:
return modelVersionMismatch(_that);case BiometricsDisabled() when biometricsDisabled != null:
return biometricsDisabled(_that);case ChallengeInvalid() when challengeInvalid != null:
return challengeInvalid(_that);case ChallengeUsed() when challengeUsed != null:
return challengeUsed(_that);case EnrollmentConflict() when enrollmentConflict != null:
return enrollmentConflict(_that);case VerificationRequestConflict() when verificationRequestConflict != null:
return verificationRequestConflict(_that);case InvalidImage() when invalidImage != null:
return invalidImage(_that);case ImageTooLarge() when imageTooLarge != null:
return imageTooLarge(_that);case TechnicallyUnavailable() when technicallyUnavailable != null:
return technicallyUnavailable(_that);case DeviceNotRegistered() when deviceNotRegistered != null:
return deviceNotRegistered(_that);case BiometricRateLimited() when biometricRateLimited != null:
return biometricRateLimited(_that);case ClockInRejected() when clockInRejected != null:
return clockInRejected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FaceNotMatched value)  faceNotMatched,required TResult Function( ChallengeExpired value)  challengeExpired,required TResult Function( NotEnrolled value)  notEnrolled,required TResult Function( NoProfile value)  noProfile,required TResult Function( ReEnrollmentRequired value)  reEnrollmentRequired,required TResult Function( ProfileRevoked value)  profileRevoked,required TResult Function( NoTemplate value)  noTemplate,required TResult Function( EnrollmentNotAllowed value)  enrollmentNotAllowed,required TResult Function( ModelVersionMismatch value)  modelVersionMismatch,required TResult Function( BiometricsDisabled value)  biometricsDisabled,required TResult Function( ChallengeInvalid value)  challengeInvalid,required TResult Function( ChallengeUsed value)  challengeUsed,required TResult Function( EnrollmentConflict value)  enrollmentConflict,required TResult Function( VerificationRequestConflict value)  verificationRequestConflict,required TResult Function( InvalidImage value)  invalidImage,required TResult Function( ImageTooLarge value)  imageTooLarge,required TResult Function( TechnicallyUnavailable value)  technicallyUnavailable,required TResult Function( DeviceNotRegistered value)  deviceNotRegistered,required TResult Function( BiometricRateLimited value)  biometricRateLimited,required TResult Function( ClockInRejected value)  clockInRejected,}){
final _that = this;
switch (_that) {
case FaceNotMatched():
return faceNotMatched(_that);case ChallengeExpired():
return challengeExpired(_that);case NotEnrolled():
return notEnrolled(_that);case NoProfile():
return noProfile(_that);case ReEnrollmentRequired():
return reEnrollmentRequired(_that);case ProfileRevoked():
return profileRevoked(_that);case NoTemplate():
return noTemplate(_that);case EnrollmentNotAllowed():
return enrollmentNotAllowed(_that);case ModelVersionMismatch():
return modelVersionMismatch(_that);case BiometricsDisabled():
return biometricsDisabled(_that);case ChallengeInvalid():
return challengeInvalid(_that);case ChallengeUsed():
return challengeUsed(_that);case EnrollmentConflict():
return enrollmentConflict(_that);case VerificationRequestConflict():
return verificationRequestConflict(_that);case InvalidImage():
return invalidImage(_that);case ImageTooLarge():
return imageTooLarge(_that);case TechnicallyUnavailable():
return technicallyUnavailable(_that);case DeviceNotRegistered():
return deviceNotRegistered(_that);case BiometricRateLimited():
return biometricRateLimited(_that);case ClockInRejected():
return clockInRejected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FaceNotMatched value)?  faceNotMatched,TResult? Function( ChallengeExpired value)?  challengeExpired,TResult? Function( NotEnrolled value)?  notEnrolled,TResult? Function( NoProfile value)?  noProfile,TResult? Function( ReEnrollmentRequired value)?  reEnrollmentRequired,TResult? Function( ProfileRevoked value)?  profileRevoked,TResult? Function( NoTemplate value)?  noTemplate,TResult? Function( EnrollmentNotAllowed value)?  enrollmentNotAllowed,TResult? Function( ModelVersionMismatch value)?  modelVersionMismatch,TResult? Function( BiometricsDisabled value)?  biometricsDisabled,TResult? Function( ChallengeInvalid value)?  challengeInvalid,TResult? Function( ChallengeUsed value)?  challengeUsed,TResult? Function( EnrollmentConflict value)?  enrollmentConflict,TResult? Function( VerificationRequestConflict value)?  verificationRequestConflict,TResult? Function( InvalidImage value)?  invalidImage,TResult? Function( ImageTooLarge value)?  imageTooLarge,TResult? Function( TechnicallyUnavailable value)?  technicallyUnavailable,TResult? Function( DeviceNotRegistered value)?  deviceNotRegistered,TResult? Function( BiometricRateLimited value)?  biometricRateLimited,TResult? Function( ClockInRejected value)?  clockInRejected,}){
final _that = this;
switch (_that) {
case FaceNotMatched() when faceNotMatched != null:
return faceNotMatched(_that);case ChallengeExpired() when challengeExpired != null:
return challengeExpired(_that);case NotEnrolled() when notEnrolled != null:
return notEnrolled(_that);case NoProfile() when noProfile != null:
return noProfile(_that);case ReEnrollmentRequired() when reEnrollmentRequired != null:
return reEnrollmentRequired(_that);case ProfileRevoked() when profileRevoked != null:
return profileRevoked(_that);case NoTemplate() when noTemplate != null:
return noTemplate(_that);case EnrollmentNotAllowed() when enrollmentNotAllowed != null:
return enrollmentNotAllowed(_that);case ModelVersionMismatch() when modelVersionMismatch != null:
return modelVersionMismatch(_that);case BiometricsDisabled() when biometricsDisabled != null:
return biometricsDisabled(_that);case ChallengeInvalid() when challengeInvalid != null:
return challengeInvalid(_that);case ChallengeUsed() when challengeUsed != null:
return challengeUsed(_that);case EnrollmentConflict() when enrollmentConflict != null:
return enrollmentConflict(_that);case VerificationRequestConflict() when verificationRequestConflict != null:
return verificationRequestConflict(_that);case InvalidImage() when invalidImage != null:
return invalidImage(_that);case ImageTooLarge() when imageTooLarge != null:
return imageTooLarge(_that);case TechnicallyUnavailable() when technicallyUnavailable != null:
return technicallyUnavailable(_that);case DeviceNotRegistered() when deviceNotRegistered != null:
return deviceNotRegistered(_that);case BiometricRateLimited() when biometricRateLimited != null:
return biometricRateLimited(_that);case ClockInRejected() when clockInRejected != null:
return clockInRejected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? requestId)?  faceNotMatched,TResult Function( String message,  String? requestId)?  challengeExpired,TResult Function( String message,  String? requestId)?  notEnrolled,TResult Function( String message,  String? requestId)?  noProfile,TResult Function( String message,  String? requestId)?  reEnrollmentRequired,TResult Function( String message,  String? requestId)?  profileRevoked,TResult Function( String message,  String? requestId)?  noTemplate,TResult Function( String message,  String? requestId)?  enrollmentNotAllowed,TResult Function( String message,  String? requestId)?  modelVersionMismatch,TResult Function( String message,  String? requestId)?  biometricsDisabled,TResult Function( String message,  String? requestId)?  challengeInvalid,TResult Function( String message,  String? requestId)?  challengeUsed,TResult Function( String message,  String? requestId)?  enrollmentConflict,TResult Function( String message,  String? requestId)?  verificationRequestConflict,TResult Function( String message,  String? requestId)?  invalidImage,TResult Function( String message,  String? requestId)?  imageTooLarge,TResult Function( BiometricTechnicalUnavailableReason reason,  Duration? retryAfter,  String message,  String? requestId)?  technicallyUnavailable,TResult Function( String message,  String? requestId)?  deviceNotRegistered,TResult Function( Duration retryAfter,  String message,  String? requestId)?  biometricRateLimited,TResult Function( BiometricClockInRejectionReason reason,  String message,  String? requestId)?  clockInRejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FaceNotMatched() when faceNotMatched != null:
return faceNotMatched(_that.message,_that.requestId);case ChallengeExpired() when challengeExpired != null:
return challengeExpired(_that.message,_that.requestId);case NotEnrolled() when notEnrolled != null:
return notEnrolled(_that.message,_that.requestId);case NoProfile() when noProfile != null:
return noProfile(_that.message,_that.requestId);case ReEnrollmentRequired() when reEnrollmentRequired != null:
return reEnrollmentRequired(_that.message,_that.requestId);case ProfileRevoked() when profileRevoked != null:
return profileRevoked(_that.message,_that.requestId);case NoTemplate() when noTemplate != null:
return noTemplate(_that.message,_that.requestId);case EnrollmentNotAllowed() when enrollmentNotAllowed != null:
return enrollmentNotAllowed(_that.message,_that.requestId);case ModelVersionMismatch() when modelVersionMismatch != null:
return modelVersionMismatch(_that.message,_that.requestId);case BiometricsDisabled() when biometricsDisabled != null:
return biometricsDisabled(_that.message,_that.requestId);case ChallengeInvalid() when challengeInvalid != null:
return challengeInvalid(_that.message,_that.requestId);case ChallengeUsed() when challengeUsed != null:
return challengeUsed(_that.message,_that.requestId);case EnrollmentConflict() when enrollmentConflict != null:
return enrollmentConflict(_that.message,_that.requestId);case VerificationRequestConflict() when verificationRequestConflict != null:
return verificationRequestConflict(_that.message,_that.requestId);case InvalidImage() when invalidImage != null:
return invalidImage(_that.message,_that.requestId);case ImageTooLarge() when imageTooLarge != null:
return imageTooLarge(_that.message,_that.requestId);case TechnicallyUnavailable() when technicallyUnavailable != null:
return technicallyUnavailable(_that.reason,_that.retryAfter,_that.message,_that.requestId);case DeviceNotRegistered() when deviceNotRegistered != null:
return deviceNotRegistered(_that.message,_that.requestId);case BiometricRateLimited() when biometricRateLimited != null:
return biometricRateLimited(_that.retryAfter,_that.message,_that.requestId);case ClockInRejected() when clockInRejected != null:
return clockInRejected(_that.reason,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? requestId)  faceNotMatched,required TResult Function( String message,  String? requestId)  challengeExpired,required TResult Function( String message,  String? requestId)  notEnrolled,required TResult Function( String message,  String? requestId)  noProfile,required TResult Function( String message,  String? requestId)  reEnrollmentRequired,required TResult Function( String message,  String? requestId)  profileRevoked,required TResult Function( String message,  String? requestId)  noTemplate,required TResult Function( String message,  String? requestId)  enrollmentNotAllowed,required TResult Function( String message,  String? requestId)  modelVersionMismatch,required TResult Function( String message,  String? requestId)  biometricsDisabled,required TResult Function( String message,  String? requestId)  challengeInvalid,required TResult Function( String message,  String? requestId)  challengeUsed,required TResult Function( String message,  String? requestId)  enrollmentConflict,required TResult Function( String message,  String? requestId)  verificationRequestConflict,required TResult Function( String message,  String? requestId)  invalidImage,required TResult Function( String message,  String? requestId)  imageTooLarge,required TResult Function( BiometricTechnicalUnavailableReason reason,  Duration? retryAfter,  String message,  String? requestId)  technicallyUnavailable,required TResult Function( String message,  String? requestId)  deviceNotRegistered,required TResult Function( Duration retryAfter,  String message,  String? requestId)  biometricRateLimited,required TResult Function( BiometricClockInRejectionReason reason,  String message,  String? requestId)  clockInRejected,}) {final _that = this;
switch (_that) {
case FaceNotMatched():
return faceNotMatched(_that.message,_that.requestId);case ChallengeExpired():
return challengeExpired(_that.message,_that.requestId);case NotEnrolled():
return notEnrolled(_that.message,_that.requestId);case NoProfile():
return noProfile(_that.message,_that.requestId);case ReEnrollmentRequired():
return reEnrollmentRequired(_that.message,_that.requestId);case ProfileRevoked():
return profileRevoked(_that.message,_that.requestId);case NoTemplate():
return noTemplate(_that.message,_that.requestId);case EnrollmentNotAllowed():
return enrollmentNotAllowed(_that.message,_that.requestId);case ModelVersionMismatch():
return modelVersionMismatch(_that.message,_that.requestId);case BiometricsDisabled():
return biometricsDisabled(_that.message,_that.requestId);case ChallengeInvalid():
return challengeInvalid(_that.message,_that.requestId);case ChallengeUsed():
return challengeUsed(_that.message,_that.requestId);case EnrollmentConflict():
return enrollmentConflict(_that.message,_that.requestId);case VerificationRequestConflict():
return verificationRequestConflict(_that.message,_that.requestId);case InvalidImage():
return invalidImage(_that.message,_that.requestId);case ImageTooLarge():
return imageTooLarge(_that.message,_that.requestId);case TechnicallyUnavailable():
return technicallyUnavailable(_that.reason,_that.retryAfter,_that.message,_that.requestId);case DeviceNotRegistered():
return deviceNotRegistered(_that.message,_that.requestId);case BiometricRateLimited():
return biometricRateLimited(_that.retryAfter,_that.message,_that.requestId);case ClockInRejected():
return clockInRejected(_that.reason,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? requestId)?  faceNotMatched,TResult? Function( String message,  String? requestId)?  challengeExpired,TResult? Function( String message,  String? requestId)?  notEnrolled,TResult? Function( String message,  String? requestId)?  noProfile,TResult? Function( String message,  String? requestId)?  reEnrollmentRequired,TResult? Function( String message,  String? requestId)?  profileRevoked,TResult? Function( String message,  String? requestId)?  noTemplate,TResult? Function( String message,  String? requestId)?  enrollmentNotAllowed,TResult? Function( String message,  String? requestId)?  modelVersionMismatch,TResult? Function( String message,  String? requestId)?  biometricsDisabled,TResult? Function( String message,  String? requestId)?  challengeInvalid,TResult? Function( String message,  String? requestId)?  challengeUsed,TResult? Function( String message,  String? requestId)?  enrollmentConflict,TResult? Function( String message,  String? requestId)?  verificationRequestConflict,TResult? Function( String message,  String? requestId)?  invalidImage,TResult? Function( String message,  String? requestId)?  imageTooLarge,TResult? Function( BiometricTechnicalUnavailableReason reason,  Duration? retryAfter,  String message,  String? requestId)?  technicallyUnavailable,TResult? Function( String message,  String? requestId)?  deviceNotRegistered,TResult? Function( Duration retryAfter,  String message,  String? requestId)?  biometricRateLimited,TResult? Function( BiometricClockInRejectionReason reason,  String message,  String? requestId)?  clockInRejected,}) {final _that = this;
switch (_that) {
case FaceNotMatched() when faceNotMatched != null:
return faceNotMatched(_that.message,_that.requestId);case ChallengeExpired() when challengeExpired != null:
return challengeExpired(_that.message,_that.requestId);case NotEnrolled() when notEnrolled != null:
return notEnrolled(_that.message,_that.requestId);case NoProfile() when noProfile != null:
return noProfile(_that.message,_that.requestId);case ReEnrollmentRequired() when reEnrollmentRequired != null:
return reEnrollmentRequired(_that.message,_that.requestId);case ProfileRevoked() when profileRevoked != null:
return profileRevoked(_that.message,_that.requestId);case NoTemplate() when noTemplate != null:
return noTemplate(_that.message,_that.requestId);case EnrollmentNotAllowed() when enrollmentNotAllowed != null:
return enrollmentNotAllowed(_that.message,_that.requestId);case ModelVersionMismatch() when modelVersionMismatch != null:
return modelVersionMismatch(_that.message,_that.requestId);case BiometricsDisabled() when biometricsDisabled != null:
return biometricsDisabled(_that.message,_that.requestId);case ChallengeInvalid() when challengeInvalid != null:
return challengeInvalid(_that.message,_that.requestId);case ChallengeUsed() when challengeUsed != null:
return challengeUsed(_that.message,_that.requestId);case EnrollmentConflict() when enrollmentConflict != null:
return enrollmentConflict(_that.message,_that.requestId);case VerificationRequestConflict() when verificationRequestConflict != null:
return verificationRequestConflict(_that.message,_that.requestId);case InvalidImage() when invalidImage != null:
return invalidImage(_that.message,_that.requestId);case ImageTooLarge() when imageTooLarge != null:
return imageTooLarge(_that.message,_that.requestId);case TechnicallyUnavailable() when technicallyUnavailable != null:
return technicallyUnavailable(_that.reason,_that.retryAfter,_that.message,_that.requestId);case DeviceNotRegistered() when deviceNotRegistered != null:
return deviceNotRegistered(_that.message,_that.requestId);case BiometricRateLimited() when biometricRateLimited != null:
return biometricRateLimited(_that.retryAfter,_that.message,_that.requestId);case ClockInRejected() when clockInRejected != null:
return clockInRejected(_that.reason,_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class FaceNotMatched extends BiometricVerificationFailure {
  const FaceNotMatched({this.message = 'We could not verify your face. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceNotMatchedCopyWith<FaceNotMatched> get copyWith => _$FaceNotMatchedCopyWithImpl<FaceNotMatched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceNotMatched&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.faceNotMatched(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $FaceNotMatchedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $FaceNotMatchedCopyWith(FaceNotMatched value, $Res Function(FaceNotMatched) _then) = _$FaceNotMatchedCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$FaceNotMatchedCopyWithImpl<$Res>
    implements $FaceNotMatchedCopyWith<$Res> {
  _$FaceNotMatchedCopyWithImpl(this._self, this._then);

  final FaceNotMatched _self;
  final $Res Function(FaceNotMatched) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(FaceNotMatched(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChallengeExpired extends BiometricVerificationFailure {
  const ChallengeExpired({this.message = 'Liveness check expired. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeExpiredCopyWith<ChallengeExpired> get copyWith => _$ChallengeExpiredCopyWithImpl<ChallengeExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeExpired&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.challengeExpired(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ChallengeExpiredCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ChallengeExpiredCopyWith(ChallengeExpired value, $Res Function(ChallengeExpired) _then) = _$ChallengeExpiredCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ChallengeExpiredCopyWithImpl<$Res>
    implements $ChallengeExpiredCopyWith<$Res> {
  _$ChallengeExpiredCopyWithImpl(this._self, this._then);

  final ChallengeExpired _self;
  final $Res Function(ChallengeExpired) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ChallengeExpired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NotEnrolled extends BiometricVerificationFailure {
  const NotEnrolled({this.message = 'Face not registered for this account', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotEnrolledCopyWith<NotEnrolled> get copyWith => _$NotEnrolledCopyWithImpl<NotEnrolled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotEnrolled&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.notEnrolled(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $NotEnrolledCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $NotEnrolledCopyWith(NotEnrolled value, $Res Function(NotEnrolled) _then) = _$NotEnrolledCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$NotEnrolledCopyWithImpl<$Res>
    implements $NotEnrolledCopyWith<$Res> {
  _$NotEnrolledCopyWithImpl(this._self, this._then);

  final NotEnrolled _self;
  final $Res Function(NotEnrolled) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(NotEnrolled(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NoProfile extends BiometricVerificationFailure {
  const NoProfile({this.message = 'Face not registered for this account', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoProfileCopyWith<NoProfile> get copyWith => _$NoProfileCopyWithImpl<NoProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoProfile&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.noProfile(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $NoProfileCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $NoProfileCopyWith(NoProfile value, $Res Function(NoProfile) _then) = _$NoProfileCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$NoProfileCopyWithImpl<$Res>
    implements $NoProfileCopyWith<$Res> {
  _$NoProfileCopyWithImpl(this._self, this._then);

  final NoProfile _self;
  final $Res Function(NoProfile) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(NoProfile(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ReEnrollmentRequired extends BiometricVerificationFailure {
  const ReEnrollmentRequired({this.message = 'Your face registration was reset — please register again', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReEnrollmentRequiredCopyWith<ReEnrollmentRequired> get copyWith => _$ReEnrollmentRequiredCopyWithImpl<ReEnrollmentRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReEnrollmentRequired&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.reEnrollmentRequired(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ReEnrollmentRequiredCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ReEnrollmentRequiredCopyWith(ReEnrollmentRequired value, $Res Function(ReEnrollmentRequired) _then) = _$ReEnrollmentRequiredCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ReEnrollmentRequiredCopyWithImpl<$Res>
    implements $ReEnrollmentRequiredCopyWith<$Res> {
  _$ReEnrollmentRequiredCopyWithImpl(this._self, this._then);

  final ReEnrollmentRequired _self;
  final $Res Function(ReEnrollmentRequired) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ReEnrollmentRequired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ProfileRevoked extends BiometricVerificationFailure {
  const ProfileRevoked({this.message = 'Face verification disabled for your account — contact your supervisor', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileRevokedCopyWith<ProfileRevoked> get copyWith => _$ProfileRevokedCopyWithImpl<ProfileRevoked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileRevoked&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.profileRevoked(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ProfileRevokedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ProfileRevokedCopyWith(ProfileRevoked value, $Res Function(ProfileRevoked) _then) = _$ProfileRevokedCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ProfileRevokedCopyWithImpl<$Res>
    implements $ProfileRevokedCopyWith<$Res> {
  _$ProfileRevokedCopyWithImpl(this._self, this._then);

  final ProfileRevoked _self;
  final $Res Function(ProfileRevoked) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ProfileRevoked(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NoTemplate extends BiometricVerificationFailure {
  const NoTemplate({this.message = 'Face registration is incomplete — please register again', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoTemplateCopyWith<NoTemplate> get copyWith => _$NoTemplateCopyWithImpl<NoTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoTemplate&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.noTemplate(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $NoTemplateCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $NoTemplateCopyWith(NoTemplate value, $Res Function(NoTemplate) _then) = _$NoTemplateCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$NoTemplateCopyWithImpl<$Res>
    implements $NoTemplateCopyWith<$Res> {
  _$NoTemplateCopyWithImpl(this._self, this._then);

  final NoTemplate _self;
  final $Res Function(NoTemplate) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(NoTemplate(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EnrollmentNotAllowed extends BiometricVerificationFailure {
  const EnrollmentNotAllowed({this.message = 'Already registered. Ask your supervisor to reset.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentNotAllowedCopyWith<EnrollmentNotAllowed> get copyWith => _$EnrollmentNotAllowedCopyWithImpl<EnrollmentNotAllowed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrollmentNotAllowed&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.enrollmentNotAllowed(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $EnrollmentNotAllowedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $EnrollmentNotAllowedCopyWith(EnrollmentNotAllowed value, $Res Function(EnrollmentNotAllowed) _then) = _$EnrollmentNotAllowedCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$EnrollmentNotAllowedCopyWithImpl<$Res>
    implements $EnrollmentNotAllowedCopyWith<$Res> {
  _$EnrollmentNotAllowedCopyWithImpl(this._self, this._then);

  final EnrollmentNotAllowed _self;
  final $Res Function(EnrollmentNotAllowed) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(EnrollmentNotAllowed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ModelVersionMismatch extends BiometricVerificationFailure {
  const ModelVersionMismatch({this.message = 'Face registration needs to be renewed — contact your supervisor', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelVersionMismatchCopyWith<ModelVersionMismatch> get copyWith => _$ModelVersionMismatchCopyWithImpl<ModelVersionMismatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelVersionMismatch&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.modelVersionMismatch(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ModelVersionMismatchCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ModelVersionMismatchCopyWith(ModelVersionMismatch value, $Res Function(ModelVersionMismatch) _then) = _$ModelVersionMismatchCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ModelVersionMismatchCopyWithImpl<$Res>
    implements $ModelVersionMismatchCopyWith<$Res> {
  _$ModelVersionMismatchCopyWithImpl(this._self, this._then);

  final ModelVersionMismatch _self;
  final $Res Function(ModelVersionMismatch) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ModelVersionMismatch(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BiometricsDisabled extends BiometricVerificationFailure {
  const BiometricsDisabled({this.message = 'Face verification is not available', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricsDisabledCopyWith<BiometricsDisabled> get copyWith => _$BiometricsDisabledCopyWithImpl<BiometricsDisabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricsDisabled&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.biometricsDisabled(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $BiometricsDisabledCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $BiometricsDisabledCopyWith(BiometricsDisabled value, $Res Function(BiometricsDisabled) _then) = _$BiometricsDisabledCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$BiometricsDisabledCopyWithImpl<$Res>
    implements $BiometricsDisabledCopyWith<$Res> {
  _$BiometricsDisabledCopyWithImpl(this._self, this._then);

  final BiometricsDisabled _self;
  final $Res Function(BiometricsDisabled) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(BiometricsDisabled(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChallengeInvalid extends BiometricVerificationFailure {
  const ChallengeInvalid({this.message = 'Something went wrong. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeInvalidCopyWith<ChallengeInvalid> get copyWith => _$ChallengeInvalidCopyWithImpl<ChallengeInvalid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeInvalid&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.challengeInvalid(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ChallengeInvalidCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ChallengeInvalidCopyWith(ChallengeInvalid value, $Res Function(ChallengeInvalid) _then) = _$ChallengeInvalidCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ChallengeInvalidCopyWithImpl<$Res>
    implements $ChallengeInvalidCopyWith<$Res> {
  _$ChallengeInvalidCopyWithImpl(this._self, this._then);

  final ChallengeInvalid _self;
  final $Res Function(ChallengeInvalid) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ChallengeInvalid(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChallengeUsed extends BiometricVerificationFailure {
  const ChallengeUsed({this.message = 'Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeUsedCopyWith<ChallengeUsed> get copyWith => _$ChallengeUsedCopyWithImpl<ChallengeUsed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeUsed&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.challengeUsed(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ChallengeUsedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ChallengeUsedCopyWith(ChallengeUsed value, $Res Function(ChallengeUsed) _then) = _$ChallengeUsedCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ChallengeUsedCopyWithImpl<$Res>
    implements $ChallengeUsedCopyWith<$Res> {
  _$ChallengeUsedCopyWithImpl(this._self, this._then);

  final ChallengeUsed _self;
  final $Res Function(ChallengeUsed) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ChallengeUsed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EnrollmentConflict extends BiometricVerificationFailure {
  const EnrollmentConflict({this.message = 'Registration already completed on another device', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentConflictCopyWith<EnrollmentConflict> get copyWith => _$EnrollmentConflictCopyWithImpl<EnrollmentConflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrollmentConflict&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.enrollmentConflict(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $EnrollmentConflictCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $EnrollmentConflictCopyWith(EnrollmentConflict value, $Res Function(EnrollmentConflict) _then) = _$EnrollmentConflictCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$EnrollmentConflictCopyWithImpl<$Res>
    implements $EnrollmentConflictCopyWith<$Res> {
  _$EnrollmentConflictCopyWithImpl(this._self, this._then);

  final EnrollmentConflict _self;
  final $Res Function(EnrollmentConflict) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(EnrollmentConflict(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class VerificationRequestConflict extends BiometricVerificationFailure {
  const VerificationRequestConflict({this.message = 'Something went wrong. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationRequestConflictCopyWith<VerificationRequestConflict> get copyWith => _$VerificationRequestConflictCopyWithImpl<VerificationRequestConflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationRequestConflict&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.verificationRequestConflict(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $VerificationRequestConflictCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $VerificationRequestConflictCopyWith(VerificationRequestConflict value, $Res Function(VerificationRequestConflict) _then) = _$VerificationRequestConflictCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$VerificationRequestConflictCopyWithImpl<$Res>
    implements $VerificationRequestConflictCopyWith<$Res> {
  _$VerificationRequestConflictCopyWithImpl(this._self, this._then);

  final VerificationRequestConflict _self;
  final $Res Function(VerificationRequestConflict) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(VerificationRequestConflict(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class InvalidImage extends BiometricVerificationFailure {
  const InvalidImage({this.message = 'Something went wrong capturing your photo. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidImageCopyWith<InvalidImage> get copyWith => _$InvalidImageCopyWithImpl<InvalidImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidImage&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.invalidImage(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $InvalidImageCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $InvalidImageCopyWith(InvalidImage value, $Res Function(InvalidImage) _then) = _$InvalidImageCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$InvalidImageCopyWithImpl<$Res>
    implements $InvalidImageCopyWith<$Res> {
  _$InvalidImageCopyWithImpl(this._self, this._then);

  final InvalidImage _self;
  final $Res Function(InvalidImage) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(InvalidImage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ImageTooLarge extends BiometricVerificationFailure {
  const ImageTooLarge({this.message = 'Something went wrong capturing your photo. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageTooLargeCopyWith<ImageTooLarge> get copyWith => _$ImageTooLargeCopyWithImpl<ImageTooLarge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageTooLarge&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.imageTooLarge(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ImageTooLargeCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ImageTooLargeCopyWith(ImageTooLarge value, $Res Function(ImageTooLarge) _then) = _$ImageTooLargeCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$ImageTooLargeCopyWithImpl<$Res>
    implements $ImageTooLargeCopyWith<$Res> {
  _$ImageTooLargeCopyWithImpl(this._self, this._then);

  final ImageTooLarge _self;
  final $Res Function(ImageTooLarge) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(ImageTooLarge(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TechnicallyUnavailable extends BiometricVerificationFailure {
  const TechnicallyUnavailable({required this.reason, this.retryAfter, this.message = 'Face verification temporarily unavailable', this.requestId}): super._();
  

 final  BiometricTechnicalUnavailableReason reason;
 final  Duration? retryAfter;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechnicallyUnavailableCopyWith<TechnicallyUnavailable> get copyWith => _$TechnicallyUnavailableCopyWithImpl<TechnicallyUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechnicallyUnavailable&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,reason,retryAfter,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.technicallyUnavailable(reason: $reason, retryAfter: $retryAfter, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $TechnicallyUnavailableCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $TechnicallyUnavailableCopyWith(TechnicallyUnavailable value, $Res Function(TechnicallyUnavailable) _then) = _$TechnicallyUnavailableCopyWithImpl;
@override @useResult
$Res call({
 BiometricTechnicalUnavailableReason reason, Duration? retryAfter, String message, String? requestId
});




}
/// @nodoc
class _$TechnicallyUnavailableCopyWithImpl<$Res>
    implements $TechnicallyUnavailableCopyWith<$Res> {
  _$TechnicallyUnavailableCopyWithImpl(this._self, this._then);

  final TechnicallyUnavailable _self;
  final $Res Function(TechnicallyUnavailable) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? retryAfter = freezed,Object? message = null,Object? requestId = freezed,}) {
  return _then(TechnicallyUnavailable(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as BiometricTechnicalUnavailableReason,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DeviceNotRegistered extends BiometricVerificationFailure {
  const DeviceNotRegistered({this.message = 'Device not registered. Please try again.', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceNotRegisteredCopyWith<DeviceNotRegistered> get copyWith => _$DeviceNotRegisteredCopyWithImpl<DeviceNotRegistered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceNotRegistered&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.deviceNotRegistered(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $DeviceNotRegisteredCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $DeviceNotRegisteredCopyWith(DeviceNotRegistered value, $Res Function(DeviceNotRegistered) _then) = _$DeviceNotRegisteredCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$DeviceNotRegisteredCopyWithImpl<$Res>
    implements $DeviceNotRegisteredCopyWith<$Res> {
  _$DeviceNotRegisteredCopyWithImpl(this._self, this._then);

  final DeviceNotRegistered _self;
  final $Res Function(DeviceNotRegistered) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(DeviceNotRegistered(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BiometricRateLimited extends BiometricVerificationFailure {
  const BiometricRateLimited({required this.retryAfter, this.message = 'Too many attempts. Please try again shortly.', this.requestId}): super._();
  

 final  Duration retryAfter;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricRateLimitedCopyWith<BiometricRateLimited> get copyWith => _$BiometricRateLimitedCopyWithImpl<BiometricRateLimited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricRateLimited&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfter,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.biometricRateLimited(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $BiometricRateLimitedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $BiometricRateLimitedCopyWith(BiometricRateLimited value, $Res Function(BiometricRateLimited) _then) = _$BiometricRateLimitedCopyWithImpl;
@override @useResult
$Res call({
 Duration retryAfter, String message, String? requestId
});




}
/// @nodoc
class _$BiometricRateLimitedCopyWithImpl<$Res>
    implements $BiometricRateLimitedCopyWith<$Res> {
  _$BiometricRateLimitedCopyWithImpl(this._self, this._then);

  final BiometricRateLimited _self;
  final $Res Function(BiometricRateLimited) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryAfter = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(BiometricRateLimited(
retryAfter: null == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ClockInRejected extends BiometricVerificationFailure {
  const ClockInRejected({required this.reason, this.message = 'Verification could not be completed. Please try again.', this.requestId}): super._();
  

 final  BiometricClockInRejectionReason reason;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInRejectedCopyWith<ClockInRejected> get copyWith => _$ClockInRejectedCopyWithImpl<ClockInRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInRejected&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,reason,message,requestId);

@override
String toString() {
  return 'BiometricVerificationFailure.clockInRejected(reason: $reason, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ClockInRejectedCopyWith<$Res> implements $BiometricVerificationFailureCopyWith<$Res> {
  factory $ClockInRejectedCopyWith(ClockInRejected value, $Res Function(ClockInRejected) _then) = _$ClockInRejectedCopyWithImpl;
@override @useResult
$Res call({
 BiometricClockInRejectionReason reason, String message, String? requestId
});




}
/// @nodoc
class _$ClockInRejectedCopyWithImpl<$Res>
    implements $ClockInRejectedCopyWith<$Res> {
  _$ClockInRejectedCopyWithImpl(this._self, this._then);

  final ClockInRejected _self;
  final $Res Function(ClockInRejected) _then;

/// Create a copy of BiometricVerificationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(ClockInRejected(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as BiometricClockInRejectionReason,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$OutletMappingFailure {

 String get message; String? get requestId;
/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingFailureCopyWith<OutletMappingFailure> get copyWith => _$OutletMappingFailureCopyWithImpl<OutletMappingFailure>(this as OutletMappingFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingFailureCopyWith<$Res>  {
  factory $OutletMappingFailureCopyWith(OutletMappingFailure value, $Res Function(OutletMappingFailure) _then) = _$OutletMappingFailureCopyWithImpl;
@useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingFailureCopyWithImpl<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  _$OutletMappingFailureCopyWithImpl(this._self, this._then);

  final OutletMappingFailure _self;
  final $Res Function(OutletMappingFailure) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutletMappingFailure].
extension OutletMappingFailurePatterns on OutletMappingFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OutletMappingNotFound value)?  notFound,TResult Function( OutletMappingForbidden value)?  forbidden,TResult Function( OutletMappingConflict value)?  conflict,TResult Function( OutletMappingTooManySamples value)?  tooManySamples,TResult Function( OutletMappingValidation value)?  validation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OutletMappingNotFound() when notFound != null:
return notFound(_that);case OutletMappingForbidden() when forbidden != null:
return forbidden(_that);case OutletMappingConflict() when conflict != null:
return conflict(_that);case OutletMappingTooManySamples() when tooManySamples != null:
return tooManySamples(_that);case OutletMappingValidation() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OutletMappingNotFound value)  notFound,required TResult Function( OutletMappingForbidden value)  forbidden,required TResult Function( OutletMappingConflict value)  conflict,required TResult Function( OutletMappingTooManySamples value)  tooManySamples,required TResult Function( OutletMappingValidation value)  validation,}){
final _that = this;
switch (_that) {
case OutletMappingNotFound():
return notFound(_that);case OutletMappingForbidden():
return forbidden(_that);case OutletMappingConflict():
return conflict(_that);case OutletMappingTooManySamples():
return tooManySamples(_that);case OutletMappingValidation():
return validation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OutletMappingNotFound value)?  notFound,TResult? Function( OutletMappingForbidden value)?  forbidden,TResult? Function( OutletMappingConflict value)?  conflict,TResult? Function( OutletMappingTooManySamples value)?  tooManySamples,TResult? Function( OutletMappingValidation value)?  validation,}){
final _that = this;
switch (_that) {
case OutletMappingNotFound() when notFound != null:
return notFound(_that);case OutletMappingForbidden() when forbidden != null:
return forbidden(_that);case OutletMappingConflict() when conflict != null:
return conflict(_that);case OutletMappingTooManySamples() when tooManySamples != null:
return tooManySamples(_that);case OutletMappingValidation() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? requestId)?  notFound,TResult Function( String message,  String? requestId)?  forbidden,TResult Function( String code,  String message,  String? requestId)?  conflict,TResult Function( String message,  String? requestId)?  tooManySamples,TResult Function( String message,  String? requestId)?  validation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OutletMappingNotFound() when notFound != null:
return notFound(_that.message,_that.requestId);case OutletMappingForbidden() when forbidden != null:
return forbidden(_that.message,_that.requestId);case OutletMappingConflict() when conflict != null:
return conflict(_that.code,_that.message,_that.requestId);case OutletMappingTooManySamples() when tooManySamples != null:
return tooManySamples(_that.message,_that.requestId);case OutletMappingValidation() when validation != null:
return validation(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? requestId)  notFound,required TResult Function( String message,  String? requestId)  forbidden,required TResult Function( String code,  String message,  String? requestId)  conflict,required TResult Function( String message,  String? requestId)  tooManySamples,required TResult Function( String message,  String? requestId)  validation,}) {final _that = this;
switch (_that) {
case OutletMappingNotFound():
return notFound(_that.message,_that.requestId);case OutletMappingForbidden():
return forbidden(_that.message,_that.requestId);case OutletMappingConflict():
return conflict(_that.code,_that.message,_that.requestId);case OutletMappingTooManySamples():
return tooManySamples(_that.message,_that.requestId);case OutletMappingValidation():
return validation(_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? requestId)?  notFound,TResult? Function( String message,  String? requestId)?  forbidden,TResult? Function( String code,  String message,  String? requestId)?  conflict,TResult? Function( String message,  String? requestId)?  tooManySamples,TResult? Function( String message,  String? requestId)?  validation,}) {final _that = this;
switch (_that) {
case OutletMappingNotFound() when notFound != null:
return notFound(_that.message,_that.requestId);case OutletMappingForbidden() when forbidden != null:
return forbidden(_that.message,_that.requestId);case OutletMappingConflict() when conflict != null:
return conflict(_that.code,_that.message,_that.requestId);case OutletMappingTooManySamples() when tooManySamples != null:
return tooManySamples(_that.message,_that.requestId);case OutletMappingValidation() when validation != null:
return validation(_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class OutletMappingNotFound extends OutletMappingFailure {
  const OutletMappingNotFound({this.message = 'Mapping request not found', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingNotFoundCopyWith<OutletMappingNotFound> get copyWith => _$OutletMappingNotFoundCopyWithImpl<OutletMappingNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingNotFound&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure.notFound(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingNotFoundCopyWith<$Res> implements $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingNotFoundCopyWith(OutletMappingNotFound value, $Res Function(OutletMappingNotFound) _then) = _$OutletMappingNotFoundCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingNotFoundCopyWithImpl<$Res>
    implements $OutletMappingNotFoundCopyWith<$Res> {
  _$OutletMappingNotFoundCopyWithImpl(this._self, this._then);

  final OutletMappingNotFound _self;
  final $Res Function(OutletMappingNotFound) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(OutletMappingNotFound(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OutletMappingForbidden extends OutletMappingFailure {
  const OutletMappingForbidden({this.message = 'You are not authorized to map this outlet', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingForbiddenCopyWith<OutletMappingForbidden> get copyWith => _$OutletMappingForbiddenCopyWithImpl<OutletMappingForbidden>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingForbidden&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure.forbidden(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingForbiddenCopyWith<$Res> implements $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingForbiddenCopyWith(OutletMappingForbidden value, $Res Function(OutletMappingForbidden) _then) = _$OutletMappingForbiddenCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingForbiddenCopyWithImpl<$Res>
    implements $OutletMappingForbiddenCopyWith<$Res> {
  _$OutletMappingForbiddenCopyWithImpl(this._self, this._then);

  final OutletMappingForbidden _self;
  final $Res Function(OutletMappingForbidden) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(OutletMappingForbidden(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OutletMappingConflict extends OutletMappingFailure {
  const OutletMappingConflict({required this.code, this.message = 'This mapping session cannot continue right now', this.requestId}): super._();
  

 final  String code;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingConflictCopyWith<OutletMappingConflict> get copyWith => _$OutletMappingConflictCopyWithImpl<OutletMappingConflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingConflict&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure.conflict(code: $code, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingConflictCopyWith<$Res> implements $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingConflictCopyWith(OutletMappingConflict value, $Res Function(OutletMappingConflict) _then) = _$OutletMappingConflictCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingConflictCopyWithImpl<$Res>
    implements $OutletMappingConflictCopyWith<$Res> {
  _$OutletMappingConflictCopyWithImpl(this._self, this._then);

  final OutletMappingConflict _self;
  final $Res Function(OutletMappingConflict) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(OutletMappingConflict(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OutletMappingTooManySamples extends OutletMappingFailure {
  const OutletMappingTooManySamples({this.message = 'Maximum mapping readings reached', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingTooManySamplesCopyWith<OutletMappingTooManySamples> get copyWith => _$OutletMappingTooManySamplesCopyWithImpl<OutletMappingTooManySamples>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingTooManySamples&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure.tooManySamples(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingTooManySamplesCopyWith<$Res> implements $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingTooManySamplesCopyWith(OutletMappingTooManySamples value, $Res Function(OutletMappingTooManySamples) _then) = _$OutletMappingTooManySamplesCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingTooManySamplesCopyWithImpl<$Res>
    implements $OutletMappingTooManySamplesCopyWith<$Res> {
  _$OutletMappingTooManySamplesCopyWithImpl(this._self, this._then);

  final OutletMappingTooManySamples _self;
  final $Res Function(OutletMappingTooManySamples) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(OutletMappingTooManySamples(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OutletMappingValidation extends OutletMappingFailure {
  const OutletMappingValidation({this.message = 'Invalid mapping request', this.requestId}): super._();
  

@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletMappingValidationCopyWith<OutletMappingValidation> get copyWith => _$OutletMappingValidationCopyWithImpl<OutletMappingValidation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletMappingValidation&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,message,requestId);

@override
String toString() {
  return 'OutletMappingFailure.validation(message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $OutletMappingValidationCopyWith<$Res> implements $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingValidationCopyWith(OutletMappingValidation value, $Res Function(OutletMappingValidation) _then) = _$OutletMappingValidationCopyWithImpl;
@override @useResult
$Res call({
 String message, String? requestId
});




}
/// @nodoc
class _$OutletMappingValidationCopyWithImpl<$Res>
    implements $OutletMappingValidationCopyWith<$Res> {
  _$OutletMappingValidationCopyWithImpl(this._self, this._then);

  final OutletMappingValidation _self;
  final $Res Function(OutletMappingValidation) _then;

/// Create a copy of OutletMappingFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? requestId = freezed,}) {
  return _then(OutletMappingValidation(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LunchBreakFailure {

 String get code; String get message; String? get requestId;
/// Create a copy of LunchBreakFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LunchBreakFailureCopyWith<LunchBreakFailure> get copyWith => _$LunchBreakFailureCopyWithImpl<LunchBreakFailure>(this as LunchBreakFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LunchBreakFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,requestId);

@override
String toString() {
  return 'LunchBreakFailure(code: $code, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $LunchBreakFailureCopyWith<$Res>  {
  factory $LunchBreakFailureCopyWith(LunchBreakFailure value, $Res Function(LunchBreakFailure) _then) = _$LunchBreakFailureCopyWithImpl;
@useResult
$Res call({
 String code, String message, String? requestId
});




}
/// @nodoc
class _$LunchBreakFailureCopyWithImpl<$Res>
    implements $LunchBreakFailureCopyWith<$Res> {
  _$LunchBreakFailureCopyWithImpl(this._self, this._then);

  final LunchBreakFailure _self;
  final $Res Function(LunchBreakFailure) _then;

/// Create a copy of LunchBreakFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LunchBreakFailure].
extension LunchBreakFailurePatterns on LunchBreakFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LunchBreakActionRejected value)?  actionRejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LunchBreakActionRejected() when actionRejected != null:
return actionRejected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LunchBreakActionRejected value)  actionRejected,}){
final _that = this;
switch (_that) {
case LunchBreakActionRejected():
return actionRejected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LunchBreakActionRejected value)?  actionRejected,}){
final _that = this;
switch (_that) {
case LunchBreakActionRejected() when actionRejected != null:
return actionRejected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String code,  String message,  String? requestId)?  actionRejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LunchBreakActionRejected() when actionRejected != null:
return actionRejected(_that.code,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String code,  String message,  String? requestId)  actionRejected,}) {final _that = this;
switch (_that) {
case LunchBreakActionRejected():
return actionRejected(_that.code,_that.message,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String code,  String message,  String? requestId)?  actionRejected,}) {final _that = this;
switch (_that) {
case LunchBreakActionRejected() when actionRejected != null:
return actionRejected(_that.code,_that.message,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class LunchBreakActionRejected extends LunchBreakFailure {
  const LunchBreakActionRejected({required this.code, this.message = 'Lunch break action could not be completed', this.requestId}): super._();
  

@override final  String code;
@override@JsonKey() final  String message;
@override final  String? requestId;

/// Create a copy of LunchBreakFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LunchBreakActionRejectedCopyWith<LunchBreakActionRejected> get copyWith => _$LunchBreakActionRejectedCopyWithImpl<LunchBreakActionRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LunchBreakActionRejected&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,requestId);

@override
String toString() {
  return 'LunchBreakFailure.actionRejected(code: $code, message: $message, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $LunchBreakActionRejectedCopyWith<$Res> implements $LunchBreakFailureCopyWith<$Res> {
  factory $LunchBreakActionRejectedCopyWith(LunchBreakActionRejected value, $Res Function(LunchBreakActionRejected) _then) = _$LunchBreakActionRejectedCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String? requestId
});




}
/// @nodoc
class _$LunchBreakActionRejectedCopyWithImpl<$Res>
    implements $LunchBreakActionRejectedCopyWith<$Res> {
  _$LunchBreakActionRejectedCopyWithImpl(this._self, this._then);

  final LunchBreakActionRejected _self;
  final $Res Function(LunchBreakActionRejected) _then;

/// Create a copy of LunchBreakFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? requestId = freezed,}) {
  return _then(LunchBreakActionRejected(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
