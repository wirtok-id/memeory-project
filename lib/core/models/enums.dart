import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum MediaType {
  @JsonValue('image')
  image,
  @JsonValue('gif')
  gif,
  @JsonValue('video')
  video,
  @JsonValue('text')
  text;
}

@JsonEnum(valueField: 'value')
enum MemeStatus {
  @JsonValue('pending_moderation')
  pendingModeration,
  @JsonValue('pending_analysis')
  pendingAnalysis,
  @JsonValue('active')
  active,
  @JsonValue('flagged')
  flagged,
  @JsonValue('rejected')
  rejected,
  @JsonValue('archived')
  archived;
}

@JsonEnum(valueField: 'value')
enum MemeEmotion {
  @JsonValue('funny')
  funny,
  @JsonValue('ironic')
  ironic,
  @JsonValue('relatable')
  relatable,
  @JsonValue('wholesome')
  wholesome,
  @JsonValue('dark')
  dark,
  @JsonValue('cringe')
  cringe,
  @JsonValue('inspiring')
  inspiring,
  @JsonValue('other')
  other;
}

@JsonEnum(valueField: 'value')
enum MemeMediaType {
  @JsonValue('image')
  image,
  @JsonValue('gif')
  gif,
  @JsonValue('video')
  video,
  @JsonValue('text')
  text;
}

@JsonEnum(valueField: 'value')
enum MemeSort {
  @JsonValue('relevance')
  relevance,
  @JsonValue('newest')
  newest,
  @JsonValue('most_viewed')
  mostViewed,
  @JsonValue('quality')
  quality;
}

@JsonEnum(valueField: 'value')
enum ViralPrediction {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('very_high')
  veryHigh;
}

@JsonEnum(valueField: 'value')
enum MemeStatusFilter {
  @JsonValue('all')
  all,
  @JsonValue('active')
  active,
  @JsonValue('pending')
  pending,
  @JsonValue('flagged')
  flagged,
  @JsonValue('rejected')
  rejected;
}

@JsonEnum(valueField: 'value')
enum Platform {
  @JsonValue('reddit')
  reddit,
  @JsonValue('tiktok')
  tiktok,
  @JsonValue('youtube')
  youtube,
  @JsonValue('twitter')
  twitter,
  @JsonValue('instagram')
  instagram,
  @JsonValue('admin')
  admin,
  @JsonValue('other')
  other;
}

@JsonEnum(valueField: 'value')
enum ViralPredictionType {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('very_high')
  veryHigh;
}