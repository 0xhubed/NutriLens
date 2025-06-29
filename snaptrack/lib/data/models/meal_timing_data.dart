import 'package:hive/hive.dart';
import 'food_entry.dart';
import 'macro_profile.dart';

part 'meal_timing_data.g.dart';

@HiveType(typeId: 9)
class MealTimingData extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime timestamp = DateTime.now();
  
  @HiveField(2)
  int timeSinceLastMealMinutes = 0; // Duration stored as minutes
  
  @HiveField(3)
  int fastingWindowMinutes = 0; // Duration stored as minutes
  
  @HiveField(4)
  MealType mealType = MealType.breakfast;
  
  @HiveField(5)
  double totalCalories = 0.0;
  
  // Embedded macro profile for this meal
  @HiveField(6)
  double protein = 0.0;
  
  @HiveField(7)
  double carbs = 0.0;
  
  @HiveField(8)
  double fat = 0.0;
  
  @HiveField(9)
  double fiber = 0.0;
  
  // Food types in this meal
  @HiveField(10)
  List<String> foodTypes = []; // protein, carbs, fats, fiber
  
  // Link to the actual food entry if available
  @HiveField(11)
  String? foodEntryId;
  
  // Constructor
  MealTimingData();
  
  // Helper properties for Duration conversion
  Duration get timeSinceLastMeal => Duration(minutes: timeSinceLastMealMinutes);
  set timeSinceLastMeal(Duration duration) => timeSinceLastMealMinutes = duration.inMinutes;
  
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
  bool get isHighProtein => macroDistribution['protein']! > 30;
  bool get isHighCarb => macroDistribution['carbs']! > 50;
  bool get isHighFat => macroDistribution['fat']! > 40;
  
  // Get meal size category
  String get mealSizeCategory {
    if (totalCalories < 200) return 'snack';
    if (totalCalories < 400) return 'light_meal';
    if (totalCalories < 700) return 'moderate_meal';
    return 'large_meal';
  }
}