// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentLogImpl _$$AgentLogImplFromJson(Map<String, dynamic> json) =>
    _$AgentLogImpl(
      id: json['id'] as String,
      agentId: json['agentId'] as String,
      runId: json['runId'] as String,
      status: json['status'] as String? ?? 'running',
      triggerType: json['triggerType'] as String?,
      input: json['input'] as Map<String, dynamic>?,
      output: json['output'] as Map<String, dynamic>?,
      errorMessage: json['errorMessage'] as String?,
      durationMs: (json['durationMs'] as num?)?.toInt(),
      itemsProcessed: (json['itemsProcessed'] as num?)?.toInt() ?? 0,
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$AgentLogImplToJson(_$AgentLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agentId': instance.agentId,
      'runId': instance.runId,
      'status': instance.status,
      'triggerType': instance.triggerType,
      'input': instance.input,
      'output': instance.output,
      'errorMessage': instance.errorMessage,
      'durationMs': instance.durationMs,
      'itemsProcessed': instance.itemsProcessed,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };
