import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
import 'data/models/measurement_guide.dart';
import 'data/models/metabolic_context.dart';
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
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register adapters
  Hive.registerAdapter(FoodEntryAdapter());
  Hive.registerAdapter(DailyNutritionAdapter());
  Hive.registerAdapter(MealTemplateAdapter());
  Hive.registerAdapter(ActivityEntryAdapter());
  Hive.registerAdapter(UserMetricsAdapter());
  Hive.registerAdapter(MeasurementUnitAdapter());
  Hive.registerAdapter(FoodConversionAdapter());
  Hive.registerAdapter(UserMeasurementPreferenceAdapter());
  Hive.registerAdapter(MetabolicStateAdapter());
  Hive.registerAdapter(MetabolicInsightAdapter());
  Hive.registerAdapter(EatingPatternAdapter());
  Hive.registerAdapter(MealTimingDataAdapter());
  Hive.registerAdapter(MeasurementGuideAdapter());
  
  // Register enum adapters
  Hive.registerAdapter(MealTypeAdapter());
  Hive.registerAdapter(FoodGroupAdapter());
  Hive.registerAdapter(CuisineTypeAdapter());
  Hive.registerAdapter(DietaryTagAdapter());
  Hive.registerAdapter(MeasurementCategoryAdapter());
  Hive.registerAdapter(GoalTypeAdapter());
  Hive.registerAdapter(ActivityCategoryAdapter());
  Hive.registerAdapter(IntensityAdapter());
  Hive.registerAdapter(MetabolicPhaseAdapter());
  Hive.registerAdapter(InsulinLevelAdapter());
  Hive.registerAdapter(UserGoalsAdapter());
  Hive.registerAdapter(ActivityLevelAdapter());
  
  // Register embedded class adapters
  Hive.registerAdapter(DetectedFoodItemAdapter());
  Hive.registerAdapter(FoodPortionAdapter());
  Hive.registerAdapter(TemplateItemAdapter());
  Hive.registerAdapter(TemplateIngredientAdapter());
  Hive.registerAdapter(HealthGoalAdapter());
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(VisualReferenceAdapter());
  
  // Open boxes
  await Hive.openBox<FoodEntry>('foodEntries');
  await Hive.openBox<DailyNutrition>('dailyNutrition');
  await Hive.openBox<MealTemplate>('mealTemplates');
  await Hive.openBox<ActivityEntry>('activityEntries');
  await Hive.openBox<UserMetrics>('userMetrics');
  await Hive.openBox<MeasurementUnit>('measurementUnits');
  await Hive.openBox<FoodConversion>('foodConversions');
  await Hive.openBox<UserMeasurementPreference>('userMeasurementPreferences');
  await Hive.openBox<MetabolicState>('metabolicStates');
  await Hive.openBox<MetabolicInsight>('metabolicInsights');
  await Hive.openBox<EatingPattern>('eatingPatterns');
  await Hive.openBox<MealTimingData>('mealTimingData');
  await Hive.openBox<MeasurementGuide>('measurementGuides');
  
  // Initialize services
  final dbService = DatabaseService();
  final activityService = ActivityService();
  final metricsService = MetricsService();
  final metabolicAnalysisService = MetabolicAnalysisService();
  
  runApp(
    ProviderScope(
      overrides: [
        databaseServiceProvider.overrideWithValue(dbService),
        activityServiceProvider.overrideWithValue(activityService),
        metricsServiceProvider.overrideWithValue(metricsService),
        metabolicAnalysisServiceProvider.overrideWithValue(metabolicAnalysisService),
      ],
      child: const NutriLensApp(),
    ),
  );
}