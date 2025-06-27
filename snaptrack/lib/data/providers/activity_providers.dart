import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/activity_entry.dart';
import '../models/user_metrics.dart';
import '../services/activity_database.dart';
import '../services/activity_service.dart';
import 'nutrition_providers.dart';

// Activity Service Provider
final activityServiceProvider = Provider<ActivityService>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

// Today's activities
final todayActivitiesProvider = StreamProvider<List<ActivityEntry>>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  final today = DateTime.now();
  return activityService.watchActivitiesForDate(today);
});

// Activity statistics for today
final todayActivityStatsProvider = FutureProvider<ActivityStats>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  final today = DateTime.now();
  return activityService.getActivityStats(today);
});

// All available activities from database
final availableActivitiesProvider = Provider<List<Activity>>((ref) {
  return ActivityDatabase.getAllActivities();
});

// Activities grouped by category
final activitiesByCategoryProvider = Provider<Map<ActivityCategory, List<Activity>>>((ref) {
  return ActivityDatabase.getActivitiesGroupedByCategory();
});

// Popular activities
final popularActivitiesProvider = Provider<List<Activity>>((ref) {
  return ActivityDatabase.getPopularActivities();
});

// Recent activities
final recentActivitiesProvider = FutureProvider<List<ActivityEntry>>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  return activityService.getRecentActivities();
});

// Favorite activities
final favoriteActivitiesProvider = FutureProvider<List<String>>((ref) {
  final activityService = ref.watch(activityServiceProvider);
  return activityService.getFavoriteActivities();
});

// Activity search provider
final activitySearchProvider = StateProvider<String>((ref) => '');

final filteredActivitiesProvider = Provider<List<Activity>>((ref) {
  final searchQuery = ref.watch(activitySearchProvider);
  return ActivityDatabase.searchActivities(searchQuery);
});

// Selected activity category filter
final selectedActivityCategoryProvider = StateProvider<ActivityCategory?>((ref) => null);

final filteredActivitiesByCategoryProvider = Provider<List<Activity>>((ref) {
  final selectedCategory = ref.watch(selectedActivityCategoryProvider);
  final searchQuery = ref.watch(activitySearchProvider);
  
  if (selectedCategory == null) {
    return ActivityDatabase.searchActivities(searchQuery);
  } else {
    final categoryActivities = ActivityDatabase.getActivitiesByCategory(selectedCategory);
    if (searchQuery.isEmpty) {
      return categoryActivities;
    } else {
      final lowercaseQuery = searchQuery.toLowerCase();
      return categoryActivities
          .where((activity) =>
              activity.name.toLowerCase().contains(lowercaseQuery) ||
              activity.description.toLowerCase().contains(lowercaseQuery))
          .toList();
    }
  }
});

// User weight provider (needed for calorie calculations)
final userWeightProvider = StateProvider<double>((ref) => 70.0); // Default 70kg

// Activity form state
class ActivityFormState {
  final Activity? selectedActivity;
  final int durationMinutes;
  final Intensity intensity;
  final DateTime timestamp;
  final String notes;

  ActivityFormState({
    this.selectedActivity,
    this.durationMinutes = 30,
    this.intensity = Intensity.moderate,
    DateTime? timestamp,
    this.notes = '',
  }) : timestamp = timestamp ?? DateTime.now();

  ActivityFormState copyWith({
    Activity? selectedActivity,
    int? durationMinutes,
    Intensity? intensity,
    DateTime? timestamp,
    String? notes,
  }) {
    return ActivityFormState(
      selectedActivity: selectedActivity ?? this.selectedActivity,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      intensity: intensity ?? this.intensity,
      timestamp: timestamp ?? this.timestamp,
      notes: notes ?? this.notes,
    );
  }

  bool get isValid => selectedActivity != null && durationMinutes > 0;

  double calculateCalories(double userWeight) {
    if (selectedActivity == null) return 0.0;
    
    return CalorieCalculator.calculateBurn(
      activity: selectedActivity!,
      durationMinutes: durationMinutes,
      userWeight: userWeight,
      intensity: intensity,
    );
  }
}

final activityFormProvider = StateNotifierProvider<ActivityFormNotifier, ActivityFormState>((ref) {
  return ActivityFormNotifier();
});

class ActivityFormNotifier extends StateNotifier<ActivityFormState> {
  ActivityFormNotifier() : super(ActivityFormState());

  void selectActivity(Activity activity) {
    state = state.copyWith(selectedActivity: activity);
  }

  void setDuration(int minutes) {
    state = state.copyWith(durationMinutes: minutes);
  }

  void setIntensity(Intensity intensity) {
    state = state.copyWith(intensity: intensity);
  }

  void setTimestamp(DateTime timestamp) {
    state = state.copyWith(timestamp: timestamp);
  }

  void setNotes(String notes) {
    state = state.copyWith(notes: notes);
  }

  void reset() {
    state = ActivityFormState();
  }
}

// Daily calorie balance provider
final dailyCalorieBalanceProvider = FutureProvider<CalorieBalance>((ref) async {
  final activityService = ref.watch(activityServiceProvider);
  final todayNutrition = await ref.watch(todayNutritionProvider.future);
  final today = DateTime.now();
  
  // Get today's activity burn
  final activityBurn = await activityService.calculateDailyBurn(today);
  
  // Get food intake from nutrition data
  final foodIntake = todayNutrition?.totalCalories ?? 0.0;
  
  // Estimated BMR (will be calculated from user metrics)
  const bmr = 1800.0; // TODO: Calculate from user weight, height, age, gender
  
  return CalorieBalance(
    foodIntake: foodIntake,
    activityBurn: activityBurn,
    bmr: bmr,
    date: today,
  );
});

class CalorieBalance {
  final double foodIntake;
  final double activityBurn;
  final double bmr;
  final DateTime date;

  CalorieBalance({
    required this.foodIntake,
    required this.activityBurn,
    required this.bmr,
    required this.date,
  });

  double get netCalories => foodIntake - activityBurn - bmr;
  
  bool get isDeficit => netCalories < 0;
  bool get isSurplus => netCalories > 0;
  bool get isBalanced => netCalories.abs() < 50; // Within 50 calories

  String get balanceLabel {
    if (isBalanced) return 'Balanced';
    if (isDeficit) return 'Deficit';
    return 'Surplus';
  }

  String get formattedBalance {
    final abs = netCalories.abs();
    final sign = netCalories >= 0 ? '+' : '-';
    return '$sign${abs.toStringAsFixed(0)} cal';
  }
}