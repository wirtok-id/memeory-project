// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemeSource _$MemeSourceFromJson(Map<String, dynamic> json) {
  return _MemeSource.fromJson(json);
}

/// @nodoc
mixin _$MemeSource {
  String get id => throw _privateConstructorUsedError;
  String get memeId => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  String? get sourceAuthor => throw _privateConstructorUsedError;
  String? get sourceTitle => throw _privateConstructorUsedError;
  Map<String, dynamic>? get engagement => throw _privateConstructorUsedError;
  DateTime get discoveredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeSourceCopyWith<MemeSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeSourceCopyWith<$Res> {
  factory $MemeSourceCopyWith(
          MemeSource value, $Res Function(MemeSource) then) =
      _$MemeSourceCopyWithImpl<$Res, MemeSource>;
  @useResult
  $Res call(
      {String id,
      String memeId,
      String platform,
      String sourceUrl,
      String? sourceId,
      String? sourceAuthor,
      String? sourceTitle,
      Map<String, dynamic>? engagement,
      DateTime discoveredAt});
}

/// @nodoc
class _$MemeSourceCopyWithImpl<$Res, $Val extends MemeSource>
    implements $MemeSourceCopyWith<$Res> {
  _$MemeSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? platform = null,
    Object? sourceUrl = null,
    Object? sourceId = freezed,
    Object? sourceAuthor = freezed,
    Object? sourceTitle = freezed,
    Object? engagement = freezed,
    Object? discoveredAt = null,
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
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAuthor: freezed == sourceAuthor
          ? _value.sourceAuthor
          : sourceAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceTitle: freezed == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      engagement: freezed == engagement
          ? _value.engagement
          : engagement // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      discoveredAt: null == discoveredAt
          ? _value.discoveredAt
          : discoveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeSourceImplCopyWith<$Res>
    implements $MemeSourceCopyWith<$Res> {
  factory _$$MemeSourceImplCopyWith(
          _$MemeSourceImpl value, $Res Function(_$MemeSourceImpl) then) =
      __$$MemeSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String memeId,
      String platform,
      String sourceUrl,
      String? sourceId,
      String? sourceAuthor,
      String? sourceTitle,
      Map<String, dynamic>? engagement,
      DateTime discoveredAt});
}

/// @nodoc
class __$$MemeSourceImplCopyWithImpl<$Res>
    extends _$MemeSourceCopyWithImpl<$Res, _$MemeSourceImpl>
    implements _$$MemeSourceImplCopyWith<$Res> {
  __$$MemeSourceImplCopyWithImpl(
      _$MemeSourceImpl _value, $Res Function(_$MemeSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? platform = null,
    Object? sourceUrl = null,
    Object? sourceId = freezed,
    Object? sourceAuthor = freezed,
    Object? sourceTitle = freezed,
    Object? engagement = freezed,
    Object? discoveredAt = null,
  }) {
    return _then(_$MemeSourceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAuthor: freezed == sourceAuthor
          ? _value.sourceAuthor
          : sourceAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceTitle: freezed == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      engagement: freezed == engagement
          ? _value._engagement
          : engagement // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      discoveredAt: null == discoveredAt
          ? _value.discoveredAt
          : discoveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemeSourceImpl implements _MemeSource {
  const _$MemeSourceImpl(
      {required this.id,
      required this.memeId,
      required this.platform,
      required this.sourceUrl,
      this.sourceId,
      this.sourceAuthor,
      this.sourceTitle,
      final Map<String, dynamic>? engagement,
      required this.discoveredAt})
      : _engagement = engagement;

  factory _$MemeSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeSourceImplFromJson(json);

  @override
  final String id;
  @override
  final String memeId;
  @override
  final String platform;
  @override
  final String sourceUrl;
  @override
  final String? sourceId;
  @override
  final String? sourceAuthor;
  @override
  final String? sourceTitle;
  final Map<String, dynamic>? _engagement;
  @override
  Map<String, dynamic>? get engagement {
    final value = _engagement;
    if (value == null) return null;
    if (_engagement is EqualUnmodifiableMapView) return _engagement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime discoveredAt;

  @override
  String toString() {
    return 'MemeSource(id: $id, memeId: $memeId, platform: $platform, sourceUrl: $sourceUrl, sourceId: $sourceId, sourceAuthor: $sourceAuthor, sourceTitle: $sourceTitle, engagement: $engagement, discoveredAt: $discoveredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memeId, memeId) || other.memeId == memeId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceAuthor, sourceAuthor) ||
                other.sourceAuthor == sourceAuthor) &&
            (identical(other.sourceTitle, sourceTitle) ||
                other.sourceTitle == sourceTitle) &&
            const DeepCollectionEquality()
                .equals(other._engagement, _engagement) &&
            (identical(other.discoveredAt, discoveredAt) ||
                other.discoveredAt == discoveredAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      memeId,
      platform,
      sourceUrl,
      sourceId,
      sourceAuthor,
      sourceTitle,
      const DeepCollectionEquality().hash(_engagement),
      discoveredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeSourceImplCopyWith<_$MemeSourceImpl> get copyWith =>
      __$$MemeSourceImplCopyWithImpl<_$MemeSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeSourceImplToJson(
      this,
    );
  }
}

abstract class _MemeSource implements MemeSource {
  const factory _MemeSource(
      {required final String id,
      required final String memeId,
      required final String platform,
      required final String sourceUrl,
      final String? sourceId,
      final String? sourceAuthor,
      final String? sourceTitle,
      final Map<String, dynamic>? engagement,
      required final DateTime discoveredAt}) = _$MemeSourceImpl;

  factory _MemeSource.fromJson(Map<String, dynamic> json) =
      _$MemeSourceImpl.fromJson;

  @override
  String get id;
  @override
  String get memeId;
  @override
  String get platform;
  @override
  String get sourceUrl;
  @override
  String? get sourceId;
  @override
  String? get sourceAuthor;
  @override
  String? get sourceTitle;
  @override
  Map<String, dynamic>? get engagement;
  @override
  DateTime get discoveredAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeSourceImplCopyWith<_$MemeSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
