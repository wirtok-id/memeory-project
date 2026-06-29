import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'viral_prediction.freezed.dart';
part 'viral_prediction.g.dart';

@freezed
abstract class ViralPrediction with _$ViralPrediction {
  const factory ViralPrediction({
    required String id,
    required String memeId,
    @Default(0) int viralScore,
    @Default(ViralPredictionType.low) ViralPredictionType prediction,
    double? confidence,
    String? reasoningEn,
    String? reasoningId,
    Map<String, dynamic>? signals,
    required String modelUsed,
    required DateTime predictedAt,
    required DateTime validUntil,
  }) = _ViralPrediction;

  factory ViralPrediction.fromJson(Map<String, dynamic> json) => _$ViralPredictionFromJson(json);
}