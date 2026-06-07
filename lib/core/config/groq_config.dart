import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqConfig {
  const GroqConfig._();

  static String get fastModel =>
      dotenv.maybeGet('GROQ_MODEL_FAST') ?? 'llama3-8b-8192';
  static String get balancedModel =>
      dotenv.maybeGet('GROQ_MODEL_BALANCED') ?? 'llama3-70b-8192';
  static String get powerfulModel =>
      dotenv.maybeGet('GROQ_MODEL_POWERFUL') ?? 'mixtral-8x7b-32768';
  static String get guardModel =>
      dotenv.maybeGet('GROQ_MODEL_GUARD') ?? 'llama-guard-3-8b';
}
