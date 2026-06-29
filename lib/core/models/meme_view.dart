import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_view.freezed.dart';
part 'meme_view.g.dart';

@freezed
abstract class MemeView with _$MemeView {
  const factory MemeView({
    required int id,
    required String memeId,
    String? userId,
    String? sessionId,
    String? ipHash,
    required DateTime viewedAt,
  }) = _MemeView;

  factory MemeView.fromJson(Map<String, dynamic> json) => _$MemeViewFromJson(json);
}