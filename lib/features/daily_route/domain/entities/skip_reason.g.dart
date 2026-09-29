// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skip_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SkipReason _$SkipReasonFromJson(Map<String, dynamic> json) => _SkipReason(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  label: json['label'] as String,
  requiresNotes: json['requiresNotes'] as bool? ?? false,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$SkipReasonToJson(_SkipReason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'requiresNotes': instance.requiresNotes,
      'isActive': instance.isActive,
    };
