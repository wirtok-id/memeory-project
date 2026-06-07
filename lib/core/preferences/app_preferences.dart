import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeModeKey = 'theme_mode';
const _localeKey = 'locale';

final appPreferencesControllerProvider =
    StateNotifierProvider<AppPreferencesController, AppPreferences>((ref) {
  return AppPreferencesController(AppPreferences.defaults());
});

class AppPreferences {
  const AppPreferences({
    required this.themeMode,
    required this.locale,
    required SharedPreferences? storage,
  }) : _storage = storage;

  factory AppPreferences.defaults() {
    return const AppPreferences(
      themeMode: ThemeMode.system,
      locale: Locale('id'),
      storage: null,
    );
  }

  static Future<AppPreferences> load() async {
    final storage = await SharedPreferences.getInstance();
    final themeModeName = storage.getString(_themeModeKey);
    final localeCode = storage.getString(_localeKey);

    return AppPreferences(
      themeMode: ThemeMode.values.firstWhere(
        (mode) => mode.name == themeModeName,
        orElse: () => ThemeMode.system,
      ),
      locale: Locale(localeCode ?? 'id'),
      storage: storage,
    );
  }

  final ThemeMode themeMode;
  final Locale locale;
  final SharedPreferences? _storage;

  AppPreferences copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppPreferences(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      storage: _storage,
    );
  }

  Future<void> persist() async {
    final storage = _storage;
    if (storage == null) {
      return;
    }

    await storage.setString(_themeModeKey, themeMode.name);
    await storage.setString(_localeKey, locale.languageCode);
  }
}

class AppPreferencesController extends StateNotifier<AppPreferences> {
  AppPreferencesController(super.state);

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = state.copyWith(themeMode: themeMode);
    await state.persist();
  }

  Future<void> setLocale(Locale locale) async {
    state = state.copyWith(locale: locale);
    await state.persist();
  }
}
