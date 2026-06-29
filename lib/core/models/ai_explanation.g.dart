// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AIExplanationImpl _$$AIExplanationImplFromJson(Map<String, dynamic> json) =>
    _$AIExplanationImpl(
      id: json['id'] as String,
      memeId: json['memeId'] as String,
      meaningEn: json['meaningEn'] as String,
      originEn: json['originEn'] as String,
      culturalContextEn: json['culturalContextEn'] as String,
      popularityReasonsEn: json['popularityReasonsEn'] as String,
      relatedEventsEn: json['relatedEventsEn'] as String?,
      meaningId: json['meaningId'] as String,
      originId: json['originId'] as String,
      culturalContextId: json['culturalContextId'] as String,
      popularityReasonsId: json['popularityReasonsId'] as String,
      relatedEventsId: json['relatedEventsId'] as String?,
      thumbsUp: (json['thumbsUp'] as num?)?.toInt() ?? 0,
      thumbsDown: (json['thumbsDown'] as num?)?.toInt() ?? 0,
      modelUsed: json['modelUsed'] as String,
      promptVersion: json['promptVersion'] as String? ?? '1.0',
      tokensUsed: (json['tokensUsed'] as num?)?.toInt(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$AIExplanationImplToJson(_$AIExplanationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memeId': instance.memeId,
      'meaningEn': instance.meaningEn,
      'originEn': instance.originEn,
      'culturalContextEn': instance.culturalContextEn,
      'popularityReasonsEn': instance.popularityReasonsEn,
      'relatedEventsEn': instance.relatedEventsEn,
      'meaningId': instance.meaningId,
      'originId': instance.originId,
      'culturalContextId': instance.culturalContextId,
      'popularityReasonsId': instance.popularityReasonsId,
      'relatedEventsId': instance.relatedEventsId,
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
      'modelUsed': instance.modelUsed,
      'promptVersion': instance.promptVersion,
      'tokensUsed': instance.tokensUsed,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
