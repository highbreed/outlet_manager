// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale_otp_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DailySaleOtpResult {
  String get message => throw _privateConstructorUsedError;
  int get expiresInMinutes => throw _privateConstructorUsedError;

  /// Create a copy of DailySaleOtpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySaleOtpResultCopyWith<DailySaleOtpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySaleOtpResultCopyWith<$Res> {
  factory $DailySaleOtpResultCopyWith(
    DailySaleOtpResult value,
    $Res Function(DailySaleOtpResult) then,
  ) = _$DailySaleOtpResultCopyWithImpl<$Res, DailySaleOtpResult>;
  @useResult
  $Res call({String message, int expiresInMinutes});
}

/// @nodoc
class _$DailySaleOtpResultCopyWithImpl<$Res, $Val extends DailySaleOtpResult>
    implements $DailySaleOtpResultCopyWith<$Res> {
  _$DailySaleOtpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySaleOtpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? expiresInMinutes = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresInMinutes: null == expiresInMinutes
                ? _value.expiresInMinutes
                : expiresInMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailySaleOtpResultImplCopyWith<$Res>
    implements $DailySaleOtpResultCopyWith<$Res> {
  factory _$$DailySaleOtpResultImplCopyWith(
    _$DailySaleOtpResultImpl value,
    $Res Function(_$DailySaleOtpResultImpl) then,
  ) = __$$DailySaleOtpResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int expiresInMinutes});
}

/// @nodoc
class __$$DailySaleOtpResultImplCopyWithImpl<$Res>
    extends _$DailySaleOtpResultCopyWithImpl<$Res, _$DailySaleOtpResultImpl>
    implements _$$DailySaleOtpResultImplCopyWith<$Res> {
  __$$DailySaleOtpResultImplCopyWithImpl(
    _$DailySaleOtpResultImpl _value,
    $Res Function(_$DailySaleOtpResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailySaleOtpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? expiresInMinutes = null}) {
    return _then(
      _$DailySaleOtpResultImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresInMinutes: null == expiresInMinutes
            ? _value.expiresInMinutes
            : expiresInMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DailySaleOtpResultImpl implements _DailySaleOtpResult {
  const _$DailySaleOtpResultImpl({
    required this.message,
    required this.expiresInMinutes,
  });

  @override
  final String message;
  @override
  final int expiresInMinutes;

  @override
  String toString() {
    return 'DailySaleOtpResult(message: $message, expiresInMinutes: $expiresInMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySaleOtpResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.expiresInMinutes, expiresInMinutes) ||
                other.expiresInMinutes == expiresInMinutes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, expiresInMinutes);

  /// Create a copy of DailySaleOtpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySaleOtpResultImplCopyWith<_$DailySaleOtpResultImpl> get copyWith =>
      __$$DailySaleOtpResultImplCopyWithImpl<_$DailySaleOtpResultImpl>(
        this,
        _$identity,
      );
}

abstract class _DailySaleOtpResult implements DailySaleOtpResult {
  const factory _DailySaleOtpResult({
    required final String message,
    required final int expiresInMinutes,
  }) = _$DailySaleOtpResultImpl;

  @override
  String get message;
  @override
  int get expiresInMinutes;

  /// Create a copy of DailySaleOtpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySaleOtpResultImplCopyWith<_$DailySaleOtpResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
