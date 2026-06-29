// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeSearchResultImpl _$$MemeSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MemeSearchResultImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      year: (json['year'] as num).toInt(),
      viewCount: (json['viewCount'] as num).toInt(),
      isTrending: json['isTrending'] as bool,
      qualityScore: (json['qualityScore'] as num?)?.toInt(),
      categorySlug: json['categorySlug'] as String?,
      rank: (json['rank'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MemeSearchResultImplToJson(
        _$MemeSearchResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'year': instance.year,
      'viewCount': instance.viewCount,
      'isTrending': instance.isTrending,
      'qualityScore': instance.qualityScore,
      'categorySlug': instance.categorySlug,
      'rank': instance.rank,
    };
