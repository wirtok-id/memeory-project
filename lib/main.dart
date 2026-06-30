import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/supabase_config.dart';
import 'core/preferences/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Debug: Log environment loading
  debugPrint('[Memeory] Loading environment variables...');
  await dotenv.load(fileName: '.env', isOptional: true);
  debugPrint('[Memeory] Environment loaded');

  final config = AppConfig.fromEnvironment();
  
  // Debug: Log config values (without exposing secrets)
  debugPrint('[Memeory] Config loaded:');
  debugPrint('[Memeory]   supabaseUrl: ${config.supabaseUrl}');
  debugPrint('[Memeory]   supabaseAnonKey: ${config.supabaseAnonKey.isNotEmpty ? "SET (${config.supabaseAnonKey.length} chars)" : "EMPTY"}');
  debugPrint('[Memeory]   hasSupabaseCredentials: ${config.hasSupabaseCredentials}');
  debugPrint('[Memeory]   environment: ${config.environment}');

  await SupabaseConfig.initialize(config);
  debugPrint('[Memeory] Supabase initialized: ${SupabaseConfig.isInitialized}');
  
  final preferences = await AppPreferences.load();
  debugPrint('[Memeory] Preferences loaded');

  if (config.sentryDsn.isEmpty) {
    runApp(
      ProviderScope(
        overrides: [
          appPreferencesControllerProvider.overrideWith(
            (ref) => AppPreferencesController(preferences),
          ),
        ],
        child: const MemeoryApp(),
      ),
    );
    return;
  }

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = config.sentryDsn
        ..environment = config.environment
        ..tracesSampleRate = config.sentryTracesSampleRate;
    },
    appRunner: () => runApp(
      ProviderScope(
        overrides: [
          appPreferencesControllerProvider.overrideWith(
            (ref) => AppPreferencesController(preferences),
          ),
        ],
        child: const MemeoryApp(),
      ),
    ),
  );

  // Listen to auth state changes
  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    final event = data.event;
    final session = data.session;
    if (event == AuthChangeEvent.signedIn) {
      debugPrint('[Memeory] Auth: User signed in');
    } else if (event == AuthChangeEvent.signedOut) {
      debugPrint('[Memeory] Auth: User signed out');
    } else if (event == AuthChangeEvent.tokenRefreshed) {
      debugPrint('[Memeory] Auth: Token refreshed');
    }
  });
}
