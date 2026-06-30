import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.environment,
    required this.version,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.defaultLocale,
    required this.sentryDsn,
    required this.sentryTracesSampleRate,
  });

  factory AppConfig.fromEnvironment() {
    print('[AppConfig] Loading configuration from environment...');
    final config = AppConfig(
      appName: _read('APP_NAME', fallback: 'Memeory'),
      environment: _read('APP_ENV', fallback: 'development'),
      version: _read('APP_VERSION', fallback: '1.0.0'),
      supabaseUrl: _read('SUPABASE_URL'),
      supabaseAnonKey: _read('SUPABASE_ANON_KEY'),
      defaultLocale: _read('DEFAULT_LOCALE', fallback: 'id'),
      sentryDsn: _read('SENTRY_DSN'),
      sentryTracesSampleRate: double.tryParse(
            _read('SENTRY_TRACES_SAMPLE_RATE', fallback: '0.0'),
          ) ??
          0,
    );
    print('[AppConfig] Configuration loaded:');
    print('[AppConfig]   appName: \$appName');
    print('[AppConfig]   environment: \$environment');
    print('[AppConfig]   version: \$version');
    print('[AppConfig]   supabaseUrl: \$supabaseUrl');
    print('[AppConfig]   supabaseAnonKey: \${supabaseAnonKey.isNotEmpty ? "SET (\${supabaseAnonKey.length} chars)" : "EMPTY"}');
    print('[AppConfig]   defaultLocale: \$defaultLocale');
    print('[AppConfig]   hasSupabaseCredentials: \${hasSupabaseCredentials}');
    return config;
  }

  final String appName;
  final String environment;
  final String version;
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String defaultLocale;
  final String sentryDsn;
  final double sentryTracesSampleRate;

  bool get hasSupabaseCredentials {
    return supabaseUrl.startsWith('https://') &&
        supabaseAnonKey.isNotEmpty &&
        !supabaseUrl.contains('your-project-ref') &&
        !supabaseAnonKey.startsWith('your-');
  }

  static String _read(String key, {String fallback = ''}) {
    final value = dotenv.maybeGet(key) ?? fallback;
    if (value == fallback && fallback.isNotEmpty) {
      print('[AppConfig] Using fallback for \$key: \$value');
    }
    return value;
  }
}
