import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'data/models/activity_entry.dart';
import 'data/models/daily_nutrition.dart';
import 'data/models/eating_pattern.dart';
import 'data/models/food_entry.dart';
import 'data/models/meal_template.dart';
import 'data/models/meal_timing_data.dart';
import 'data/models/measurement_unit.dart';
import 'data/models/metabolic_insight.dart';
import 'data/models/metabolic_state.dart';
import 'data/models/user_metrics.dart';
import 'data/providers/activity_providers.dart';
import 'data/providers/metabolic_providers.dart';
import 'data/providers/metrics_providers.dart';
import 'data/services/activity_service.dart' hide activityServiceProvider;
import 'data/services/database_service.dart';
import 'data/services/metabolic_analysis_service.dart';
import 'data/services/metrics_service.dart' hide metricsServiceProvider;
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
      MeasurementUnitSchema,
      FoodConversionSchema,
      UserMeasurementPreferenceSchema,
      // Metabolic Analysis Models
      MetabolicStateSchema,
      MetabolicInsightSchema,
      EatingPatternSchema,
      MealTimingDataSchema,
    ],
    directory: dir.path,
  );
  
  // Initialize services
  final dbService = DatabaseService(isar);
  final activityService = ActivityService(isar);
  final metricsService = MetricsService(isar);
  final metabolicAnalysisService = MetabolicAnalysisService(isar);
  
  runApp(
    ProviderScope(
      overrides: [
        databaseServiceProvider.overrideWithValue(dbService),
        activityServiceProvider.overrideWithValue(activityService),
        metricsServiceProvider.overrideWithValue(metricsService),
        metabolicAnalysisServiceProvider.overrideWithValue(metabolicAnalysisService),
        isarProvider.overrideWithValue(isar),
      ],
      child: const NutriLensApp(),
    ),
  );
}