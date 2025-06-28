import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../services/metabolic_analysis_service.dart';
import '../services/metabolic_context_builder.dart';
import '../services/metabolic_coaching_service.dart';
import '../models/metabolic_state.dart';
import '../models/metabolic_context.dart';
import '../models/metabolic_insight.dart';
import '../models/eating_pattern.dart';
import '../models/food_entry.dart'; // For MealType
import 'ai_provider_manager_provider.dart';

// Database provider (assume this exists)
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar instance should be provided at app startup');
});

// Core services
final metabolicAnalysisServiceProvider = Provider<MetabolicAnalysisService>((ref) {
  final isar = ref.watch(isarProvider);
  return MetabolicAnalysisService(isar);
});

final metabolicContextBuilderProvider = Provider<MetabolicContextBuilder>((ref) {
  final analysisService = ref.watch(metabolicAnalysisServiceProvider);
  return MetabolicContextBuilder(analysisService);
});

final metabolicCoachingServiceProvider = Provider<MetabolicCoachingService>((ref) {
  final aiProviderManager = ref.watch(aiProviderManagerProvider);
  return MetabolicCoachingService(aiProviderManager);
});

// Current metabolic state
final currentMetabolicStateProvider = FutureProvider.family<MetabolicState, String>((ref, userId) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.calculateCurrentState(userId);
});

// Metabolic context
final metabolicContextProvider = FutureProvider.family<MetabolicContext, MetabolicContextParams>((ref, params) async {
  final builder = ref.watch(metabolicContextBuilderProvider);
  
  if (params.isQuick) {
    return await builder.buildQuickContext(params.userId);
  }
  
  return await builder.buildContext(
    userId: params.userId,
    goals: params.goals ?? UserGoals.maintenance,
    activityLevel: params.activityLevel ?? ActivityLevel.moderatelyActive,
    sleepPattern: params.sleepPattern ?? SleepPattern.defaultPattern,
    currentActivity: params.currentActivity,
    currentStressLevel: params.currentStressLevel,
  );
});

// Metabolic insights
final metabolicInsightProvider = FutureProvider.family<MetabolicInsight, String>((ref, userId) async {
  final context = await ref.read(metabolicContextProvider(MetabolicContextParams(userId: userId)).future);
  final coachingService = ref.watch(metabolicCoachingServiceProvider);
  
  return await coachingService.getPersonalizedInsight(context);
});

// Quick insight for immediate feedback
final quickMetabolicInsightProvider = FutureProvider.family<MetabolicInsight, QuickInsightParams>((ref, params) async {
  final coachingService = ref.watch(metabolicCoachingServiceProvider);
  return await coachingService.getQuickInsight(params.timeSinceLastMeal, params.currentActivity);
});

// Eating patterns
final eatingPatternProvider = FutureProvider.family<EatingPattern, EatingPatternParams>((ref, params) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.generateEatingPattern(params.userId, params.date);
});

final eatingPatternsRangeProvider = FutureProvider.family<List<EatingPattern>, EatingPatternRangeParams>((ref, params) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.getEatingPatterns(params.userId, params.startDate, params.endDate);
});

// Simple insights for display
final simpleInsightsProvider = FutureProvider.family<Map<String, String>, String>((ref, userId) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.getSimpleInsights(userId);
});

// Metabolic patterns analysis
final metabolicPatternsProvider = FutureProvider.family<List<String>, MetabolicPatternsParams>((ref, params) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.identifyPatterns(params.userId, params.timeRange);
});

// Meal timing recommendations
final mealTimingRecommendationProvider = FutureProvider.family<DateTime, MealTimingParams>((ref, params) async {
  final service = ref.watch(metabolicAnalysisServiceProvider);
  return await service.suggestOptimalMealTime(params.userId, params.mealType);
});

// State notifier for metabolic dashboard
final metabolicDashboardProvider = StateNotifierProvider<MetabolicDashboardNotifier, MetabolicDashboardState>((ref) {
  return MetabolicDashboardNotifier(ref);
});

class MetabolicDashboardNotifier extends StateNotifier<MetabolicDashboardState> {
  final Ref ref;
  
  MetabolicDashboardNotifier(this.ref) : super(MetabolicDashboardState.initial());
  
  Future<void> loadDashboard(String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // Load current state
      final currentState = await ref.read(currentMetabolicStateProvider(userId).future);
      
      // Load simple insights
      final insights = await ref.read(simpleInsightsProvider(userId).future);
      
      // Load recent patterns (last 7 days)
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(days: 7));
      final patterns = await ref.read(eatingPatternsRangeProvider(
        EatingPatternRangeParams(
          userId: userId,
          startDate: startDate,
          endDate: endDate,
        ),
      ).future);
      
      state = state.copyWith(
        isLoading: false,
        currentState: currentState,
        simpleInsights: insights,
        recentPatterns: patterns,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  Future<void> refreshInsights(String userId) async {
    // Invalidate providers to force refresh
    ref.invalidate(currentMetabolicStateProvider(userId));
    ref.invalidate(simpleInsightsProvider(userId));
    ref.invalidate(metabolicInsightProvider(userId));
    
    await loadDashboard(userId);
  }
}

// Data classes for parameters
class MetabolicContextParams {
  final String userId;
  final bool isQuick;
  final UserGoals? goals;
  final ActivityLevel? activityLevel;
  final SleepPattern? sleepPattern;
  final String? currentActivity;
  final double? currentStressLevel;
  
  MetabolicContextParams({
    required this.userId,
    this.isQuick = false,
    this.goals,
    this.activityLevel,
    this.sleepPattern,
    this.currentActivity,
    this.currentStressLevel,
  });
}

class QuickInsightParams {
  final Duration timeSinceLastMeal;
  final String currentActivity;
  
  QuickInsightParams({
    required this.timeSinceLastMeal,
    required this.currentActivity,
  });
}

class EatingPatternParams {
  final String userId;
  final DateTime date;
  
  EatingPatternParams({
    required this.userId,
    required this.date,
  });
}

class EatingPatternRangeParams {
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  
  EatingPatternRangeParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });
}

class MetabolicPatternsParams {
  final String userId;
  final Duration timeRange;
  
  MetabolicPatternsParams({
    required this.userId,
    required this.timeRange,
  });
}

class MealTimingParams {
  final String userId;
  final MealType mealType;
  
  MealTimingParams({
    required this.userId,
    required this.mealType,
  });
}

// Dashboard state
class MetabolicDashboardState {
  final bool isLoading;
  final String? error;
  final MetabolicState? currentState;
  final Map<String, String>? simpleInsights;
  final List<EatingPattern>? recentPatterns;
  
  MetabolicDashboardState({
    required this.isLoading,
    this.error,
    this.currentState,
    this.simpleInsights,
    this.recentPatterns,
  });
  
  factory MetabolicDashboardState.initial() {
    return MetabolicDashboardState(isLoading: false);
  }
  
  MetabolicDashboardState copyWith({
    bool? isLoading,
    String? error,
    MetabolicState? currentState,
    Map<String, String>? simpleInsights,
    List<EatingPattern>? recentPatterns,
  }) {
    return MetabolicDashboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentState: currentState ?? this.currentState,
      simpleInsights: simpleInsights ?? this.simpleInsights,
      recentPatterns: recentPatterns ?? this.recentPatterns,
    );
  }
}