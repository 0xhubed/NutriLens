import 'package:hive/hive.dart';

part 'user_metrics.g.dart';

@HiveType(typeId: 4)
class UserMetrics extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime date = DateTime.now();
  
  // Physical measurements
  @HiveField(2)
  double? weight; // in kg
  
  @HiveField(3)
  double? height; // in cm
  
  @HiveField(4)
  double? bodyFatPercentage;
  
  // User demographics
  @HiveField(5)
  int? age; // in years
  
  @HiveField(6)
  String? gender; // 'male', 'female', 'other'
  
  // Daily health metrics
  @HiveField(7)
  double? waterLiters;
  
  @HiveField(8)
  double? sleepHours;
  
  @HiveField(9)
  int? stepCount;
  
  // Body measurements stored as string in database
  @HiveField(10)
  String? bodyMeasurementsData;
  
  // Body measurements (optional) - computed from stored string
  Map<String, double>? _bodyMeasurements;
  
  Map<String, double>? get bodyMeasurements {
    if (_bodyMeasurements == null && bodyMeasurementsData != null) {
      _bodyMeasurements = {};
      for (final entry in bodyMeasurementsData!.split(',')) {
        final parts = entry.split(':');
        if (parts.length == 2) {
          final key = parts[0].trim();
          final value = double.tryParse(parts[1].trim());
          if (value != null) {
            _bodyMeasurements![key] = value;
          }
        }
      }
    }
    return _bodyMeasurements;
  }
  
  set bodyMeasurements(Map<String, double>? measurements) {
    _bodyMeasurements = measurements;
    if (measurements == null) {
      bodyMeasurementsData = null;
    } else {
      bodyMeasurementsData = measurements.entries
          .map((e) => '${e.key}:${e.value}')
          .join(',');
    }
  }
  
  // Calculated metrics
  @HiveField(11)
  double? bmi;
  
  @HiveField(12)
  double? bmr; // Basal Metabolic Rate
  
  // User goals and preferences
  @HiveField(13)
  double? dailyCalorieGoal;
  
  @HiveField(14)
  double? dailyWaterGoal;
  
  @HiveField(15)
  double? dailyStepGoal;
  
  @HiveField(16)
  String? notes;
  
  UserMetrics();
  
  UserMetrics.create({
    required this.date,
    this.weight,
    this.height,
    this.bodyFatPercentage,
    this.waterLiters,
    this.sleepHours,
    this.stepCount,
    Map<String, double>? bodyMeasurements,
    this.dailyCalorieGoal,
    this.dailyWaterGoal,
    this.dailyStepGoal,
    this.notes,
  }) {
    if (bodyMeasurements != null) {
      this.bodyMeasurements = bodyMeasurements;
    }
    _calculateDerivedMetrics();
  }
  
  void _calculateDerivedMetrics() {
    if (weight != null && height != null) {
      final heightInMeters = height! / 100;
      bmi = weight! / (heightInMeters * heightInMeters);
    }
    
    if (weight != null && height != null) {
      // Using Mifflin-St Jeor Equation (assuming male, can be adjusted)
      // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age + 5 (male)
      // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age - 161 (female)
      // For now, using a simplified version without age/gender
      bmr = (10 * weight!) + (6.25 * height!) + 5;
    }
  }
  
  // Helper methods
  String get bmiCategory {
    if (bmi == null) return 'Unknown';
    if (bmi! < 18.5) return 'Underweight';
    if (bmi! < 25) return 'Normal';
    if (bmi! < 30) return 'Overweight';
    return 'Obese';
  }
  
  // Helper to get current weight (alias for backward compatibility)
  double? get currentWeight => weight;
  
  bool get isCompleteProfile {
    return weight != null && height != null;
  }
  
  double get waterGoalProgress {
    if (dailyWaterGoal == null || waterLiters == null) return 0.0;
    return (waterLiters! / dailyWaterGoal!).clamp(0.0, 1.0);
  }
  
  double get stepGoalProgress {
    if (dailyStepGoal == null || stepCount == null) return 0.0;
    return (stepCount! / dailyStepGoal!).clamp(0.0, 1.0);
  }
}

@HiveType(typeId: 25)
class HealthGoal extends HiveObject {
  @HiveField(0)
  String name = '';
  
  @HiveField(1)
  double targetValue = 0.0;
  
  @HiveField(2)
  String unit = '';
  
  @HiveField(3)
  DateTime targetDate = DateTime.now();
  
  @HiveField(4)
  String description = '';
  
  @HiveField(5)
  GoalType type = GoalType.weightLoss;
  
  @HiveField(6)
  bool isActive = true;
  
  HealthGoal();
  
  HealthGoal.create({
    required this.name,
    required this.targetValue,
    required this.unit,
    required this.targetDate,
    required this.description,
    required this.type,
    this.isActive = true,
  });
}

@HiveType(typeId: 35)
enum GoalType {
  @HiveField(0)
  weightLoss,
  @HiveField(1)
  weightGain,
  @HiveField(2)
  maintenance,
  @HiveField(3)
  performance,
  @HiveField(4)
  custom,
}

extension GoalTypeExtension on GoalType {
  String get displayName {
    switch (this) {
      case GoalType.weightLoss:
        return 'Weight Loss';
      case GoalType.weightGain:
        return 'Weight Gain';
      case GoalType.maintenance:
        return 'Maintenance';
      case GoalType.performance:
        return 'Performance';
      case GoalType.custom:
        return 'Custom';
    }
  }
  
  String get description {
    switch (this) {
      case GoalType.weightLoss:
        return 'Target daily calorie deficit';
      case GoalType.weightGain:
        return 'Target daily calorie surplus';
      case GoalType.maintenance:
        return 'Maintain current weight';
      case GoalType.performance:
        return 'Focus on activity levels';
      case GoalType.custom:
        return 'Custom goal parameters';
    }
  }
}