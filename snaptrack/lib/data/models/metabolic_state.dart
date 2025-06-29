import 'package:hive/hive.dart';

part 'metabolic_state.g.dart';

@HiveType(typeId: 36)
enum MetabolicPhase {
  @HiveField(0)
  fed,
  @HiveField(1)
  fasting,
  @HiveField(2)
  fatBurning,
  @HiveField(3)
  muscleBuilding,
}

@HiveType(typeId: 37)
enum InsulinLevel {
  @HiveField(0)
  low,
  @HiveField(1)
  medium,
  @HiveField(2)
  high,
}

@HiveType(typeId: 6)
class MetabolicState extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime timestamp = DateTime.now();
  
  @HiveField(2)
  MetabolicPhase phase = MetabolicPhase.fed;
  
  @HiveField(3)
  InsulinLevel estimatedInsulinLevel = InsulinLevel.medium;
  
  @HiveField(4)
  int timeInCurrentStateMinutes = 0; // Duration stored as minutes
  
  // Active metabolic processes
  @HiveField(5)
  List<String> activeProcesses = [];
  
  // Additional metabolic markers
  @HiveField(6)
  double fatBurningPotential = 0.0; // 0.0 to 1.0
  
  @HiveField(7)
  double muscleBuildinPotential = 0.0; // 0.0 to 1.0
  
  @HiveField(8)
  double digestiveLoad = 0.0; // 0.0 to 1.0
  
  // Context information
  @HiveField(9)
  int timeSinceLastMealMinutes = 0; // Duration stored as minutes
  
  @HiveField(10)
  double lastMealCalories = 0.0;
  
  @HiveField(11)
  double lastMealCarbs = 0.0;
  
  // Constructor
  MetabolicState();
  
  // Helper properties for Duration conversion
  Duration get timeInCurrentState => Duration(minutes: timeInCurrentStateMinutes);
  set timeInCurrentState(Duration duration) => timeInCurrentStateMinutes = duration.inMinutes;
  
  Duration get timeSinceLastMeal => Duration(minutes: timeSinceLastMealMinutes);
  set timeSinceLastMeal(Duration duration) => timeSinceLastMealMinutes = duration.inMinutes;
  
  // Calculate metabolic state based on timing and meal data
  static MetabolicState calculate({
    required Duration timeSinceLastMeal,
    required double lastMealCalories,
    required double lastMealCarbs,
    required DateTime timestamp,
  }) {
    final state = MetabolicState()
      ..timestamp = timestamp
      ..timeSinceLastMealMinutes = timeSinceLastMeal.inMinutes
      ..lastMealCalories = lastMealCalories
      ..lastMealCarbs = lastMealCarbs;
    
    state._calculatePhase();
    state._calculateInsulinLevel();
    state._calculateActiveProcesses();
    state._calculatePotentials();
    state._calculateTimeInState();
    
    return state;
  }
  
  void _calculatePhase() {
    final hoursSinceLastMeal = timeSinceLastMeal.inHours;
    
    if (hoursSinceLastMeal < 3) {
      phase = MetabolicPhase.fed;
    } else if (hoursSinceLastMeal < 12) {
      phase = MetabolicPhase.fasting;
    } else if (hoursSinceLastMeal < 18) {
      phase = MetabolicPhase.fatBurning;
    } else {
      phase = MetabolicPhase.muscleBuilding;
    }
  }
  
  void _calculateInsulinLevel() {
    final hoursSinceLastMeal = timeSinceLastMeal.inHours;
    
    if (hoursSinceLastMeal < 2 && lastMealCarbs > 30) {
      estimatedInsulinLevel = InsulinLevel.high;
    } else if (hoursSinceLastMeal < 4 && lastMealCarbs > 15) {
      estimatedInsulinLevel = InsulinLevel.medium;
    } else {
      estimatedInsulinLevel = InsulinLevel.low;
    }
  }
  
  void _calculateActiveProcesses() {
    activeProcesses.clear();
    
    final hoursSinceLastMeal = timeSinceLastMeal.inHours;
    
    if (hoursSinceLastMeal < 4) {
      activeProcesses.add('digestion');
    }
    
    if (hoursSinceLastMeal >= 6) {
      activeProcesses.add('fat_oxidation');
    }
    
    if (hoursSinceLastMeal >= 12) {
      activeProcesses.add('gluconeogenesis');
    }
    
    if (hoursSinceLastMeal >= 16) {
      activeProcesses.add('autophagy');
    }
    
    if (hoursSinceLastMeal >= 24) {
      activeProcesses.add('growth_hormone_release');
    }
  }
  
  void _calculatePotentials() {
    final hoursSinceLastMeal = timeSinceLastMeal.inHours;
    
    // Fat burning potential increases with fasting time
    fatBurningPotential = (hoursSinceLastMeal / 16).clamp(0.0, 1.0);
    
    // Muscle building potential decreases significantly after 6 hours
    if (hoursSinceLastMeal < 6) {
      muscleBuildinPotential = 1.0 - (hoursSinceLastMeal / 12);
    } else {
      muscleBuildinPotential = 0.1; // Minimal but not zero
    }
    
    // Digestive load decreases over time
    digestiveLoad = (1.0 - (hoursSinceLastMeal / 6)).clamp(0.0, 1.0);
  }
  
  void _calculateTimeInState() {
    // This would typically be calculated by comparing with previous states
    // For now, use a simple approximation
    final hoursSinceLastMeal = timeSinceLastMeal.inHours;
    
    switch (phase) {
      case MetabolicPhase.fed:
        timeInCurrentStateMinutes = timeSinceLastMeal.inMinutes;
        break;
      case MetabolicPhase.fasting:
        timeInCurrentStateMinutes = ((hoursSinceLastMeal - 3) * 60).clamp(0, double.infinity).toInt();
        break;
      case MetabolicPhase.fatBurning:
        timeInCurrentStateMinutes = ((hoursSinceLastMeal - 12) * 60).clamp(0, double.infinity).toInt();
        break;
      case MetabolicPhase.muscleBuilding:
        timeInCurrentStateMinutes = ((hoursSinceLastMeal - 18) * 60).clamp(0, double.infinity).toInt();
        break;
    }
  }
  
  // Helper methods
  bool get isFasting => phase == MetabolicPhase.fasting || phase == MetabolicPhase.fatBurning;
  bool get isFatBurning => fatBurningPotential > 0.5;
  bool get isInsulinSensitive => estimatedInsulinLevel == InsulinLevel.low;
  
  String get phaseDescription {
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Fed State - Digesting and storing nutrients';
      case MetabolicPhase.fasting:
        return 'Fasting State - Transitioning to fat burning';
      case MetabolicPhase.fatBurning:
        return 'Fat Burning Mode - Optimal fat oxidation';
      case MetabolicPhase.muscleBuilding:
        return 'Extended Fast - Growth hormone active';
    }
  }
  
  String get recommendedAction {
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Allow 3-4 hours before next meal for optimal digestion';
      case MetabolicPhase.fasting:
        return 'Great time for light activity to enhance fat burning';
      case MetabolicPhase.fatBurning:
        return 'Peak fat burning window - consider workout or continued fasting';
      case MetabolicPhase.muscleBuilding:
        return 'Consider protein-rich meal to support muscle building';
    }
  }
}