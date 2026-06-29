// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeImpl _$$MemeImplFromJson(Map<String, dynamic> json) => _$MemeImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String,
      mediaUrl: json['mediaUrl'] as String?,
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['mediaType']) ??
          MediaType.image,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      templateName: json['templateName'] as String?,
      textContent: json['textContent'] as String?,
      emotion: json['emotion'] as String?,
      qualityScore: (json['qualityScore'] as num?)?.toInt(),
      language: json['language'] as String? ?? 'en',
      originalDate: json['originalDate'] == null
          ? null
          : DateTime.parse(json['originalDate'] as String),
      year: (json['year'] as num?)?.toInt(),
      ingestedAt: DateTime.parse(json['ingestedAt'] as String),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      bookmarkCount: (json['bookmarkCount'] as num?)?.toInt() ?? 0,
      shareCount: (json['shareCount'] as num?)?.toInt() ?? 0,
      isTrending: json['isTrending'] as bool? ?? false,
      trendingRank: (json['trendingRank'] as num?)?.toInt(),
      trendingScore: (json['trendingScore'] as num?)?.toDouble(),
      lastTrendedAt: json['lastTrendedAt'] == null
          ? null
          : DateTime.parse(json['lastTrendedAt'] as String),
      status: $enumDecodeNullable(_$MemeStatusEnumMap, json['status']) ??
          MemeStatus.pendingModeration,
      moderationNotes: json['moderationNotes'] as String?,
      embedding: (json['embedding'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      sourceUrl: json['sourceUrl'] as String?,
      isAdminCurated: json['isAdminCurated'] as bool? ?? false,
      createdBy: json['createdBy'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MemeImplToJson(_$MemeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaUrl': instance.mediaUrl,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'categoryId': instance.categoryId,
      'templateName': instance.templateName,
      'textContent': instance.textContent,
      'emotion': instance.emotion,
      'qualityScore': instance.qualityScore,
      'language': instance.language,
      'originalDate': instance.originalDate?.toIso8601String(),
      'year': instance.year,
      'ingestedAt': instance.ingestedAt.toIso8601String(),
      'viewCount': instance.viewCount,
      'bookmarkCount': instance.bookmarkCount,
      'shareCount': instance.shareCount,
      'isTrending': instance.isTrending,
      'trendingRank': instance.trendingRank,
      'trendingScore': instance.trendingScore,
      'lastTrendedAt': instance.lastTrendedAt?.toIso8601String(),
      'status': _$MemeStatusEnumMap[instance.status]!,
      'moderationNotes': instance.moderationNotes,
      'embedding': instance.embedding,
      'sourceUrl': instance.sourceUrl,
      'isAdminCurated': instance.isAdminCurated,
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.gif: 'gif',
  MediaType.video: 'video',
  MediaType.text: 'text',
};

const _$MemeStatusEnumMap = {
  MemeStatus.pendingModeration: 'pending_moderation',
  MemeStatus.pendingAnalysis: 'pending_analysis',
  MemeStatus.active: 'active',
  MemeStatus.flagged: 'flagged',
  MemeStatus.rejected: 'rejected',
  MemeStatus.archived: 'archived',
};
