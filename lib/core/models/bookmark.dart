import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String id,
    required String userId,
    required String memeId,
    required DateTime createdAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);
}