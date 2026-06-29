import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_tag_relation.freezed.dart';
part 'meme_tag_relation.g.dart';

@freezed
abstract class MemeTagRelation with _$MemeTagRelation {
  const factory MemeTagRelation({
    required String memeId,
    required int tagId,
    required DateTime createdAt,
  }) = _MemeTagRelation;

  factory MemeTagRelation.fromJson(Map<String, dynamic> json) => _$MemeTagRelationFromJson(json);
}