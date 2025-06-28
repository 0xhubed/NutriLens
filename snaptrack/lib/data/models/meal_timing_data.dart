import 'package:isar/isar.dart';
import 'food_entry.dart';
import 'macro_profile.dart';

part 'meal_timing_data.g.dart';

@collection
class MealTimingData {
  Id id = Isar.autoIncrement;
  
  late DateTime timestamp;
  late int timeSinceLastMealMinutes; // Duration stored as minutes
  late int fastingWindowMinutes; // Duration stored as minutes
  
  @enumerated
  late MealType mealType;
  
  late double totalCalories;
  
  // Embedded macro profile for this meal
  late double protein;
  late double carbs;
  late double fat;
  late double fiber;
  
  // Food types in this meal
  List<String> foodTypes = []; // protein, carbs, fats, fiber
  
  // Link to the actual food entry if available
  int? foodEntryId;
  
  // Constructor
  MealTimingData();
  
  // Helper properties for Duration conversion
  @ignore
  Duration get timeSinceLastMeal => Duration(minutes: timeSinceLastMealMinutes);
  set timeSinceLastMeal(Duration duration) => timeSinceLastMealMinutes = duration.inMinutes;
  
  @ignore
  Duration get fastingWindow => Duration(minutes: fastingWindowMinutes);
  set fastingWindow(Duration duration) => fastingWindowMinutes = duration.inMinutes;
  
  // Create from FoodEntry
  static MealTimingData fromFoodEntry(FoodEntry entry, Duration timeSinceLastMeal, Duration fastingWindow) {
    final mealTiming = MealTimingData()
      ..timestamp = entry.timestamp
      ..timeSinceLastMealMinutes = timeSinceLastMeal.inMinutes
      ..fastingWindowMinutes = fastingWindow.inMinutes
      ..mealType = entry.mealType
      ..totalCalories = entry.effectiveCalories
      ..protein = entry.effectiveProtein
      ..carbs = entry.effectiveCarbs
      ..fat = entry.effectiveFat
      ..fiber = 0.0 // TODO: Add fiber to FoodEntry
      ..foodEntryId = entry.id;
    
    // Determine food types based on macro distribution
    mealTiming._calculateFoodTypes();
    
    return mealTiming;
  }
  
  void _calculateFoodTypes() {
    foodTypes.clear();
    
    final totalMacros = protein + carbs + fat;
    if (totalMacros == 0) return;
    
    final proteinRatio = protein / totalMacros;
    final carbsRatio = carbs / totalMacros;
    final fatRatio = fat / totalMacros;
    
    // Add food types based on significant macro content (>15%)
    if (proteinRatio > 0.15) foodTypes.add('protein');
    if (carbsRatio > 0.15) foodTypes.add('carbs');
    if (fatRatio > 0.15) foodTypes.add('fats');
    if (fiber > 5.0) foodTypes.add('fiber'); // More than 5g fiber
  }
  
  // Get macro distribution as percentages
  @ignore
  Map<String, double> get macroDistribution {
    final totalMacros = protein + carbs + fat;
    if (totalMacros == 0) {
      return {'protein': 0, 'carbs': 0, 'fat': 0};
    }
    
    return {
      'protein': (protein / totalMacros) * 100,
      'carbs': (carbs / totalMacros) * 100,
      'fat': (fat / totalMacros) * 100,
    };
  }
  
  // Check if this meal is high in specific macros
  @ignore
  bool get isHighProtein => macroDistribution['protein']! > 30;
  @ignore
  bool get isHighCarb => macroDistribution['carbs']! > 50;
  @ignore
  bool get isHighFat => macroDistribution['fat']! > 40;
  
  // Get meal size category
  @ignore
  String get mealSizeCategory {
    if (totalCalories < 200) return 'snack';
    if (totalCalories < 400) return 'light_meal';
    if (totalCalories < 700) return 'moderate_meal';
    return 'large_meal';
  }
}