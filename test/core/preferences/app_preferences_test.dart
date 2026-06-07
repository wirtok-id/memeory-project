import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memeory/core/preferences/app_preferences.dart';

void main() {
  test('AppPreferencesController updates theme and locale', () async {
    final controller = AppPreferencesController(AppPreferences.defaults());

    await controller.setThemeMode(ThemeMode.dark);
    await controller.setLocale(const Locale('en'));

    expect(controller.state.themeMode, ThemeMode.dark);
    expect(controller.state.locale, const Locale('en'));
  });
}
