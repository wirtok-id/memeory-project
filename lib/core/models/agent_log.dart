import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_log.freezed.dart';
part 'agent_log.g.dart';

@freezed
abstract class AgentLog with _$AgentLog {
  const factory AgentLog({
    required String id,
    required String agentId,
    required String runId,
    @Default('running') String status,
    String? triggerType,
    Map<String, dynamic>? input,
    Map<String, dynamic>? output,
    String? errorMessage,
    int? durationMs,
    @Default(0) int itemsProcessed,
    required DateTime startedAt,
    DateTime? completedAt,
  }) = _AgentLog;

  factory AgentLog.fromJson(Map<String, dynamic> json) => _$AgentLogFromJson(json);
}