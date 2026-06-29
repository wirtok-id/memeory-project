// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeViewImpl _$$MemeViewImplFromJson(Map<String, dynamic> json) =>
    _$MemeViewImpl(
      id: (json['id'] as num).toInt(),
      memeId: json['memeId'] as String,
      userId: json['userId'] as String?,
      sessionId: json['sessionId'] as String?,
      ipHash: json['ipHash'] as String?,
      viewedAt: DateTime.parse(json['viewedAt'] as String),
    );

Map<String, dynamic> _$$MemeViewImplToJson(_$MemeViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memeId': instance.memeId,
      'userId': instance.userId,
      'sessionId': instance.sessionId,
      'ipHash': instance.ipHash,
      'viewedAt': instance.viewedAt.toIso8601String(),
    };
