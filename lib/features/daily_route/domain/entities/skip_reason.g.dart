// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skip_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkipReasonImpl _$$SkipReasonImplFromJson(Map<String, dynamic> json) =>
    _$SkipReasonImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      label: json['label'] as String,
      requiresNotes: json['requiresNotes'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$SkipReasonImplToJson(_$SkipReasonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'requiresNotes': instance.requiresNotes,
      'isActive': instance.isActive,
    };
