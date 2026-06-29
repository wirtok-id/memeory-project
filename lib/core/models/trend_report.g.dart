// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendReportImpl _$$TrendReportImplFromJson(Map<String, dynamic> json) =>
    _$TrendReportImpl(
      id: json['id'] as String,
      reportDate: DateTime.parse(json['reportDate'] as String),
      summaryEn: json['summaryEn'] as String,
      summaryId: json['summaryId'] as String,
      topMemeIds: (json['topMemeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      trendingCategories: (json['trendingCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      emergingTrends: (json['emergingTrends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      totalMemesIngested: (json['totalMemesIngested'] as num?)?.toInt() ?? 0,
      totalViews: (json['totalViews'] as num?)?.toInt() ?? 0,
      newTrendingCount: (json['newTrendingCount'] as num?)?.toInt() ?? 0,
      modelUsed: json['modelUsed'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$TrendReportImplToJson(_$TrendReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportDate': instance.reportDate.toIso8601String(),
      'summaryEn': instance.summaryEn,
      'summaryId': instance.summaryId,
      'topMemeIds': instance.topMemeIds,
      'trendingCategories': instance.trendingCategories,
      'emergingTrends': instance.emergingTrends,
      'totalMemesIngested': instance.totalMemesIngested,
      'totalViews': instance.totalViews,
      'newTrendingCount': instance.newTrendingCount,
      'modelUsed': instance.modelUsed,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
