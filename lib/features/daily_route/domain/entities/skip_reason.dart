import 'package:freezed_annotation/freezed_annotation.dart';

part 'skip_reason.freezed.dart';
part 'skip_reason.g.dart';

/// Skip reason entity representing a reason for skipping a visit.
@freezed
abstract class SkipReason with _$SkipReason {
  const factory SkipReason({
    required int id,
    required String code,
    required String label,
    @Default(false) bool requiresNotes,
    @Default(true) bool isActive,
  }) = _SkipReason;

  factory SkipReason.fromJson(Map<String, dynamic> json) =>
      _$SkipReasonFromJson(json);
}
