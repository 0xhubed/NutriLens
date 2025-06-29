import 'package:hive/hive.dart';
import 'measurement_unit.dart';

part 'measurement_guide.g.dart';

@HiveType(typeId: 10)
class MeasurementGuide extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String unitId = '';
  
  @HiveField(2)
  String unitDisplayName = '';
  
  @HiveField(3)
  String title = '';
  
  @HiveField(4)
  String description = '';
  
  @HiveField(5)
  String visualComparison = '';
  
  @HiveField(6)
  String helpText = '';
  
  @HiveField(7)
  MeasurementCategory category = MeasurementCategory.liquid;
  
  // Visual references
  @HiveField(8)
  List<String> visualComparisons = []; // e.g., "Size of a tennis ball"
  
  @HiveField(9)
  List<String> handComparisons = [];   // e.g., "Fits in your palm"
  
  @HiveField(10)
  List<String> commonObjects = [];     // e.g., "About the size of a deck of cards"
  
  // Usage context
  @HiveField(11)
  List<String> bestFor = [];           // e.g., "Fruits", "Vegetables", "Proteins"
  
  @HiveField(12)
  List<String> examples = [];          // e.g., "1 medium apple", "1 cup cooked rice"
  
  // Measurement tips
  @HiveField(13)
  String? howToMeasure;
  
  @HiveField(14)
  String? commonMistakes;
  
  @HiveField(15)
  String? accuracyTips;
  
  // Reference values
  @HiveField(16)
  double? approximateGrams;
  
  @HiveField(17)
  double? approximateCalories;
  
  @HiveField(18)
  bool isUserFavorite = false;
  
  @HiveField(19)
  DateTime createdAt = DateTime.now();
  
  @HiveField(20)
  DateTime? lastViewed;
  
  @HiveField(21)
  int viewCount = 0;
  
  MeasurementGuide();
  
  factory MeasurementGuide.create({
    required String unitId,
    required String unitDisplayName,
    required String title,
    required String description,
    required String visualComparison,
    required MeasurementCategory category,
    List<String> visualComparisons = const [],
    List<String> handComparisons = const [],
    List<String> commonObjects = const [],
    List<String> bestFor = const [],
    List<String> examples = const [],
    String? howToMeasure,
    String? commonMistakes,
    String? accuracyTips,
    double? approximateGrams,
    double? approximateCalories,
  }) {
    return MeasurementGuide()
      ..unitId = unitId
      ..unitDisplayName = unitDisplayName
      ..title = title
      ..description = description
      ..visualComparison = visualComparison
      ..category = category
      ..visualComparisons = List.from(visualComparisons)
      ..handComparisons = List.from(handComparisons)
      ..commonObjects = List.from(commonObjects)
      ..bestFor = List.from(bestFor)
      ..examples = List.from(examples)
      ..howToMeasure = howToMeasure
      ..commonMistakes = commonMistakes
      ..accuracyTips = accuracyTips
      ..approximateGrams = approximateGrams
      ..approximateCalories = approximateCalories
      ..createdAt = DateTime.now();
  }
  
  void markAsViewed() {
    viewCount++;
    lastViewed = DateTime.now();
  }
  
  String get primaryVisualComparison {
    if (visualComparisons.isNotEmpty) return visualComparisons.first;
    if (handComparisons.isNotEmpty) return handComparisons.first;
    if (commonObjects.isNotEmpty) return commonObjects.first;
    return visualComparison;
  }
  
  String get primaryExample {
    return examples.isNotEmpty ? examples.first : '';
  }
  
  bool get hasVisualReferences {
    return visualComparisons.isNotEmpty || 
           handComparisons.isNotEmpty || 
           commonObjects.isNotEmpty;
  }
  
  bool get hasMeasurementTips {
    return howToMeasure != null || 
           commonMistakes != null || 
           accuracyTips != null;
  }
}

@HiveType(typeId: 29)
class VisualReference extends HiveObject {
  @HiveField(0)
  String type = ''; // 'hand', 'object', 'food'
  
  @HiveField(1)
  String description = '';
  
  @HiveField(2)
  String? imagePath;
  
  @HiveField(3)
  String? iconName;
  
  @HiveField(4)
  double? size; // for objects with known dimensions
  
  VisualReference();
  
  factory VisualReference.hand({
    required String description,
    String? imagePath,
  }) {
    return VisualReference()
      ..type = 'hand'
      ..description = description
      ..imagePath = imagePath;
  }
  
  factory VisualReference.object({
    required String description,
    String? imagePath,
    String? iconName,
    double? size,
  }) {
    return VisualReference()
      ..type = 'object'
      ..description = description
      ..imagePath = imagePath
      ..iconName = iconName
      ..size = size;
  }
  
  factory VisualReference.food({
    required String description,
    String? imagePath,
  }) {
    return VisualReference()
      ..type = 'food'
      ..description = description
      ..imagePath = imagePath;
  }
}

// Predefined measurement guides
class MeasurementGuideDatabase {
  static List<MeasurementGuide> getPredefinedGuides() {
    return [
      // Volume measurements
      MeasurementGuide.create(
        unitId: 'cup',
        unitDisplayName: 'cup',
        title: '1 Cup',
        description: 'A standard US cup measurement',
        visualComparison: 'Size of a baseball',
        category: MeasurementCategory.liquid,
        visualComparisons: ['Size of a baseball', 'Standard coffee mug'],
        handComparisons: ['Two cupped hands together'],
        commonObjects: ['Baseball', 'Large coffee mug', 'Tennis ball container'],
        bestFor: ['Rice', 'Pasta', 'Vegetables', 'Fruits', 'Liquids'],
        examples: ['1 cup cooked rice', '1 cup milk', '1 cup chopped vegetables'],
        howToMeasure: 'Fill a measuring cup to the brim and level off with a knife',
        commonMistakes: 'Packing ingredients too tightly, not leveling off',
        accuracyTips: 'Use dry measuring cups for dry ingredients, liquid cups for liquids',
        approximateGrams: 240.0,
      ),
      
      MeasurementGuide.create(
        unitId: 'tbsp',
        unitDisplayName: 'tablespoon',
        title: '1 Tablespoon',
        description: 'A standard tablespoon measurement',
        visualComparison: 'Size of a large grape',
        category: MeasurementCategory.liquid,
        visualComparisons: ['Large grape', 'Half a ping pong ball'],
        handComparisons: ['Tip of your thumb'],
        commonObjects: ['Large grape', 'Walnut half', 'Small bottle cap'],
        bestFor: ['Oils', 'Sauces', 'Seasonings', 'Nut butters'],
        examples: ['1 tbsp olive oil', '1 tbsp peanut butter', '1 tbsp honey'],
        howToMeasure: 'Fill measuring spoon and level off with a knife',
        commonMistakes: 'Heaping spoons, using regular spoons instead of measuring spoons',
        accuracyTips: 'Level off for dry ingredients, allow slight dome for liquids',
        approximateGrams: 15.0,
      ),
      
      MeasurementGuide.create(
        unitId: 'tsp',
        unitDisplayName: 'teaspoon',
        title: '1 Teaspoon',
        description: 'A standard teaspoon measurement',
        visualComparison: 'Size of a small marble',
        category: MeasurementCategory.liquid,
        visualComparisons: ['Small marble', 'Dime stacked 3 times'],
        handComparisons: ['Tip of your pinky finger'],
        commonObjects: ['Small marble', 'Small button', 'Pencil eraser'],
        bestFor: ['Spices', 'Extracts', 'Baking powder', 'Salt'],
        examples: ['1 tsp vanilla extract', '1 tsp salt', '1 tsp baking powder'],
        howToMeasure: 'Fill measuring spoon and level off with a knife',
        commonMistakes: 'Using regular teaspoons, not leveling off',
        accuracyTips: 'Be precise with small amounts - they make a big difference',
        approximateGrams: 5.0,
      ),
      
      // Weight measurements
      MeasurementGuide.create(
        unitId: 'oz',
        unitDisplayName: 'ounce',
        title: '1 Ounce',
        description: 'A standard ounce by weight',
        visualComparison: 'Size of a slice of bread',
        category: MeasurementCategory.powder,
        visualComparisons: ['Slice of bread', 'Matchbox'],
        handComparisons: ['Two tablespoons'],
        commonObjects: ['Slice of bread', 'CD case', 'Matchbox'],
        bestFor: ['Cheese', 'Nuts', 'Meat', 'Chocolate'],
        examples: ['1 oz cheddar cheese', '1 oz almonds', '1 oz dark chocolate'],
        howToMeasure: 'Use a kitchen scale for accuracy',
        commonMistakes: 'Confusing weight ounces with fluid ounces',
        accuracyTips: 'A kitchen scale is the most accurate way to measure weight',
        approximateGrams: 28.35,
      ),
      
      // Piece measurements
      MeasurementGuide.create(
        unitId: 'piece_medium',
        unitDisplayName: 'medium piece',
        title: 'Medium Piece',
        description: 'A medium-sized piece of food',
        visualComparison: 'Size of a tennis ball',
        category: MeasurementCategory.solid,
        visualComparisons: ['Tennis ball', 'Computer mouse'],
        handComparisons: ['Fits in your palm'],
        commonObjects: ['Tennis ball', 'Computer mouse', 'Small apple'],
        bestFor: ['Fruits', 'Vegetables', 'Baked goods'],
        examples: ['1 medium apple', '1 medium potato', '1 medium muffin'],
        howToMeasure: 'Compare to reference objects or use your hand as a guide',
        commonMistakes: 'Misjudging size without reference',
        accuracyTips: 'Use common objects as size references for consistency',
        approximateGrams: 150.0,
      ),
      
      MeasurementGuide.create(
        unitId: 'slice',
        unitDisplayName: 'slice',
        title: '1 Slice',
        description: 'A standard slice of food',
        visualComparison: 'Size of a playing card',
        category: MeasurementCategory.solid,
        visualComparisons: ['Playing card', 'iPhone'],
        handComparisons: ['Palm of your hand'],
        commonObjects: ['Playing card', 'Credit card (thicker)', 'Smartphone'],
        bestFor: ['Bread', 'Cheese', 'Meat', 'Pizza'],
        examples: ['1 slice bread', '1 slice cheese', '1 slice pizza'],
        howToMeasure: 'Cut to consistent thickness, about 1/4 to 1/2 inch',
        commonMistakes: 'Cutting slices too thick or thin',
        accuracyTips: 'Use a ruler or compare to known objects for consistent sizing',
        approximateGrams: 30.0,
      ),
      
      // Hand measurements
      MeasurementGuide.create(
        unitId: 'handful',
        unitDisplayName: 'handful',
        title: '1 Handful',
        description: 'Amount that fits in your cupped hand',
        visualComparison: 'Your cupped palm',
        category: MeasurementCategory.solid,
        visualComparisons: ['Cupped palm', 'Small bowl'],
        handComparisons: ['Your cupped hand'],
        commonObjects: ['Small bowl', 'Large egg'],
        bestFor: ['Nuts', 'Berries', 'Crackers', 'Chips'],
        examples: ['1 handful nuts', '1 handful berries', '1 handful crackers'],
        howToMeasure: 'Cup your hand and fill without overflowing',
        commonMistakes: 'Using both hands, overfilling',
        accuracyTips: 'Use your non-dominant hand for consistency',
        approximateGrams: 30.0,
      ),
      
      // Scoop measurements
      MeasurementGuide.create(
        unitId: 'scoop',
        unitDisplayName: 'scoop',
        title: '1 Scoop',
        description: 'Standard protein powder scoop',
        visualComparison: 'Size of a large ice cream scoop',
        category: MeasurementCategory.solid,
        visualComparisons: ['Large ice cream scoop', 'Ping pong ball'],
        handComparisons: ['Rounded handful'],
        commonObjects: ['Ice cream scoop', 'Ping pong ball', 'Golf ball'],
        bestFor: ['Protein powder', 'Supplements', 'Ice cream'],
        examples: ['1 scoop protein powder', '1 scoop ice cream'],
        howToMeasure: 'Use the scoop provided with the product',
        commonMistakes: 'Using different scoop sizes, packing too tightly',
        accuracyTips: 'Level off for consistency, use the scoop that comes with the product',
        approximateGrams: 30.0,
      ),
    ];
  }
  
  static MeasurementGuide? getGuideForUnit(String unitId) {
    return getPredefinedGuides()
        .where((guide) => guide.unitId == unitId)
        .firstOrNull;
  }
  
  static List<MeasurementGuide> getGuidesByCategory(MeasurementCategory category) {
    return getPredefinedGuides()
        .where((guide) => guide.category == category)
        .toList();
  }
  
  static List<MeasurementGuide> searchGuides(String query) {
    final lowerQuery = query.toLowerCase();
    return getPredefinedGuides()
        .where((guide) => 
          guide.title.toLowerCase().contains(lowerQuery) ||
          guide.description.toLowerCase().contains(lowerQuery) ||
          guide.visualComparison.toLowerCase().contains(lowerQuery) ||
          guide.bestFor.any((item) => item.toLowerCase().contains(lowerQuery)))
        .toList();
  }
}