import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/activity_entry.dart';
import '../models/user_metrics.dart';
import 'activity_database.dart';

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService();
});

class ActivityService {
  Box<ActivityEntry> get _activityBox => Hive.box<ActivityEntry>('activityEntries');
  
  ActivityService();

  // Activity Entry CRUD operations
  Future<void> logActivity(ActivityEntry entry) async {
    // Generate ID if not present
    entry.id ??= DateTime.now().millisecondsSinceEpoch.toString();
    await _activityBox.put(entry.id, entry);
  }

  Future<void> updateActivity(ActivityEntry entry) async {
    if (entry.id == null) return;
    await _activityBox.put(entry.id, entry);
  }

  Future<void> deleteActivity(int id) async {
    await _activityBox.delete(id);
  }

  Future<List<ActivityEntry>> getActivitiesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    return _activityBox.values
        .where((entry) =>
            entry.timestamp.isAfter(startOfDay) &&
            entry.timestamp.isBefore(endOfDay))
        .toList();
  }

  Future<List<ActivityEntry>> getActivitiesInRange(DateTime startDate, DateTime endDate) async {
    return _activityBox.values
        .where((entry) =>
            entry.timestamp.isAfter(startDate) &&
            entry.timestamp.isBefore(endDate))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  Stream<List<ActivityEntry>> watchActivitiesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    print('🏃 ActivityService: Setting up watchActivitiesForDate stream...');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final activities = _activityBox.values
          .where((entry) =>
              entry.timestamp.isAfter(startOfDay) &&
              entry.timestamp.isBefore(endOfDay))
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
      print('🏃 ActivityService: Activities for date check: ${activities.length} activities');
      return activities;
    }).distinct((prev, next) => prev.length == next.length && 
      (prev.isEmpty || next.isEmpty || prev.first.id == next.first.id));
  }

  Stream<List<ActivityEntry>> watchAllActivities() {
    print('🏃 ActivityService: Setting up watchAllActivities stream...');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final activities = _activityBox.values.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
      print('🏃 ActivityService: All activities check: ${activities.length} activities');
      return activities;
    }).distinct((prev, next) => prev.length == next.length && 
      (prev.isEmpty || next.isEmpty || prev.first.id == next.first.id));
  }

  // Calorie calculation methods
  Future<double> calculateDailyBurn(DateTime date) async {
    final activities = await getActivitiesForDate(date);
    return activities.fold<double>(0.0, (double sum, ActivityEntry activity) => sum + activity.caloriesBurned);
  }

  Future<double> calculateWeeklyBurn(DateTime startDate) async {
    final endDate = startDate.add(const Duration(days: 7));
    final activities = await getActivitiesInRange(startDate, endDate);
    return activities.fold<double>(0.0, (double sum, ActivityEntry activity) => sum + activity.caloriesBurned);
  }

  // Create activity entry with automatic calorie calculation
  Future<ActivityEntry> createActivityEntry({
    required String activityName,
    required int durationMinutes,
    required Intensity intensity,
    required double userWeight,
    DateTime? timestamp,
    String? notes,
  }) async {
    final activity = ActivityDatabase.getActivityByName(activityName);
    if (activity == null) {
      throw ArgumentError('Activity not found: $activityName');
    }

    final caloriesBurned = CalorieCalculator.calculateBurn(
      activity: activity,
      durationMinutes: durationMinutes,
      userWeight: userWeight,
      intensity: intensity,
    );

    final entry = ActivityEntry()
      ..activityName = activityName
      ..metValue = activity.baseMET
      ..durationMinutes = durationMinutes
      ..intensity = intensity
      ..caloriesBurned = caloriesBurned
      ..userWeight = userWeight
      ..timestamp = timestamp ?? DateTime.now()
      ..category = activity.category
      ..notes = notes;

    return entry;
  }

  // Get recent activities for quick logging
  Future<List<ActivityEntry>> getRecentActivities({int limit = 10}) async {
    final activities = _activityBox.values.toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    
    return activities.take(limit).toList();
  }

  // Get favorite activities (most logged)
  Future<List<String>> getFavoriteActivities({int limit = 5}) async {
    final activities = _activityBox.values.toList();
    
    // Count frequency of each activity
    final activityCounts = <String, int>{};
    for (final activity in activities) {
      activityCounts[activity.activityName] = 
          (activityCounts[activity.activityName] ?? 0) + 1;
    }

    // Sort by frequency and return top activities
    final sortedActivities = activityCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedActivities
        .take(limit)
        .map((entry) => entry.key)
        .toList();
  }

  // Activity statistics
  Future<ActivityStats> getActivityStats(DateTime date) async {
    final activities = await getActivitiesForDate(date);
    
    if (activities.isEmpty) {
      return ActivityStats.empty();
    }

    final totalCalories = activities.fold(0.0, (sum, a) => sum + a.caloriesBurned);
    final totalMinutes = activities.fold(0, (sum, a) => sum + a.durationMinutes);
    final averageIntensity = activities
        .map((a) => a.intensity.multiplier)
        .reduce((a, b) => a + b) / activities.length;

    // Group by category
    final categoryBreakdown = <ActivityCategory, double>{};
    for (final activity in activities) {
      categoryBreakdown[activity.category] = 
          (categoryBreakdown[activity.category] ?? 0) + activity.caloriesBurned;
    }

    return ActivityStats(
      totalCalories: totalCalories,
      totalMinutes: totalMinutes,
      activityCount: activities.length,
      averageIntensity: averageIntensity,
      categoryBreakdown: categoryBreakdown,
      mostActiveHour: _getMostActiveHour(activities),
    );
  }

  int _getMostActiveHour(List<ActivityEntry> activities) {
    final hourCounts = <int, int>{};
    for (final activity in activities) {
      final hour = activity.timestamp.hour;
      hourCounts[hour] = (hourCounts[hour] ?? 0) + 1;
    }

    if (hourCounts.isEmpty) return 12; // Default to noon

    return hourCounts.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }
}

class CalorieCalculator {
  static double calculateBurn({
    required Activity activity,
    required int durationMinutes,
    required double userWeight,
    required Intensity intensity,
  }) {
    final effectiveMET = activity.baseMET * intensity.multiplier;
    return effectiveMET * userWeight * (durationMinutes / 60.0);
  }

  static double calculateBMR({
    required double weight, // kg
    required double height, // cm
    required int age,
    required bool isMale,
  }) {
    // Mifflin-St Jeor Equation
    double bmr = (10 * weight) + (6.25 * height) - (5 * age);
    return isMale ? bmr + 5 : bmr - 161;
  }

  static double calculateTDEE({
    required double bmr,
    required ActivityLevel activityLevel,
  }) {
    return bmr * activityLevel.multiplier;
  }
}

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extraActive,
}

extension ActivityLevelExtension on ActivityLevel {
  double get multiplier {
    switch (this) {
      case ActivityLevel.sedentary:
        return 1.2;
      case ActivityLevel.lightlyActive:
        return 1.375;
      case ActivityLevel.moderatelyActive:
        return 1.55;
      case ActivityLevel.veryActive:
        return 1.725;
      case ActivityLevel.extraActive:
        return 1.9;
    }
  }

  String get displayName {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Sedentary';
      case ActivityLevel.lightlyActive:
        return 'Lightly Active';
      case ActivityLevel.moderatelyActive:
        return 'Moderately Active';
      case ActivityLevel.veryActive:
        return 'Very Active';
      case ActivityLevel.extraActive:
        return 'Extra Active';
    }
  }

  String get description {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Little to no exercise';
      case ActivityLevel.lightlyActive:
        return 'Light exercise 1-3 days/week';
      case ActivityLevel.moderatelyActive:
        return 'Moderate exercise 3-5 days/week';
      case ActivityLevel.veryActive:
        return 'Hard exercise 6-7 days/week';
      case ActivityLevel.extraActive:
        return 'Very hard exercise, physical job';
    }
  }
}

class ActivityStats {
  final double totalCalories;
  final int totalMinutes;
  final int activityCount;
  final double averageIntensity;
  final Map<ActivityCategory, double> categoryBreakdown;
  final int mostActiveHour;

  ActivityStats({
    required this.totalCalories,
    required this.totalMinutes,
    required this.activityCount,
    required this.averageIntensity,
    required this.categoryBreakdown,
    required this.mostActiveHour,
  });

  factory ActivityStats.empty() {
    return ActivityStats(
      totalCalories: 0,
      totalMinutes: 0,
      activityCount: 0,
      averageIntensity: 0,
      categoryBreakdown: {},
      mostActiveHour: 12,
    );
  }

  String get formattedDuration {
    if (totalMinutes < 60) {
      return '${totalMinutes}m';
    } else {
      final hours = totalMinutes ~/ 60;
      final minutes = totalMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  String get intensityLabel {
    if (averageIntensity < 0.9) return 'Light';
    if (averageIntensity < 1.1) return 'Moderate';
    return 'Vigorous';
  }
}