// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      memeId: json['memeId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'memeId': instance.memeId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
