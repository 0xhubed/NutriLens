import 'package:hive/hive.dart';

part 'activity_entry.g.dart';

@HiveType(typeId: 38)
enum ActivityCategory {
  @HiveField(0)
  cardio,
  @HiveField(1)
  strength,
  @HiveField(2)
  sports,
  @HiveField(3)
  flexibility,
  @HiveField(4)
  water,
  @HiveField(5)
  other,
}

@HiveType(typeId: 39)
enum Intensity {
  @HiveField(0)
  light,
  @HiveField(1)
  moderate,
  @HiveField(2)
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

@HiveType(typeId: 3)
class ActivityEntry extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String activityName = '';
  
  @HiveField(2)
  double metValue = 0.0;
  
  @HiveField(3)
  int durationMinutes = 0;
  
  @HiveField(4)
  double caloriesBurned = 0.0;
  
  @HiveField(5)
  DateTime timestamp = DateTime.now();
  
  @HiveField(6)
  ActivityCategory category = ActivityCategory.other;
  
  @HiveField(7)
  Intensity intensity = Intensity.moderate;
  
  @HiveField(8)
  String? notes;
  
  // User weight at time of activity (for accurate calorie calculation)
  @HiveField(9)
  double? userWeight;
  
  // Whether this was a manually entered activity or from a fitness tracker
  @HiveField(10)
  bool isManualEntry = true;
  
  // Optional fields for detailed tracking
  @HiveField(11)
  double? heartRateAverage;
  
  @HiveField(12)
  double? distanceKm;
  
  @HiveField(13)
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

@HiveType(typeId: 28)
class Activity extends HiveObject {
  @HiveField(0)
  String name = '';
  
  @HiveField(1)
  double baseMET = 0.0;
  
  @HiveField(2)
  ActivityCategory category = ActivityCategory.other;
  
  @HiveField(3)
  String description = '';
  
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