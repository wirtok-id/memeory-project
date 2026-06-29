import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend_report.freezed.dart';
part 'trend_report.g.dart';

@freezed
abstract class TrendReport with _$TrendReport {
  const factory TrendReport({
    required String id,
    required DateTime reportDate,
    required String summaryEn,
    required String summaryId,
    @Default([]) List<String> topMemeIds,
    @Default([]) List<String> trendingCategories,
    @Default([]) List<String> emergingTrends,
    @Default(0) int totalMemesIngested,
    @Default(0) int totalViews,
    @Default(0) int newTrendingCount,
    required String modelUsed,
    required DateTime generatedAt,
  }) = _TrendReport;

  factory TrendReport.fromJson(Map<String, dynamic> json) => _$TrendReportFromJson(json);
}