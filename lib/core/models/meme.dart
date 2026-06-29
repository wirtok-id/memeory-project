import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'meme.freezed.dart';
part 'meme.g.dart';

@freezed
abstract class Meme with _$Meme {
  const factory Meme({
    required String id,
    required String title,
    required String slug,
    String? description,
    required String thumbnailUrl,
    String? mediaUrl,
    @Default(MediaType.image) MediaType mediaType,
    int? categoryId,
    String? templateName,
    String? textContent,
    String? emotion,
    int? qualityScore,
    @Default('en') String language,
    DateTime? originalDate,
    int? year,
    required DateTime ingestedAt,
    @Default(0) int viewCount,
    @Default(0) int bookmarkCount,
    @Default(0) int shareCount,
    @Default(false) bool isTrending,
    int? trendingRank,
    double? trendingScore,
    DateTime? lastTrendedAt,
    @Default(MemeStatus.pendingModeration) MemeStatus status,
    String? moderationNotes,
    List<double>? embedding,
    String? sourceUrl,
    @Default(false) bool isAdminCurated,
    String? createdBy,
    required DateTime updatedAt,
  }) = _Meme;

  factory Meme.fromJson(Map<String, dynamic> json) => _$MemeFromJson(json);
}