// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_tag_relation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemeTagRelation _$MemeTagRelationFromJson(Map<String, dynamic> json) {
  return _MemeTagRelation.fromJson(json);
}

/// @nodoc
mixin _$MemeTagRelation {
  String get memeId => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeTagRelationCopyWith<MemeTagRelation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeTagRelationCopyWith<$Res> {
  factory $MemeTagRelationCopyWith(
          MemeTagRelation value, $Res Function(MemeTagRelation) then) =
      _$MemeTagRelationCopyWithImpl<$Res, MemeTagRelation>;
  @useResult
  $Res call({String memeId, int tagId, DateTime createdAt});
}

/// @nodoc
class _$MemeTagRelationCopyWithImpl<$Res, $Val extends MemeTagRelation>
    implements $MemeTagRelationCopyWith<$Res> {
  _$MemeTagRelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memeId = null,
    Object? tagId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeTagRelationImplCopyWith<$Res>
    implements $MemeTagRelationCopyWith<$Res> {
  factory _$$MemeTagRelationImplCopyWith(_$MemeTagRelationImpl value,
          $Res Function(_$MemeTagRelationImpl) then) =
      __$$MemeTagRelationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String memeId, int tagId, DateTime createdAt});
}

/// @nodoc
class __$$MemeTagRelationImplCopyWithImpl<$Res>
    extends _$MemeTagRelationCopyWithImpl<$Res, _$MemeTagRelationImpl>
    implements _$$MemeTagRelationImplCopyWith<$Res> {
  __$$MemeTagRelationImplCopyWithImpl(
      _$MemeTagRelationImpl _value, $Res Function(_$MemeTagRelationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memeId = null,
    Object? tagId = null,
    Object? createdAt = null,
  }) {
    return _then(_$MemeTagRelationImpl(
      memeId: null == memeId
          ? _value.memeId
          : memeId // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemeTagRelationImpl implements _MemeTagRelation {
  const _$MemeTagRelationImpl(
      {required this.memeId, required this.tagId, required this.createdAt});

  factory _$MemeTagRelationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeTagRelationImplFromJson(json);

  @override
  final String memeId;
  @override
  final int tagId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MemeTagRelation(memeId: $memeId, tagId: $tagId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeTagRelationImpl &&
            (identical(other.memeId, memeId) || other.memeId == memeId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memeId, tagId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeTagRelationImplCopyWith<_$MemeTagRelationImpl> get copyWith =>
      __$$MemeTagRelationImplCopyWithImpl<_$MemeTagRelationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeTagRelationImplToJson(
      this,
    );
  }
}

abstract class _MemeTagRelation implements MemeTagRelation {
  const factory _MemeTagRelation(
      {required final String memeId,
      required final int tagId,
      required final DateTime createdAt}) = _$MemeTagRelationImpl;

  factory _MemeTagRelation.fromJson(Map<String, dynamic> json) =
      _$MemeTagRelationImpl.fromJson;

  @override
  String get memeId;
  @override
  int get tagId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeTagRelationImplCopyWith<_$MemeTagRelationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
