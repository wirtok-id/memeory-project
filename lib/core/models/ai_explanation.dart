import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_explanation.freezed.dart';
part 'ai_explanation.g.dart';

@freezed
abstract class AIExplanation with _$AIExplanation {
  const factory AIExplanation({
    required String id,
    required String memeId,
    required String meaningEn,
    required String originEn,
    required String culturalContextEn,
    required String popularityReasonsEn,
    String? relatedEventsEn,
    required String meaningId,
    required String originId,
    required String culturalContextId,
    required String popularityReasonsId,
    String? relatedEventsId,
    @Default(0) int thumbsUp,
    @Default(0) int thumbsDown,
    required String modelUsed,
    @Default('1.0') String promptVersion,
    int? tokensUsed,
    required DateTime generatedAt,
    required DateTime expiresAt,
  }) = _AIExplanation;

  factory AIExplanation.fromJson(Map<String, dynamic> json) => _$AIExplanationFromJson(json);
}