import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_category.freezed.dart';
part 'meme_category.g.dart';

@freezed
abstract class MemeCategory with _$MemeCategory {
  const factory MemeCategory({
    required int id,
    required String slug,
    required String nameEn,
    required String nameId,
    String? icon,
    String? colorHex,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _MemeCategory;

  factory MemeCategory.fromJson(Map<String, dynamic> json) => _$MemeCategoryFromJson(json);
}