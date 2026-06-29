import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_tag.freezed.dart';
part 'meme_tag.g.dart';

@freezed
abstract class MemeTag with _$MemeTag {
  const factory MemeTag({
    required int id,
    required String slug,
    required String name,
    @Default(0) int usageCount,
    required DateTime createdAt,
  }) = _MemeTag;

  factory MemeTag.fromJson(Map<String, dynamic> json) => _$MemeTagFromJson(json);
}