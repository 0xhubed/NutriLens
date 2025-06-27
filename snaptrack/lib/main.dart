import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'data/models/food_entry.dart';
import 'data/models/daily_nutrition.dart';
import 'data/models/meal_template.dart';
import 'data/services/database_service.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [FoodEntrySchema, DailyNutritionSchema, MealTemplateSchema],
    directory: dir.path,
  );
  
  // Initialize services
  final dbService = DatabaseService(isar);
  
  runApp(
    ProviderScope(
      overrides: [
        databaseServiceProvider.overrideWithValue(dbService),
      ],
      child: const NutriLensApp(),
    ),
  );
}