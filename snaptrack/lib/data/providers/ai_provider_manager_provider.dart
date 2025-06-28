import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ai_provider_manager.dart';

// Export the AI provider manager from analysis_providers
// This is a compatibility file to maintain imports
final aiProviderManagerProvider = Provider<AIProviderManager>((ref) {
  final manager = AIProviderManager();
  manager.initialize();
  return manager;
});