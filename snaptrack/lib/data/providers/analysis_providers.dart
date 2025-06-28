import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/ai_provider.dart';
import '../services/ai_provider_manager.dart';
import '../services/openai_service.dart';

// Provider for the AI provider manager
final aiProviderManagerProvider = Provider<AIProviderManager>((ref) {
  final manager = AIProviderManager();
  // Initialize in background - the manager now has proper fallbacks
  manager.initialize();
  return manager;
});

// Provider for the OpenAI service (legacy compatibility)
final openAIServiceProvider = Provider<OpenAIProvider>((ref) {
  return OpenAIProvider();
});

// Provider for food analysis state
final foodAnalysisProvider = StateNotifierProvider<FoodAnalysisNotifier, AsyncValue<FoodAnalysis?>>((ref) {
  final aiManager = ref.watch(aiProviderManagerProvider);
  return FoodAnalysisNotifier(aiManager);
});

class FoodAnalysisNotifier extends StateNotifier<AsyncValue<FoodAnalysis?>> {
  final AIProviderManager _aiManager;
  
  FoodAnalysisNotifier(this._aiManager) : super(const AsyncValue.data(null));
  
  Future<void> analyzeImage(File imageFile) async {
    state = const AsyncValue.loading();
    
    try {
      final result = await _aiManager.analyzeWithFallback(imageFile);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Future<void> analyzeImageWithHint(File imageFile, String hint) async {
    state = const AsyncValue.loading();
    
    try {
      final result = await _aiManager.analyzeWithFallback(imageFile, userHint: hint);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> analyzeImageWithPortions(File imageFile, {String? hint}) async {
    state = const AsyncValue.loading();
    
    try {
      final result = await _aiManager.analyzeWithPortionsAndFallback(
        imageFile, 
        userHint: hint, 
        requestPortions: true,
      );
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  void reset() {
    state = const AsyncValue.data(null);
  }
}