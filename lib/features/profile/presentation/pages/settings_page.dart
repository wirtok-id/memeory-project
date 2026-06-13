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
        padding: const EdgeInsets.all(AppSpacing.xl),
        children: [
          _SectionHeader(label: l10n.theme.toUpperCase()),
          const SizedBox(height: AppSpacing.sm),
          _DropdownField<ThemeMode>(
            value: preferences.themeMode,
            items: [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text(l10n.system),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text(l10n.dark),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text(l10n.light),
              ),
            ],
            onChanged: (value) {
              if (value != null) controller.setThemeMode(value);
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          _SectionHeader(label: l10n.language.toUpperCase()),
          const SizedBox(height: AppSpacing.sm),
          _DropdownField<Locale>(
            value: preferences.locale,
            items: [
              DropdownMenuItem(
                value: const Locale('id'),
                child: Text(l10n.localeIndonesian),
              ),
              DropdownMenuItem(
                value: const Locale('en'),
                child: Text(l10n.localeEnglish),
              ),
            ],
            onChanged: (value) {
              if (value != null) controller.setLocale(value);
            },
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
      isExpanded: true,
      style: Theme.of(context).textTheme.bodyLarge,
      dropdownColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
