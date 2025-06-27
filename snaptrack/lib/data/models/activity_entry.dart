import 'package:isar/isar.dart';

part 'activity_entry.g.dart';

enum ActivityCategory {
  cardio,
  strength,
  sports,
  flexibility,
  water,
  other,
}

enum Intensity {
  light,
  moderate,
  vigorous,
}

extension IntensityExtension on Intensity {
  double get multiplier {
    switch (this) {
      case Intensity.light:
        return 0.8;
      case Intensity.moderate:
        return 1.0;
      case Intensity.vigorous:
        return 1.2;
    }
  }
  
  String get displayName {
    switch (this) {
      case Intensity.light:
        return 'Light';
      case Intensity.moderate:
        return 'Moderate';
      case Intensity.vigorous:
        return 'Vigorous';
    }
  }
}

@collection
class ActivityEntry {
  Id id = Isar.autoIncrement;
  
  late String activityName;
  late double metValue;
  late int durationMinutes;
  late double caloriesBurned;
  late DateTime timestamp;
  
  @enumerated
  ActivityCategory category = ActivityCategory.other;
  
  @enumerated
  Intensity intensity = Intensity.moderate;
  
  String? notes;
  
  // User weight at time of activity (for accurate calorie calculation)
  double? userWeight;
  
  // Whether this was a manually entered activity or from a fitness tracker
  bool isManualEntry = true;
  
  // Optional fields for detailed tracking
  double? heartRateAverage;
  double? distanceKm;
  String? location;
  
  // Computed properties
  double get caloriesPerMinute => caloriesBurned / durationMinutes;
  String get formattedDuration => _formatDuration(durationMinutes);
  
  static String _formatDuration(int minutes) {
    if (minutes < 60) {
      return '${minutes}m';
    } else {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        return '${hours}h';
      } else {
        return '${hours}h ${remainingMinutes}m';
      }
    }
  }
}

@embedded
class Activity {
  late String name;
  late double baseMET;
  
  @enumerated
  late ActivityCategory category;
  
  late String description;
  
  Activity();
  
  Activity.create({
    required this.name,
    required this.baseMET,
    required this.category,
    required this.description,
  });
  
  // Calculate calories burned for this activity
  double calculateCalories({
    required int durationMinutes,
    required double userWeight,
    required Intensity intensity,
  }) {
    final effectiveMET = baseMET * intensity.multiplier;
    return effectiveMET * userWeight * (durationMinutes / 60.0);
  }
}