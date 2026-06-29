// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemeTag _$MemeTagFromJson(Map<String, dynamic> json) {
  return _MemeTag.fromJson(json);
}

/// @nodoc
mixin _$MemeTag {
  int get id => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeTagCopyWith<MemeTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeTagCopyWith<$Res> {
  factory $MemeTagCopyWith(MemeTag value, $Res Function(MemeTag) then) =
      _$MemeTagCopyWithImpl<$Res, MemeTag>;
  @useResult
  $Res call(
      {int id, String slug, String name, int usageCount, DateTime createdAt});
}

/// @nodoc
class _$MemeTagCopyWithImpl<$Res, $Val extends MemeTag>
    implements $MemeTagCopyWith<$Res> {
  _$MemeTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = null,
    Object? usageCount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeTagImplCopyWith<$Res> implements $MemeTagCopyWith<$Res> {
  factory _$$MemeTagImplCopyWith(
          _$MemeTagImpl value, $Res Function(_$MemeTagImpl) then) =
      __$$MemeTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String slug, String name, int usageCount, DateTime createdAt});
}

/// @nodoc
class __$$MemeTagImplCopyWithImpl<$Res>
    extends _$MemeTagCopyWithImpl<$Res, _$MemeTagImpl>
    implements _$$MemeTagImplCopyWith<$Res> {
  __$$MemeTagImplCopyWithImpl(
      _$MemeTagImpl _value, $Res Function(_$MemeTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = null,
    Object? usageCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$MemeTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
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
class _$MemeTagImpl implements _MemeTag {
  const _$MemeTagImpl(
      {required this.id,
      required this.slug,
      required this.name,
      this.usageCount = 0,
      required this.createdAt});

  factory _$MemeTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeTagImplFromJson(json);

  @override
  final int id;
  @override
  final String slug;
  @override
  final String name;
  @override
  @JsonKey()
  final int usageCount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MemeTag(id: $id, slug: $slug, name: $name, usageCount: $usageCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, slug, name, usageCount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeTagImplCopyWith<_$MemeTagImpl> get copyWith =>
      __$$MemeTagImplCopyWithImpl<_$MemeTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeTagImplToJson(
      this,
    );
  }
}

abstract class _MemeTag implements MemeTag {
  const factory _MemeTag(
      {required final int id,
      required final String slug,
      required final String name,
      final int usageCount,
      required final DateTime createdAt}) = _$MemeTagImpl;

  factory _MemeTag.fromJson(Map<String, dynamic> json) = _$MemeTagImpl.fromJson;

  @override
  int get id;
  @override
  String get slug;
  @override
  String get name;
  @override
  int get usageCount;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeTagImplCopyWith<_$MemeTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
