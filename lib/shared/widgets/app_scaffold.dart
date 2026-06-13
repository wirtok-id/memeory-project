import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_routes.dart';
import '../../l10n/app_localizations.dart';
import 'layout/responsive_layout.dart';
import 'layout/sidebar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.title,
    required this.child,
    super.key,
    this.actions,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;
    final selectedIndex = _selectedIndex(currentPath);
    final l10n = AppLocalizations.of(context);

    return ResponsiveLayout(
      mobile: _MobileScaffold(
        title: title,
        child: child,
        actions: actions,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => context.go(_routeForIndex(index)),
        l10n: l10n,
      ),
      tablet: _MobileScaffold(
        title: title,
        child: child,
        actions: actions,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => context.go(_routeForIndex(index)),
        l10n: l10n,
      ),
      desktop: _DesktopScaffold(
        title: title,
        child: child,
        actions: actions,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => context.go(_routeForIndex(index)),
        l10n: l10n,
      ),
    );
  }

  static int _selectedIndex(String path) {
    return switch (path) {
      AppRoutes.search => 1,
      AppRoutes.timeline => 2,
      AppRoutes.trending => 3,
      AppRoutes.profile || AppRoutes.settings => 4,
      _ => 0,
    };
  }

  static String _routeForIndex(int index) {
    return switch (index) {
      1 => AppRoutes.search,
      2 => AppRoutes.timeline,
      3 => AppRoutes.trending,
      4 => AppRoutes.profile,
      _ => AppRoutes.home,
    };
  }
}

class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({
    required this.title,
    required this.child,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.l10n,
    this.actions,
  });

  final String title;
  final Widget child;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final AppLocalizations l10n;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.search_outlined),
            selectedIcon: const Icon(Icons.search),
            label: l10n.search,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: const Icon(Icons.history),
            label: l10n.timeline,
          ),
          NavigationDestination(
            icon: const Icon(Icons.local_fire_department_outlined),
            selectedIcon: const Icon(Icons.local_fire_department),
            label: l10n.trending,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}

class _DesktopScaffold extends StatelessWidget {
  const _DesktopScaffold({
    required this.title,
    required this.child,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.l10n,
    this.actions,
  });

  final String title;
  final Widget child;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final AppLocalizations l10n;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: Text(title),
                actions: actions,
              ),
              body: SafeArea(child: child),
            ),
          ),
        ],
      ),
    );
  }
}
