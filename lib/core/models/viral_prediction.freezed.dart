// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viral_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViralPrediction _$ViralPredictionFromJson(Map<String, dynamic> json) {
  return _ViralPrediction.fromJson(json);
}

/// @nodoc
mixin _$ViralPrediction {
  String get id => throw _privateConstructorUsedError;
  String get memeId => throw _privateConstructorUsedError;
  int get viralScore => throw _privateConstructorUsedError;
  ViralPredictionType get prediction => throw _privateConstructorUsedError;
  double? get confidence => throw _privateConstructorUsedError;
  String? get reasoningEn => throw _privateConstructorUsedError;
  String? get reasoningId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get signals => throw _privateConstructorUsedError;
  String get modelUsed => throw _privateConstructorUsedError;
  DateTime get predictedAt => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralPredictionCopyWith<ViralPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralPredictionCopyWith<$Res> {
  factory $ViralPredictionCopyWith(
          ViralPrediction value, $Res Function(ViralPrediction) then) =
      _$ViralPredictionCopyWithImpl<$Res, ViralPrediction>;
  @useResult
  $Res call(
      {String id,
      String memeId,
      int viralScore,
      ViralPredictionType prediction,
      double? confidence,
      String? reasoningEn,
      String? reasoningId,
      Map<String, dynamic>? signals,
      String modelUsed,
      DateTime predictedAt,
      DateTime validUntil});
}

/// @nodoc
class _$ViralPredictionCopyWithImpl<$Res, $Val extends ViralPrediction>
    implements $ViralPredictionCopyWith<$Res> {
  _$ViralPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? viralScore = null,
    Object? prediction = null,
    Object? confidence = freezed,
    Object? reasoningEn = freezed,
    Object? reasoningId = freezed,
    Object? signals = freezed,
    Object? modelUsed = null,
    Object? predictedAt = null,
    Object? validUntil = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      viralScore: null == viralScore
          ? _value.viralScore
          : viralScore // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as ViralPredictionType,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      reasoningEn: freezed == reasoningEn
          ? _value.reasoningEn
          : reasoningEn // ignore: cast_nullable_to_non_nullable
              as String?,
      reasoningId: freezed == reasoningId
          ? _value.reasoningId
          : reasoningId // ignore: cast_nullable_to_non_nullable
              as String?,
      signals: freezed == signals
          ? _value.signals
          : signals // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      modelUsed: null == modelUsed
          ? _value.modelUsed
          : modelUsed // ignore: cast_nullable_to_non_nullable
              as String,
      predictedAt: null == predictedAt
          ? _value.predictedAt
          : predictedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViralPredictionImplCopyWith<$Res>
    implements $ViralPredictionCopyWith<$Res> {
  factory _$$ViralPredictionImplCopyWith(_$ViralPredictionImpl value,
          $Res Function(_$ViralPredictionImpl) then) =
      __$$ViralPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String memeId,
      int viralScore,
      ViralPredictionType prediction,
      double? confidence,
      String? reasoningEn,
      String? reasoningId,
      Map<String, dynamic>? signals,
      String modelUsed,
      DateTime predictedAt,
      DateTime validUntil});
}

/// @nodoc
class __$$ViralPredictionImplCopyWithImpl<$Res>
    extends _$ViralPredictionCopyWithImpl<$Res, _$ViralPredictionImpl>
    implements _$$ViralPredictionImplCopyWith<$Res> {
  __$$ViralPredictionImplCopyWithImpl(
      _$ViralPredictionImpl _value, $Res Function(_$ViralPredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? viralScore = null,
    Object? prediction = null,
    Object? confidence = freezed,
    Object? reasoningEn = freezed,
    Object? reasoningId = freezed,
    Object? signals = freezed,
    Object? modelUsed = null,
    Object? predictedAt = null,
    Object? validUntil = null,
  }) {
    return _then(_$ViralPredictionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      viralScore: null == viralScore
          ? _value.viralScore
          : viralScore // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as ViralPredictionType,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      reasoningEn: freezed == reasoningEn
          ? _value.reasoningEn
          : reasoningEn // ignore: cast_nullable_to_non_nullable
              as String?,
      reasoningId: freezed == reasoningId
          ? _value.reasoningId
          : reasoningId // ignore: cast_nullable_to_non_nullable
              as String?,
      signals: freezed == signals
          ? _value._signals
          : signals // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      modelUsed: null == modelUsed
          ? _value.modelUsed
          : modelUsed // ignore: cast_nullable_to_non_nullable
              as String,
      predictedAt: null == predictedAt
          ? _value.predictedAt
          : predictedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViralPredictionImpl implements _ViralPrediction {
  const _$ViralPredictionImpl(
      {required this.id,
      required this.memeId,
      this.viralScore = 0,
      this.prediction = ViralPredictionType.low,
      this.confidence,
      this.reasoningEn,
      this.reasoningId,
      final Map<String, dynamic>? signals,
      required this.modelUsed,
      required this.predictedAt,
      required this.validUntil})
      : _signals = signals;

  factory _$ViralPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViralPredictionImplFromJson(json);

  @override
  final String id;
  @override
  final String memeId;
  @override
  @JsonKey()
  final int viralScore;
  @override
  @JsonKey()
  final ViralPredictionType prediction;
  @override
  final double? confidence;
  @override
  final String? reasoningEn;
  @override
  final String? reasoningId;
  final Map<String, dynamic>? _signals;
  @override
  Map<String, dynamic>? get signals {
    final value = _signals;
    if (value == null) return null;
    if (_signals is EqualUnmodifiableMapView) return _signals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String modelUsed;
  @override
  final DateTime predictedAt;
  @override
  final DateTime validUntil;

  @override
  String toString() {
    return 'ViralPrediction(id: $id, memeId: $memeId, viralScore: $viralScore, prediction: $prediction, confidence: $confidence, reasoningEn: $reasoningEn, reasoningId: $reasoningId, signals: $signals, modelUsed: $modelUsed, predictedAt: $predictedAt, validUntil: $validUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViralPredictionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memeId, memeId) || other.memeId == memeId) &&
            (identical(other.viralScore, viralScore) ||
                other.viralScore == viralScore) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.reasoningEn, reasoningEn) ||
                other.reasoningEn == reasoningEn) &&
            (identical(other.reasoningId, reasoningId) ||
                other.reasoningId == reasoningId) &&
            const DeepCollectionEquality().equals(other._signals, _signals) &&
            (identical(other.modelUsed, modelUsed) ||
                other.modelUsed == modelUsed) &&
            (identical(other.predictedAt, predictedAt) ||
                other.predictedAt == predictedAt) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      memeId,
      viralScore,
      prediction,
      confidence,
      reasoningEn,
      reasoningId,
      const DeepCollectionEquality().hash(_signals),
      modelUsed,
      predictedAt,
      validUntil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViralPredictionImplCopyWith<_$ViralPredictionImpl> get copyWith =>
      __$$ViralPredictionImplCopyWithImpl<_$ViralPredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViralPredictionImplToJson(
      this,
    );
  }
}

abstract class _ViralPrediction implements ViralPrediction {
  const factory _ViralPrediction(
      {required final String id,
      required final String memeId,
      final int viralScore,
      final ViralPredictionType prediction,
      final double? confidence,
      final String? reasoningEn,
      final String? reasoningId,
      final Map<String, dynamic>? signals,
      required final String modelUsed,
      required final DateTime predictedAt,
      required final DateTime validUntil}) = _$ViralPredictionImpl;

  factory _ViralPrediction.fromJson(Map<String, dynamic> json) =
      _$ViralPredictionImpl.fromJson;

  @override
  String get id;
  @override
  String get memeId;
  @override
  int get viralScore;
  @override
  ViralPredictionType get prediction;
  @override
  double? get confidence;
  @override
  String? get reasoningEn;
  @override
  String? get reasoningId;
  @override
  Map<String, dynamic>? get signals;
  @override
  String get modelUsed;
  @override
  DateTime get predictedAt;
  @override
  DateTime get validUntil;
  @override
  @JsonKey(ignore: true)
  _$$ViralPredictionImplCopyWith<_$ViralPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
