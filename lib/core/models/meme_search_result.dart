import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_search_result.freezed.dart';
part 'meme_search_result.g.dart';

@freezed
abstract class MemeSearchResult with _$MemeSearchResult {
  const factory MemeSearchResult({
    required String id,
    required String title,
    required String thumbnailUrl,
    required int year,
    required int viewCount,
    required bool isTrending,
    int? qualityScore,
    String? categorySlug,
    double? rank,
  }) = _MemeSearchResult;

  factory MemeSearchResult.fromJson(Map<String, dynamic> json) => _$MemeSearchResultFromJson(json);
}