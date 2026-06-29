// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeTagImpl _$$MemeTagImplFromJson(Map<String, dynamic> json) =>
    _$MemeTagImpl(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
      usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MemeTagImplToJson(_$MemeTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'usageCount': instance.usageCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
