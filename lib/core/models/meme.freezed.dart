// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meme _$MemeFromJson(Map<String, dynamic> json) {
  return _Meme.fromJson(json);
}

/// @nodoc
mixin _$Meme {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  MediaType get mediaType => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get templateName => throw _privateConstructorUsedError;
  String? get textContent => throw _privateConstructorUsedError;
  String? get emotion => throw _privateConstructorUsedError;
  int? get qualityScore => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  DateTime? get originalDate => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  DateTime get ingestedAt => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get bookmarkCount => throw _privateConstructorUsedError;
  int get shareCount => throw _privateConstructorUsedError;
  bool get isTrending => throw _privateConstructorUsedError;
  int? get trendingRank => throw _privateConstructorUsedError;
  double? get trendingScore => throw _privateConstructorUsedError;
  DateTime? get lastTrendedAt => throw _privateConstructorUsedError;
  MemeStatus get status => throw _privateConstructorUsedError;
  String? get moderationNotes => throw _privateConstructorUsedError;
  List<double>? get embedding => throw _privateConstructorUsedError;
  String? get sourceUrl => throw _privateConstructorUsedError;
  bool get isAdminCurated => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeCopyWith<Meme> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeCopyWith<$Res> {
  factory $MemeCopyWith(Meme value, $Res Function(Meme) then) =
      _$MemeCopyWithImpl<$Res, Meme>;
  @useResult
  $Res call(
      {String id,
      String title,
      String slug,
      String? description,
      String thumbnailUrl,
      String? mediaUrl,
      MediaType mediaType,
      int? categoryId,
      String? templateName,
      String? textContent,
      String? emotion,
      int? qualityScore,
      String language,
      DateTime? originalDate,
      int? year,
      DateTime ingestedAt,
      int viewCount,
      int bookmarkCount,
      int shareCount,
      bool isTrending,
      int? trendingRank,
      double? trendingScore,
      DateTime? lastTrendedAt,
      MemeStatus status,
      String? moderationNotes,
      List<double>? embedding,
      String? sourceUrl,
      bool isAdminCurated,
      String? createdBy,
      DateTime updatedAt});
}

/// @nodoc
class _$MemeCopyWithImpl<$Res, $Val extends Meme>
    implements $MemeCopyWith<$Res> {
  _$MemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? description = freezed,
    Object? thumbnailUrl = null,
    Object? mediaUrl = freezed,
    Object? mediaType = null,
    Object? categoryId = freezed,
    Object? templateName = freezed,
    Object? textContent = freezed,
    Object? emotion = freezed,
    Object? qualityScore = freezed,
    Object? language = null,
    Object? originalDate = freezed,
    Object? year = freezed,
    Object? ingestedAt = null,
    Object? viewCount = null,
    Object? bookmarkCount = null,
    Object? shareCount = null,
    Object? isTrending = null,
    Object? trendingRank = freezed,
    Object? trendingScore = freezed,
    Object? lastTrendedAt = freezed,
    Object? status = null,
    Object? moderationNotes = freezed,
    Object? embedding = freezed,
    Object? sourceUrl = freezed,
    Object? isAdminCurated = null,
    Object? createdBy = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      templateName: freezed == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String?,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityScore: freezed == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as int?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      originalDate: freezed == originalDate
          ? _value.originalDate
          : originalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ingestedAt: null == ingestedAt
          ? _value.ingestedAt
          : ingestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkCount: null == bookmarkCount
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareCount: null == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int,
      isTrending: null == isTrending
          ? _value.isTrending
          : isTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingRank: freezed == trendingRank
          ? _value.trendingRank
          : trendingRank // ignore: cast_nullable_to_non_nullable
              as int?,
      trendingScore: freezed == trendingScore
          ? _value.trendingScore
          : trendingScore // ignore: cast_nullable_to_non_nullable
              as double?,
      lastTrendedAt: freezed == lastTrendedAt
          ? _value.lastTrendedAt
          : lastTrendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemeStatus,
      moderationNotes: freezed == moderationNotes
          ? _value.moderationNotes
          : moderationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      embedding: freezed == embedding
          ? _value.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdminCurated: null == isAdminCurated
          ? _value.isAdminCurated
          : isAdminCurated // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeImplCopyWith<$Res> implements $MemeCopyWith<$Res> {
  factory _$$MemeImplCopyWith(
          _$MemeImpl value, $Res Function(_$MemeImpl) then) =
      __$$MemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String slug,
      String? description,
      String thumbnailUrl,
      String? mediaUrl,
      MediaType mediaType,
      int? categoryId,
      String? templateName,
      String? textContent,
      String? emotion,
      int? qualityScore,
      String language,
      DateTime? originalDate,
      int? year,
      DateTime ingestedAt,
      int viewCount,
      int bookmarkCount,
      int shareCount,
      bool isTrending,
      int? trendingRank,
      double? trendingScore,
      DateTime? lastTrendedAt,
      MemeStatus status,
      String? moderationNotes,
      List<double>? embedding,
      String? sourceUrl,
      bool isAdminCurated,
      String? createdBy,
      DateTime updatedAt});
}

/// @nodoc
class __$$MemeImplCopyWithImpl<$Res>
    extends _$MemeCopyWithImpl<$Res, _$MemeImpl>
    implements _$$MemeImplCopyWith<$Res> {
  __$$MemeImplCopyWithImpl(_$MemeImpl _value, $Res Function(_$MemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? description = freezed,
    Object? thumbnailUrl = null,
    Object? mediaUrl = freezed,
    Object? mediaType = null,
    Object? categoryId = freezed,
    Object? templateName = freezed,
    Object? textContent = freezed,
    Object? emotion = freezed,
    Object? qualityScore = freezed,
    Object? language = null,
    Object? originalDate = freezed,
    Object? year = freezed,
    Object? ingestedAt = null,
    Object? viewCount = null,
    Object? bookmarkCount = null,
    Object? shareCount = null,
    Object? isTrending = null,
    Object? trendingRank = freezed,
    Object? trendingScore = freezed,
    Object? lastTrendedAt = freezed,
    Object? status = null,
    Object? moderationNotes = freezed,
    Object? embedding = freezed,
    Object? sourceUrl = freezed,
    Object? isAdminCurated = null,
    Object? createdBy = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$MemeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      templateName: freezed == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String?,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityScore: freezed == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as int?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      originalDate: freezed == originalDate
          ? _value.originalDate
          : originalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ingestedAt: null == ingestedAt
          ? _value.ingestedAt
          : ingestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkCount: null == bookmarkCount
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareCount: null == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int,
      isTrending: null == isTrending
          ? _value.isTrending
          : isTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingRank: freezed == trendingRank
          ? _value.trendingRank
          : trendingRank // ignore: cast_nullable_to_non_nullable
              as int?,
      trendingScore: freezed == trendingScore
          ? _value.trendingScore
          : trendingScore // ignore: cast_nullable_to_non_nullable
              as double?,
      lastTrendedAt: freezed == lastTrendedAt
          ? _value.lastTrendedAt
          : lastTrendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemeStatus,
      moderationNotes: freezed == moderationNotes
          ? _value.moderationNotes
          : moderationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      embedding: freezed == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdminCurated: null == isAdminCurated
          ? _value.isAdminCurated
          : isAdminCurated // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemeImpl implements _Meme {
  const _$MemeImpl(
      {required this.id,
      required this.title,
      required this.slug,
      this.description,
      required this.thumbnailUrl,
      this.mediaUrl,
      this.mediaType = MediaType.image,
      this.categoryId,
      this.templateName,
      this.textContent,
      this.emotion,
      this.qualityScore,
      this.language = 'en',
      this.originalDate,
      this.year,
      required this.ingestedAt,
      this.viewCount = 0,
      this.bookmarkCount = 0,
      this.shareCount = 0,
      this.isTrending = false,
      this.trendingRank,
      this.trendingScore,
      this.lastTrendedAt,
      this.status = MemeStatus.pendingModeration,
      this.moderationNotes,
      final List<double>? embedding,
      this.sourceUrl,
      this.isAdminCurated = false,
      this.createdBy,
      required this.updatedAt})
      : _embedding = embedding;

  factory _$MemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemeImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String thumbnailUrl;
  @override
  final String? mediaUrl;
  @override
  @JsonKey()
  final MediaType mediaType;
  @override
  final int? categoryId;
  @override
  final String? templateName;
  @override
  final String? textContent;
  @override
  final String? emotion;
  @override
  final int? qualityScore;
  @override
  @JsonKey()
  final String language;
  @override
  final DateTime? originalDate;
  @override
  final int? year;
  @override
  final DateTime ingestedAt;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int bookmarkCount;
  @override
  @JsonKey()
  final int shareCount;
  @override
  @JsonKey()
  final bool isTrending;
  @override
  final int? trendingRank;
  @override
  final double? trendingScore;
  @override
  final DateTime? lastTrendedAt;
  @override
  @JsonKey()
  final MemeStatus status;
  @override
  final String? moderationNotes;
  final List<double>? _embedding;
  @override
  List<double>? get embedding {
    final value = _embedding;
    if (value == null) return null;
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? sourceUrl;
  @override
  @JsonKey()
  final bool isAdminCurated;
  @override
  final String? createdBy;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Meme(id: $id, title: $title, slug: $slug, description: $description, thumbnailUrl: $thumbnailUrl, mediaUrl: $mediaUrl, mediaType: $mediaType, categoryId: $categoryId, templateName: $templateName, textContent: $textContent, emotion: $emotion, qualityScore: $qualityScore, language: $language, originalDate: $originalDate, year: $year, ingestedAt: $ingestedAt, viewCount: $viewCount, bookmarkCount: $bookmarkCount, shareCount: $shareCount, isTrending: $isTrending, trendingRank: $trendingRank, trendingScore: $trendingScore, lastTrendedAt: $lastTrendedAt, status: $status, moderationNotes: $moderationNotes, embedding: $embedding, sourceUrl: $sourceUrl, isAdminCurated: $isAdminCurated, createdBy: $createdBy, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.textContent, textContent) ||
                other.textContent == textContent) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.originalDate, originalDate) ||
                other.originalDate == originalDate) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.ingestedAt, ingestedAt) ||
                other.ingestedAt == ingestedAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.bookmarkCount, bookmarkCount) ||
                other.bookmarkCount == bookmarkCount) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.isTrending, isTrending) ||
                other.isTrending == isTrending) &&
            (identical(other.trendingRank, trendingRank) ||
                other.trendingRank == trendingRank) &&
            (identical(other.trendingScore, trendingScore) ||
                other.trendingScore == trendingScore) &&
            (identical(other.lastTrendedAt, lastTrendedAt) ||
                other.lastTrendedAt == lastTrendedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.moderationNotes, moderationNotes) ||
                other.moderationNotes == moderationNotes) &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.isAdminCurated, isAdminCurated) ||
                other.isAdminCurated == isAdminCurated) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        slug,
        description,
        thumbnailUrl,
        mediaUrl,
        mediaType,
        categoryId,
        templateName,
        textContent,
        emotion,
        qualityScore,
        language,
        originalDate,
        year,
        ingestedAt,
        viewCount,
        bookmarkCount,
        shareCount,
        isTrending,
        trendingRank,
        trendingScore,
        lastTrendedAt,
        status,
        moderationNotes,
        const DeepCollectionEquality().hash(_embedding),
        sourceUrl,
        isAdminCurated,
        createdBy,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeImplCopyWith<_$MemeImpl> get copyWith =>
      __$$MemeImplCopyWithImpl<_$MemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemeImplToJson(
      this,
    );
  }
}

abstract class _Meme implements Meme {
  const factory _Meme(
      {required final String id,
      required final String title,
      required final String slug,
      final String? description,
      required final String thumbnailUrl,
      final String? mediaUrl,
      final MediaType mediaType,
      final int? categoryId,
      final String? templateName,
      final String? textContent,
      final String? emotion,
      final int? qualityScore,
      final String language,
      final DateTime? originalDate,
      final int? year,
      required final DateTime ingestedAt,
      final int viewCount,
      final int bookmarkCount,
      final int shareCount,
      final bool isTrending,
      final int? trendingRank,
      final double? trendingScore,
      final DateTime? lastTrendedAt,
      final MemeStatus status,
      final String? moderationNotes,
      final List<double>? embedding,
      final String? sourceUrl,
      final bool isAdminCurated,
      final String? createdBy,
      required final DateTime updatedAt}) = _$MemeImpl;

  factory _Meme.fromJson(Map<String, dynamic> json) = _$MemeImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get slug;
  @override
  String? get description;
  @override
  String get thumbnailUrl;
  @override
  String? get mediaUrl;
  @override
  MediaType get mediaType;
  @override
  int? get categoryId;
  @override
  String? get templateName;
  @override
  String? get textContent;
  @override
  String? get emotion;
  @override
  int? get qualityScore;
  @override
  String get language;
  @override
  DateTime? get originalDate;
  @override
  int? get year;
  @override
  DateTime get ingestedAt;
  @override
  int get viewCount;
  @override
  int get bookmarkCount;
  @override
  int get shareCount;
  @override
  bool get isTrending;
  @override
  int? get trendingRank;
  @override
  double? get trendingScore;
  @override
  DateTime? get lastTrendedAt;
  @override
  MemeStatus get status;
  @override
  String? get moderationNotes;
  @override
  List<double>? get embedding;
  @override
  String? get sourceUrl;
  @override
  bool get isAdminCurated;
  @override
  String? get createdBy;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MemeImplCopyWith<_$MemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
