import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/layout/responsive_layout.dart';

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
      child: ResponsiveLayout(
        mobile: _MobileHome(l10n: l10n),
        tablet: _TabletHome(l10n: l10n),
        desktop: _DesktopHome(l10n: l10n),
      ),
    );
  }
}

class _MobileHome extends StatelessWidget {
  const _MobileHome({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      children: [
        _HeroSection(l10n: l10n),
        const SizedBox(height: AppSpacing.xxxl),
        _ActionCard(
          title: l10n.searchMemes,
          description: l10n.searchIntro,
          icon: Icons.search_outlined,
          onPressed: () => context.go(AppRoutes.search),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ActionCard(
          title: l10n.timeline,
          description: l10n.timelineIntro,
          icon: Icons.history_outlined,
          onPressed: () => context.go(AppRoutes.timeline),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ActionCard(
          title: l10n.trending,
          description: l10n.trendingIntro,
          icon: Icons.local_fire_department_outlined,
          onPressed: () => context.go(AppRoutes.trending),
        ),
      ],
    );
  }
}

class _TabletHome extends StatelessWidget {
  const _TabletHome({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.xxxl),
      children: [
        _HeroSection(l10n: l10n),
        const SizedBox(height: AppSpacing.xxxl),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: AppSpacing.lg,
          mainAxisSpacing: AppSpacing.lg,
          childAspectRatio: 1.6,
          children: [
            _ActionCard(
              title: l10n.searchMemes,
              description: l10n.searchIntro,
              icon: Icons.search_outlined,
              onPressed: () => context.go(AppRoutes.search),
            ),
            _ActionCard(
              title: l10n.timeline,
              description: l10n.timelineIntro,
              icon: Icons.history_outlined,
              onPressed: () => context.go(AppRoutes.timeline),
            ),
            _ActionCard(
              title: l10n.trending,
              description: l10n.trendingIntro,
              icon: Icons.local_fire_department_outlined,
              onPressed: () => context.go(AppRoutes.trending),
            ),
            _ActionCard(
              title: l10n.profile,
              description: l10n.profileIntro,
              icon: Icons.person_outlined,
              onPressed: () => context.go(AppRoutes.profile),
            ),
          ],
        ),
      ],
    );
  }
}

class _DesktopHome extends StatelessWidget {
  const _DesktopHome({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.xxxxl),
      children: [
        _HeroSection(l10n: l10n, isDesktop: true),
        const SizedBox(height: AppSpacing.xxxxxl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: AppSpacing.xl,
                mainAxisSpacing: AppSpacing.xl,
                childAspectRatio: 1.8,
                children: [
                  _ActionCard(
                    title: l10n.searchMemes,
                    description: l10n.searchIntro,
                    icon: Icons.search_outlined,
                    onPressed: () => context.go(AppRoutes.search),
                  ),
                  _ActionCard(
                    title: l10n.timeline,
                    description: l10n.timelineIntro,
                    icon: Icons.history_outlined,
                    onPressed: () => context.go(AppRoutes.timeline),
                  ),
                  _ActionCard(
                    title: l10n.trending,
                    description: l10n.trendingIntro,
                    icon: Icons.local_fire_department_outlined,
                    onPressed: () => context.go(AppRoutes.trending),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.xxxxl),
            _SidebarCard(l10n: l10n),
          ],
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.l10n,
    this.isDesktop = false,
  });

  final AppLocalizations l10n;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          l10n.appName,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.tagline,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          l10n.homeIntro,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarCard extends StatelessWidget {
  const _SidebarCard({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Links',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _SidebarItem(
                icon: Icons.person_outlined,
                label: l10n.profile,
                onPressed: () => context.go(AppRoutes.profile),
              ),
              const SizedBox(height: AppSpacing.md),
              _SidebarItem(
                icon: Icons.bookmark_outlined,
                label: 'Bookmarks',
                onPressed: () => context.go('/bookmarks'),
              ),
              const SizedBox(height: AppSpacing.md),
              _SidebarItem(
                icon: Icons.settings_outlined,
                label: l10n.settings,
                onPressed: () => context.go(AppRoutes.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.md),
          child: Row(
            children: [
              Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
