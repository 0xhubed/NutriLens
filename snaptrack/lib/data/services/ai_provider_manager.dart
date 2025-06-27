import 'dart:io';
import 'secure_storage_fallback.dart';

import 'ai_provider.dart';
import 'openai_service.dart';
import 'anthropic_provider.dart';
import 'gemini_provider.dart';

class AIProviderManager {
  static const String _activeProviderKey = 'active_ai_provider';
  static const String _fallbackProviderKey = 'fallback_ai_provider';

  final List<AIProvider> _providers = [
    OpenAIProvider(),
    AnthropicProvider(),
    GeminiProvider(),
  ];

  List<AIProvider> get providers => List.unmodifiable(_providers);

  AIProvider? get activeProvider {
    final activeId = _activeProviderId;
    if (activeId == null) return null;
    return _providers.firstWhere(
      (p) => p.providerId == activeId,
      orElse: () => _providers.first,
    );
  }

  AIProvider? get fallbackProvider {
    final fallbackId = _fallbackProviderId;
    if (fallbackId == null) return null;
    return _providers.firstWhere(
      (p) => p.providerId == fallbackId,
      orElse: () => _providers.length > 1 ? _providers[1] : _providers.first,
    );
  }

  String? _activeProviderId;
  String? _fallbackProviderId;

  Future<void> initialize() async {
    _activeProviderId = await SecureStorageFallback.read(key: _activeProviderKey);
    _fallbackProviderId = await SecureStorageFallback.read(key: _fallbackProviderKey);
    
    // Set defaults if not configured
    if (_activeProviderId == null && _providers.isNotEmpty) {
      _activeProviderId = _providers.first.providerId;
      await SecureStorageFallback.write(key: _activeProviderKey, value: _activeProviderId!);
    }
    
    if (_fallbackProviderId == null && _providers.length > 1) {
      _fallbackProviderId = _providers[1].providerId;
      await SecureStorageFallback.write(key: _fallbackProviderKey, value: _fallbackProviderId!);
    }
  }

  Future<void> setActiveProvider(String providerId) async {
    if (_providers.any((p) => p.providerId == providerId)) {
      _activeProviderId = providerId;
      await SecureStorageFallback.write(key: _activeProviderKey, value: providerId);
    } else {
      throw ArgumentError('Provider with ID $providerId not found');
    }
  }

  Future<void> setFallbackProvider(String providerId) async {
    if (_providers.any((p) => p.providerId == providerId)) {
      _fallbackProviderId = providerId;
      await SecureStorageFallback.write(key: _fallbackProviderKey, value: providerId);
    } else {
      throw ArgumentError('Provider with ID $providerId not found');
    }
  }

  Future<FoodAnalysis> analyzeWithFallback(File imageFile) async {
    final active = activeProvider;
    if (active == null) {
      throw AIProviderException('No active provider configured');
    }

    try {
      // Try primary provider first
      if (await active.validateConfiguration()) {
        return await active.analyzeImage(imageFile);
      } else {
        throw AIProviderException('Active provider not configured', provider: active);
      }
    } catch (e) {
      // If primary fails, try fallback
      final fallback = fallbackProvider;
      if (fallback != null && fallback.providerId != active.providerId) {
        try {
          if (await fallback.validateConfiguration()) {
            return await fallback.analyzeImage(imageFile);
          }
        } catch (fallbackError) {
          // Both failed, throw original error with fallback info
          throw AIProviderException(
            'Both primary (${active.name}) and fallback (${fallback.name}) providers failed. Primary: $e, Fallback: $fallbackError',
            provider: active,
            originalError: e,
          );
        }
      }
      
      // Re-throw original error if no fallback or fallback not configured
      if (e is AIProviderException) {
        rethrow;
      } else {
        throw AIProviderException('Analysis failed: $e', provider: active, originalError: e);
      }
    }
  }

  Future<List<FoodAnalysis>> compareProviders(File imageFile) async {
    final results = <FoodAnalysis>[];
    final errors = <String>[];

    for (final provider in _providers) {
      try {
        if (await provider.validateConfiguration()) {
          final analysis = await provider.analyzeImage(imageFile);
          results.add(analysis);
        }
      } catch (e) {
        errors.add('${provider.name}: $e');
      }
    }

    if (results.isEmpty) {
      throw AIProviderException('All providers failed: ${errors.join(', ')}');
    }

    return results;
  }

  AIProvider? getProviderById(String providerId) {
    try {
      return _providers.firstWhere((p) => p.providerId == providerId);
    } catch (e) {
      return null;
    }
  }

  List<AIProvider> get configuredProviders {
    return _providers.where((p) {
      try {
        return p.isConfigured;
      } catch (e) {
        return false;
      }
    }).toList();
  }

  List<AIProvider> get unconfiguredProviders {
    return _providers.where((p) {
      try {
        return !p.isConfigured;
      } catch (e) {
        return true;
      }
    }).toList();
  }

  Future<Map<String, bool>> getProviderStatus() async {
    final status = <String, bool>{};
    
    for (final provider in _providers) {
      try {
        status[provider.providerId] = await provider.validateConfiguration();
      } catch (e) {
        status[provider.providerId] = false;
      }
    }
    
    return status;
  }

  // Cost estimation (placeholder - would need actual pricing data)
  double estimateCost(AIProvider provider, {int imageCount = 1}) {
    switch (provider.providerId) {
      case 'openai':
        return imageCount * 0.01; // $0.01 per image (example)
      case 'anthropic':
        return imageCount * 0.008; // $0.008 per image (example)
      case 'gemini':
        return imageCount * 0.005; // $0.005 per image (example)
      default:
        return 0.0;
    }
  }

  Map<String, double> estimateAllProviderCosts({int imageCount = 1}) {
    final costs = <String, double>{};
    for (final provider in _providers) {
      costs[provider.providerId] = estimateCost(provider, imageCount: imageCount);
    }
    return costs;
  }
}