import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      title: l10n.appName,
      actions: [
        IconButton(
          tooltip: l10n.settings,
          onPressed: () => context.go(AppRoutes.settings),
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            l10n.tagline,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.homeIntro),
          const SizedBox(height: AppSpacing.lg),
          _HomeAction(
            title: l10n.searchMemes,
            description: l10n.searchIntro,
            icon: Icons.search,
            onPressed: () => context.go(AppRoutes.search),
          ),
          const SizedBox(height: AppSpacing.md),
          _HomeAction(
            title: l10n.timeline,
            description: l10n.timelineIntro,
            icon: Icons.history,
            onPressed: () => context.go(AppRoutes.timeline),
          ),
          const SizedBox(height: AppSpacing.md),
          _HomeAction(
            title: l10n.trending,
            description: l10n.trendingIntro,
            icon: Icons.local_fire_department,
            onPressed: () => context.go(AppRoutes.trending),
          ),
        ],
      ),
    );
  }
}

class _HomeAction extends StatelessWidget {
  const _HomeAction({
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
