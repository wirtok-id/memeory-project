import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_config.dart';

class SupabaseConfig {
  const SupabaseConfig._();

  static bool _initialized = false;

  static bool get isInitialized => _initialized;

  static Future<void> initialize(AppConfig config) async {
    print('[SupabaseConfig] Initializing Supabase...');
    print('[SupabaseConfig] hasSupabaseCredentials: ${config.hasSupabaseCredentials}');
    print('[SupabaseConfig] supabaseUrl: ${config.supabaseUrl}');
    print('[SupabaseConfig] supabaseAnonKey length: ${config.supabaseAnonKey.length}');

    if (!config.hasSupabaseCredentials) {
      print('[SupabaseConfig] ERROR: Missing Supabase credentials!');
      return;
    }

    try {
      await Supabase.initialize(
        url: config.supabaseUrl,
        publishableKey: config.supabaseAnonKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
        ),
      );

      _initialized = true;
      print('[Memeory] Supabase initialized successfully');
    } catch (e, stackTrace) {
      print('[SupabaseConfig] ERROR initializing Supabase: $e');
      print('$stackTrace');
      rethrow;
    }
  }
}