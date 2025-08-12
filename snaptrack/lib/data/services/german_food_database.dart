import '../models/food_entry.dart';

/// Service providing common German food items with nutritional information
/// These are commonly consumed foods in German-speaking countries
class GermanFoodDatabase {
  
  /// Get a list of common German food items
  static List<GermanFoodItem> getCommonGermanFoods() {
    return _germanFoods;
  }
  
  /// Find German food items by name (partial match)
  static List<GermanFoodItem> searchFoods(String query) {
    final lowerQuery = query.toLowerCase();
    return _germanFoods.where((food) => 
      food.nameDE.toLowerCase().contains(lowerQuery) ||
      food.nameEN.toLowerCase().contains(lowerQuery)
    ).toList();
  }
  
  /// Get food item by exact German name
  static GermanFoodItem? getFoodByGermanName(String name) {
    try {
      return _germanFoods.firstWhere(
        (food) => food.nameDE.toLowerCase() == name.toLowerCase()
      );
    } catch (e) {
      return null;
    }
  }
  
  /// Common German food items with nutritional data (per 100g)
  static final List<GermanFoodItem> _germanFoods = [
    // Breakfast items
    GermanFoodItem(
      nameDE: 'Brötchen',
      nameEN: 'German Bread Roll',
      calories: 250,
      protein: 8.0,
      carbs: 50.0,
      fat: 2.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 50,
    ),
    GermanFoodItem(
      nameDE: 'Müsli',
      nameEN: 'Muesli',
      calories: 380,
      protein: 12.0,
      carbs: 65.0,
      fat: 8.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 40,
    ),
    GermanFoodItem(
      nameDE: 'Quark',
      nameEN: 'Curd Cheese',
      calories: 69,
      protein: 13.0,
      carbs: 4.0,
      fat: 0.3,
      foodGroup: FoodGroup.dairy,
      cuisine: CuisineType.german,
      commonPortionGrams: 150,
    ),
    GermanFoodItem(
      nameDE: 'Leberwurst',
      nameEN: 'Liver Sausage',
      calories: 326,
      protein: 14.0,
      carbs: 2.0,
      fat: 29.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 30,
    ),
    
    // Main dishes
    GermanFoodItem(
      nameDE: 'Schnitzel',
      nameEN: 'Schnitzel',
      calories: 210,
      protein: 25.0,
      carbs: 8.0,
      fat: 8.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 150,
    ),
    GermanFoodItem(
      nameDE: 'Bratwurst',
      nameEN: 'Bratwurst',
      calories: 313,
      protein: 13.0,
      carbs: 3.0,
      fat: 27.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 100,
    ),
    GermanFoodItem(
      nameDE: 'Sauerkraut',
      nameEN: 'Sauerkraut',
      calories: 19,
      protein: 0.9,
      carbs: 4.3,
      fat: 0.1,
      foodGroup: FoodGroup.vegetables,
      cuisine: CuisineType.german,
      commonPortionGrams: 150,
    ),
    GermanFoodItem(
      nameDE: 'Spätzle',
      nameEN: 'Spaetzle',
      calories: 140,
      protein: 5.0,
      carbs: 25.0,
      fat: 2.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 200,
    ),
    GermanFoodItem(
      nameDE: 'Döner Kebab',
      nameEN: 'Doner Kebab',
      calories: 215,
      protein: 15.0,
      carbs: 20.0,
      fat: 8.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 300,
    ),
    GermanFoodItem(
      nameDE: 'Sauerbraten',
      nameEN: 'Sauerbraten',
      calories: 185,
      protein: 22.0,
      carbs: 3.0,
      fat: 9.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 200,
    ),
    GermanFoodItem(
      nameDE: 'Currywurst',
      nameEN: 'Curry Sausage',
      calories: 250,
      protein: 12.0,
      carbs: 8.0,
      fat: 18.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 150,
    ),
    
    // Beverages
    GermanFoodItem(
      nameDE: 'Apfelschorle',
      nameEN: 'Apple Spritzer',
      calories: 25,
      protein: 0.0,
      carbs: 6.0,
      fat: 0.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 250,
    ),
    GermanFoodItem(
      nameDE: 'Radler',
      nameEN: 'Radler (Beer Mix)',
      calories: 45,
      protein: 0.3,
      carbs: 4.5,
      fat: 0.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 500,
    ),
    GermanFoodItem(
      nameDE: 'Glühwein',
      nameEN: 'Mulled Wine',
      calories: 85,
      protein: 0.1,
      carbs: 8.0,
      fat: 0.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 200,
    ),
    
    // Desserts and sweets
    GermanFoodItem(
      nameDE: 'Schwarzwälder Kirschtorte',
      nameEN: 'Black Forest Cake',
      calories: 350,
      protein: 4.0,
      carbs: 35.0,
      fat: 22.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 120,
    ),
    GermanFoodItem(
      nameDE: 'Apfelstrudel',
      nameEN: 'Apple Strudel',
      calories: 195,
      protein: 3.0,
      carbs: 35.0,
      fat: 5.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 150,
    ),
    GermanFoodItem(
      nameDE: 'Lebkuchen',
      nameEN: 'Gingerbread',
      calories: 410,
      protein: 5.0,
      carbs: 75.0,
      fat: 10.0,
      foodGroup: FoodGroup.other,
      cuisine: CuisineType.german,
      commonPortionGrams: 30,
    ),
    
    // Bread and bakery
    GermanFoodItem(
      nameDE: 'Pumpernickel',
      nameEN: 'Pumpernickel Bread',
      calories: 250,
      protein: 9.0,
      carbs: 45.0,
      fat: 3.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 35,
    ),
    GermanFoodItem(
      nameDE: 'Brezel',
      nameEN: 'Pretzel',
      calories: 290,
      protein: 8.0,
      carbs: 55.0,
      fat: 4.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 85,
    ),
    
    // Cheese
    GermanFoodItem(
      nameDE: 'Weisswurst',
      nameEN: 'White Sausage',
      calories: 285,
      protein: 12.0,
      carbs: 1.0,
      fat: 25.0,
      foodGroup: FoodGroup.proteins,
      cuisine: CuisineType.german,
      commonPortionGrams: 100,
    ),
    GermanFoodItem(
      nameDE: 'Maultaschen',
      nameEN: 'Swabian Ravioli',
      calories: 165,
      protein: 8.0,
      carbs: 18.0,
      fat: 6.0,
      foodGroup: FoodGroup.grains,
      cuisine: CuisineType.german,
      commonPortionGrams: 250,
    ),
  ];
}

/// Data class for German food items
class GermanFoodItem {
  final String nameDE;
  final String nameEN;
  final double calories; // per 100g
  final double protein; // per 100g
  final double carbs; // per 100g
  final double fat; // per 100g
  final FoodGroup foodGroup;
  final CuisineType cuisine;
  final double commonPortionGrams; // typical serving size
  
  const GermanFoodItem({
    required this.nameDE,
    required this.nameEN,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.foodGroup,
    required this.cuisine,
    required this.commonPortionGrams,
  });
  
  /// Convert to FoodEntry for the main app
  FoodEntry toFoodEntry({double? customWeight}) {
    final weight = customWeight ?? commonPortionGrams;
    final multiplier = weight / 100.0; // Convert from per-100g to actual weight
    
    return FoodEntry()
      ..name = nameDE
      ..calories = calories * multiplier
      ..protein = protein * multiplier
      ..carbs = carbs * multiplier
      ..fat = fat * multiplier
      ..estimatedWeight = weight
      ..foodGroups = [foodGroup]
      ..cuisine = cuisine
      ..timestamp = DateTime.now()
      ..mealType = FoodEntry.suggestMealTypeByTime(DateTime.now());
  }
  
  /// Get nutritional info for a specific weight
  Map<String, double> getNutritionForWeight(double grams) {
    final multiplier = grams / 100.0;
    return {
      'calories': calories * multiplier,
      'protein': protein * multiplier,
      'carbs': carbs * multiplier,
      'fat': fat * multiplier,
    };
  }
}