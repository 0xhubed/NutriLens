class MacroProfile {
  final String id;
  final String name;
  final String description;
  final double proteinPercentage;
  final double carbsPercentage;
  final double fatPercentage;
  final List<String> suitableFor;
  final String? note;

  const MacroProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.proteinPercentage,
    required this.carbsPercentage,
    required this.fatPercentage,
    required this.suitableFor,
    this.note,
  });

  static const List<MacroProfile> standardProfiles = [
    MacroProfile(
      id: 'balanced',
      name: 'Balanced',
      description: 'Well-rounded macro distribution for general health',
      proteinPercentage: 20,
      carbsPercentage: 50,
      fatPercentage: 30,
      suitableFor: ['General health', 'Maintenance', 'Beginners'],
    ),
    MacroProfile(
      id: 'weight_loss',
      name: 'Weight Loss',
      description: 'Higher protein, moderate carbs for sustainable weight loss',
      proteinPercentage: 30,
      carbsPercentage: 35,
      fatPercentage: 35,
      suitableFor: ['Weight loss', 'Fat loss', 'Calorie deficit'],
      note: 'Higher protein helps preserve muscle during weight loss',
    ),
    MacroProfile(
      id: 'muscle_gain',
      name: 'Muscle Gain',
      description: 'Higher carbs and protein for muscle building',
      proteinPercentage: 25,
      carbsPercentage: 45,
      fatPercentage: 30,
      suitableFor: ['Muscle building', 'Strength training', 'Bulking'],
      note: 'Higher carbs support intense training and recovery',
    ),
    MacroProfile(
      id: 'athletic',
      name: 'Athletic Performance',
      description: 'Optimized for high-intensity training and competition',
      proteinPercentage: 20,
      carbsPercentage: 55,
      fatPercentage: 25,
      suitableFor: ['Athletes', 'High-intensity training', 'Endurance sports'],
      note: 'Higher carbs fuel performance and recovery',
    ),
    MacroProfile(
      id: 'low_carb',
      name: 'Low Carb',
      description: 'Reduced carbohydrates for metabolic flexibility',
      proteinPercentage: 25,
      carbsPercentage: 25,
      fatPercentage: 50,
      suitableFor: ['Low carb lifestyle', 'Insulin sensitivity', 'PCOS'],
      note: 'May improve insulin sensitivity and metabolic health',
    ),
    MacroProfile(
      id: 'keto',
      name: 'Ketogenic',
      description: 'Very low carb, high fat for ketosis',
      proteinPercentage: 20,
      carbsPercentage: 5,
      fatPercentage: 75,
      suitableFor: ['Ketogenic diet', 'Epilepsy management', 'Metabolic therapy'],
      note: 'Designed to maintain nutritional ketosis',
    ),
    MacroProfile(
      id: 'mediterranean',
      name: 'Mediterranean',
      description: 'Inspired by traditional Mediterranean eating patterns',
      proteinPercentage: 18,
      carbsPercentage: 45,
      fatPercentage: 37,
      suitableFor: ['Heart health', 'Longevity', 'Anti-inflammatory'],
      note: 'Emphasizes healthy fats and whole foods',
    ),
    MacroProfile(
      id: 'high_protein',
      name: 'High Protein',
      description: 'Elevated protein for muscle preservation and satiety',
      proteinPercentage: 35,
      carbsPercentage: 30,
      fatPercentage: 35,
      suitableFor: ['Muscle preservation', 'Satiety', 'Body recomposition'],
      note: 'Higher protein increases satiety and muscle preservation',
    ),
  ];

  static MacroProfile? getProfileById(String id) {
    try {
      return standardProfiles.firstWhere((profile) => profile.id == id);
    } catch (e) {
      return null;
    }
  }

  static MacroProfile get defaultProfile => standardProfiles.first;

  // Calculate macro grams based on total calories
  MacroGrams calculateMacroGrams(double totalCalories) {
    final proteinCalories = totalCalories * (proteinPercentage / 100);
    final carbsCalories = totalCalories * (carbsPercentage / 100);
    final fatCalories = totalCalories * (fatPercentage / 100);

    return MacroGrams(
      protein: proteinCalories / 4, // 4 calories per gram
      carbs: carbsCalories / 4, // 4 calories per gram
      fat: fatCalories / 9, // 9 calories per gram
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MacroProfile &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class MacroGrams {
  final double protein;
  final double carbs;
  final double fat;

  const MacroGrams({
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  double get totalCalories => (protein * 4) + (carbs * 4) + (fat * 9);
}