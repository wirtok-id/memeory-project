// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      preferredLocale: json['preferredLocale'] as String? ?? 'id',
      themePreference: json['themePreference'] as String? ?? 'system',
      bookmarkCount: (json['bookmarkCount'] as num?)?.toInt() ?? 0,
      memeViewsCount: (json['memeViewsCount'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? 'user',
      isVerified: json['isVerified'] as bool? ?? false,
      isBanned: json['isBanned'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'preferredLocale': instance.preferredLocale,
      'themePreference': instance.themePreference,
      'bookmarkCount': instance.bookmarkCount,
      'memeViewsCount': instance.memeViewsCount,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'isBanned': instance.isBanned,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
