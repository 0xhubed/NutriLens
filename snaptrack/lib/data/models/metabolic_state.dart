import 'package:isar/isar.dart';

part 'metabolic_state.g.dart';

enum MetabolicPhase {
  fed,
  fasting,
  fatBurning,
  muscleBuilding,
}

enum InsulinLevel {
  low,
  medium,
  high,
}

@collection
class MetabolicState {
  Id id = Isar.autoIncrement;
  
  late DateTime timestamp;
  
  @enumerated
  late MetabolicPhase phase;
  
  @enumerated
  late InsulinLevel estimatedInsulinLevel;
  
  late int timeInCurrentStateMinutes; // Duration stored as minutes
  
  // Active metabolic processes
  List<String> activeProcesses = [];
  
  // Additional metabolic markers
  late double fatBurningPotential; // 0.0 to 1.0
  late double muscleBuildinPotential; // 0.0 to 1.0
  late double digestiveLoad; // 0.0 to 1.0
  
  // Context information
  late int timeSinceLastMealMinutes; // Duration stored as minutes
  late double lastMealCalories;
  late double lastMealCarbs;
  
  // Constructor
  MetabolicState();
  
  // Helper properties for Duration conversion
  @ignore
  Duration get timeInCurrentState => Duration(minutes: timeInCurrentStateMinutes);
  set timeInCurrentState(Duration duration) => timeInCurrentStateMinutes = duration.inMinutes;
  
  @ignore
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
  @ignore
  bool get isFasting => phase == MetabolicPhase.fasting || phase == MetabolicPhase.fatBurning;
  @ignore
  bool get isFatBurning => fatBurningPotential > 0.5;
  @ignore
  bool get isInsulinSensitive => estimatedInsulinLevel == InsulinLevel.low;
  
  @ignore
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
  
  @ignore
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