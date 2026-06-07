import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/supabase_config.dart';
import 'core/preferences/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env', isOptional: true);

  final config = AppConfig.fromEnvironment();
  await SupabaseConfig.initialize(config);
  final preferences = await AppPreferences.load();

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
}
