import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/preferences/app_preferences.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_scaffold.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final preferences = ref.watch(appPreferencesControllerProvider);
    final controller = ref.read(appPreferencesControllerProvider.notifier);

    return AppScaffold(
      title: l10n.settings,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(l10n.theme, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                value: ThemeMode.system,
                icon: const Icon(Icons.brightness_auto),
                label: Text(l10n.system),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: const Icon(Icons.dark_mode),
                label: Text(l10n.dark),
              ),
              ButtonSegment(
                value: ThemeMode.light,
                icon: const Icon(Icons.light_mode),
                label: Text(l10n.light),
              ),
            ],
            selected: {preferences.themeMode},
            onSelectionChanged: (selection) {
              controller.setThemeMode(selection.single);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.language, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<Locale>(
            segments: const [
              ButtonSegment(value: Locale('id'), label: Text('ID')),
              ButtonSegment(value: Locale('en'), label: Text('EN')),
            ],
            selected: {preferences.locale},
            onSelectionChanged: (selection) {
              controller.setLocale(selection.single);
            },
          ),
        ],
      ),
    );
  }
}
