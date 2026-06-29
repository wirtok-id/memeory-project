// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeSourceImpl _$$MemeSourceImplFromJson(Map<String, dynamic> json) =>
    _$MemeSourceImpl(
      id: json['id'] as String,
      memeId: json['memeId'] as String,
      platform: json['platform'] as String,
      sourceUrl: json['sourceUrl'] as String,
      sourceId: json['sourceId'] as String?,
      sourceAuthor: json['sourceAuthor'] as String?,
      sourceTitle: json['sourceTitle'] as String?,
      engagement: json['engagement'] as Map<String, dynamic>?,
      discoveredAt: DateTime.parse(json['discoveredAt'] as String),
    );

Map<String, dynamic> _$$MemeSourceImplToJson(_$MemeSourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memeId': instance.memeId,
      'platform': instance.platform,
      'sourceUrl': instance.sourceUrl,
      'sourceId': instance.sourceId,
      'sourceAuthor': instance.sourceAuthor,
      'sourceTitle': instance.sourceTitle,
      'engagement': instance.engagement,
      'discoveredAt': instance.discoveredAt.toIso8601String(),
    };
