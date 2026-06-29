import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String username,
    String? displayName,
    String? avatarUrl,
    String? bio,
    @Default('id') String preferredLocale,
    @Default('system') String themePreference,
    @Default(0) int bookmarkCount,
    @Default(0) int memeViewsCount,
    @Default('user') String role,
    @Default(false) bool isVerified,
    @Default(false) bool isBanned,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}