import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_config.dart';

class SupabaseConfig {
  const SupabaseConfig._();

  static bool _initialized = false;

  static bool get isInitialized => _initialized;

  static Future<void> initialize(AppConfig config) async {
    if (!config.hasSupabaseCredentials) {
      return;
    }

    await Supabase.initialize(
  url: config.supabaseUrl,
  publishableKey: config.supabaseAnonKey,
  authOptions: const FlutterAuthClientOptions(
    authFlowType: AuthFlowType.pkce,
  ),
);
