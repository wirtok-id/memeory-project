// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viral_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViralPredictionImpl _$$ViralPredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$ViralPredictionImpl(
      id: json['id'] as String,
      memeId: json['memeId'] as String,
      viralScore: (json['viralScore'] as num?)?.toInt() ?? 0,
      prediction: $enumDecodeNullable(
              _$ViralPredictionTypeEnumMap, json['prediction']) ??
          ViralPredictionType.low,
      confidence: (json['confidence'] as num?)?.toDouble(),
      reasoningEn: json['reasoningEn'] as String?,
      reasoningId: json['reasoningId'] as String?,
      signals: json['signals'] as Map<String, dynamic>?,
      modelUsed: json['modelUsed'] as String,
      predictedAt: DateTime.parse(json['predictedAt'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
    );

Map<String, dynamic> _$$ViralPredictionImplToJson(
        _$ViralPredictionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memeId': instance.memeId,
      'viralScore': instance.viralScore,
      'prediction': _$ViralPredictionTypeEnumMap[instance.prediction]!,
      'confidence': instance.confidence,
      'reasoningEn': instance.reasoningEn,
      'reasoningId': instance.reasoningId,
      'signals': instance.signals,
      'modelUsed': instance.modelUsed,
      'predictedAt': instance.predictedAt.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
    };

const _$ViralPredictionTypeEnumMap = {
  ViralPredictionType.low: 'low',
  ViralPredictionType.medium: 'medium',
  ViralPredictionType.high: 'high',
  ViralPredictionType.veryHigh: 'very_high',
};
