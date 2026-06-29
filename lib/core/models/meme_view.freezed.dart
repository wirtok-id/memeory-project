// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemeView _$MemeViewFromJson(Map<String, dynamic> json) {
  return _MemeView.fromJson(json);
}

/// @nodoc
mixin _$MemeView {
  int get id => throw _privateConstructorUsedError;
  String get memeId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get ipHash => throw _privateConstructorUsedError;
  DateTime get viewedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeViewCopyWith<MemeView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeViewCopyWith<$Res> {
  factory $MemeViewCopyWith(MemeView value, $Res Function(MemeView) then) =
      _$MemeViewCopyWithImpl<$Res, MemeView>;
  @useResult
  $Res call(
      {int id,
      String memeId,
      String? userId,
      String? sessionId,
      String? ipHash,
      DateTime viewedAt});
}

/// @nodoc
class _$MemeViewCopyWithImpl<$Res, $Val extends MemeView>
    implements $MemeViewCopyWith<$Res> {
  _$MemeViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? userId = freezed,
    Object? sessionId = freezed,
    Object? ipHash = freezed,
    Object? viewedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      ipHash: freezed == ipHash
          ? _value.ipHash
          : ipHash // ignore: cast_nullable_to_non_nullable
              as String?,
      viewedAt: null == viewedAt
          ? _value.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeViewImplCopyWith<$Res>
    implements $MemeViewCopyWith<$Res> {
  factory _$$MemeViewImplCopyWith(
          _$MemeViewImpl value, $Res Function(_$MemeViewImpl) then) =
      __$$MemeViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String memeId,
      String? userId,
      String? sessionId,
      String? ipHash,
      DateTime viewedAt});
}

/// @nodoc
class __$$MemeViewImplCopyWithImpl<$Res>
    extends _$MemeViewCopyWithImpl<$Res, _$MemeViewImpl>
    implements _$$MemeViewImplCopyWith<$Res> {
  __$$MemeViewImplCopyWithImpl(
      _$MemeViewImpl _value, $Res Function(_$MemeViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memeId = null,
    Object? userId = freezed,
    Object? sessionId = freezed,
    Object? ipHash = freezed,
    Object? viewedAt = null,
  }) {
    return _then(_$MemeViewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      ipHash: freezed == ipHash
          ? _value.ipHash
          : ipHash // ignore: cast_nullable_to_non_nullable
              as String?,
      viewedAt: null == viewedAt
          ? _value.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemeViewImpl implements _MemeView {
  const _$MemeViewImpl(
      {required this.id,
      required this.memeId,
      this.userId,
      this.sessionId,
      this.ipHash,
      required this.viewedAt});

  factory _$MemeViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeViewImplFromJson(json);

  @override
  final int id;
  @override
  final String memeId;
  @override
  final String? userId;
  @override
  final String? sessionId;
  @override
  final String? ipHash;
  @override
  final DateTime viewedAt;

  @override
  String toString() {
    return 'MemeView(id: $id, memeId: $memeId, userId: $userId, sessionId: $sessionId, ipHash: $ipHash, viewedAt: $viewedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memeId, memeId) || other.memeId == memeId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.ipHash, ipHash) || other.ipHash == ipHash) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, memeId, userId, sessionId, ipHash, viewedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeViewImplCopyWith<_$MemeViewImpl> get copyWith =>
      __$$MemeViewImplCopyWithImpl<_$MemeViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeViewImplToJson(
      this,
    );
  }
}

abstract class _MemeView implements MemeView {
  const factory _MemeView(
      {required final int id,
      required final String memeId,
      final String? userId,
      final String? sessionId,
      final String? ipHash,
      required final DateTime viewedAt}) = _$MemeViewImpl;

  factory _MemeView.fromJson(Map<String, dynamic> json) =
      _$MemeViewImpl.fromJson;

  @override
  int get id;
  @override
  String get memeId;
  @override
  String? get userId;
  @override
  String? get sessionId;
  @override
  String? get ipHash;
  @override
  DateTime get viewedAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeViewImplCopyWith<_$MemeViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
