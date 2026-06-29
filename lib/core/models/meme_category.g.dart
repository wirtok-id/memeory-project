// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemeCategoryImpl _$$MemeCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MemeCategoryImpl(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      nameEn: json['nameEn'] as String,
      nameId: json['nameId'] as String,
      icon: json['icon'] as String?,
      colorHex: json['colorHex'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MemeCategoryImplToJson(_$MemeCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'nameEn': instance.nameEn,
      'nameId': instance.nameId,
      'icon': instance.icon,
      'colorHex': instance.colorHex,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
