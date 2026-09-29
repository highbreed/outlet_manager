// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MappingSessionUiState {
  MappingSession? get session => throw _privateConstructorUsedError;

  /// True only right after cold-start recovery found a `CAPTURING`
  /// session that was actively being walked when the process died
  /// (spec §56) — cleared the moment the employee taps Resume or Stop.
  bool get showResumePrompt => throw _privateConstructorUsedError;

  /// In-flight guard surfaced to the UI so a button can disable itself
  /// during start/finish/abandon — the actual concurrency guard lives in
  /// the notifier, this is display-only.
  bool get isBusy => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MappingCaptureSummary? get finishSummary =>
      throw _privateConstructorUsedError;
  int get localSampleCount => throw _privateConstructorUsedError;
  int get pendingUploadCount => throw _privateConstructorUsedError;

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MappingSessionUiStateCopyWith<MappingSessionUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MappingSessionUiStateCopyWith<$Res> {
  factory $MappingSessionUiStateCopyWith(
    MappingSessionUiState value,
    $Res Function(MappingSessionUiState) then,
  ) = _$MappingSessionUiStateCopyWithImpl<$Res, MappingSessionUiState>;
  @useResult
  $Res call({
    MappingSession? session,
    bool showResumePrompt,
    bool isBusy,
    String? errorMessage,
    MappingCaptureSummary? finishSummary,
    int localSampleCount,
    int pendingUploadCount,
  });

  $MappingSessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$MappingSessionUiStateCopyWithImpl<
  $Res,
  $Val extends MappingSessionUiState
>
    implements $MappingSessionUiStateCopyWith<$Res> {
  _$MappingSessionUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? showResumePrompt = null,
    Object? isBusy = null,
    Object? errorMessage = freezed,
    Object? finishSummary = freezed,
    Object? localSampleCount = null,
    Object? pendingUploadCount = null,
  }) {
    return _then(
      _value.copyWith(
            session: freezed == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                      as MappingSession?,
            showResumePrompt: null == showResumePrompt
                ? _value.showResumePrompt
                : showResumePrompt // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBusy: null == isBusy
                ? _value.isBusy
                : isBusy // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            finishSummary: freezed == finishSummary
                ? _value.finishSummary
                : finishSummary // ignore: cast_nullable_to_non_nullable
                      as MappingCaptureSummary?,
            localSampleCount: null == localSampleCount
                ? _value.localSampleCount
                : localSampleCount // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingUploadCount: null == pendingUploadCount
                ? _value.pendingUploadCount
                : pendingUploadCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MappingSessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $MappingSessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MappingSessionUiStateImplCopyWith<$Res>
    implements $MappingSessionUiStateCopyWith<$Res> {
  factory _$$MappingSessionUiStateImplCopyWith(
    _$MappingSessionUiStateImpl value,
    $Res Function(_$MappingSessionUiStateImpl) then,
  ) = __$$MappingSessionUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MappingSession? session,
    bool showResumePrompt,
    bool isBusy,
    String? errorMessage,
    MappingCaptureSummary? finishSummary,
    int localSampleCount,
    int pendingUploadCount,
  });

  @override
  $MappingSessionCopyWith<$Res>? get session;
}

/// @nodoc
class __$$MappingSessionUiStateImplCopyWithImpl<$Res>
    extends
        _$MappingSessionUiStateCopyWithImpl<$Res, _$MappingSessionUiStateImpl>
    implements _$$MappingSessionUiStateImplCopyWith<$Res> {
  __$$MappingSessionUiStateImplCopyWithImpl(
    _$MappingSessionUiStateImpl _value,
    $Res Function(_$MappingSessionUiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? showResumePrompt = null,
    Object? isBusy = null,
    Object? errorMessage = freezed,
    Object? finishSummary = freezed,
    Object? localSampleCount = null,
    Object? pendingUploadCount = null,
  }) {
    return _then(
      _$MappingSessionUiStateImpl(
        session: freezed == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as MappingSession?,
        showResumePrompt: null == showResumePrompt
            ? _value.showResumePrompt
            : showResumePrompt // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBusy: null == isBusy
            ? _value.isBusy
            : isBusy // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        finishSummary: freezed == finishSummary
            ? _value.finishSummary
            : finishSummary // ignore: cast_nullable_to_non_nullable
                  as MappingCaptureSummary?,
        localSampleCount: null == localSampleCount
            ? _value.localSampleCount
            : localSampleCount // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingUploadCount: null == pendingUploadCount
            ? _value.pendingUploadCount
            : pendingUploadCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$MappingSessionUiStateImpl implements _MappingSessionUiState {
  const _$MappingSessionUiStateImpl({
    this.session,
    this.showResumePrompt = false,
    this.isBusy = false,
    this.errorMessage,
    this.finishSummary,
    this.localSampleCount = 0,
    this.pendingUploadCount = 0,
  });

  @override
  final MappingSession? session;

  /// True only right after cold-start recovery found a `CAPTURING`
  /// session that was actively being walked when the process died
  /// (spec §56) — cleared the moment the employee taps Resume or Stop.
  @override
  @JsonKey()
  final bool showResumePrompt;

  /// In-flight guard surfaced to the UI so a button can disable itself
  /// during start/finish/abandon — the actual concurrency guard lives in
  /// the notifier, this is display-only.
  @override
  @JsonKey()
  final bool isBusy;
  @override
  final String? errorMessage;
  @override
  final MappingCaptureSummary? finishSummary;
  @override
  @JsonKey()
  final int localSampleCount;
  @override
  @JsonKey()
  final int pendingUploadCount;

  @override
  String toString() {
    return 'MappingSessionUiState(session: $session, showResumePrompt: $showResumePrompt, isBusy: $isBusy, errorMessage: $errorMessage, finishSummary: $finishSummary, localSampleCount: $localSampleCount, pendingUploadCount: $pendingUploadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MappingSessionUiStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.showResumePrompt, showResumePrompt) ||
                other.showResumePrompt == showResumePrompt) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.finishSummary, finishSummary) ||
                other.finishSummary == finishSummary) &&
            (identical(other.localSampleCount, localSampleCount) ||
                other.localSampleCount == localSampleCount) &&
            (identical(other.pendingUploadCount, pendingUploadCount) ||
                other.pendingUploadCount == pendingUploadCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    showResumePrompt,
    isBusy,
    errorMessage,
    finishSummary,
    localSampleCount,
    pendingUploadCount,
  );

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MappingSessionUiStateImplCopyWith<_$MappingSessionUiStateImpl>
  get copyWith =>
      __$$MappingSessionUiStateImplCopyWithImpl<_$MappingSessionUiStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MappingSessionUiState implements MappingSessionUiState {
  const factory _MappingSessionUiState({
    final MappingSession? session,
    final bool showResumePrompt,
    final bool isBusy,
    final String? errorMessage,
    final MappingCaptureSummary? finishSummary,
    final int localSampleCount,
    final int pendingUploadCount,
  }) = _$MappingSessionUiStateImpl;

  @override
  MappingSession? get session;

  /// True only right after cold-start recovery found a `CAPTURING`
  /// session that was actively being walked when the process died
  /// (spec §56) — cleared the moment the employee taps Resume or Stop.
  @override
  bool get showResumePrompt;

  /// In-flight guard surfaced to the UI so a button can disable itself
  /// during start/finish/abandon — the actual concurrency guard lives in
  /// the notifier, this is display-only.
  @override
  bool get isBusy;
  @override
  String? get errorMessage;
  @override
  MappingCaptureSummary? get finishSummary;
  @override
  int get localSampleCount;
  @override
  int get pendingUploadCount;

  /// Create a copy of MappingSessionUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MappingSessionUiStateImplCopyWith<_$MappingSessionUiStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
