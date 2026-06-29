// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_tag_relation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeTagRelationImpl _$$MemeTagRelationImplFromJson(
        Map<String, dynamic> json) =>
    _$MemeTagRelationImpl(
      memeId: json['memeId'] as String,
      tagId: (json['tagId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MemeTagRelationImplToJson(
        _$MemeTagRelationImpl instance) =>
    <String, dynamic>{
      'memeId': instance.memeId,
      'tagId': instance.tagId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
