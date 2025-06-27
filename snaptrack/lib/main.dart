import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'data/models/activity_entry.dart';
import 'data/models/daily_nutrition.dart';
import 'data/models/food_entry.dart';
import 'data/models/meal_template.dart';
import 'data/models/user_metrics.dart';
import 'data/providers/activity_providers.dart';
import 'data/providers/metrics_providers.dart';
import 'data/services/activity_service.dart';
import 'data/services/database_service.dart';
import 'data/services/metrics_service.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      FoodEntrySchema, 
      DailyNutritionSchema, 
      MealTemplateSchema,
      ActivityEntrySchema,
      UserMetricsSchema,
    ],
    directory: dir.path,
  );
  
  // Initialize services
  final dbService = DatabaseService(isar);
  final activityService = ActivityService(isar);
  final metricsService = MetricsService(isar);
  
  runApp(
    ProviderScope(
      overrides: [
        databaseServiceProvider.overrideWithValue(dbService),
        activityServiceProvider.overrideWithValue(activityService),
        metricsServiceProvider.overrideWithValue(metricsService),
      ],
      child: const NutriLensApp(),
    ),
  );
}