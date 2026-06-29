// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentLog _$AgentLogFromJson(Map<String, dynamic> json) {
  return _AgentLog.fromJson(json);
}

/// @nodoc
mixin _$AgentLog {
  String get id => throw _privateConstructorUsedError;
  String get agentId => throw _privateConstructorUsedError;
  String get runId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get triggerType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get input => throw _privateConstructorUsedError;
  Map<String, dynamic>? get output => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get durationMs => throw _privateConstructorUsedError;
  int get itemsProcessed => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgentLogCopyWith<AgentLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentLogCopyWith<$Res> {
  factory $AgentLogCopyWith(AgentLog value, $Res Function(AgentLog) then) =
      _$AgentLogCopyWithImpl<$Res, AgentLog>;
  @useResult
  $Res call(
      {String id,
      String agentId,
      String runId,
      String status,
      String? triggerType,
      Map<String, dynamic>? input,
      Map<String, dynamic>? output,
      String? errorMessage,
      int? durationMs,
      int itemsProcessed,
      DateTime startedAt,
      DateTime? completedAt});
}

/// @nodoc
class _$AgentLogCopyWithImpl<$Res, $Val extends AgentLog>
    implements $AgentLogCopyWith<$Res> {
  _$AgentLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? agentId = null,
    Object? runId = null,
    Object? status = null,
    Object? triggerType = freezed,
    Object? input = freezed,
    Object? output = freezed,
    Object? errorMessage = freezed,
    Object? durationMs = freezed,
    Object? itemsProcessed = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      triggerType: freezed == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as String?,
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMs: freezed == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsProcessed: null == itemsProcessed
          ? _value.itemsProcessed
          : itemsProcessed // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentLogImplCopyWith<$Res>
    implements $AgentLogCopyWith<$Res> {
  factory _$$AgentLogImplCopyWith(
          _$AgentLogImpl value, $Res Function(_$AgentLogImpl) then) =
      __$$AgentLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String agentId,
      String runId,
      String status,
      String? triggerType,
      Map<String, dynamic>? input,
      Map<String, dynamic>? output,
      String? errorMessage,
      int? durationMs,
      int itemsProcessed,
      DateTime startedAt,
      DateTime? completedAt});
}

/// @nodoc
class __$$AgentLogImplCopyWithImpl<$Res>
    extends _$AgentLogCopyWithImpl<$Res, _$AgentLogImpl>
    implements _$$AgentLogImplCopyWith<$Res> {
  __$$AgentLogImplCopyWithImpl(
      _$AgentLogImpl _value, $Res Function(_$AgentLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? agentId = null,
    Object? runId = null,
    Object? status = null,
    Object? triggerType = freezed,
    Object? input = freezed,
    Object? output = freezed,
    Object? errorMessage = freezed,
    Object? durationMs = freezed,
    Object? itemsProcessed = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$AgentLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      triggerType: freezed == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as String?,
      input: freezed == input
          ? _value._input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      output: freezed == output
          ? _value._output
          : output // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMs: freezed == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsProcessed: null == itemsProcessed
          ? _value.itemsProcessed
          : itemsProcessed // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentLogImpl implements _AgentLog {
  const _$AgentLogImpl(
      {required this.id,
      required this.agentId,
      required this.runId,
      this.status = 'running',
      this.triggerType,
      final Map<String, dynamic>? input,
      final Map<String, dynamic>? output,
      this.errorMessage,
      this.durationMs,
      this.itemsProcessed = 0,
      required this.startedAt,
      this.completedAt})
      : _input = input,
        _output = output;

  factory _$AgentLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentLogImplFromJson(json);

  @override
  final String id;
  @override
  final String agentId;
  @override
  final String runId;
  @override
  @JsonKey()
  final String status;
  @override
  final String? triggerType;
  final Map<String, dynamic>? _input;
  @override
  Map<String, dynamic>? get input {
    final value = _input;
    if (value == null) return null;
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _output;
  @override
  Map<String, dynamic>? get output {
    final value = _output;
    if (value == null) return null;
    if (_output is EqualUnmodifiableMapView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorMessage;
  @override
  final int? durationMs;
  @override
  @JsonKey()
  final int itemsProcessed;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'AgentLog(id: $id, agentId: $agentId, runId: $runId, status: $status, triggerType: $triggerType, input: $input, output: $output, errorMessage: $errorMessage, durationMs: $durationMs, itemsProcessed: $itemsProcessed, startedAt: $startedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.triggerType, triggerType) ||
                other.triggerType == triggerType) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.itemsProcessed, itemsProcessed) ||
                other.itemsProcessed == itemsProcessed) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      agentId,
      runId,
      status,
      triggerType,
      const DeepCollectionEquality().hash(_input),
      const DeepCollectionEquality().hash(_output),
      errorMessage,
      durationMs,
      itemsProcessed,
      startedAt,
      completedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentLogImplCopyWith<_$AgentLogImpl> get copyWith =>
      __$$AgentLogImplCopyWithImpl<_$AgentLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentLogImplToJson(
      this,
    );
  }
}

abstract class _AgentLog implements AgentLog {
  const factory _AgentLog(
      {required final String id,
      required final String agentId,
      required final String runId,
      final String status,
      final String? triggerType,
      final Map<String, dynamic>? input,
      final Map<String, dynamic>? output,
      final String? errorMessage,
      final int? durationMs,
      final int itemsProcessed,
      required final DateTime startedAt,
      final DateTime? completedAt}) = _$AgentLogImpl;

  factory _AgentLog.fromJson(Map<String, dynamic> json) =
      _$AgentLogImpl.fromJson;

  @override
  String get id;
  @override
  String get agentId;
  @override
  String get runId;
  @override
  String get status;
  @override
  String? get triggerType;
  @override
  Map<String, dynamic>? get input;
  @override
  Map<String, dynamic>? get output;
  @override
  String? get errorMessage;
  @override
  int? get durationMs;
  @override
  int get itemsProcessed;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(ignore: true)
  _$$AgentLogImplCopyWith<_$AgentLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
