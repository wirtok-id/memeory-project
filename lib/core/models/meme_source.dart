import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_source.freezed.dart';
part 'meme_source.g.dart';

@freezed
abstract class MemeSource with _$MemeSource {
  const factory MemeSource({
    required String id,
    required String memeId,
    required String platform,
    required String sourceUrl,
    String? sourceId,
    String? sourceAuthor,
    String? sourceTitle,
    Map<String, dynamic>? engagement,
    required DateTime discoveredAt,
  }) = _MemeSource;

  factory MemeSource.fromJson(Map<String, dynamic> json) => _$MemeSourceFromJson(json);
}