// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemeCategory _$MemeCategoryFromJson(Map<String, dynamic> json) {
  return _MemeCategory.fromJson(json);
}

/// @nodoc
mixin _$MemeCategory {
  int get id => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get nameId => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get colorHex => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeCategoryCopyWith<MemeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeCategoryCopyWith<$Res> {
  factory $MemeCategoryCopyWith(
          MemeCategory value, $Res Function(MemeCategory) then) =
      _$MemeCategoryCopyWithImpl<$Res, MemeCategory>;
  @useResult
  $Res call(
      {int id,
      String slug,
      String nameEn,
      String nameId,
      String? icon,
      String? colorHex,
      int sortOrder,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class _$MemeCategoryCopyWithImpl<$Res, $Val extends MemeCategory>
    implements $MemeCategoryCopyWith<$Res> {
  _$MemeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? nameEn = null,
    Object? nameId = null,
    Object? icon = freezed,
    Object? colorHex = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
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
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeCategoryImplCopyWith<$Res>
    implements $MemeCategoryCopyWith<$Res> {
  factory _$$MemeCategoryImplCopyWith(
          _$MemeCategoryImpl value, $Res Function(_$MemeCategoryImpl) then) =
      __$$MemeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String slug,
      String nameEn,
      String nameId,
      String? icon,
      String? colorHex,
      int sortOrder,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class __$$MemeCategoryImplCopyWithImpl<$Res>
    extends _$MemeCategoryCopyWithImpl<$Res, _$MemeCategoryImpl>
    implements _$$MemeCategoryImplCopyWith<$Res> {
  __$$MemeCategoryImplCopyWithImpl(
      _$MemeCategoryImpl _value, $Res Function(_$MemeCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? nameEn = null,
    Object? nameId = null,
    Object? icon = freezed,
    Object? colorHex = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_$MemeCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemeCategoryImpl implements _MemeCategory {
  const _$MemeCategoryImpl(
      {required this.id,
      required this.slug,
      required this.nameEn,
      required this.nameId,
      this.icon,
      this.colorHex,
      this.sortOrder = 0,
      this.isActive = true,
      required this.createdAt});

  factory _$MemeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String slug;
  @override
  final String nameEn;
  @override
  final String nameId;
  @override
  final String? icon;
  @override
  final String? colorHex;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MemeCategory(id: $id, slug: $slug, nameEn: $nameEn, nameId: $nameId, icon: $icon, colorHex: $colorHex, sortOrder: $sortOrder, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameId, nameId) || other.nameId == nameId) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, nameEn, nameId, icon,
      colorHex, sortOrder, isActive, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeCategoryImplCopyWith<_$MemeCategoryImpl> get copyWith =>
      __$$MemeCategoryImplCopyWithImpl<_$MemeCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeCategoryImplToJson(
      this,
    );
  }
}

abstract class _MemeCategory implements MemeCategory {
  const factory _MemeCategory(
      {required final int id,
      required final String slug,
      required final String nameEn,
      required final String nameId,
      final String? icon,
      final String? colorHex,
      final int sortOrder,
      final bool isActive,
      required final DateTime createdAt}) = _$MemeCategoryImpl;

  factory _MemeCategory.fromJson(Map<String, dynamic> json) =
      _$MemeCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get slug;
  @override
  String get nameEn;
  @override
  String get nameId;
  @override
  String? get icon;
  @override
  String? get colorHex;
  @override
  int get sortOrder;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeCategoryImplCopyWith<_$MemeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
