import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/measurement_guide.dart';
import '../models/measurement_unit.dart';
import '../services/measurement_guide_service.dart';
import '../services/database_service.dart';

// Measurement Guide Service Provider
final measurementGuideServiceProvider = Provider<MeasurementGuideService>((ref) {
  return MeasurementGuideService();
});

// All guides
final allGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getAllGuides();
});

// Guide for specific unit
final guideForUnitProvider = FutureProvider.family<MeasurementGuide?, String>((ref, unitId) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getGuideForUnit(unitId);
});

// Guides by category
final guidesByCategoryProvider = FutureProvider.family<List<MeasurementGuide>, MeasurementCategory>((ref, category) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getGuidesByCategory(category);
});

// Search guides
final guideSearchProvider = StateProvider<String>((ref) => '');

final searchGuidesProvider = FutureProvider.family<List<MeasurementGuide>, String>((ref, query) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.searchGuides(query);
});

// Favorite guides
final favoriteGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getFavoriteGuides();
});

// Popular guides (most viewed)
final popularGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getPopularGuides();
});

// Recently viewed guides
final recentGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getRecentlyViewedGuides();
});

// Quick reference guides (most useful ones)
final quickReferenceGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getQuickReferenceGuides();
});

// Guide statistics
final guideStatsProvider = FutureProvider<GuideStatistics>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getGuideStatistics();
});

// Guides for specific food category
final guidesForFoodProvider = FutureProvider.family<List<MeasurementGuide>, String>((ref, foodName) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getGuidesForFood(foodName);
});

// User preferences for guides
final guidePreferencesProvider = StateNotifierProvider<GuidePreferencesNotifier, GuidePreferences>((ref) {
  return GuidePreferencesNotifier();
});

class GuidePreferencesNotifier extends StateNotifier<GuidePreferences> {
  GuidePreferencesNotifier() : super(GuidePreferences());

  void setShowVisualReferences(bool show) {
    state = state.copyWith(showVisualReferences: show);
  }

  void setShowMeasurementTips(bool show) {
    state = state.copyWith(showMeasurementTips: show);
  }

  void setShowApproximateWeights(bool show) {
    state = state.copyWith(showApproximateWeights: show);
  }

  void setPreferredReferenceType(String type) {
    state = state.copyWith(preferredReferenceType: type);
  }

  void setCompactMode(bool compact) {
    state = state.copyWith(compactMode: compact);
  }
}

class GuidePreferences {
  final bool showVisualReferences;
  final bool showMeasurementTips;
  final bool showApproximateWeights;
  final String preferredReferenceType; // 'hand', 'object', 'all'
  final bool compactMode;

  GuidePreferences({
    this.showVisualReferences = true,
    this.showMeasurementTips = true,
    this.showApproximateWeights = true,
    this.preferredReferenceType = 'all',
    this.compactMode = false,
  });

  GuidePreferences copyWith({
    bool? showVisualReferences,
    bool? showMeasurementTips,
    bool? showApproximateWeights,
    String? preferredReferenceType,
    bool? compactMode,
  }) {
    return GuidePreferences(
      showVisualReferences: showVisualReferences ?? this.showVisualReferences,
      showMeasurementTips: showMeasurementTips ?? this.showMeasurementTips,
      showApproximateWeights: showApproximateWeights ?? this.showApproximateWeights,
      preferredReferenceType: preferredReferenceType ?? this.preferredReferenceType,
      compactMode: compactMode ?? this.compactMode,
    );
  }
}

// Helper providers for common use cases
final handMeasurementGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getHandMeasurementGuides();
});

final cookingMeasurementGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getCookingMeasurementGuides();
});

final weightMeasurementGuidesProvider = FutureProvider<List<MeasurementGuide>>((ref) async {
  final service = ref.watch(measurementGuideServiceProvider);
  return await service.getWeightMeasurementGuides();
});

// Interactive guide state
final interactiveGuideProvider = StateNotifierProvider<InteractiveGuideNotifier, InteractiveGuideState>((ref) {
  return InteractiveGuideNotifier();
});

class InteractiveGuideNotifier extends StateNotifier<InteractiveGuideState> {
  InteractiveGuideNotifier() : super(InteractiveGuideState());

  void startGuide(String unitId) {
    state = state.copyWith(
      currentGuideId: unitId,
      isActive: true,
      currentStep: 0,
    );
  }

  void nextStep() {
    if (state.currentStep < state.totalSteps - 1) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void completeGuide() {
    state = state.copyWith(
      isActive: false,
      isCompleted: true,
    );
  }

  void resetGuide() {
    state = InteractiveGuideState();
  }
}

class InteractiveGuideState {
  final String? currentGuideId;
  final bool isActive;
  final bool isCompleted;
  final int currentStep;
  final int totalSteps;

  InteractiveGuideState({
    this.currentGuideId,
    this.isActive = false,
    this.isCompleted = false,
    this.currentStep = 0,
    this.totalSteps = 5,
  });

  InteractiveGuideState copyWith({
    String? currentGuideId,
    bool? isActive,
    bool? isCompleted,
    int? currentStep,
    int? totalSteps,
  }) {
    return InteractiveGuideState(
      currentGuideId: currentGuideId ?? this.currentGuideId,
      isActive: isActive ?? this.isActive,
      isCompleted: isCompleted ?? this.isCompleted,
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
    );
  }

  double get progress => totalSteps > 0 ? (currentStep + 1) / totalSteps : 0.0;
  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == totalSteps - 1;
}