import 'package:isar/isar.dart';

part 'user_metrics.g.dart';

@collection
class UserMetrics {
  Id id = Isar.autoIncrement;
  
  late DateTime date;
  
  // Physical measurements
  double? weight; // in kg
  double? height; // in cm
  double? bodyFatPercentage;
  
  // User demographics
  int? age; // in years
  String? gender; // 'male', 'female', 'other'
  
  // Daily health metrics
  double? waterLiters;
  double? sleepHours;
  int? stepCount;
  
  // Body measurements stored as string in database
  String? bodyMeasurementsData;
  
  // Body measurements (optional) - computed from stored string
  @ignore
  Map<String, double>? _bodyMeasurements;
  
  @ignore
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
  
  @ignore
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
  double? bmi;
  double? bmr; // Basal Metabolic Rate
  
  // User goals and preferences
  double? dailyCalorieGoal;
  double? dailyWaterGoal;
  double? dailyStepGoal;
  
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

@embedded
class HealthGoal {
  late String name;
  late double targetValue;
  late String unit;
  late DateTime targetDate;
  late String description;
  
  @enumerated
  GoalType type = GoalType.weightLoss;
  
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

enum GoalType {
  weightLoss,
  weightGain,
  maintenance,
  performance,
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