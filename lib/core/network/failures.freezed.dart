// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId)
    invalidCredentials,
    required TResult Function(String message, String? requestId) tokenExpired,
    required TResult Function(String? reason, String message, String? requestId)
    sessionRevoked,
    required TResult Function(String message, String? requestId)
    biometricFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? invalidCredentials,
    TResult? Function(String message, String? requestId)? tokenExpired,
    TResult? Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult? Function(String message, String? requestId)? biometricFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? invalidCredentials,
    TResult Function(String message, String? requestId)? tokenExpired,
    TResult Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult Function(String message, String? requestId)? biometricFailed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(TokenExpired value) tokenExpired,
    required TResult Function(SessionRevoked value) sessionRevoked,
    required TResult Function(BiometricFailed value) biometricFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(TokenExpired value)? tokenExpired,
    TResult? Function(SessionRevoked value)? sessionRevoked,
    TResult? Function(BiometricFailed value)? biometricFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(TokenExpired value)? tokenExpired,
    TResult Function(SessionRevoked value)? sessionRevoked,
    TResult Function(BiometricFailed value)? biometricFailed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
    AuthFailure value,
    $Res Function(AuthFailure) then,
  ) = _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvalidCredentialsImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$InvalidCredentialsImplCopyWith(
    _$InvalidCredentialsImpl value,
    $Res Function(_$InvalidCredentialsImpl) then,
  ) = __$$InvalidCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$InvalidCredentialsImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidCredentialsImpl>
    implements _$$InvalidCredentialsImplCopyWith<$Res> {
  __$$InvalidCredentialsImplCopyWithImpl(
    _$InvalidCredentialsImpl _value,
    $Res Function(_$InvalidCredentialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$InvalidCredentialsImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InvalidCredentialsImpl extends InvalidCredentials {
  const _$InvalidCredentialsImpl({
    this.message = 'Invalid email or password',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      __$$InvalidCredentialsImplCopyWithImpl<_$InvalidCredentialsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId)
    invalidCredentials,
    required TResult Function(String message, String? requestId) tokenExpired,
    required TResult Function(String? reason, String message, String? requestId)
    sessionRevoked,
    required TResult Function(String message, String? requestId)
    biometricFailed,
  }) {
    return invalidCredentials(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? invalidCredentials,
    TResult? Function(String message, String? requestId)? tokenExpired,
    TResult? Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult? Function(String message, String? requestId)? biometricFailed,
  }) {
    return invalidCredentials?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? invalidCredentials,
    TResult Function(String message, String? requestId)? tokenExpired,
    TResult Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult Function(String message, String? requestId)? biometricFailed,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(TokenExpired value) tokenExpired,
    required TResult Function(SessionRevoked value) sessionRevoked,
    required TResult Function(BiometricFailed value) biometricFailed,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(TokenExpired value)? tokenExpired,
    TResult? Function(SessionRevoked value)? sessionRevoked,
    TResult? Function(BiometricFailed value)? biometricFailed,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(TokenExpired value)? tokenExpired,
    TResult Function(SessionRevoked value)? sessionRevoked,
    TResult Function(BiometricFailed value)? biometricFailed,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentials extends AuthFailure {
  const factory InvalidCredentials({
    final String message,
    final String? requestId,
  }) = _$InvalidCredentialsImpl;
  const InvalidCredentials._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TokenExpiredImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$TokenExpiredImplCopyWith(
    _$TokenExpiredImpl value,
    $Res Function(_$TokenExpiredImpl) then,
  ) = __$$TokenExpiredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$TokenExpiredImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$TokenExpiredImpl>
    implements _$$TokenExpiredImplCopyWith<$Res> {
  __$$TokenExpiredImplCopyWithImpl(
    _$TokenExpiredImpl _value,
    $Res Function(_$TokenExpiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$TokenExpiredImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TokenExpiredImpl extends TokenExpired {
  const _$TokenExpiredImpl({this.message = 'Session expired', this.requestId})
    : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'AuthFailure.tokenExpired(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenExpiredImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenExpiredImplCopyWith<_$TokenExpiredImpl> get copyWith =>
      __$$TokenExpiredImplCopyWithImpl<_$TokenExpiredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId)
    invalidCredentials,
    required TResult Function(String message, String? requestId) tokenExpired,
    required TResult Function(String? reason, String message, String? requestId)
    sessionRevoked,
    required TResult Function(String message, String? requestId)
    biometricFailed,
  }) {
    return tokenExpired(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? invalidCredentials,
    TResult? Function(String message, String? requestId)? tokenExpired,
    TResult? Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult? Function(String message, String? requestId)? biometricFailed,
  }) {
    return tokenExpired?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? invalidCredentials,
    TResult Function(String message, String? requestId)? tokenExpired,
    TResult Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult Function(String message, String? requestId)? biometricFailed,
    required TResult orElse(),
  }) {
    if (tokenExpired != null) {
      return tokenExpired(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(TokenExpired value) tokenExpired,
    required TResult Function(SessionRevoked value) sessionRevoked,
    required TResult Function(BiometricFailed value) biometricFailed,
  }) {
    return tokenExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(TokenExpired value)? tokenExpired,
    TResult? Function(SessionRevoked value)? sessionRevoked,
    TResult? Function(BiometricFailed value)? biometricFailed,
  }) {
    return tokenExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(TokenExpired value)? tokenExpired,
    TResult Function(SessionRevoked value)? sessionRevoked,
    TResult Function(BiometricFailed value)? biometricFailed,
    required TResult orElse(),
  }) {
    if (tokenExpired != null) {
      return tokenExpired(this);
    }
    return orElse();
  }
}

abstract class TokenExpired extends AuthFailure {
  const factory TokenExpired({final String message, final String? requestId}) =
      _$TokenExpiredImpl;
  const TokenExpired._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenExpiredImplCopyWith<_$TokenExpiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionRevokedImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$SessionRevokedImplCopyWith(
    _$SessionRevokedImpl value,
    $Res Function(_$SessionRevokedImpl) then,
  ) = __$$SessionRevokedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason, String message, String? requestId});
}

/// @nodoc
class __$$SessionRevokedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$SessionRevokedImpl>
    implements _$$SessionRevokedImplCopyWith<$Res> {
  __$$SessionRevokedImplCopyWithImpl(
    _$SessionRevokedImpl _value,
    $Res Function(_$SessionRevokedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$SessionRevokedImpl(
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SessionRevokedImpl extends SessionRevoked {
  const _$SessionRevokedImpl({
    this.reason,
    this.message = 'Session ended',
    this.requestId,
  }) : super._();

  @override
  final String? reason;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'AuthFailure.sessionRevoked(reason: $reason, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionRevokedImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, message, requestId);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionRevokedImplCopyWith<_$SessionRevokedImpl> get copyWith =>
      __$$SessionRevokedImplCopyWithImpl<_$SessionRevokedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId)
    invalidCredentials,
    required TResult Function(String message, String? requestId) tokenExpired,
    required TResult Function(String? reason, String message, String? requestId)
    sessionRevoked,
    required TResult Function(String message, String? requestId)
    biometricFailed,
  }) {
    return sessionRevoked(reason, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? invalidCredentials,
    TResult? Function(String message, String? requestId)? tokenExpired,
    TResult? Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult? Function(String message, String? requestId)? biometricFailed,
  }) {
    return sessionRevoked?.call(reason, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? invalidCredentials,
    TResult Function(String message, String? requestId)? tokenExpired,
    TResult Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult Function(String message, String? requestId)? biometricFailed,
    required TResult orElse(),
  }) {
    if (sessionRevoked != null) {
      return sessionRevoked(reason, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(TokenExpired value) tokenExpired,
    required TResult Function(SessionRevoked value) sessionRevoked,
    required TResult Function(BiometricFailed value) biometricFailed,
  }) {
    return sessionRevoked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(TokenExpired value)? tokenExpired,
    TResult? Function(SessionRevoked value)? sessionRevoked,
    TResult? Function(BiometricFailed value)? biometricFailed,
  }) {
    return sessionRevoked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(TokenExpired value)? tokenExpired,
    TResult Function(SessionRevoked value)? sessionRevoked,
    TResult Function(BiometricFailed value)? biometricFailed,
    required TResult orElse(),
  }) {
    if (sessionRevoked != null) {
      return sessionRevoked(this);
    }
    return orElse();
  }
}

abstract class SessionRevoked extends AuthFailure {
  const factory SessionRevoked({
    final String? reason,
    final String message,
    final String? requestId,
  }) = _$SessionRevokedImpl;
  const SessionRevoked._() : super._();

  String? get reason;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionRevokedImplCopyWith<_$SessionRevokedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricFailedImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$BiometricFailedImplCopyWith(
    _$BiometricFailedImpl value,
    $Res Function(_$BiometricFailedImpl) then,
  ) = __$$BiometricFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$BiometricFailedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$BiometricFailedImpl>
    implements _$$BiometricFailedImplCopyWith<$Res> {
  __$$BiometricFailedImplCopyWithImpl(
    _$BiometricFailedImpl _value,
    $Res Function(_$BiometricFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$BiometricFailedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricFailedImpl extends BiometricFailed {
  const _$BiometricFailedImpl({
    this.message = 'Biometric authentication failed',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'AuthFailure.biometricFailed(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricFailedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricFailedImplCopyWith<_$BiometricFailedImpl> get copyWith =>
      __$$BiometricFailedImplCopyWithImpl<_$BiometricFailedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId)
    invalidCredentials,
    required TResult Function(String message, String? requestId) tokenExpired,
    required TResult Function(String? reason, String message, String? requestId)
    sessionRevoked,
    required TResult Function(String message, String? requestId)
    biometricFailed,
  }) {
    return biometricFailed(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? invalidCredentials,
    TResult? Function(String message, String? requestId)? tokenExpired,
    TResult? Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult? Function(String message, String? requestId)? biometricFailed,
  }) {
    return biometricFailed?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? invalidCredentials,
    TResult Function(String message, String? requestId)? tokenExpired,
    TResult Function(String? reason, String message, String? requestId)?
    sessionRevoked,
    TResult Function(String message, String? requestId)? biometricFailed,
    required TResult orElse(),
  }) {
    if (biometricFailed != null) {
      return biometricFailed(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentials value) invalidCredentials,
    required TResult Function(TokenExpired value) tokenExpired,
    required TResult Function(SessionRevoked value) sessionRevoked,
    required TResult Function(BiometricFailed value) biometricFailed,
  }) {
    return biometricFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentials value)? invalidCredentials,
    TResult? Function(TokenExpired value)? tokenExpired,
    TResult? Function(SessionRevoked value)? sessionRevoked,
    TResult? Function(BiometricFailed value)? biometricFailed,
  }) {
    return biometricFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentials value)? invalidCredentials,
    TResult Function(TokenExpired value)? tokenExpired,
    TResult Function(SessionRevoked value)? sessionRevoked,
    TResult Function(BiometricFailed value)? biometricFailed,
    required TResult orElse(),
  }) {
    if (biometricFailed != null) {
      return biometricFailed(this);
    }
    return orElse();
  }
}

abstract class BiometricFailed extends AuthFailure {
  const factory BiometricFailed({
    final String message,
    final String? requestId,
  }) = _$BiometricFailedImpl;
  const BiometricFailed._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricFailedImplCopyWith<_$BiometricFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForbiddenFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )
    insufficientPermissions,
    required TResult Function(String message, String? requestId)
    accountDisabled,
    required TResult Function(String message, String? requestId)
    resourceForbidden,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult? Function(String message, String? requestId)? accountDisabled,
    TResult? Function(String message, String? requestId)? resourceForbidden,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult Function(String message, String? requestId)? accountDisabled,
    TResult Function(String message, String? requestId)? resourceForbidden,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsufficientPermissions value)
    insufficientPermissions,
    required TResult Function(AccountDisabled value) accountDisabled,
    required TResult Function(ResourceForbidden value) resourceForbidden,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsufficientPermissions value)? insufficientPermissions,
    TResult? Function(AccountDisabled value)? accountDisabled,
    TResult? Function(ResourceForbidden value)? resourceForbidden,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsufficientPermissions value)? insufficientPermissions,
    TResult Function(AccountDisabled value)? accountDisabled,
    TResult Function(ResourceForbidden value)? resourceForbidden,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForbiddenFailureCopyWith<$Res> {
  factory $ForbiddenFailureCopyWith(
    ForbiddenFailure value,
    $Res Function(ForbiddenFailure) then,
  ) = _$ForbiddenFailureCopyWithImpl<$Res, ForbiddenFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res, $Val extends ForbiddenFailure>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InsufficientPermissionsImplCopyWith<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  factory _$$InsufficientPermissionsImplCopyWith(
    _$InsufficientPermissionsImpl value,
    $Res Function(_$InsufficientPermissionsImpl) then,
  ) = __$$InsufficientPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requiredPermission, String message, String? requestId});
}

/// @nodoc
class __$$InsufficientPermissionsImplCopyWithImpl<$Res>
    extends _$ForbiddenFailureCopyWithImpl<$Res, _$InsufficientPermissionsImpl>
    implements _$$InsufficientPermissionsImplCopyWith<$Res> {
  __$$InsufficientPermissionsImplCopyWithImpl(
    _$InsufficientPermissionsImpl _value,
    $Res Function(_$InsufficientPermissionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredPermission = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$InsufficientPermissionsImpl(
        requiredPermission: null == requiredPermission
            ? _value.requiredPermission
            : requiredPermission // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InsufficientPermissionsImpl extends InsufficientPermissions {
  const _$InsufficientPermissionsImpl({
    required this.requiredPermission,
    this.message = 'You do not have permission to perform this action',
    this.requestId,
  }) : super._();

  @override
  final String requiredPermission;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ForbiddenFailure.insufficientPermissions(requiredPermission: $requiredPermission, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPermissionsImpl &&
            (identical(other.requiredPermission, requiredPermission) ||
                other.requiredPermission == requiredPermission) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, requiredPermission, message, requestId);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsufficientPermissionsImplCopyWith<_$InsufficientPermissionsImpl>
  get copyWith =>
      __$$InsufficientPermissionsImplCopyWithImpl<
        _$InsufficientPermissionsImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )
    insufficientPermissions,
    required TResult Function(String message, String? requestId)
    accountDisabled,
    required TResult Function(String message, String? requestId)
    resourceForbidden,
  }) {
    return insufficientPermissions(requiredPermission, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult? Function(String message, String? requestId)? accountDisabled,
    TResult? Function(String message, String? requestId)? resourceForbidden,
  }) {
    return insufficientPermissions?.call(
      requiredPermission,
      message,
      requestId,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult Function(String message, String? requestId)? accountDisabled,
    TResult Function(String message, String? requestId)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions(requiredPermission, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsufficientPermissions value)
    insufficientPermissions,
    required TResult Function(AccountDisabled value) accountDisabled,
    required TResult Function(ResourceForbidden value) resourceForbidden,
  }) {
    return insufficientPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsufficientPermissions value)? insufficientPermissions,
    TResult? Function(AccountDisabled value)? accountDisabled,
    TResult? Function(ResourceForbidden value)? resourceForbidden,
  }) {
    return insufficientPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsufficientPermissions value)? insufficientPermissions,
    TResult Function(AccountDisabled value)? accountDisabled,
    TResult Function(ResourceForbidden value)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions(this);
    }
    return orElse();
  }
}

abstract class InsufficientPermissions extends ForbiddenFailure {
  const factory InsufficientPermissions({
    required final String requiredPermission,
    final String message,
    final String? requestId,
  }) = _$InsufficientPermissionsImpl;
  const InsufficientPermissions._() : super._();

  String get requiredPermission;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsufficientPermissionsImplCopyWith<_$InsufficientPermissionsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountDisabledImplCopyWith<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  factory _$$AccountDisabledImplCopyWith(
    _$AccountDisabledImpl value,
    $Res Function(_$AccountDisabledImpl) then,
  ) = __$$AccountDisabledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$AccountDisabledImplCopyWithImpl<$Res>
    extends _$ForbiddenFailureCopyWithImpl<$Res, _$AccountDisabledImpl>
    implements _$$AccountDisabledImplCopyWith<$Res> {
  __$$AccountDisabledImplCopyWithImpl(
    _$AccountDisabledImpl _value,
    $Res Function(_$AccountDisabledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$AccountDisabledImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AccountDisabledImpl extends AccountDisabled {
  const _$AccountDisabledImpl({
    this.message = 'Your account has been disabled',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ForbiddenFailure.accountDisabled(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDisabledImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDisabledImplCopyWith<_$AccountDisabledImpl> get copyWith =>
      __$$AccountDisabledImplCopyWithImpl<_$AccountDisabledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )
    insufficientPermissions,
    required TResult Function(String message, String? requestId)
    accountDisabled,
    required TResult Function(String message, String? requestId)
    resourceForbidden,
  }) {
    return accountDisabled(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult? Function(String message, String? requestId)? accountDisabled,
    TResult? Function(String message, String? requestId)? resourceForbidden,
  }) {
    return accountDisabled?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult Function(String message, String? requestId)? accountDisabled,
    TResult Function(String message, String? requestId)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (accountDisabled != null) {
      return accountDisabled(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsufficientPermissions value)
    insufficientPermissions,
    required TResult Function(AccountDisabled value) accountDisabled,
    required TResult Function(ResourceForbidden value) resourceForbidden,
  }) {
    return accountDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsufficientPermissions value)? insufficientPermissions,
    TResult? Function(AccountDisabled value)? accountDisabled,
    TResult? Function(ResourceForbidden value)? resourceForbidden,
  }) {
    return accountDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsufficientPermissions value)? insufficientPermissions,
    TResult Function(AccountDisabled value)? accountDisabled,
    TResult Function(ResourceForbidden value)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (accountDisabled != null) {
      return accountDisabled(this);
    }
    return orElse();
  }
}

abstract class AccountDisabled extends ForbiddenFailure {
  const factory AccountDisabled({
    final String message,
    final String? requestId,
  }) = _$AccountDisabledImpl;
  const AccountDisabled._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDisabledImplCopyWith<_$AccountDisabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceForbiddenImplCopyWith<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  factory _$$ResourceForbiddenImplCopyWith(
    _$ResourceForbiddenImpl value,
    $Res Function(_$ResourceForbiddenImpl) then,
  ) = __$$ResourceForbiddenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ResourceForbiddenImplCopyWithImpl<$Res>
    extends _$ForbiddenFailureCopyWithImpl<$Res, _$ResourceForbiddenImpl>
    implements _$$ResourceForbiddenImplCopyWith<$Res> {
  __$$ResourceForbiddenImplCopyWithImpl(
    _$ResourceForbiddenImpl _value,
    $Res Function(_$ResourceForbiddenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ResourceForbiddenImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ResourceForbiddenImpl extends ResourceForbidden {
  const _$ResourceForbiddenImpl({
    this.message = 'Access denied',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ForbiddenFailure.resourceForbidden(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceForbiddenImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceForbiddenImplCopyWith<_$ResourceForbiddenImpl> get copyWith =>
      __$$ResourceForbiddenImplCopyWithImpl<_$ResourceForbiddenImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )
    insufficientPermissions,
    required TResult Function(String message, String? requestId)
    accountDisabled,
    required TResult Function(String message, String? requestId)
    resourceForbidden,
  }) {
    return resourceForbidden(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult? Function(String message, String? requestId)? accountDisabled,
    TResult? Function(String message, String? requestId)? resourceForbidden,
  }) {
    return resourceForbidden?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String requiredPermission,
      String message,
      String? requestId,
    )?
    insufficientPermissions,
    TResult Function(String message, String? requestId)? accountDisabled,
    TResult Function(String message, String? requestId)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (resourceForbidden != null) {
      return resourceForbidden(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsufficientPermissions value)
    insufficientPermissions,
    required TResult Function(AccountDisabled value) accountDisabled,
    required TResult Function(ResourceForbidden value) resourceForbidden,
  }) {
    return resourceForbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsufficientPermissions value)? insufficientPermissions,
    TResult? Function(AccountDisabled value)? accountDisabled,
    TResult? Function(ResourceForbidden value)? resourceForbidden,
  }) {
    return resourceForbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsufficientPermissions value)? insufficientPermissions,
    TResult Function(AccountDisabled value)? accountDisabled,
    TResult Function(ResourceForbidden value)? resourceForbidden,
    required TResult orElse(),
  }) {
    if (resourceForbidden != null) {
      return resourceForbidden(this);
    }
    return orElse();
  }
}

abstract class ResourceForbidden extends ForbiddenFailure {
  const factory ResourceForbidden({
    final String message,
    final String? requestId,
  }) = _$ResourceForbiddenImpl;
  const ResourceForbidden._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ForbiddenFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceForbiddenImplCopyWith<_$ResourceForbiddenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidationFailure {
  String get message => throw _privateConstructorUsedError;
  Map<String, List<String>> get fieldErrors =>
      throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of ValidationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationFailureCopyWith<ValidationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationFailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(
    ValidationFailure value,
    $Res Function(ValidationFailure) then,
  ) = _$ValidationFailureCopyWithImpl<$Res, ValidationFailure>;
  @useResult
  $Res call({
    String message,
    Map<String, List<String>> fieldErrors,
    String? requestId,
  });
}

/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res, $Val extends ValidationFailure>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            fieldErrors: null == fieldErrors
                ? _value.fieldErrors
                : fieldErrors // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<String>>,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    Map<String, List<String>> fieldErrors,
    String? requestId,
  });
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$ValidationFailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ValidationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$ValidationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldErrors: null == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<String>>,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl extends _ValidationFailure {
  const _$ValidationFailureImpl({
    required this.message,
    required final Map<String, List<String>> fieldErrors,
    this.requestId,
  }) : _fieldErrors = fieldErrors,
       super._();

  @override
  final String message;
  final Map<String, List<String>> _fieldErrors;
  @override
  Map<String, List<String>> get fieldErrors {
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fieldErrors);
  }

  @override
  final String? requestId;

  @override
  String toString() {
    return 'ValidationFailure(message: $message, fieldErrors: $fieldErrors, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_fieldErrors),
    requestId,
  );

  /// Create a copy of ValidationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _ValidationFailure extends ValidationFailure {
  const factory _ValidationFailure({
    required final String message,
    required final Map<String, List<String>> fieldErrors,
    final String? requestId,
  }) = _$ValidationFailureImpl;
  const _ValidationFailure._() : super._();

  @override
  String get message;
  @override
  Map<String, List<String>> get fieldErrors;
  @override
  String? get requestId;

  /// Create a copy of ValidationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotFoundFailure {
  String get resourceType => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of NotFoundFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotFoundFailureCopyWith<NotFoundFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotFoundFailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(
    NotFoundFailure value,
    $Res Function(NotFoundFailure) then,
  ) = _$NotFoundFailureCopyWithImpl<$Res, NotFoundFailure>;
  @useResult
  $Res call({
    String resourceType,
    String resourceId,
    String message,
    String? requestId,
  });
}

/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res, $Val extends NotFoundFailure>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotFoundFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = null,
    Object? resourceId = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            resourceType: null == resourceType
                ? _value.resourceType
                : resourceType // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceId: null == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String resourceType,
    String resourceId,
    String message,
    String? requestId,
  });
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$NotFoundFailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotFoundFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = null,
    Object? resourceId = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$NotFoundFailureImpl(
        resourceType: null == resourceType
            ? _value.resourceType
            : resourceType // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceId: null == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl extends _NotFoundFailure {
  const _$NotFoundFailureImpl({
    required this.resourceType,
    required this.resourceId,
    this.message = 'Resource not found',
    this.requestId,
  }) : super._();

  @override
  final String resourceType;
  @override
  final String resourceId;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'NotFoundFailure(resourceType: $resourceType, resourceId: $resourceId, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, resourceType, resourceId, message, requestId);

  /// Create a copy of NotFoundFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _NotFoundFailure extends NotFoundFailure {
  const factory _NotFoundFailure({
    required final String resourceType,
    required final String resourceId,
    final String message,
    final String? requestId,
  }) = _$NotFoundFailureImpl;
  const _NotFoundFailure._() : super._();

  @override
  String get resourceType;
  @override
  String get resourceId;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of NotFoundFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConflictFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int serverVersion,
      String message,
      String? requestId,
    )
    versionMismatch,
    required TResult Function(String field, String message, String? requestId)
    duplicateEntry,
    required TResult Function(String message, String? requestId)
    concurrentSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult? Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult? Function(String message, String? requestId)? concurrentSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult Function(String message, String? requestId)? concurrentSession,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VersionMismatch value) versionMismatch,
    required TResult Function(DuplicateEntry value) duplicateEntry,
    required TResult Function(ConcurrentSession value) concurrentSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VersionMismatch value)? versionMismatch,
    TResult? Function(DuplicateEntry value)? duplicateEntry,
    TResult? Function(ConcurrentSession value)? concurrentSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VersionMismatch value)? versionMismatch,
    TResult Function(DuplicateEntry value)? duplicateEntry,
    TResult Function(ConcurrentSession value)? concurrentSession,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConflictFailureCopyWith<ConflictFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConflictFailureCopyWith<$Res> {
  factory $ConflictFailureCopyWith(
    ConflictFailure value,
    $Res Function(ConflictFailure) then,
  ) = _$ConflictFailureCopyWithImpl<$Res, ConflictFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$ConflictFailureCopyWithImpl<$Res, $Val extends ConflictFailure>
    implements $ConflictFailureCopyWith<$Res> {
  _$ConflictFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VersionMismatchImplCopyWith<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  factory _$$VersionMismatchImplCopyWith(
    _$VersionMismatchImpl value,
    $Res Function(_$VersionMismatchImpl) then,
  ) = __$$VersionMismatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int serverVersion, String message, String? requestId});
}

/// @nodoc
class __$$VersionMismatchImplCopyWithImpl<$Res>
    extends _$ConflictFailureCopyWithImpl<$Res, _$VersionMismatchImpl>
    implements _$$VersionMismatchImplCopyWith<$Res> {
  __$$VersionMismatchImplCopyWithImpl(
    _$VersionMismatchImpl _value,
    $Res Function(_$VersionMismatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVersion = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$VersionMismatchImpl(
        serverVersion: null == serverVersion
            ? _value.serverVersion
            : serverVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VersionMismatchImpl extends VersionMismatch {
  const _$VersionMismatchImpl({
    required this.serverVersion,
    this.message = 'Data was modified by another user',
    this.requestId,
  }) : super._();

  @override
  final int serverVersion;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ConflictFailure.versionMismatch(serverVersion: $serverVersion, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionMismatchImpl &&
            (identical(other.serverVersion, serverVersion) ||
                other.serverVersion == serverVersion) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serverVersion, message, requestId);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionMismatchImplCopyWith<_$VersionMismatchImpl> get copyWith =>
      __$$VersionMismatchImplCopyWithImpl<_$VersionMismatchImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int serverVersion,
      String message,
      String? requestId,
    )
    versionMismatch,
    required TResult Function(String field, String message, String? requestId)
    duplicateEntry,
    required TResult Function(String message, String? requestId)
    concurrentSession,
  }) {
    return versionMismatch(serverVersion, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult? Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult? Function(String message, String? requestId)? concurrentSession,
  }) {
    return versionMismatch?.call(serverVersion, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult Function(String message, String? requestId)? concurrentSession,
    required TResult orElse(),
  }) {
    if (versionMismatch != null) {
      return versionMismatch(serverVersion, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VersionMismatch value) versionMismatch,
    required TResult Function(DuplicateEntry value) duplicateEntry,
    required TResult Function(ConcurrentSession value) concurrentSession,
  }) {
    return versionMismatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VersionMismatch value)? versionMismatch,
    TResult? Function(DuplicateEntry value)? duplicateEntry,
    TResult? Function(ConcurrentSession value)? concurrentSession,
  }) {
    return versionMismatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VersionMismatch value)? versionMismatch,
    TResult Function(DuplicateEntry value)? duplicateEntry,
    TResult Function(ConcurrentSession value)? concurrentSession,
    required TResult orElse(),
  }) {
    if (versionMismatch != null) {
      return versionMismatch(this);
    }
    return orElse();
  }
}

abstract class VersionMismatch extends ConflictFailure {
  const factory VersionMismatch({
    required final int serverVersion,
    final String message,
    final String? requestId,
  }) = _$VersionMismatchImpl;
  const VersionMismatch._() : super._();

  int get serverVersion;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VersionMismatchImplCopyWith<_$VersionMismatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DuplicateEntryImplCopyWith<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  factory _$$DuplicateEntryImplCopyWith(
    _$DuplicateEntryImpl value,
    $Res Function(_$DuplicateEntryImpl) then,
  ) = __$$DuplicateEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, String message, String? requestId});
}

/// @nodoc
class __$$DuplicateEntryImplCopyWithImpl<$Res>
    extends _$ConflictFailureCopyWithImpl<$Res, _$DuplicateEntryImpl>
    implements _$$DuplicateEntryImplCopyWith<$Res> {
  __$$DuplicateEntryImplCopyWithImpl(
    _$DuplicateEntryImpl _value,
    $Res Function(_$DuplicateEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$DuplicateEntryImpl(
        field: null == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DuplicateEntryImpl extends DuplicateEntry {
  const _$DuplicateEntryImpl({
    required this.field,
    this.message = 'This entry already exists',
    this.requestId,
  }) : super._();

  @override
  final String field;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ConflictFailure.duplicateEntry(field: $field, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuplicateEntryImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field, message, requestId);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DuplicateEntryImplCopyWith<_$DuplicateEntryImpl> get copyWith =>
      __$$DuplicateEntryImplCopyWithImpl<_$DuplicateEntryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int serverVersion,
      String message,
      String? requestId,
    )
    versionMismatch,
    required TResult Function(String field, String message, String? requestId)
    duplicateEntry,
    required TResult Function(String message, String? requestId)
    concurrentSession,
  }) {
    return duplicateEntry(field, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult? Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult? Function(String message, String? requestId)? concurrentSession,
  }) {
    return duplicateEntry?.call(field, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult Function(String message, String? requestId)? concurrentSession,
    required TResult orElse(),
  }) {
    if (duplicateEntry != null) {
      return duplicateEntry(field, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VersionMismatch value) versionMismatch,
    required TResult Function(DuplicateEntry value) duplicateEntry,
    required TResult Function(ConcurrentSession value) concurrentSession,
  }) {
    return duplicateEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VersionMismatch value)? versionMismatch,
    TResult? Function(DuplicateEntry value)? duplicateEntry,
    TResult? Function(ConcurrentSession value)? concurrentSession,
  }) {
    return duplicateEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VersionMismatch value)? versionMismatch,
    TResult Function(DuplicateEntry value)? duplicateEntry,
    TResult Function(ConcurrentSession value)? concurrentSession,
    required TResult orElse(),
  }) {
    if (duplicateEntry != null) {
      return duplicateEntry(this);
    }
    return orElse();
  }
}

abstract class DuplicateEntry extends ConflictFailure {
  const factory DuplicateEntry({
    required final String field,
    final String message,
    final String? requestId,
  }) = _$DuplicateEntryImpl;
  const DuplicateEntry._() : super._();

  String get field;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DuplicateEntryImplCopyWith<_$DuplicateEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConcurrentSessionImplCopyWith<$Res>
    implements $ConflictFailureCopyWith<$Res> {
  factory _$$ConcurrentSessionImplCopyWith(
    _$ConcurrentSessionImpl value,
    $Res Function(_$ConcurrentSessionImpl) then,
  ) = __$$ConcurrentSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ConcurrentSessionImplCopyWithImpl<$Res>
    extends _$ConflictFailureCopyWithImpl<$Res, _$ConcurrentSessionImpl>
    implements _$$ConcurrentSessionImplCopyWith<$Res> {
  __$$ConcurrentSessionImplCopyWithImpl(
    _$ConcurrentSessionImpl _value,
    $Res Function(_$ConcurrentSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ConcurrentSessionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ConcurrentSessionImpl extends ConcurrentSession {
  const _$ConcurrentSessionImpl({
    this.message = 'Logged in on another device',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ConflictFailure.concurrentSession(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConcurrentSessionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConcurrentSessionImplCopyWith<_$ConcurrentSessionImpl> get copyWith =>
      __$$ConcurrentSessionImplCopyWithImpl<_$ConcurrentSessionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int serverVersion,
      String message,
      String? requestId,
    )
    versionMismatch,
    required TResult Function(String field, String message, String? requestId)
    duplicateEntry,
    required TResult Function(String message, String? requestId)
    concurrentSession,
  }) {
    return concurrentSession(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult? Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult? Function(String message, String? requestId)? concurrentSession,
  }) {
    return concurrentSession?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int serverVersion, String message, String? requestId)?
    versionMismatch,
    TResult Function(String field, String message, String? requestId)?
    duplicateEntry,
    TResult Function(String message, String? requestId)? concurrentSession,
    required TResult orElse(),
  }) {
    if (concurrentSession != null) {
      return concurrentSession(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VersionMismatch value) versionMismatch,
    required TResult Function(DuplicateEntry value) duplicateEntry,
    required TResult Function(ConcurrentSession value) concurrentSession,
  }) {
    return concurrentSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VersionMismatch value)? versionMismatch,
    TResult? Function(DuplicateEntry value)? duplicateEntry,
    TResult? Function(ConcurrentSession value)? concurrentSession,
  }) {
    return concurrentSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VersionMismatch value)? versionMismatch,
    TResult Function(DuplicateEntry value)? duplicateEntry,
    TResult Function(ConcurrentSession value)? concurrentSession,
    required TResult orElse(),
  }) {
    if (concurrentSession != null) {
      return concurrentSession(this);
    }
    return orElse();
  }
}

abstract class ConcurrentSession extends ConflictFailure {
  const factory ConcurrentSession({
    final String message,
    final String? requestId,
  }) = _$ConcurrentSessionImpl;
  const ConcurrentSession._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ConflictFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConcurrentSessionImplCopyWith<_$ConcurrentSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RateLimitFailure {
  Duration get retryAfter => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of RateLimitFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RateLimitFailureCopyWith<RateLimitFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateLimitFailureCopyWith<$Res> {
  factory $RateLimitFailureCopyWith(
    RateLimitFailure value,
    $Res Function(RateLimitFailure) then,
  ) = _$RateLimitFailureCopyWithImpl<$Res, RateLimitFailure>;
  @useResult
  $Res call({Duration retryAfter, String message, String? requestId});
}

/// @nodoc
class _$RateLimitFailureCopyWithImpl<$Res, $Val extends RateLimitFailure>
    implements $RateLimitFailureCopyWith<$Res> {
  _$RateLimitFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RateLimitFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            retryAfter: null == retryAfter
                ? _value.retryAfter
                : retryAfter // ignore: cast_nullable_to_non_nullable
                      as Duration,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RateLimitFailureImplCopyWith<$Res>
    implements $RateLimitFailureCopyWith<$Res> {
  factory _$$RateLimitFailureImplCopyWith(
    _$RateLimitFailureImpl value,
    $Res Function(_$RateLimitFailureImpl) then,
  ) = __$$RateLimitFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration retryAfter, String message, String? requestId});
}

/// @nodoc
class __$$RateLimitFailureImplCopyWithImpl<$Res>
    extends _$RateLimitFailureCopyWithImpl<$Res, _$RateLimitFailureImpl>
    implements _$$RateLimitFailureImplCopyWith<$Res> {
  __$$RateLimitFailureImplCopyWithImpl(
    _$RateLimitFailureImpl _value,
    $Res Function(_$RateLimitFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RateLimitFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$RateLimitFailureImpl(
        retryAfter: null == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as Duration,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RateLimitFailureImpl extends _RateLimitFailure {
  const _$RateLimitFailureImpl({
    required this.retryAfter,
    this.message = 'Too many requests. Please wait.',
    this.requestId,
  }) : super._();

  @override
  final Duration retryAfter;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'RateLimitFailure(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitFailureImpl &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter, message, requestId);

  /// Create a copy of RateLimitFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitFailureImplCopyWith<_$RateLimitFailureImpl> get copyWith =>
      __$$RateLimitFailureImplCopyWithImpl<_$RateLimitFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _RateLimitFailure extends RateLimitFailure {
  const factory _RateLimitFailure({
    required final Duration retryAfter,
    final String message,
    final String? requestId,
  }) = _$RateLimitFailureImpl;
  const _RateLimitFailure._() : super._();

  @override
  Duration get retryAfter;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of RateLimitFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitFailureImplCopyWith<_$RateLimitFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServerFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) internalError,
    required TResult Function(
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    serviceUnavailable,
    required TResult Function(String message, String? requestId) badGateway,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? internalError,
    TResult? Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult? Function(String message, String? requestId)? badGateway,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? internalError,
    TResult Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult Function(String message, String? requestId)? badGateway,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(BadGateway value) badGateway,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(BadGateway value)? badGateway,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(BadGateway value)? badGateway,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerFailureCopyWith<ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
    ServerFailure value,
    $Res Function(ServerFailure) then,
  ) = _$ServerFailureCopyWithImpl<$Res, ServerFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$ServerFailureCopyWithImpl<$Res, $Val extends ServerFailure>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InternalErrorImplCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$InternalErrorImplCopyWith(
    _$InternalErrorImpl value,
    $Res Function(_$InternalErrorImpl) then,
  ) = __$$InternalErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$InternalErrorImplCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$InternalErrorImpl>
    implements _$$InternalErrorImplCopyWith<$Res> {
  __$$InternalErrorImplCopyWithImpl(
    _$InternalErrorImpl _value,
    $Res Function(_$InternalErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$InternalErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InternalErrorImpl extends InternalError {
  const _$InternalErrorImpl({
    this.message = 'Server error. Please try again later.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ServerFailure.internalError(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalErrorImplCopyWith<_$InternalErrorImpl> get copyWith =>
      __$$InternalErrorImplCopyWithImpl<_$InternalErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) internalError,
    required TResult Function(
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    serviceUnavailable,
    required TResult Function(String message, String? requestId) badGateway,
  }) {
    return internalError(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? internalError,
    TResult? Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult? Function(String message, String? requestId)? badGateway,
  }) {
    return internalError?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? internalError,
    TResult Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult Function(String message, String? requestId)? badGateway,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(BadGateway value) badGateway,
  }) {
    return internalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(BadGateway value)? badGateway,
  }) {
    return internalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(BadGateway value)? badGateway,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(this);
    }
    return orElse();
  }
}

abstract class InternalError extends ServerFailure {
  const factory InternalError({final String message, final String? requestId}) =
      _$InternalErrorImpl;
  const InternalError._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternalErrorImplCopyWith<_$InternalErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceUnavailableImplCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$ServiceUnavailableImplCopyWith(
    _$ServiceUnavailableImpl value,
    $Res Function(_$ServiceUnavailableImpl) then,
  ) = __$$ServiceUnavailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration? retryAfter, String message, String? requestId});
}

/// @nodoc
class __$$ServiceUnavailableImplCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$ServiceUnavailableImpl>
    implements _$$ServiceUnavailableImplCopyWith<$Res> {
  __$$ServiceUnavailableImplCopyWithImpl(
    _$ServiceUnavailableImpl _value,
    $Res Function(_$ServiceUnavailableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = freezed,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$ServiceUnavailableImpl(
        retryAfter: freezed == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as Duration?,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServiceUnavailableImpl extends ServiceUnavailable {
  const _$ServiceUnavailableImpl({
    this.retryAfter,
    this.message = 'Service temporarily unavailable',
    this.requestId,
  }) : super._();

  @override
  final Duration? retryAfter;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ServerFailure.serviceUnavailable(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUnavailableImpl &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter, message, requestId);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUnavailableImplCopyWith<_$ServiceUnavailableImpl> get copyWith =>
      __$$ServiceUnavailableImplCopyWithImpl<_$ServiceUnavailableImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) internalError,
    required TResult Function(
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    serviceUnavailable,
    required TResult Function(String message, String? requestId) badGateway,
  }) {
    return serviceUnavailable(retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? internalError,
    TResult? Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult? Function(String message, String? requestId)? badGateway,
  }) {
    return serviceUnavailable?.call(retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? internalError,
    TResult Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult Function(String message, String? requestId)? badGateway,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(retryAfter, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(BadGateway value) badGateway,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(BadGateway value)? badGateway,
  }) {
    return serviceUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(BadGateway value)? badGateway,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class ServiceUnavailable extends ServerFailure {
  const factory ServiceUnavailable({
    final Duration? retryAfter,
    final String message,
    final String? requestId,
  }) = _$ServiceUnavailableImpl;
  const ServiceUnavailable._() : super._();

  Duration? get retryAfter;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceUnavailableImplCopyWith<_$ServiceUnavailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadGatewayImplCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$BadGatewayImplCopyWith(
    _$BadGatewayImpl value,
    $Res Function(_$BadGatewayImpl) then,
  ) = __$$BadGatewayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$BadGatewayImplCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$BadGatewayImpl>
    implements _$$BadGatewayImplCopyWith<$Res> {
  __$$BadGatewayImplCopyWithImpl(
    _$BadGatewayImpl _value,
    $Res Function(_$BadGatewayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$BadGatewayImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BadGatewayImpl extends BadGateway {
  const _$BadGatewayImpl({
    this.message = 'Unable to reach server',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ServerFailure.badGateway(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadGatewayImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadGatewayImplCopyWith<_$BadGatewayImpl> get copyWith =>
      __$$BadGatewayImplCopyWithImpl<_$BadGatewayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) internalError,
    required TResult Function(
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    serviceUnavailable,
    required TResult Function(String message, String? requestId) badGateway,
  }) {
    return badGateway(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? internalError,
    TResult? Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult? Function(String message, String? requestId)? badGateway,
  }) {
    return badGateway?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? internalError,
    TResult Function(Duration? retryAfter, String message, String? requestId)?
    serviceUnavailable,
    TResult Function(String message, String? requestId)? badGateway,
    required TResult orElse(),
  }) {
    if (badGateway != null) {
      return badGateway(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(BadGateway value) badGateway,
  }) {
    return badGateway(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(BadGateway value)? badGateway,
  }) {
    return badGateway?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(BadGateway value)? badGateway,
    required TResult orElse(),
  }) {
    if (badGateway != null) {
      return badGateway(this);
    }
    return orElse();
  }
}

abstract class BadGateway extends ServerFailure {
  const factory BadGateway({final String message, final String? requestId}) =
      _$BadGatewayImpl;
  const BadGateway._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of ServerFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadGatewayImplCopyWith<_$BadGatewayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetworkFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) offline,
    required TResult Function(String message, String? requestId) timeout,
    required TResult Function(
      String? details,
      String message,
      String? requestId,
    )
    connectionError,
    required TResult Function(String message, String? requestId) sslError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? offline,
    TResult? Function(String message, String? requestId)? timeout,
    TResult? Function(String? details, String message, String? requestId)?
    connectionError,
    TResult? Function(String message, String? requestId)? sslError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? offline,
    TResult Function(String message, String? requestId)? timeout,
    TResult Function(String? details, String message, String? requestId)?
    connectionError,
    TResult Function(String message, String? requestId)? sslError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Offline value) offline,
    required TResult Function(Timeout value) timeout,
    required TResult Function(ConnectionError value) connectionError,
    required TResult Function(SslError value) sslError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Offline value)? offline,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(ConnectionError value)? connectionError,
    TResult? Function(SslError value)? sslError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Offline value)? offline,
    TResult Function(Timeout value)? timeout,
    TResult Function(ConnectionError value)? connectionError,
    TResult Function(SslError value)? sslError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkFailureCopyWith<NetworkFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
    NetworkFailure value,
    $Res Function(NetworkFailure) then,
  ) = _$NetworkFailureCopyWithImpl<$Res, NetworkFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res, $Val extends NetworkFailure>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfflineImplCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$$OfflineImplCopyWith(
    _$OfflineImpl value,
    $Res Function(_$OfflineImpl) then,
  ) = __$$OfflineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$OfflineImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$OfflineImpl>
    implements _$$OfflineImplCopyWith<$Res> {
  __$$OfflineImplCopyWithImpl(
    _$OfflineImpl _value,
    $Res Function(_$OfflineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$OfflineImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OfflineImpl extends Offline {
  const _$OfflineImpl({this.message = 'No internet connection', this.requestId})
    : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'NetworkFailure.offline(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      __$$OfflineImplCopyWithImpl<_$OfflineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) offline,
    required TResult Function(String message, String? requestId) timeout,
    required TResult Function(
      String? details,
      String message,
      String? requestId,
    )
    connectionError,
    required TResult Function(String message, String? requestId) sslError,
  }) {
    return offline(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? offline,
    TResult? Function(String message, String? requestId)? timeout,
    TResult? Function(String? details, String message, String? requestId)?
    connectionError,
    TResult? Function(String message, String? requestId)? sslError,
  }) {
    return offline?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? offline,
    TResult Function(String message, String? requestId)? timeout,
    TResult Function(String? details, String message, String? requestId)?
    connectionError,
    TResult Function(String message, String? requestId)? sslError,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Offline value) offline,
    required TResult Function(Timeout value) timeout,
    required TResult Function(ConnectionError value) connectionError,
    required TResult Function(SslError value) sslError,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Offline value)? offline,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(ConnectionError value)? connectionError,
    TResult? Function(SslError value)? sslError,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Offline value)? offline,
    TResult Function(Timeout value)? timeout,
    TResult Function(ConnectionError value)? connectionError,
    TResult Function(SslError value)? sslError,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class Offline extends NetworkFailure {
  const factory Offline({final String message, final String? requestId}) =
      _$OfflineImpl;
  const Offline._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutImplCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$$TimeoutImplCopyWith(
    _$TimeoutImpl value,
    $Res Function(_$TimeoutImpl) then,
  ) = __$$TimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$TimeoutImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$TimeoutImpl>
    implements _$$TimeoutImplCopyWith<$Res> {
  __$$TimeoutImplCopyWithImpl(
    _$TimeoutImpl _value,
    $Res Function(_$TimeoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$TimeoutImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TimeoutImpl extends Timeout {
  const _$TimeoutImpl({this.message = 'Request timed out', this.requestId})
    : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'NetworkFailure.timeout(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      __$$TimeoutImplCopyWithImpl<_$TimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) offline,
    required TResult Function(String message, String? requestId) timeout,
    required TResult Function(
      String? details,
      String message,
      String? requestId,
    )
    connectionError,
    required TResult Function(String message, String? requestId) sslError,
  }) {
    return timeout(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? offline,
    TResult? Function(String message, String? requestId)? timeout,
    TResult? Function(String? details, String message, String? requestId)?
    connectionError,
    TResult? Function(String message, String? requestId)? sslError,
  }) {
    return timeout?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? offline,
    TResult Function(String message, String? requestId)? timeout,
    TResult Function(String? details, String message, String? requestId)?
    connectionError,
    TResult Function(String message, String? requestId)? sslError,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Offline value) offline,
    required TResult Function(Timeout value) timeout,
    required TResult Function(ConnectionError value) connectionError,
    required TResult Function(SslError value) sslError,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Offline value)? offline,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(ConnectionError value)? connectionError,
    TResult? Function(SslError value)? sslError,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Offline value)? offline,
    TResult Function(Timeout value)? timeout,
    TResult Function(ConnectionError value)? connectionError,
    TResult Function(SslError value)? sslError,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class Timeout extends NetworkFailure {
  const factory Timeout({final String message, final String? requestId}) =
      _$TimeoutImpl;
  const Timeout._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionErrorImplCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$$ConnectionErrorImplCopyWith(
    _$ConnectionErrorImpl value,
    $Res Function(_$ConnectionErrorImpl) then,
  ) = __$$ConnectionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? details, String message, String? requestId});
}

/// @nodoc
class __$$ConnectionErrorImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$ConnectionErrorImpl>
    implements _$$ConnectionErrorImplCopyWith<$Res> {
  __$$ConnectionErrorImplCopyWithImpl(
    _$ConnectionErrorImpl _value,
    $Res Function(_$ConnectionErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$ConnectionErrorImpl(
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ConnectionErrorImpl extends ConnectionError {
  const _$ConnectionErrorImpl({
    this.details,
    this.message = 'Connection error',
    this.requestId,
  }) : super._();

  @override
  final String? details;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'NetworkFailure.connectionError(details: $details, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionErrorImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, message, requestId);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionErrorImplCopyWith<_$ConnectionErrorImpl> get copyWith =>
      __$$ConnectionErrorImplCopyWithImpl<_$ConnectionErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) offline,
    required TResult Function(String message, String? requestId) timeout,
    required TResult Function(
      String? details,
      String message,
      String? requestId,
    )
    connectionError,
    required TResult Function(String message, String? requestId) sslError,
  }) {
    return connectionError(details, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? offline,
    TResult? Function(String message, String? requestId)? timeout,
    TResult? Function(String? details, String message, String? requestId)?
    connectionError,
    TResult? Function(String message, String? requestId)? sslError,
  }) {
    return connectionError?.call(details, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? offline,
    TResult Function(String message, String? requestId)? timeout,
    TResult Function(String? details, String message, String? requestId)?
    connectionError,
    TResult Function(String message, String? requestId)? sslError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(details, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Offline value) offline,
    required TResult Function(Timeout value) timeout,
    required TResult Function(ConnectionError value) connectionError,
    required TResult Function(SslError value) sslError,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Offline value)? offline,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(ConnectionError value)? connectionError,
    TResult? Function(SslError value)? sslError,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Offline value)? offline,
    TResult Function(Timeout value)? timeout,
    TResult Function(ConnectionError value)? connectionError,
    TResult Function(SslError value)? sslError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class ConnectionError extends NetworkFailure {
  const factory ConnectionError({
    final String? details,
    final String message,
    final String? requestId,
  }) = _$ConnectionErrorImpl;
  const ConnectionError._() : super._();

  String? get details;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionErrorImplCopyWith<_$ConnectionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SslErrorImplCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$$SslErrorImplCopyWith(
    _$SslErrorImpl value,
    $Res Function(_$SslErrorImpl) then,
  ) = __$$SslErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$SslErrorImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$SslErrorImpl>
    implements _$$SslErrorImplCopyWith<$Res> {
  __$$SslErrorImplCopyWithImpl(
    _$SslErrorImpl _value,
    $Res Function(_$SslErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$SslErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SslErrorImpl extends SslError {
  const _$SslErrorImpl({this.message = 'Security error', this.requestId})
    : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'NetworkFailure.sslError(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SslErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SslErrorImplCopyWith<_$SslErrorImpl> get copyWith =>
      __$$SslErrorImplCopyWithImpl<_$SslErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) offline,
    required TResult Function(String message, String? requestId) timeout,
    required TResult Function(
      String? details,
      String message,
      String? requestId,
    )
    connectionError,
    required TResult Function(String message, String? requestId) sslError,
  }) {
    return sslError(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? offline,
    TResult? Function(String message, String? requestId)? timeout,
    TResult? Function(String? details, String message, String? requestId)?
    connectionError,
    TResult? Function(String message, String? requestId)? sslError,
  }) {
    return sslError?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? offline,
    TResult Function(String message, String? requestId)? timeout,
    TResult Function(String? details, String message, String? requestId)?
    connectionError,
    TResult Function(String message, String? requestId)? sslError,
    required TResult orElse(),
  }) {
    if (sslError != null) {
      return sslError(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Offline value) offline,
    required TResult Function(Timeout value) timeout,
    required TResult Function(ConnectionError value) connectionError,
    required TResult Function(SslError value) sslError,
  }) {
    return sslError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Offline value)? offline,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(ConnectionError value)? connectionError,
    TResult? Function(SslError value)? sslError,
  }) {
    return sslError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Offline value)? offline,
    TResult Function(Timeout value)? timeout,
    TResult Function(ConnectionError value)? connectionError,
    TResult Function(SslError value)? sslError,
    required TResult orElse(),
  }) {
    if (sslError != null) {
      return sslError(this);
    }
    return orElse();
  }
}

abstract class SslError extends NetworkFailure {
  const factory SslError({final String message, final String? requestId}) =
      _$SslErrorImpl;
  const SslError._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SslErrorImplCopyWith<_$SslErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnknownFailure {
  String get message => throw _privateConstructorUsedError;
  Object? get originalError => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of UnknownFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnknownFailureCopyWith<UnknownFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnknownFailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(
    UnknownFailure value,
    $Res Function(UnknownFailure) then,
  ) = _$UnknownFailureCopyWithImpl<$Res, UnknownFailure>;
  @useResult
  $Res call({String message, Object? originalError, String? requestId});
}

/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res, $Val extends UnknownFailure>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnknownFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? originalError = freezed,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            originalError: freezed == originalError
                ? _value.originalError
                : originalError,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError, String? requestId});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$UnknownFailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnknownFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? originalError = freezed,
    Object? requestId = freezed,
  }) {
    return _then(
      _$UnknownFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl extends _UnknownFailure {
  const _$UnknownFailureImpl({
    required this.message,
    this.originalError,
    this.requestId,
  }) : super._();

  @override
  final String message;
  @override
  final Object? originalError;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'UnknownFailure(message: $message, originalError: $originalError, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
    requestId,
  );

  /// Create a copy of UnknownFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _UnknownFailure extends UnknownFailure {
  const factory _UnknownFailure({
    required final String message,
    final Object? originalError,
    final String? requestId,
  }) = _$UnknownFailureImpl;
  const _UnknownFailure._() : super._();

  @override
  String get message;
  @override
  Object? get originalError;
  @override
  String? get requestId;

  /// Create a copy of UnknownFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteBlockedFailure {
  String get blockedRouteId => throw _privateConstructorUsedError;
  DateTime get blockedRouteDate => throw _privateConstructorUsedError;
  String get blockedRouteStatus => throw _privateConstructorUsedError;
  bool get requiresSupervisorOverride => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of RouteBlockedFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteBlockedFailureCopyWith<RouteBlockedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteBlockedFailureCopyWith<$Res> {
  factory $RouteBlockedFailureCopyWith(
    RouteBlockedFailure value,
    $Res Function(RouteBlockedFailure) then,
  ) = _$RouteBlockedFailureCopyWithImpl<$Res, RouteBlockedFailure>;
  @useResult
  $Res call({
    String blockedRouteId,
    DateTime blockedRouteDate,
    String blockedRouteStatus,
    bool requiresSupervisorOverride,
    String message,
    String? requestId,
  });
}

/// @nodoc
class _$RouteBlockedFailureCopyWithImpl<$Res, $Val extends RouteBlockedFailure>
    implements $RouteBlockedFailureCopyWith<$Res> {
  _$RouteBlockedFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteBlockedFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedRouteId = null,
    Object? blockedRouteDate = null,
    Object? blockedRouteStatus = null,
    Object? requiresSupervisorOverride = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            blockedRouteId: null == blockedRouteId
                ? _value.blockedRouteId
                : blockedRouteId // ignore: cast_nullable_to_non_nullable
                      as String,
            blockedRouteDate: null == blockedRouteDate
                ? _value.blockedRouteDate
                : blockedRouteDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            blockedRouteStatus: null == blockedRouteStatus
                ? _value.blockedRouteStatus
                : blockedRouteStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            requiresSupervisorOverride: null == requiresSupervisorOverride
                ? _value.requiresSupervisorOverride
                : requiresSupervisorOverride // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteBlockedFailureImplCopyWith<$Res>
    implements $RouteBlockedFailureCopyWith<$Res> {
  factory _$$RouteBlockedFailureImplCopyWith(
    _$RouteBlockedFailureImpl value,
    $Res Function(_$RouteBlockedFailureImpl) then,
  ) = __$$RouteBlockedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String blockedRouteId,
    DateTime blockedRouteDate,
    String blockedRouteStatus,
    bool requiresSupervisorOverride,
    String message,
    String? requestId,
  });
}

/// @nodoc
class __$$RouteBlockedFailureImplCopyWithImpl<$Res>
    extends _$RouteBlockedFailureCopyWithImpl<$Res, _$RouteBlockedFailureImpl>
    implements _$$RouteBlockedFailureImplCopyWith<$Res> {
  __$$RouteBlockedFailureImplCopyWithImpl(
    _$RouteBlockedFailureImpl _value,
    $Res Function(_$RouteBlockedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteBlockedFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedRouteId = null,
    Object? blockedRouteDate = null,
    Object? blockedRouteStatus = null,
    Object? requiresSupervisorOverride = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$RouteBlockedFailureImpl(
        blockedRouteId: null == blockedRouteId
            ? _value.blockedRouteId
            : blockedRouteId // ignore: cast_nullable_to_non_nullable
                  as String,
        blockedRouteDate: null == blockedRouteDate
            ? _value.blockedRouteDate
            : blockedRouteDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        blockedRouteStatus: null == blockedRouteStatus
            ? _value.blockedRouteStatus
            : blockedRouteStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        requiresSupervisorOverride: null == requiresSupervisorOverride
            ? _value.requiresSupervisorOverride
            : requiresSupervisorOverride // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RouteBlockedFailureImpl extends _RouteBlockedFailure {
  const _$RouteBlockedFailureImpl({
    required this.blockedRouteId,
    required this.blockedRouteDate,
    required this.blockedRouteStatus,
    this.requiresSupervisorOverride = true,
    this.message = 'You have an unclosed route from a previous day',
    this.requestId,
  }) : super._();

  @override
  final String blockedRouteId;
  @override
  final DateTime blockedRouteDate;
  @override
  final String blockedRouteStatus;
  @override
  @JsonKey()
  final bool requiresSupervisorOverride;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'RouteBlockedFailure(blockedRouteId: $blockedRouteId, blockedRouteDate: $blockedRouteDate, blockedRouteStatus: $blockedRouteStatus, requiresSupervisorOverride: $requiresSupervisorOverride, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteBlockedFailureImpl &&
            (identical(other.blockedRouteId, blockedRouteId) ||
                other.blockedRouteId == blockedRouteId) &&
            (identical(other.blockedRouteDate, blockedRouteDate) ||
                other.blockedRouteDate == blockedRouteDate) &&
            (identical(other.blockedRouteStatus, blockedRouteStatus) ||
                other.blockedRouteStatus == blockedRouteStatus) &&
            (identical(
                  other.requiresSupervisorOverride,
                  requiresSupervisorOverride,
                ) ||
                other.requiresSupervisorOverride ==
                    requiresSupervisorOverride) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    blockedRouteId,
    blockedRouteDate,
    blockedRouteStatus,
    requiresSupervisorOverride,
    message,
    requestId,
  );

  /// Create a copy of RouteBlockedFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteBlockedFailureImplCopyWith<_$RouteBlockedFailureImpl> get copyWith =>
      __$$RouteBlockedFailureImplCopyWithImpl<_$RouteBlockedFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _RouteBlockedFailure extends RouteBlockedFailure {
  const factory _RouteBlockedFailure({
    required final String blockedRouteId,
    required final DateTime blockedRouteDate,
    required final String blockedRouteStatus,
    final bool requiresSupervisorOverride,
    final String message,
    final String? requestId,
  }) = _$RouteBlockedFailureImpl;
  const _RouteBlockedFailure._() : super._();

  @override
  String get blockedRouteId;
  @override
  DateTime get blockedRouteDate;
  @override
  String get blockedRouteStatus;
  @override
  bool get requiresSupervisorOverride;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of RouteBlockedFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteBlockedFailureImplCopyWith<_$RouteBlockedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GeofenceViolationFailure {
  double get userLatitude => throw _privateConstructorUsedError;
  double get userLongitude => throw _privateConstructorUsedError;
  double get outletLatitude => throw _privateConstructorUsedError;
  double get outletLongitude => throw _privateConstructorUsedError;
  double get distanceMeters => throw _privateConstructorUsedError;
  double get requiredRadiusMeters => throw _privateConstructorUsedError;
  bool get canRequestOverride => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of GeofenceViolationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeofenceViolationFailureCopyWith<GeofenceViolationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeofenceViolationFailureCopyWith<$Res> {
  factory $GeofenceViolationFailureCopyWith(
    GeofenceViolationFailure value,
    $Res Function(GeofenceViolationFailure) then,
  ) = _$GeofenceViolationFailureCopyWithImpl<$Res, GeofenceViolationFailure>;
  @useResult
  $Res call({
    double userLatitude,
    double userLongitude,
    double outletLatitude,
    double outletLongitude,
    double distanceMeters,
    double requiredRadiusMeters,
    bool canRequestOverride,
    String? requestId,
  });
}

/// @nodoc
class _$GeofenceViolationFailureCopyWithImpl<
  $Res,
  $Val extends GeofenceViolationFailure
>
    implements $GeofenceViolationFailureCopyWith<$Res> {
  _$GeofenceViolationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeofenceViolationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLatitude = null,
    Object? userLongitude = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? distanceMeters = null,
    Object? requiredRadiusMeters = null,
    Object? canRequestOverride = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            userLatitude: null == userLatitude
                ? _value.userLatitude
                : userLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            userLongitude: null == userLongitude
                ? _value.userLongitude
                : userLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            outletLatitude: null == outletLatitude
                ? _value.outletLatitude
                : outletLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            outletLongitude: null == outletLongitude
                ? _value.outletLongitude
                : outletLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            distanceMeters: null == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            requiredRadiusMeters: null == requiredRadiusMeters
                ? _value.requiredRadiusMeters
                : requiredRadiusMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            canRequestOverride: null == canRequestOverride
                ? _value.canRequestOverride
                : canRequestOverride // ignore: cast_nullable_to_non_nullable
                      as bool,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeofenceViolationFailureImplCopyWith<$Res>
    implements $GeofenceViolationFailureCopyWith<$Res> {
  factory _$$GeofenceViolationFailureImplCopyWith(
    _$GeofenceViolationFailureImpl value,
    $Res Function(_$GeofenceViolationFailureImpl) then,
  ) = __$$GeofenceViolationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double userLatitude,
    double userLongitude,
    double outletLatitude,
    double outletLongitude,
    double distanceMeters,
    double requiredRadiusMeters,
    bool canRequestOverride,
    String? requestId,
  });
}

/// @nodoc
class __$$GeofenceViolationFailureImplCopyWithImpl<$Res>
    extends
        _$GeofenceViolationFailureCopyWithImpl<
          $Res,
          _$GeofenceViolationFailureImpl
        >
    implements _$$GeofenceViolationFailureImplCopyWith<$Res> {
  __$$GeofenceViolationFailureImplCopyWithImpl(
    _$GeofenceViolationFailureImpl _value,
    $Res Function(_$GeofenceViolationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeofenceViolationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLatitude = null,
    Object? userLongitude = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? distanceMeters = null,
    Object? requiredRadiusMeters = null,
    Object? canRequestOverride = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$GeofenceViolationFailureImpl(
        userLatitude: null == userLatitude
            ? _value.userLatitude
            : userLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        userLongitude: null == userLongitude
            ? _value.userLongitude
            : userLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        outletLatitude: null == outletLatitude
            ? _value.outletLatitude
            : outletLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        outletLongitude: null == outletLongitude
            ? _value.outletLongitude
            : outletLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceMeters: null == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        requiredRadiusMeters: null == requiredRadiusMeters
            ? _value.requiredRadiusMeters
            : requiredRadiusMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        canRequestOverride: null == canRequestOverride
            ? _value.canRequestOverride
            : canRequestOverride // ignore: cast_nullable_to_non_nullable
                  as bool,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$GeofenceViolationFailureImpl extends _GeofenceViolationFailure {
  const _$GeofenceViolationFailureImpl({
    required this.userLatitude,
    required this.userLongitude,
    required this.outletLatitude,
    required this.outletLongitude,
    required this.distanceMeters,
    required this.requiredRadiusMeters,
    this.canRequestOverride = true,
    this.requestId,
  }) : super._();

  @override
  final double userLatitude;
  @override
  final double userLongitude;
  @override
  final double outletLatitude;
  @override
  final double outletLongitude;
  @override
  final double distanceMeters;
  @override
  final double requiredRadiusMeters;
  @override
  @JsonKey()
  final bool canRequestOverride;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'GeofenceViolationFailure(userLatitude: $userLatitude, userLongitude: $userLongitude, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, distanceMeters: $distanceMeters, requiredRadiusMeters: $requiredRadiusMeters, canRequestOverride: $canRequestOverride, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceViolationFailureImpl &&
            (identical(other.userLatitude, userLatitude) ||
                other.userLatitude == userLatitude) &&
            (identical(other.userLongitude, userLongitude) ||
                other.userLongitude == userLongitude) &&
            (identical(other.outletLatitude, outletLatitude) ||
                other.outletLatitude == outletLatitude) &&
            (identical(other.outletLongitude, outletLongitude) ||
                other.outletLongitude == outletLongitude) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.requiredRadiusMeters, requiredRadiusMeters) ||
                other.requiredRadiusMeters == requiredRadiusMeters) &&
            (identical(other.canRequestOverride, canRequestOverride) ||
                other.canRequestOverride == canRequestOverride) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userLatitude,
    userLongitude,
    outletLatitude,
    outletLongitude,
    distanceMeters,
    requiredRadiusMeters,
    canRequestOverride,
    requestId,
  );

  /// Create a copy of GeofenceViolationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceViolationFailureImplCopyWith<_$GeofenceViolationFailureImpl>
  get copyWith =>
      __$$GeofenceViolationFailureImplCopyWithImpl<
        _$GeofenceViolationFailureImpl
      >(this, _$identity);
}

abstract class _GeofenceViolationFailure extends GeofenceViolationFailure {
  const factory _GeofenceViolationFailure({
    required final double userLatitude,
    required final double userLongitude,
    required final double outletLatitude,
    required final double outletLongitude,
    required final double distanceMeters,
    required final double requiredRadiusMeters,
    final bool canRequestOverride,
    final String? requestId,
  }) = _$GeofenceViolationFailureImpl;
  const _GeofenceViolationFailure._() : super._();

  @override
  double get userLatitude;
  @override
  double get userLongitude;
  @override
  double get outletLatitude;
  @override
  double get outletLongitude;
  @override
  double get distanceMeters;
  @override
  double get requiredRadiusMeters;
  @override
  bool get canRequestOverride;
  @override
  String? get requestId;

  /// Create a copy of GeofenceViolationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeofenceViolationFailureImplCopyWith<_$GeofenceViolationFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GpsAccuracyFailure {
  double get currentAccuracy => throw _privateConstructorUsedError;
  double get requiredAccuracy => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of GpsAccuracyFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GpsAccuracyFailureCopyWith<GpsAccuracyFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpsAccuracyFailureCopyWith<$Res> {
  factory $GpsAccuracyFailureCopyWith(
    GpsAccuracyFailure value,
    $Res Function(GpsAccuracyFailure) then,
  ) = _$GpsAccuracyFailureCopyWithImpl<$Res, GpsAccuracyFailure>;
  @useResult
  $Res call({
    double currentAccuracy,
    double requiredAccuracy,
    String? requestId,
  });
}

/// @nodoc
class _$GpsAccuracyFailureCopyWithImpl<$Res, $Val extends GpsAccuracyFailure>
    implements $GpsAccuracyFailureCopyWith<$Res> {
  _$GpsAccuracyFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GpsAccuracyFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAccuracy = null,
    Object? requiredAccuracy = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentAccuracy: null == currentAccuracy
                ? _value.currentAccuracy
                : currentAccuracy // ignore: cast_nullable_to_non_nullable
                      as double,
            requiredAccuracy: null == requiredAccuracy
                ? _value.requiredAccuracy
                : requiredAccuracy // ignore: cast_nullable_to_non_nullable
                      as double,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GpsAccuracyFailureImplCopyWith<$Res>
    implements $GpsAccuracyFailureCopyWith<$Res> {
  factory _$$GpsAccuracyFailureImplCopyWith(
    _$GpsAccuracyFailureImpl value,
    $Res Function(_$GpsAccuracyFailureImpl) then,
  ) = __$$GpsAccuracyFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double currentAccuracy,
    double requiredAccuracy,
    String? requestId,
  });
}

/// @nodoc
class __$$GpsAccuracyFailureImplCopyWithImpl<$Res>
    extends _$GpsAccuracyFailureCopyWithImpl<$Res, _$GpsAccuracyFailureImpl>
    implements _$$GpsAccuracyFailureImplCopyWith<$Res> {
  __$$GpsAccuracyFailureImplCopyWithImpl(
    _$GpsAccuracyFailureImpl _value,
    $Res Function(_$GpsAccuracyFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GpsAccuracyFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAccuracy = null,
    Object? requiredAccuracy = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$GpsAccuracyFailureImpl(
        currentAccuracy: null == currentAccuracy
            ? _value.currentAccuracy
            : currentAccuracy // ignore: cast_nullable_to_non_nullable
                  as double,
        requiredAccuracy: null == requiredAccuracy
            ? _value.requiredAccuracy
            : requiredAccuracy // ignore: cast_nullable_to_non_nullable
                  as double,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$GpsAccuracyFailureImpl extends _GpsAccuracyFailure {
  const _$GpsAccuracyFailureImpl({
    required this.currentAccuracy,
    this.requiredAccuracy = 200.0,
    this.requestId,
  }) : super._();

  @override
  final double currentAccuracy;
  @override
  @JsonKey()
  final double requiredAccuracy;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'GpsAccuracyFailure(currentAccuracy: $currentAccuracy, requiredAccuracy: $requiredAccuracy, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsAccuracyFailureImpl &&
            (identical(other.currentAccuracy, currentAccuracy) ||
                other.currentAccuracy == currentAccuracy) &&
            (identical(other.requiredAccuracy, requiredAccuracy) ||
                other.requiredAccuracy == requiredAccuracy) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentAccuracy, requiredAccuracy, requestId);

  /// Create a copy of GpsAccuracyFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsAccuracyFailureImplCopyWith<_$GpsAccuracyFailureImpl> get copyWith =>
      __$$GpsAccuracyFailureImplCopyWithImpl<_$GpsAccuracyFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _GpsAccuracyFailure extends GpsAccuracyFailure {
  const factory _GpsAccuracyFailure({
    required final double currentAccuracy,
    final double requiredAccuracy,
    final String? requestId,
  }) = _$GpsAccuracyFailureImpl;
  const _GpsAccuracyFailure._() : super._();

  @override
  double get currentAccuracy;
  @override
  double get requiredAccuracy;
  @override
  String? get requestId;

  /// Create a copy of GpsAccuracyFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GpsAccuracyFailureImplCopyWith<_$GpsAccuracyFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VisitInProgressFailure {
  String get activeVisitLocalId => throw _privateConstructorUsedError;
  String get activeOutletName => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of VisitInProgressFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitInProgressFailureCopyWith<VisitInProgressFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitInProgressFailureCopyWith<$Res> {
  factory $VisitInProgressFailureCopyWith(
    VisitInProgressFailure value,
    $Res Function(VisitInProgressFailure) then,
  ) = _$VisitInProgressFailureCopyWithImpl<$Res, VisitInProgressFailure>;
  @useResult
  $Res call({
    String activeVisitLocalId,
    String activeOutletName,
    String? requestId,
  });
}

/// @nodoc
class _$VisitInProgressFailureCopyWithImpl<
  $Res,
  $Val extends VisitInProgressFailure
>
    implements $VisitInProgressFailureCopyWith<$Res> {
  _$VisitInProgressFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitInProgressFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeVisitLocalId = null,
    Object? activeOutletName = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            activeVisitLocalId: null == activeVisitLocalId
                ? _value.activeVisitLocalId
                : activeVisitLocalId // ignore: cast_nullable_to_non_nullable
                      as String,
            activeOutletName: null == activeOutletName
                ? _value.activeOutletName
                : activeOutletName // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisitInProgressFailureImplCopyWith<$Res>
    implements $VisitInProgressFailureCopyWith<$Res> {
  factory _$$VisitInProgressFailureImplCopyWith(
    _$VisitInProgressFailureImpl value,
    $Res Function(_$VisitInProgressFailureImpl) then,
  ) = __$$VisitInProgressFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String activeVisitLocalId,
    String activeOutletName,
    String? requestId,
  });
}

/// @nodoc
class __$$VisitInProgressFailureImplCopyWithImpl<$Res>
    extends
        _$VisitInProgressFailureCopyWithImpl<$Res, _$VisitInProgressFailureImpl>
    implements _$$VisitInProgressFailureImplCopyWith<$Res> {
  __$$VisitInProgressFailureImplCopyWithImpl(
    _$VisitInProgressFailureImpl _value,
    $Res Function(_$VisitInProgressFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitInProgressFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeVisitLocalId = null,
    Object? activeOutletName = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$VisitInProgressFailureImpl(
        activeVisitLocalId: null == activeVisitLocalId
            ? _value.activeVisitLocalId
            : activeVisitLocalId // ignore: cast_nullable_to_non_nullable
                  as String,
        activeOutletName: null == activeOutletName
            ? _value.activeOutletName
            : activeOutletName // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VisitInProgressFailureImpl extends _VisitInProgressFailure {
  const _$VisitInProgressFailureImpl({
    required this.activeVisitLocalId,
    required this.activeOutletName,
    this.requestId,
  }) : super._();

  @override
  final String activeVisitLocalId;
  @override
  final String activeOutletName;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'VisitInProgressFailure(activeVisitLocalId: $activeVisitLocalId, activeOutletName: $activeOutletName, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitInProgressFailureImpl &&
            (identical(other.activeVisitLocalId, activeVisitLocalId) ||
                other.activeVisitLocalId == activeVisitLocalId) &&
            (identical(other.activeOutletName, activeOutletName) ||
                other.activeOutletName == activeOutletName) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activeVisitLocalId, activeOutletName, requestId);

  /// Create a copy of VisitInProgressFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitInProgressFailureImplCopyWith<_$VisitInProgressFailureImpl>
  get copyWith =>
      __$$VisitInProgressFailureImplCopyWithImpl<_$VisitInProgressFailureImpl>(
        this,
        _$identity,
      );
}

abstract class _VisitInProgressFailure extends VisitInProgressFailure {
  const factory _VisitInProgressFailure({
    required final String activeVisitLocalId,
    required final String activeOutletName,
    final String? requestId,
  }) = _$VisitInProgressFailureImpl;
  const _VisitInProgressFailure._() : super._();

  @override
  String get activeVisitLocalId;
  @override
  String get activeOutletName;
  @override
  String? get requestId;

  /// Create a copy of VisitInProgressFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitInProgressFailureImplCopyWith<_$VisitInProgressFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvalidVisitStateFailure {
  String get currentStatus => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of InvalidVisitStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvalidVisitStateFailureCopyWith<InvalidVisitStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidVisitStateFailureCopyWith<$Res> {
  factory $InvalidVisitStateFailureCopyWith(
    InvalidVisitStateFailure value,
    $Res Function(InvalidVisitStateFailure) then,
  ) = _$InvalidVisitStateFailureCopyWithImpl<$Res, InvalidVisitStateFailure>;
  @useResult
  $Res call({String currentStatus, String operation, String? requestId});
}

/// @nodoc
class _$InvalidVisitStateFailureCopyWithImpl<
  $Res,
  $Val extends InvalidVisitStateFailure
>
    implements $InvalidVisitStateFailureCopyWith<$Res> {
  _$InvalidVisitStateFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvalidVisitStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? operation = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStatus: null == currentStatus
                ? _value.currentStatus
                : currentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            operation: null == operation
                ? _value.operation
                : operation // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvalidVisitStateFailureImplCopyWith<$Res>
    implements $InvalidVisitStateFailureCopyWith<$Res> {
  factory _$$InvalidVisitStateFailureImplCopyWith(
    _$InvalidVisitStateFailureImpl value,
    $Res Function(_$InvalidVisitStateFailureImpl) then,
  ) = __$$InvalidVisitStateFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentStatus, String operation, String? requestId});
}

/// @nodoc
class __$$InvalidVisitStateFailureImplCopyWithImpl<$Res>
    extends
        _$InvalidVisitStateFailureCopyWithImpl<
          $Res,
          _$InvalidVisitStateFailureImpl
        >
    implements _$$InvalidVisitStateFailureImplCopyWith<$Res> {
  __$$InvalidVisitStateFailureImplCopyWithImpl(
    _$InvalidVisitStateFailureImpl _value,
    $Res Function(_$InvalidVisitStateFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvalidVisitStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? operation = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$InvalidVisitStateFailureImpl(
        currentStatus: null == currentStatus
            ? _value.currentStatus
            : currentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        operation: null == operation
            ? _value.operation
            : operation // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InvalidVisitStateFailureImpl extends _InvalidVisitStateFailure {
  const _$InvalidVisitStateFailureImpl({
    required this.currentStatus,
    required this.operation,
    this.requestId,
  }) : super._();

  @override
  final String currentStatus;
  @override
  final String operation;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'InvalidVisitStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidVisitStateFailureImpl &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentStatus, operation, requestId);

  /// Create a copy of InvalidVisitStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidVisitStateFailureImplCopyWith<_$InvalidVisitStateFailureImpl>
  get copyWith =>
      __$$InvalidVisitStateFailureImplCopyWithImpl<
        _$InvalidVisitStateFailureImpl
      >(this, _$identity);
}

abstract class _InvalidVisitStateFailure extends InvalidVisitStateFailure {
  const factory _InvalidVisitStateFailure({
    required final String currentStatus,
    required final String operation,
    final String? requestId,
  }) = _$InvalidVisitStateFailureImpl;
  const _InvalidVisitStateFailure._() : super._();

  @override
  String get currentStatus;
  @override
  String get operation;
  @override
  String? get requestId;

  /// Create a copy of InvalidVisitStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidVisitStateFailureImplCopyWith<_$InvalidVisitStateFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvalidRouteStateFailure {
  String get currentStatus => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of InvalidRouteStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvalidRouteStateFailureCopyWith<InvalidRouteStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidRouteStateFailureCopyWith<$Res> {
  factory $InvalidRouteStateFailureCopyWith(
    InvalidRouteStateFailure value,
    $Res Function(InvalidRouteStateFailure) then,
  ) = _$InvalidRouteStateFailureCopyWithImpl<$Res, InvalidRouteStateFailure>;
  @useResult
  $Res call({String currentStatus, String operation, String? requestId});
}

/// @nodoc
class _$InvalidRouteStateFailureCopyWithImpl<
  $Res,
  $Val extends InvalidRouteStateFailure
>
    implements $InvalidRouteStateFailureCopyWith<$Res> {
  _$InvalidRouteStateFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvalidRouteStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? operation = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStatus: null == currentStatus
                ? _value.currentStatus
                : currentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            operation: null == operation
                ? _value.operation
                : operation // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvalidRouteStateFailureImplCopyWith<$Res>
    implements $InvalidRouteStateFailureCopyWith<$Res> {
  factory _$$InvalidRouteStateFailureImplCopyWith(
    _$InvalidRouteStateFailureImpl value,
    $Res Function(_$InvalidRouteStateFailureImpl) then,
  ) = __$$InvalidRouteStateFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentStatus, String operation, String? requestId});
}

/// @nodoc
class __$$InvalidRouteStateFailureImplCopyWithImpl<$Res>
    extends
        _$InvalidRouteStateFailureCopyWithImpl<
          $Res,
          _$InvalidRouteStateFailureImpl
        >
    implements _$$InvalidRouteStateFailureImplCopyWith<$Res> {
  __$$InvalidRouteStateFailureImplCopyWithImpl(
    _$InvalidRouteStateFailureImpl _value,
    $Res Function(_$InvalidRouteStateFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvalidRouteStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? operation = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$InvalidRouteStateFailureImpl(
        currentStatus: null == currentStatus
            ? _value.currentStatus
            : currentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        operation: null == operation
            ? _value.operation
            : operation // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InvalidRouteStateFailureImpl extends _InvalidRouteStateFailure {
  const _$InvalidRouteStateFailureImpl({
    required this.currentStatus,
    required this.operation,
    this.requestId,
  }) : super._();

  @override
  final String currentStatus;
  @override
  final String operation;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'InvalidRouteStateFailure(currentStatus: $currentStatus, operation: $operation, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidRouteStateFailureImpl &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentStatus, operation, requestId);

  /// Create a copy of InvalidRouteStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidRouteStateFailureImplCopyWith<_$InvalidRouteStateFailureImpl>
  get copyWith =>
      __$$InvalidRouteStateFailureImplCopyWithImpl<
        _$InvalidRouteStateFailureImpl
      >(this, _$identity);
}

abstract class _InvalidRouteStateFailure extends InvalidRouteStateFailure {
  const factory _InvalidRouteStateFailure({
    required final String currentStatus,
    required final String operation,
    final String? requestId,
  }) = _$InvalidRouteStateFailureImpl;
  const _InvalidRouteStateFailure._() : super._();

  @override
  String get currentStatus;
  @override
  String get operation;
  @override
  String? get requestId;

  /// Create a copy of InvalidRouteStateFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidRouteStateFailureImplCopyWith<_$InvalidRouteStateFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BiometricVerificationFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricVerificationFailureCopyWith<BiometricVerificationFailure>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricVerificationFailureCopyWith<$Res> {
  factory $BiometricVerificationFailureCopyWith(
    BiometricVerificationFailure value,
    $Res Function(BiometricVerificationFailure) then,
  ) =
      _$BiometricVerificationFailureCopyWithImpl<
        $Res,
        BiometricVerificationFailure
      >;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$BiometricVerificationFailureCopyWithImpl<
  $Res,
  $Val extends BiometricVerificationFailure
>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  _$BiometricVerificationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FaceNotMatchedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$FaceNotMatchedImplCopyWith(
    _$FaceNotMatchedImpl value,
    $Res Function(_$FaceNotMatchedImpl) then,
  ) = __$$FaceNotMatchedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$FaceNotMatchedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$FaceNotMatchedImpl>
    implements _$$FaceNotMatchedImplCopyWith<$Res> {
  __$$FaceNotMatchedImplCopyWithImpl(
    _$FaceNotMatchedImpl _value,
    $Res Function(_$FaceNotMatchedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$FaceNotMatchedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FaceNotMatchedImpl extends FaceNotMatched {
  const _$FaceNotMatchedImpl({
    this.message = 'We could not verify your face. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.faceNotMatched(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceNotMatchedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceNotMatchedImplCopyWith<_$FaceNotMatchedImpl> get copyWith =>
      __$$FaceNotMatchedImplCopyWithImpl<_$FaceNotMatchedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return faceNotMatched(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return faceNotMatched?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (faceNotMatched != null) {
      return faceNotMatched(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return faceNotMatched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return faceNotMatched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (faceNotMatched != null) {
      return faceNotMatched(this);
    }
    return orElse();
  }
}

abstract class FaceNotMatched extends BiometricVerificationFailure {
  const factory FaceNotMatched({
    final String message,
    final String? requestId,
  }) = _$FaceNotMatchedImpl;
  const FaceNotMatched._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaceNotMatchedImplCopyWith<_$FaceNotMatchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChallengeExpiredImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ChallengeExpiredImplCopyWith(
    _$ChallengeExpiredImpl value,
    $Res Function(_$ChallengeExpiredImpl) then,
  ) = __$$ChallengeExpiredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ChallengeExpiredImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ChallengeExpiredImpl>
    implements _$$ChallengeExpiredImplCopyWith<$Res> {
  __$$ChallengeExpiredImplCopyWithImpl(
    _$ChallengeExpiredImpl _value,
    $Res Function(_$ChallengeExpiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ChallengeExpiredImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChallengeExpiredImpl extends ChallengeExpired {
  const _$ChallengeExpiredImpl({
    this.message = 'Liveness check expired. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.challengeExpired(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeExpiredImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeExpiredImplCopyWith<_$ChallengeExpiredImpl> get copyWith =>
      __$$ChallengeExpiredImplCopyWithImpl<_$ChallengeExpiredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return challengeExpired(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return challengeExpired?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeExpired != null) {
      return challengeExpired(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return challengeExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return challengeExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeExpired != null) {
      return challengeExpired(this);
    }
    return orElse();
  }
}

abstract class ChallengeExpired extends BiometricVerificationFailure {
  const factory ChallengeExpired({
    final String message,
    final String? requestId,
  }) = _$ChallengeExpiredImpl;
  const ChallengeExpired._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeExpiredImplCopyWith<_$ChallengeExpiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotEnrolledImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$NotEnrolledImplCopyWith(
    _$NotEnrolledImpl value,
    $Res Function(_$NotEnrolledImpl) then,
  ) = __$$NotEnrolledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$NotEnrolledImplCopyWithImpl<$Res>
    extends _$BiometricVerificationFailureCopyWithImpl<$Res, _$NotEnrolledImpl>
    implements _$$NotEnrolledImplCopyWith<$Res> {
  __$$NotEnrolledImplCopyWithImpl(
    _$NotEnrolledImpl _value,
    $Res Function(_$NotEnrolledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$NotEnrolledImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NotEnrolledImpl extends NotEnrolled {
  const _$NotEnrolledImpl({
    this.message = 'Face not registered for this account',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.notEnrolled(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotEnrolledImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotEnrolledImplCopyWith<_$NotEnrolledImpl> get copyWith =>
      __$$NotEnrolledImplCopyWithImpl<_$NotEnrolledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return notEnrolled(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return notEnrolled?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (notEnrolled != null) {
      return notEnrolled(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return notEnrolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return notEnrolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (notEnrolled != null) {
      return notEnrolled(this);
    }
    return orElse();
  }
}

abstract class NotEnrolled extends BiometricVerificationFailure {
  const factory NotEnrolled({final String message, final String? requestId}) =
      _$NotEnrolledImpl;
  const NotEnrolled._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotEnrolledImplCopyWith<_$NotEnrolledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoProfileImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$NoProfileImplCopyWith(
    _$NoProfileImpl value,
    $Res Function(_$NoProfileImpl) then,
  ) = __$$NoProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$NoProfileImplCopyWithImpl<$Res>
    extends _$BiometricVerificationFailureCopyWithImpl<$Res, _$NoProfileImpl>
    implements _$$NoProfileImplCopyWith<$Res> {
  __$$NoProfileImplCopyWithImpl(
    _$NoProfileImpl _value,
    $Res Function(_$NoProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$NoProfileImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NoProfileImpl extends NoProfile {
  const _$NoProfileImpl({
    this.message = 'Face not registered for this account',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.noProfile(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoProfileImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoProfileImplCopyWith<_$NoProfileImpl> get copyWith =>
      __$$NoProfileImplCopyWithImpl<_$NoProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return noProfile(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return noProfile?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (noProfile != null) {
      return noProfile(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return noProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return noProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (noProfile != null) {
      return noProfile(this);
    }
    return orElse();
  }
}

abstract class NoProfile extends BiometricVerificationFailure {
  const factory NoProfile({final String message, final String? requestId}) =
      _$NoProfileImpl;
  const NoProfile._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoProfileImplCopyWith<_$NoProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReEnrollmentRequiredImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ReEnrollmentRequiredImplCopyWith(
    _$ReEnrollmentRequiredImpl value,
    $Res Function(_$ReEnrollmentRequiredImpl) then,
  ) = __$$ReEnrollmentRequiredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ReEnrollmentRequiredImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$ReEnrollmentRequiredImpl
        >
    implements _$$ReEnrollmentRequiredImplCopyWith<$Res> {
  __$$ReEnrollmentRequiredImplCopyWithImpl(
    _$ReEnrollmentRequiredImpl _value,
    $Res Function(_$ReEnrollmentRequiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ReEnrollmentRequiredImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ReEnrollmentRequiredImpl extends ReEnrollmentRequired {
  const _$ReEnrollmentRequiredImpl({
    this.message = 'Your face registration was reset — please register again',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.reEnrollmentRequired(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReEnrollmentRequiredImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReEnrollmentRequiredImplCopyWith<_$ReEnrollmentRequiredImpl>
  get copyWith =>
      __$$ReEnrollmentRequiredImplCopyWithImpl<_$ReEnrollmentRequiredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return reEnrollmentRequired(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return reEnrollmentRequired?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (reEnrollmentRequired != null) {
      return reEnrollmentRequired(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return reEnrollmentRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return reEnrollmentRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (reEnrollmentRequired != null) {
      return reEnrollmentRequired(this);
    }
    return orElse();
  }
}

abstract class ReEnrollmentRequired extends BiometricVerificationFailure {
  const factory ReEnrollmentRequired({
    final String message,
    final String? requestId,
  }) = _$ReEnrollmentRequiredImpl;
  const ReEnrollmentRequired._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReEnrollmentRequiredImplCopyWith<_$ReEnrollmentRequiredImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileRevokedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ProfileRevokedImplCopyWith(
    _$ProfileRevokedImpl value,
    $Res Function(_$ProfileRevokedImpl) then,
  ) = __$$ProfileRevokedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ProfileRevokedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ProfileRevokedImpl>
    implements _$$ProfileRevokedImplCopyWith<$Res> {
  __$$ProfileRevokedImplCopyWithImpl(
    _$ProfileRevokedImpl _value,
    $Res Function(_$ProfileRevokedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ProfileRevokedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ProfileRevokedImpl extends ProfileRevoked {
  const _$ProfileRevokedImpl({
    this.message =
        'Face verification disabled for your account — contact your supervisor',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.profileRevoked(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRevokedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRevokedImplCopyWith<_$ProfileRevokedImpl> get copyWith =>
      __$$ProfileRevokedImplCopyWithImpl<_$ProfileRevokedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return profileRevoked(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return profileRevoked?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (profileRevoked != null) {
      return profileRevoked(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return profileRevoked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return profileRevoked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (profileRevoked != null) {
      return profileRevoked(this);
    }
    return orElse();
  }
}

abstract class ProfileRevoked extends BiometricVerificationFailure {
  const factory ProfileRevoked({
    final String message,
    final String? requestId,
  }) = _$ProfileRevokedImpl;
  const ProfileRevoked._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRevokedImplCopyWith<_$ProfileRevokedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoTemplateImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$NoTemplateImplCopyWith(
    _$NoTemplateImpl value,
    $Res Function(_$NoTemplateImpl) then,
  ) = __$$NoTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$NoTemplateImplCopyWithImpl<$Res>
    extends _$BiometricVerificationFailureCopyWithImpl<$Res, _$NoTemplateImpl>
    implements _$$NoTemplateImplCopyWith<$Res> {
  __$$NoTemplateImplCopyWithImpl(
    _$NoTemplateImpl _value,
    $Res Function(_$NoTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$NoTemplateImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NoTemplateImpl extends NoTemplate {
  const _$NoTemplateImpl({
    this.message = 'Face registration is incomplete — please register again',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.noTemplate(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoTemplateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoTemplateImplCopyWith<_$NoTemplateImpl> get copyWith =>
      __$$NoTemplateImplCopyWithImpl<_$NoTemplateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return noTemplate(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return noTemplate?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (noTemplate != null) {
      return noTemplate(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return noTemplate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return noTemplate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (noTemplate != null) {
      return noTemplate(this);
    }
    return orElse();
  }
}

abstract class NoTemplate extends BiometricVerificationFailure {
  const factory NoTemplate({final String message, final String? requestId}) =
      _$NoTemplateImpl;
  const NoTemplate._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoTemplateImplCopyWith<_$NoTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnrollmentNotAllowedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$EnrollmentNotAllowedImplCopyWith(
    _$EnrollmentNotAllowedImpl value,
    $Res Function(_$EnrollmentNotAllowedImpl) then,
  ) = __$$EnrollmentNotAllowedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$EnrollmentNotAllowedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$EnrollmentNotAllowedImpl
        >
    implements _$$EnrollmentNotAllowedImplCopyWith<$Res> {
  __$$EnrollmentNotAllowedImplCopyWithImpl(
    _$EnrollmentNotAllowedImpl _value,
    $Res Function(_$EnrollmentNotAllowedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$EnrollmentNotAllowedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$EnrollmentNotAllowedImpl extends EnrollmentNotAllowed {
  const _$EnrollmentNotAllowedImpl({
    this.message = 'Already registered. Ask your supervisor to reset.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.enrollmentNotAllowed(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentNotAllowedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentNotAllowedImplCopyWith<_$EnrollmentNotAllowedImpl>
  get copyWith =>
      __$$EnrollmentNotAllowedImplCopyWithImpl<_$EnrollmentNotAllowedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return enrollmentNotAllowed(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return enrollmentNotAllowed?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (enrollmentNotAllowed != null) {
      return enrollmentNotAllowed(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return enrollmentNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return enrollmentNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (enrollmentNotAllowed != null) {
      return enrollmentNotAllowed(this);
    }
    return orElse();
  }
}

abstract class EnrollmentNotAllowed extends BiometricVerificationFailure {
  const factory EnrollmentNotAllowed({
    final String message,
    final String? requestId,
  }) = _$EnrollmentNotAllowedImpl;
  const EnrollmentNotAllowed._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentNotAllowedImplCopyWith<_$EnrollmentNotAllowedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModelVersionMismatchImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ModelVersionMismatchImplCopyWith(
    _$ModelVersionMismatchImpl value,
    $Res Function(_$ModelVersionMismatchImpl) then,
  ) = __$$ModelVersionMismatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ModelVersionMismatchImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$ModelVersionMismatchImpl
        >
    implements _$$ModelVersionMismatchImplCopyWith<$Res> {
  __$$ModelVersionMismatchImplCopyWithImpl(
    _$ModelVersionMismatchImpl _value,
    $Res Function(_$ModelVersionMismatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ModelVersionMismatchImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ModelVersionMismatchImpl extends ModelVersionMismatch {
  const _$ModelVersionMismatchImpl({
    this.message =
        'Face registration needs to be renewed — contact your supervisor',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.modelVersionMismatch(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelVersionMismatchImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelVersionMismatchImplCopyWith<_$ModelVersionMismatchImpl>
  get copyWith =>
      __$$ModelVersionMismatchImplCopyWithImpl<_$ModelVersionMismatchImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return modelVersionMismatch(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return modelVersionMismatch?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (modelVersionMismatch != null) {
      return modelVersionMismatch(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return modelVersionMismatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return modelVersionMismatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (modelVersionMismatch != null) {
      return modelVersionMismatch(this);
    }
    return orElse();
  }
}

abstract class ModelVersionMismatch extends BiometricVerificationFailure {
  const factory ModelVersionMismatch({
    final String message,
    final String? requestId,
  }) = _$ModelVersionMismatchImpl;
  const ModelVersionMismatch._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelVersionMismatchImplCopyWith<_$ModelVersionMismatchImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricsDisabledImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$BiometricsDisabledImplCopyWith(
    _$BiometricsDisabledImpl value,
    $Res Function(_$BiometricsDisabledImpl) then,
  ) = __$$BiometricsDisabledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$BiometricsDisabledImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$BiometricsDisabledImpl
        >
    implements _$$BiometricsDisabledImplCopyWith<$Res> {
  __$$BiometricsDisabledImplCopyWithImpl(
    _$BiometricsDisabledImpl _value,
    $Res Function(_$BiometricsDisabledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$BiometricsDisabledImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricsDisabledImpl extends BiometricsDisabled {
  const _$BiometricsDisabledImpl({
    this.message = 'Face verification is not available',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.biometricsDisabled(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsDisabledImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricsDisabledImplCopyWith<_$BiometricsDisabledImpl> get copyWith =>
      __$$BiometricsDisabledImplCopyWithImpl<_$BiometricsDisabledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return biometricsDisabled(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return biometricsDisabled?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (biometricsDisabled != null) {
      return biometricsDisabled(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return biometricsDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return biometricsDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (biometricsDisabled != null) {
      return biometricsDisabled(this);
    }
    return orElse();
  }
}

abstract class BiometricsDisabled extends BiometricVerificationFailure {
  const factory BiometricsDisabled({
    final String message,
    final String? requestId,
  }) = _$BiometricsDisabledImpl;
  const BiometricsDisabled._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricsDisabledImplCopyWith<_$BiometricsDisabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChallengeInvalidImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ChallengeInvalidImplCopyWith(
    _$ChallengeInvalidImpl value,
    $Res Function(_$ChallengeInvalidImpl) then,
  ) = __$$ChallengeInvalidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ChallengeInvalidImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ChallengeInvalidImpl>
    implements _$$ChallengeInvalidImplCopyWith<$Res> {
  __$$ChallengeInvalidImplCopyWithImpl(
    _$ChallengeInvalidImpl _value,
    $Res Function(_$ChallengeInvalidImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ChallengeInvalidImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChallengeInvalidImpl extends ChallengeInvalid {
  const _$ChallengeInvalidImpl({
    this.message = 'Something went wrong. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.challengeInvalid(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeInvalidImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeInvalidImplCopyWith<_$ChallengeInvalidImpl> get copyWith =>
      __$$ChallengeInvalidImplCopyWithImpl<_$ChallengeInvalidImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return challengeInvalid(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return challengeInvalid?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeInvalid != null) {
      return challengeInvalid(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return challengeInvalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return challengeInvalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeInvalid != null) {
      return challengeInvalid(this);
    }
    return orElse();
  }
}

abstract class ChallengeInvalid extends BiometricVerificationFailure {
  const factory ChallengeInvalid({
    final String message,
    final String? requestId,
  }) = _$ChallengeInvalidImpl;
  const ChallengeInvalid._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeInvalidImplCopyWith<_$ChallengeInvalidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChallengeUsedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ChallengeUsedImplCopyWith(
    _$ChallengeUsedImpl value,
    $Res Function(_$ChallengeUsedImpl) then,
  ) = __$$ChallengeUsedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ChallengeUsedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ChallengeUsedImpl>
    implements _$$ChallengeUsedImplCopyWith<$Res> {
  __$$ChallengeUsedImplCopyWithImpl(
    _$ChallengeUsedImpl _value,
    $Res Function(_$ChallengeUsedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ChallengeUsedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChallengeUsedImpl extends ChallengeUsed {
  const _$ChallengeUsedImpl({
    this.message = 'Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.challengeUsed(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeUsedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeUsedImplCopyWith<_$ChallengeUsedImpl> get copyWith =>
      __$$ChallengeUsedImplCopyWithImpl<_$ChallengeUsedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return challengeUsed(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return challengeUsed?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeUsed != null) {
      return challengeUsed(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return challengeUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return challengeUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (challengeUsed != null) {
      return challengeUsed(this);
    }
    return orElse();
  }
}

abstract class ChallengeUsed extends BiometricVerificationFailure {
  const factory ChallengeUsed({final String message, final String? requestId}) =
      _$ChallengeUsedImpl;
  const ChallengeUsed._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeUsedImplCopyWith<_$ChallengeUsedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnrollmentConflictImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$EnrollmentConflictImplCopyWith(
    _$EnrollmentConflictImpl value,
    $Res Function(_$EnrollmentConflictImpl) then,
  ) = __$$EnrollmentConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$EnrollmentConflictImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$EnrollmentConflictImpl
        >
    implements _$$EnrollmentConflictImplCopyWith<$Res> {
  __$$EnrollmentConflictImplCopyWithImpl(
    _$EnrollmentConflictImpl _value,
    $Res Function(_$EnrollmentConflictImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$EnrollmentConflictImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$EnrollmentConflictImpl extends EnrollmentConflict {
  const _$EnrollmentConflictImpl({
    this.message = 'Registration already completed on another device',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.enrollmentConflict(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentConflictImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentConflictImplCopyWith<_$EnrollmentConflictImpl> get copyWith =>
      __$$EnrollmentConflictImplCopyWithImpl<_$EnrollmentConflictImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return enrollmentConflict(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return enrollmentConflict?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (enrollmentConflict != null) {
      return enrollmentConflict(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return enrollmentConflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return enrollmentConflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (enrollmentConflict != null) {
      return enrollmentConflict(this);
    }
    return orElse();
  }
}

abstract class EnrollmentConflict extends BiometricVerificationFailure {
  const factory EnrollmentConflict({
    final String message,
    final String? requestId,
  }) = _$EnrollmentConflictImpl;
  const EnrollmentConflict._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentConflictImplCopyWith<_$EnrollmentConflictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationRequestConflictImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$VerificationRequestConflictImplCopyWith(
    _$VerificationRequestConflictImpl value,
    $Res Function(_$VerificationRequestConflictImpl) then,
  ) = __$$VerificationRequestConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$VerificationRequestConflictImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$VerificationRequestConflictImpl
        >
    implements _$$VerificationRequestConflictImplCopyWith<$Res> {
  __$$VerificationRequestConflictImplCopyWithImpl(
    _$VerificationRequestConflictImpl _value,
    $Res Function(_$VerificationRequestConflictImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$VerificationRequestConflictImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VerificationRequestConflictImpl extends VerificationRequestConflict {
  const _$VerificationRequestConflictImpl({
    this.message = 'Something went wrong. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.verificationRequestConflict(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationRequestConflictImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationRequestConflictImplCopyWith<_$VerificationRequestConflictImpl>
  get copyWith =>
      __$$VerificationRequestConflictImplCopyWithImpl<
        _$VerificationRequestConflictImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return verificationRequestConflict(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return verificationRequestConflict?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (verificationRequestConflict != null) {
      return verificationRequestConflict(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return verificationRequestConflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return verificationRequestConflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (verificationRequestConflict != null) {
      return verificationRequestConflict(this);
    }
    return orElse();
  }
}

abstract class VerificationRequestConflict
    extends BiometricVerificationFailure {
  const factory VerificationRequestConflict({
    final String message,
    final String? requestId,
  }) = _$VerificationRequestConflictImpl;
  const VerificationRequestConflict._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationRequestConflictImplCopyWith<_$VerificationRequestConflictImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidImageImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$InvalidImageImplCopyWith(
    _$InvalidImageImpl value,
    $Res Function(_$InvalidImageImpl) then,
  ) = __$$InvalidImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$InvalidImageImplCopyWithImpl<$Res>
    extends _$BiometricVerificationFailureCopyWithImpl<$Res, _$InvalidImageImpl>
    implements _$$InvalidImageImplCopyWith<$Res> {
  __$$InvalidImageImplCopyWithImpl(
    _$InvalidImageImpl _value,
    $Res Function(_$InvalidImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$InvalidImageImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InvalidImageImpl extends InvalidImage {
  const _$InvalidImageImpl({
    this.message =
        'Something went wrong capturing your photo. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.invalidImage(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidImageImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidImageImplCopyWith<_$InvalidImageImpl> get copyWith =>
      __$$InvalidImageImplCopyWithImpl<_$InvalidImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return invalidImage(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return invalidImage?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (invalidImage != null) {
      return invalidImage(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return invalidImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return invalidImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (invalidImage != null) {
      return invalidImage(this);
    }
    return orElse();
  }
}

abstract class InvalidImage extends BiometricVerificationFailure {
  const factory InvalidImage({final String message, final String? requestId}) =
      _$InvalidImageImpl;
  const InvalidImage._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidImageImplCopyWith<_$InvalidImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageTooLargeImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ImageTooLargeImplCopyWith(
    _$ImageTooLargeImpl value,
    $Res Function(_$ImageTooLargeImpl) then,
  ) = __$$ImageTooLargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$ImageTooLargeImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ImageTooLargeImpl>
    implements _$$ImageTooLargeImplCopyWith<$Res> {
  __$$ImageTooLargeImplCopyWithImpl(
    _$ImageTooLargeImpl _value,
    $Res Function(_$ImageTooLargeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$ImageTooLargeImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ImageTooLargeImpl extends ImageTooLarge {
  const _$ImageTooLargeImpl({
    this.message =
        'Something went wrong capturing your photo. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.imageTooLarge(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTooLargeImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTooLargeImplCopyWith<_$ImageTooLargeImpl> get copyWith =>
      __$$ImageTooLargeImplCopyWithImpl<_$ImageTooLargeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return imageTooLarge(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return imageTooLarge?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (imageTooLarge != null) {
      return imageTooLarge(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return imageTooLarge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return imageTooLarge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (imageTooLarge != null) {
      return imageTooLarge(this);
    }
    return orElse();
  }
}

abstract class ImageTooLarge extends BiometricVerificationFailure {
  const factory ImageTooLarge({final String message, final String? requestId}) =
      _$ImageTooLargeImpl;
  const ImageTooLarge._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageTooLargeImplCopyWith<_$ImageTooLargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TechnicallyUnavailableImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$TechnicallyUnavailableImplCopyWith(
    _$TechnicallyUnavailableImpl value,
    $Res Function(_$TechnicallyUnavailableImpl) then,
  ) = __$$TechnicallyUnavailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BiometricTechnicalUnavailableReason reason,
    Duration? retryAfter,
    String message,
    String? requestId,
  });
}

/// @nodoc
class __$$TechnicallyUnavailableImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$TechnicallyUnavailableImpl
        >
    implements _$$TechnicallyUnavailableImplCopyWith<$Res> {
  __$$TechnicallyUnavailableImplCopyWithImpl(
    _$TechnicallyUnavailableImpl _value,
    $Res Function(_$TechnicallyUnavailableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? retryAfter = freezed,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$TechnicallyUnavailableImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as BiometricTechnicalUnavailableReason,
        retryAfter: freezed == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as Duration?,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TechnicallyUnavailableImpl extends TechnicallyUnavailable {
  const _$TechnicallyUnavailableImpl({
    required this.reason,
    this.retryAfter,
    this.message = 'Face verification temporarily unavailable',
    this.requestId,
  }) : super._();

  @override
  final BiometricTechnicalUnavailableReason reason;
  @override
  final Duration? retryAfter;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.technicallyUnavailable(reason: $reason, retryAfter: $retryAfter, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicallyUnavailableImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reason, retryAfter, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicallyUnavailableImplCopyWith<_$TechnicallyUnavailableImpl>
  get copyWith =>
      __$$TechnicallyUnavailableImplCopyWithImpl<_$TechnicallyUnavailableImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return technicallyUnavailable(reason, retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return technicallyUnavailable?.call(reason, retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (technicallyUnavailable != null) {
      return technicallyUnavailable(reason, retryAfter, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return technicallyUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return technicallyUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (technicallyUnavailable != null) {
      return technicallyUnavailable(this);
    }
    return orElse();
  }
}

abstract class TechnicallyUnavailable extends BiometricVerificationFailure {
  const factory TechnicallyUnavailable({
    required final BiometricTechnicalUnavailableReason reason,
    final Duration? retryAfter,
    final String message,
    final String? requestId,
  }) = _$TechnicallyUnavailableImpl;
  const TechnicallyUnavailable._() : super._();

  BiometricTechnicalUnavailableReason get reason;
  Duration? get retryAfter;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TechnicallyUnavailableImplCopyWith<_$TechnicallyUnavailableImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceNotRegisteredImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$DeviceNotRegisteredImplCopyWith(
    _$DeviceNotRegisteredImpl value,
    $Res Function(_$DeviceNotRegisteredImpl) then,
  ) = __$$DeviceNotRegisteredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$DeviceNotRegisteredImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$DeviceNotRegisteredImpl
        >
    implements _$$DeviceNotRegisteredImplCopyWith<$Res> {
  __$$DeviceNotRegisteredImplCopyWithImpl(
    _$DeviceNotRegisteredImpl _value,
    $Res Function(_$DeviceNotRegisteredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$DeviceNotRegisteredImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DeviceNotRegisteredImpl extends DeviceNotRegistered {
  const _$DeviceNotRegisteredImpl({
    this.message = 'Device not registered. Please try again.',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.deviceNotRegistered(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceNotRegisteredImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceNotRegisteredImplCopyWith<_$DeviceNotRegisteredImpl> get copyWith =>
      __$$DeviceNotRegisteredImplCopyWithImpl<_$DeviceNotRegisteredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return deviceNotRegistered(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return deviceNotRegistered?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (deviceNotRegistered != null) {
      return deviceNotRegistered(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return deviceNotRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return deviceNotRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (deviceNotRegistered != null) {
      return deviceNotRegistered(this);
    }
    return orElse();
  }
}

abstract class DeviceNotRegistered extends BiometricVerificationFailure {
  const factory DeviceNotRegistered({
    final String message,
    final String? requestId,
  }) = _$DeviceNotRegisteredImpl;
  const DeviceNotRegistered._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceNotRegisteredImplCopyWith<_$DeviceNotRegisteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricRateLimitedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$BiometricRateLimitedImplCopyWith(
    _$BiometricRateLimitedImpl value,
    $Res Function(_$BiometricRateLimitedImpl) then,
  ) = __$$BiometricRateLimitedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration retryAfter, String message, String? requestId});
}

/// @nodoc
class __$$BiometricRateLimitedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<
          $Res,
          _$BiometricRateLimitedImpl
        >
    implements _$$BiometricRateLimitedImplCopyWith<$Res> {
  __$$BiometricRateLimitedImplCopyWithImpl(
    _$BiometricRateLimitedImpl _value,
    $Res Function(_$BiometricRateLimitedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$BiometricRateLimitedImpl(
        retryAfter: null == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as Duration,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricRateLimitedImpl extends BiometricRateLimited {
  const _$BiometricRateLimitedImpl({
    required this.retryAfter,
    this.message = 'Too many attempts. Please try again shortly.',
    this.requestId,
  }) : super._();

  @override
  final Duration retryAfter;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.biometricRateLimited(retryAfter: $retryAfter, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricRateLimitedImpl &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricRateLimitedImplCopyWith<_$BiometricRateLimitedImpl>
  get copyWith =>
      __$$BiometricRateLimitedImplCopyWithImpl<_$BiometricRateLimitedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return biometricRateLimited(retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return biometricRateLimited?.call(retryAfter, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (biometricRateLimited != null) {
      return biometricRateLimited(retryAfter, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return biometricRateLimited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return biometricRateLimited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (biometricRateLimited != null) {
      return biometricRateLimited(this);
    }
    return orElse();
  }
}

abstract class BiometricRateLimited extends BiometricVerificationFailure {
  const factory BiometricRateLimited({
    required final Duration retryAfter,
    final String message,
    final String? requestId,
  }) = _$BiometricRateLimitedImpl;
  const BiometricRateLimited._() : super._();

  Duration get retryAfter;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricRateLimitedImplCopyWith<_$BiometricRateLimitedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClockInRejectedImplCopyWith<$Res>
    implements $BiometricVerificationFailureCopyWith<$Res> {
  factory _$$ClockInRejectedImplCopyWith(
    _$ClockInRejectedImpl value,
    $Res Function(_$ClockInRejectedImpl) then,
  ) = __$$ClockInRejectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BiometricClockInRejectionReason reason,
    String message,
    String? requestId,
  });
}

/// @nodoc
class __$$ClockInRejectedImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationFailureCopyWithImpl<$Res, _$ClockInRejectedImpl>
    implements _$$ClockInRejectedImplCopyWith<$Res> {
  __$$ClockInRejectedImplCopyWithImpl(
    _$ClockInRejectedImpl _value,
    $Res Function(_$ClockInRejectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$ClockInRejectedImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as BiometricClockInRejectionReason,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ClockInRejectedImpl extends ClockInRejected {
  const _$ClockInRejectedImpl({
    required this.reason,
    this.message = 'Verification could not be completed. Please try again.',
    this.requestId,
  }) : super._();

  @override
  final BiometricClockInRejectionReason reason;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'BiometricVerificationFailure.clockInRejected(reason: $reason, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClockInRejectedImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, message, requestId);

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClockInRejectedImplCopyWith<_$ClockInRejectedImpl> get copyWith =>
      __$$ClockInRejectedImplCopyWithImpl<_$ClockInRejectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) faceNotMatched,
    required TResult Function(String message, String? requestId)
    challengeExpired,
    required TResult Function(String message, String? requestId) notEnrolled,
    required TResult Function(String message, String? requestId) noProfile,
    required TResult Function(String message, String? requestId)
    reEnrollmentRequired,
    required TResult Function(String message, String? requestId) profileRevoked,
    required TResult Function(String message, String? requestId) noTemplate,
    required TResult Function(String message, String? requestId)
    enrollmentNotAllowed,
    required TResult Function(String message, String? requestId)
    modelVersionMismatch,
    required TResult Function(String message, String? requestId)
    biometricsDisabled,
    required TResult Function(String message, String? requestId)
    challengeInvalid,
    required TResult Function(String message, String? requestId) challengeUsed,
    required TResult Function(String message, String? requestId)
    enrollmentConflict,
    required TResult Function(String message, String? requestId)
    verificationRequestConflict,
    required TResult Function(String message, String? requestId) invalidImage,
    required TResult Function(String message, String? requestId) imageTooLarge,
    required TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )
    technicallyUnavailable,
    required TResult Function(String message, String? requestId)
    deviceNotRegistered,
    required TResult Function(
      Duration retryAfter,
      String message,
      String? requestId,
    )
    biometricRateLimited,
    required TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )
    clockInRejected,
  }) {
    return clockInRejected(reason, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? faceNotMatched,
    TResult? Function(String message, String? requestId)? challengeExpired,
    TResult? Function(String message, String? requestId)? notEnrolled,
    TResult? Function(String message, String? requestId)? noProfile,
    TResult? Function(String message, String? requestId)? reEnrollmentRequired,
    TResult? Function(String message, String? requestId)? profileRevoked,
    TResult? Function(String message, String? requestId)? noTemplate,
    TResult? Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult? Function(String message, String? requestId)? modelVersionMismatch,
    TResult? Function(String message, String? requestId)? biometricsDisabled,
    TResult? Function(String message, String? requestId)? challengeInvalid,
    TResult? Function(String message, String? requestId)? challengeUsed,
    TResult? Function(String message, String? requestId)? enrollmentConflict,
    TResult? Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult? Function(String message, String? requestId)? invalidImage,
    TResult? Function(String message, String? requestId)? imageTooLarge,
    TResult? Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult? Function(String message, String? requestId)? deviceNotRegistered,
    TResult? Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult? Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
  }) {
    return clockInRejected?.call(reason, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? faceNotMatched,
    TResult Function(String message, String? requestId)? challengeExpired,
    TResult Function(String message, String? requestId)? notEnrolled,
    TResult Function(String message, String? requestId)? noProfile,
    TResult Function(String message, String? requestId)? reEnrollmentRequired,
    TResult Function(String message, String? requestId)? profileRevoked,
    TResult Function(String message, String? requestId)? noTemplate,
    TResult Function(String message, String? requestId)? enrollmentNotAllowed,
    TResult Function(String message, String? requestId)? modelVersionMismatch,
    TResult Function(String message, String? requestId)? biometricsDisabled,
    TResult Function(String message, String? requestId)? challengeInvalid,
    TResult Function(String message, String? requestId)? challengeUsed,
    TResult Function(String message, String? requestId)? enrollmentConflict,
    TResult Function(String message, String? requestId)?
    verificationRequestConflict,
    TResult Function(String message, String? requestId)? invalidImage,
    TResult Function(String message, String? requestId)? imageTooLarge,
    TResult Function(
      BiometricTechnicalUnavailableReason reason,
      Duration? retryAfter,
      String message,
      String? requestId,
    )?
    technicallyUnavailable,
    TResult Function(String message, String? requestId)? deviceNotRegistered,
    TResult Function(Duration retryAfter, String message, String? requestId)?
    biometricRateLimited,
    TResult Function(
      BiometricClockInRejectionReason reason,
      String message,
      String? requestId,
    )?
    clockInRejected,
    required TResult orElse(),
  }) {
    if (clockInRejected != null) {
      return clockInRejected(reason, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceNotMatched value) faceNotMatched,
    required TResult Function(ChallengeExpired value) challengeExpired,
    required TResult Function(NotEnrolled value) notEnrolled,
    required TResult Function(NoProfile value) noProfile,
    required TResult Function(ReEnrollmentRequired value) reEnrollmentRequired,
    required TResult Function(ProfileRevoked value) profileRevoked,
    required TResult Function(NoTemplate value) noTemplate,
    required TResult Function(EnrollmentNotAllowed value) enrollmentNotAllowed,
    required TResult Function(ModelVersionMismatch value) modelVersionMismatch,
    required TResult Function(BiometricsDisabled value) biometricsDisabled,
    required TResult Function(ChallengeInvalid value) challengeInvalid,
    required TResult Function(ChallengeUsed value) challengeUsed,
    required TResult Function(EnrollmentConflict value) enrollmentConflict,
    required TResult Function(VerificationRequestConflict value)
    verificationRequestConflict,
    required TResult Function(InvalidImage value) invalidImage,
    required TResult Function(ImageTooLarge value) imageTooLarge,
    required TResult Function(TechnicallyUnavailable value)
    technicallyUnavailable,
    required TResult Function(DeviceNotRegistered value) deviceNotRegistered,
    required TResult Function(BiometricRateLimited value) biometricRateLimited,
    required TResult Function(ClockInRejected value) clockInRejected,
  }) {
    return clockInRejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceNotMatched value)? faceNotMatched,
    TResult? Function(ChallengeExpired value)? challengeExpired,
    TResult? Function(NotEnrolled value)? notEnrolled,
    TResult? Function(NoProfile value)? noProfile,
    TResult? Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult? Function(ProfileRevoked value)? profileRevoked,
    TResult? Function(NoTemplate value)? noTemplate,
    TResult? Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult? Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult? Function(BiometricsDisabled value)? biometricsDisabled,
    TResult? Function(ChallengeInvalid value)? challengeInvalid,
    TResult? Function(ChallengeUsed value)? challengeUsed,
    TResult? Function(EnrollmentConflict value)? enrollmentConflict,
    TResult? Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult? Function(InvalidImage value)? invalidImage,
    TResult? Function(ImageTooLarge value)? imageTooLarge,
    TResult? Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult? Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult? Function(BiometricRateLimited value)? biometricRateLimited,
    TResult? Function(ClockInRejected value)? clockInRejected,
  }) {
    return clockInRejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceNotMatched value)? faceNotMatched,
    TResult Function(ChallengeExpired value)? challengeExpired,
    TResult Function(NotEnrolled value)? notEnrolled,
    TResult Function(NoProfile value)? noProfile,
    TResult Function(ReEnrollmentRequired value)? reEnrollmentRequired,
    TResult Function(ProfileRevoked value)? profileRevoked,
    TResult Function(NoTemplate value)? noTemplate,
    TResult Function(EnrollmentNotAllowed value)? enrollmentNotAllowed,
    TResult Function(ModelVersionMismatch value)? modelVersionMismatch,
    TResult Function(BiometricsDisabled value)? biometricsDisabled,
    TResult Function(ChallengeInvalid value)? challengeInvalid,
    TResult Function(ChallengeUsed value)? challengeUsed,
    TResult Function(EnrollmentConflict value)? enrollmentConflict,
    TResult Function(VerificationRequestConflict value)?
    verificationRequestConflict,
    TResult Function(InvalidImage value)? invalidImage,
    TResult Function(ImageTooLarge value)? imageTooLarge,
    TResult Function(TechnicallyUnavailable value)? technicallyUnavailable,
    TResult Function(DeviceNotRegistered value)? deviceNotRegistered,
    TResult Function(BiometricRateLimited value)? biometricRateLimited,
    TResult Function(ClockInRejected value)? clockInRejected,
    required TResult orElse(),
  }) {
    if (clockInRejected != null) {
      return clockInRejected(this);
    }
    return orElse();
  }
}

abstract class ClockInRejected extends BiometricVerificationFailure {
  const factory ClockInRejected({
    required final BiometricClockInRejectionReason reason,
    final String message,
    final String? requestId,
  }) = _$ClockInRejectedImpl;
  const ClockInRejected._() : super._();

  BiometricClockInRejectionReason get reason;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of BiometricVerificationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClockInRejectedImplCopyWith<_$ClockInRejectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OutletMappingFailure {
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletMappingFailureCopyWith<OutletMappingFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletMappingFailureCopyWith<$Res> {
  factory $OutletMappingFailureCopyWith(
    OutletMappingFailure value,
    $Res Function(OutletMappingFailure) then,
  ) = _$OutletMappingFailureCopyWithImpl<$Res, OutletMappingFailure>;
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class _$OutletMappingFailureCopyWithImpl<
  $Res,
  $Val extends OutletMappingFailure
>
    implements $OutletMappingFailureCopyWith<$Res> {
  _$OutletMappingFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutletMappingNotFoundImplCopyWith<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  factory _$$OutletMappingNotFoundImplCopyWith(
    _$OutletMappingNotFoundImpl value,
    $Res Function(_$OutletMappingNotFoundImpl) then,
  ) = __$$OutletMappingNotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$OutletMappingNotFoundImplCopyWithImpl<$Res>
    extends
        _$OutletMappingFailureCopyWithImpl<$Res, _$OutletMappingNotFoundImpl>
    implements _$$OutletMappingNotFoundImplCopyWith<$Res> {
  __$$OutletMappingNotFoundImplCopyWithImpl(
    _$OutletMappingNotFoundImpl _value,
    $Res Function(_$OutletMappingNotFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$OutletMappingNotFoundImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OutletMappingNotFoundImpl extends OutletMappingNotFound {
  const _$OutletMappingNotFoundImpl({
    this.message = 'Mapping request not found',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'OutletMappingFailure.notFound(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletMappingNotFoundImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletMappingNotFoundImplCopyWith<_$OutletMappingNotFoundImpl>
  get copyWith =>
      __$$OutletMappingNotFoundImplCopyWithImpl<_$OutletMappingNotFoundImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) {
    return notFound(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) {
    return notFound?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class OutletMappingNotFound extends OutletMappingFailure {
  const factory OutletMappingNotFound({
    final String message,
    final String? requestId,
  }) = _$OutletMappingNotFoundImpl;
  const OutletMappingNotFound._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletMappingNotFoundImplCopyWith<_$OutletMappingNotFoundImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutletMappingForbiddenImplCopyWith<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  factory _$$OutletMappingForbiddenImplCopyWith(
    _$OutletMappingForbiddenImpl value,
    $Res Function(_$OutletMappingForbiddenImpl) then,
  ) = __$$OutletMappingForbiddenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$OutletMappingForbiddenImplCopyWithImpl<$Res>
    extends
        _$OutletMappingFailureCopyWithImpl<$Res, _$OutletMappingForbiddenImpl>
    implements _$$OutletMappingForbiddenImplCopyWith<$Res> {
  __$$OutletMappingForbiddenImplCopyWithImpl(
    _$OutletMappingForbiddenImpl _value,
    $Res Function(_$OutletMappingForbiddenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$OutletMappingForbiddenImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OutletMappingForbiddenImpl extends OutletMappingForbidden {
  const _$OutletMappingForbiddenImpl({
    this.message = 'You are not authorized to map this outlet',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'OutletMappingFailure.forbidden(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletMappingForbiddenImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletMappingForbiddenImplCopyWith<_$OutletMappingForbiddenImpl>
  get copyWith =>
      __$$OutletMappingForbiddenImplCopyWithImpl<_$OutletMappingForbiddenImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) {
    return forbidden(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) {
    return forbidden?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class OutletMappingForbidden extends OutletMappingFailure {
  const factory OutletMappingForbidden({
    final String message,
    final String? requestId,
  }) = _$OutletMappingForbiddenImpl;
  const OutletMappingForbidden._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletMappingForbiddenImplCopyWith<_$OutletMappingForbiddenImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutletMappingConflictImplCopyWith<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  factory _$$OutletMappingConflictImplCopyWith(
    _$OutletMappingConflictImpl value,
    $Res Function(_$OutletMappingConflictImpl) then,
  ) = __$$OutletMappingConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String? requestId});
}

/// @nodoc
class __$$OutletMappingConflictImplCopyWithImpl<$Res>
    extends
        _$OutletMappingFailureCopyWithImpl<$Res, _$OutletMappingConflictImpl>
    implements _$$OutletMappingConflictImplCopyWith<$Res> {
  __$$OutletMappingConflictImplCopyWithImpl(
    _$OutletMappingConflictImpl _value,
    $Res Function(_$OutletMappingConflictImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$OutletMappingConflictImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OutletMappingConflictImpl extends OutletMappingConflict {
  const _$OutletMappingConflictImpl({
    required this.code,
    this.message = 'This mapping session cannot continue right now',
    this.requestId,
  }) : super._();

  @override
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'OutletMappingFailure.conflict(code: $code, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletMappingConflictImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, requestId);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletMappingConflictImplCopyWith<_$OutletMappingConflictImpl>
  get copyWith =>
      __$$OutletMappingConflictImplCopyWithImpl<_$OutletMappingConflictImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) {
    return conflict(code, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) {
    return conflict?.call(code, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(code, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class OutletMappingConflict extends OutletMappingFailure {
  const factory OutletMappingConflict({
    required final String code,
    final String message,
    final String? requestId,
  }) = _$OutletMappingConflictImpl;
  const OutletMappingConflict._() : super._();

  String get code;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletMappingConflictImplCopyWith<_$OutletMappingConflictImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutletMappingTooManySamplesImplCopyWith<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  factory _$$OutletMappingTooManySamplesImplCopyWith(
    _$OutletMappingTooManySamplesImpl value,
    $Res Function(_$OutletMappingTooManySamplesImpl) then,
  ) = __$$OutletMappingTooManySamplesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$OutletMappingTooManySamplesImplCopyWithImpl<$Res>
    extends
        _$OutletMappingFailureCopyWithImpl<
          $Res,
          _$OutletMappingTooManySamplesImpl
        >
    implements _$$OutletMappingTooManySamplesImplCopyWith<$Res> {
  __$$OutletMappingTooManySamplesImplCopyWithImpl(
    _$OutletMappingTooManySamplesImpl _value,
    $Res Function(_$OutletMappingTooManySamplesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$OutletMappingTooManySamplesImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OutletMappingTooManySamplesImpl extends OutletMappingTooManySamples {
  const _$OutletMappingTooManySamplesImpl({
    this.message = 'Maximum mapping readings reached',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'OutletMappingFailure.tooManySamples(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletMappingTooManySamplesImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletMappingTooManySamplesImplCopyWith<_$OutletMappingTooManySamplesImpl>
  get copyWith =>
      __$$OutletMappingTooManySamplesImplCopyWithImpl<
        _$OutletMappingTooManySamplesImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) {
    return tooManySamples(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) {
    return tooManySamples?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) {
    if (tooManySamples != null) {
      return tooManySamples(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) {
    return tooManySamples(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) {
    return tooManySamples?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) {
    if (tooManySamples != null) {
      return tooManySamples(this);
    }
    return orElse();
  }
}

abstract class OutletMappingTooManySamples extends OutletMappingFailure {
  const factory OutletMappingTooManySamples({
    final String message,
    final String? requestId,
  }) = _$OutletMappingTooManySamplesImpl;
  const OutletMappingTooManySamples._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletMappingTooManySamplesImplCopyWith<_$OutletMappingTooManySamplesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OutletMappingValidationImplCopyWith<$Res>
    implements $OutletMappingFailureCopyWith<$Res> {
  factory _$$OutletMappingValidationImplCopyWith(
    _$OutletMappingValidationImpl value,
    $Res Function(_$OutletMappingValidationImpl) then,
  ) = __$$OutletMappingValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requestId});
}

/// @nodoc
class __$$OutletMappingValidationImplCopyWithImpl<$Res>
    extends
        _$OutletMappingFailureCopyWithImpl<$Res, _$OutletMappingValidationImpl>
    implements _$$OutletMappingValidationImplCopyWith<$Res> {
  __$$OutletMappingValidationImplCopyWithImpl(
    _$OutletMappingValidationImpl _value,
    $Res Function(_$OutletMappingValidationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? requestId = freezed}) {
    return _then(
      _$OutletMappingValidationImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OutletMappingValidationImpl extends OutletMappingValidation {
  const _$OutletMappingValidationImpl({
    this.message = 'Invalid mapping request',
    this.requestId,
  }) : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'OutletMappingFailure.validation(message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletMappingValidationImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requestId);

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletMappingValidationImplCopyWith<_$OutletMappingValidationImpl>
  get copyWith =>
      __$$OutletMappingValidationImplCopyWithImpl<
        _$OutletMappingValidationImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? requestId) notFound,
    required TResult Function(String message, String? requestId) forbidden,
    required TResult Function(String code, String message, String? requestId)
    conflict,
    required TResult Function(String message, String? requestId) tooManySamples,
    required TResult Function(String message, String? requestId) validation,
  }) {
    return validation(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? requestId)? notFound,
    TResult? Function(String message, String? requestId)? forbidden,
    TResult? Function(String code, String message, String? requestId)? conflict,
    TResult? Function(String message, String? requestId)? tooManySamples,
    TResult? Function(String message, String? requestId)? validation,
  }) {
    return validation?.call(message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? requestId)? notFound,
    TResult Function(String message, String? requestId)? forbidden,
    TResult Function(String code, String message, String? requestId)? conflict,
    TResult Function(String message, String? requestId)? tooManySamples,
    TResult Function(String message, String? requestId)? validation,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletMappingNotFound value) notFound,
    required TResult Function(OutletMappingForbidden value) forbidden,
    required TResult Function(OutletMappingConflict value) conflict,
    required TResult Function(OutletMappingTooManySamples value) tooManySamples,
    required TResult Function(OutletMappingValidation value) validation,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletMappingNotFound value)? notFound,
    TResult? Function(OutletMappingForbidden value)? forbidden,
    TResult? Function(OutletMappingConflict value)? conflict,
    TResult? Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult? Function(OutletMappingValidation value)? validation,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletMappingNotFound value)? notFound,
    TResult Function(OutletMappingForbidden value)? forbidden,
    TResult Function(OutletMappingConflict value)? conflict,
    TResult Function(OutletMappingTooManySamples value)? tooManySamples,
    TResult Function(OutletMappingValidation value)? validation,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class OutletMappingValidation extends OutletMappingFailure {
  const factory OutletMappingValidation({
    final String message,
    final String? requestId,
  }) = _$OutletMappingValidationImpl;
  const OutletMappingValidation._() : super._();

  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of OutletMappingFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletMappingValidationImplCopyWith<_$OutletMappingValidationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LunchBreakFailure {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, String message, String? requestId)
    actionRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code, String message, String? requestId)?
    actionRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, String message, String? requestId)?
    actionRejected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LunchBreakActionRejected value) actionRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LunchBreakActionRejected value)? actionRejected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LunchBreakActionRejected value)? actionRejected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of LunchBreakFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LunchBreakFailureCopyWith<LunchBreakFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LunchBreakFailureCopyWith<$Res> {
  factory $LunchBreakFailureCopyWith(
    LunchBreakFailure value,
    $Res Function(LunchBreakFailure) then,
  ) = _$LunchBreakFailureCopyWithImpl<$Res, LunchBreakFailure>;
  @useResult
  $Res call({String code, String message, String? requestId});
}

/// @nodoc
class _$LunchBreakFailureCopyWithImpl<$Res, $Val extends LunchBreakFailure>
    implements $LunchBreakFailureCopyWith<$Res> {
  _$LunchBreakFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LunchBreakFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LunchBreakActionRejectedImplCopyWith<$Res>
    implements $LunchBreakFailureCopyWith<$Res> {
  factory _$$LunchBreakActionRejectedImplCopyWith(
    _$LunchBreakActionRejectedImpl value,
    $Res Function(_$LunchBreakActionRejectedImpl) then,
  ) = __$$LunchBreakActionRejectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String? requestId});
}

/// @nodoc
class __$$LunchBreakActionRejectedImplCopyWithImpl<$Res>
    extends
        _$LunchBreakFailureCopyWithImpl<$Res, _$LunchBreakActionRejectedImpl>
    implements _$$LunchBreakActionRejectedImplCopyWith<$Res> {
  __$$LunchBreakActionRejectedImplCopyWithImpl(
    _$LunchBreakActionRejectedImpl _value,
    $Res Function(_$LunchBreakActionRejectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LunchBreakFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$LunchBreakActionRejectedImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$LunchBreakActionRejectedImpl extends LunchBreakActionRejected {
  const _$LunchBreakActionRejectedImpl({
    required this.code,
    this.message = 'Lunch break action could not be completed',
    this.requestId,
  }) : super._();

  @override
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'LunchBreakFailure.actionRejected(code: $code, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LunchBreakActionRejectedImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, requestId);

  /// Create a copy of LunchBreakFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LunchBreakActionRejectedImplCopyWith<_$LunchBreakActionRejectedImpl>
  get copyWith =>
      __$$LunchBreakActionRejectedImplCopyWithImpl<
        _$LunchBreakActionRejectedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, String message, String? requestId)
    actionRejected,
  }) {
    return actionRejected(code, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code, String message, String? requestId)?
    actionRejected,
  }) {
    return actionRejected?.call(code, message, requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, String message, String? requestId)?
    actionRejected,
    required TResult orElse(),
  }) {
    if (actionRejected != null) {
      return actionRejected(code, message, requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LunchBreakActionRejected value) actionRejected,
  }) {
    return actionRejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LunchBreakActionRejected value)? actionRejected,
  }) {
    return actionRejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LunchBreakActionRejected value)? actionRejected,
    required TResult orElse(),
  }) {
    if (actionRejected != null) {
      return actionRejected(this);
    }
    return orElse();
  }
}

abstract class LunchBreakActionRejected extends LunchBreakFailure {
  const factory LunchBreakActionRejected({
    required final String code,
    final String message,
    final String? requestId,
  }) = _$LunchBreakActionRejectedImpl;
  const LunchBreakActionRejected._() : super._();

  @override
  String get code;
  @override
  String get message;
  @override
  String? get requestId;

  /// Create a copy of LunchBreakFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LunchBreakActionRejectedImplCopyWith<_$LunchBreakActionRejectedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
