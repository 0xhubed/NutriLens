// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'NutriLens';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get remove => 'Remove';

  @override
  String get search => 'Search';

  @override
  String get settings => 'Settings';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get close => 'Close';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get done => 'Done';

  @override
  String get homeTab => 'Home';

  @override
  String get analyticsTab => 'Analytics';

  @override
  String get historyTab => 'History';

  @override
  String get activityTab => 'Activity';

  @override
  String get balanceTab => 'Balance';

  @override
  String get goodMorning => 'Good Morning!';

  @override
  String get goodAfternoon => 'Good Afternoon!';

  @override
  String get goodEvening => 'Good Evening!';

  @override
  String get readyToTrack => 'Ready to track your nutrition?';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get takePhotoDescription => 'Scan your meal instantly';

  @override
  String get typeFood => 'Type Food';

  @override
  String get typeFoodDescription => 'Describe your meal';

  @override
  String get addFood => 'Add Food';

  @override
  String get addFoodDescription => 'Choose how you\'d like to track your meal';

  @override
  String get noMealsToday => 'No meals logged today';

  @override
  String get noMealsCta =>
      'Start tracking your nutrition by taking a photo or typing your meal';

  @override
  String get todaySummary => 'Today\'s Summary';

  @override
  String get energyBalance => 'Energy Balance';

  @override
  String get quickAccess => 'Quick Access';

  @override
  String get viewAll => 'View All';

  @override
  String get analytics => 'Analytics';

  @override
  String get analyticsDescription => 'View your trends';

  @override
  String get templates => 'Templates';

  @override
  String get templatesDescription => 'Saved meals';

  @override
  String get calories => 'Calories';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Carbs';

  @override
  String get fat => 'Fat';

  @override
  String get kcal => 'kcal';

  @override
  String get grams => 'g';

  @override
  String meals(int count) {
    return '$count meals';
  }

  @override
  String get meal => 'meal';

  @override
  String get macroDistribution => 'Macro Distribution';

  @override
  String get dailyProgress => 'Daily Progress';

  @override
  String get weeklyStats => 'Weekly Stats';

  @override
  String get insights => 'Insights';

  @override
  String get metabolicData => 'Metabolic Data';

  @override
  String get logActivity => 'Log Activity';

  @override
  String get activityName => 'Activity Name';

  @override
  String get duration => 'Duration';

  @override
  String get intensity => 'Intensity';

  @override
  String get caloriesBurned => 'Calories Burned';

  @override
  String get minutes => 'minutes';

  @override
  String get hours => 'hours';

  @override
  String get intensityLight => 'Light';

  @override
  String get intensityModerate => 'Moderate';

  @override
  String get intensityVigorous => 'Vigorous';

  @override
  String get cardio => 'Cardio';

  @override
  String get strength => 'Strength';

  @override
  String get sports => 'Sports';

  @override
  String get flexibility => 'Flexibility';

  @override
  String get water => 'Water';

  @override
  String get other => 'Other';

  @override
  String get measurementUnits => 'Measurement Units';

  @override
  String get grams_short => 'g';

  @override
  String get kilograms_short => 'kg';

  @override
  String get milliliters_short => 'ml';

  @override
  String get deciliters_short => 'dl';

  @override
  String get liters_short => 'l';

  @override
  String get tablespoon_short => 'tbsp';

  @override
  String get teaspoon_short => 'tsp';

  @override
  String get cup_short => 'cup';

  @override
  String get piece => 'piece';

  @override
  String get slice => 'slice';

  @override
  String get portion => 'portion';

  @override
  String get handful => 'handful';

  @override
  String get scoop => 'scoop';

  @override
  String get proteins => 'Proteins';

  @override
  String get carbohydrates => 'Carbohydrates';

  @override
  String get fats => 'Fats';

  @override
  String get vegetables => 'Vegetables';

  @override
  String get fruits => 'Fruits';

  @override
  String get dairy => 'Dairy';

  @override
  String get grains => 'Grains';

  @override
  String get nuts => 'Nuts';

  @override
  String get seeds => 'Seeds';

  @override
  String get beverages => 'Beverages';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get thisWeek => 'This Week';

  @override
  String get lastWeek => 'Last Week';

  @override
  String get selectWeek => 'Select Week';

  @override
  String get selectDate => 'Select Date';

  @override
  String get overview => 'Overview';

  @override
  String get trends => 'Trends';

  @override
  String get comparison => 'Comparison';

  @override
  String get exportData => 'Export Data';

  @override
  String get setGoals => 'Set Goals';

  @override
  String get caloriesTrend => 'Calories Trend';

  @override
  String get macroTrends => 'Macro Trends';

  @override
  String get weeklyAverage => 'Weekly Average';

  @override
  String get dailyAverage => 'Daily Average';

  @override
  String get exportOptions => 'Export Options';

  @override
  String get exportCsv => 'Export as CSV';

  @override
  String get exportJson => 'Export as JSON';

  @override
  String get exportPdf => 'Export as PDF';

  @override
  String get shareData => 'Share Data';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get errorSavingData => 'Error saving data';

  @override
  String get errorNetworkConnection => 'Network connection error';

  @override
  String get errorUnknown => 'An unknown error occurred';

  @override
  String get retryAction => 'Retry';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get dailyCalorieGoal => 'Daily Calorie Goal';

  @override
  String get proteinGoal => 'Protein Goal';

  @override
  String get carbsGoal => 'Carbs Goal';

  @override
  String get fatGoal => 'Fat Goal';

  @override
  String get goalAchieved => 'Goal Achieved!';

  @override
  String get goalProgress => 'Goal Progress';

  @override
  String get recalculateTotals => 'Recalculate totals';

  @override
  String get moreOptions => 'More options';

  @override
  String get editItem => 'Edit item';

  @override
  String get deleteItem => 'Delete item';

  @override
  String get addItem => 'Add item';

  @override
  String get viewDetails => 'View details';

  @override
  String get noMealsLogged => 'No meals logged today';

  @override
  String get startTrackingMeal =>
      'Start tracking your nutrition by taking a photo or typing your meal';

  @override
  String get todaysSummary => 'Today\'s Summary';

  @override
  String get errorLoadingNutrition => 'Error loading nutrition data';

  @override
  String get recalculatingTotals => 'Recalculating nutrition totals...';

  @override
  String get food => 'Food';

  @override
  String get unableToLoadBalance => 'Unable to load balance data';

  @override
  String get takeAPhoto => 'Take a Photo';

  @override
  String get snapPictureAI => 'Snap a picture and let AI analyze it';

  @override
  String get typeDescription => 'Type Description';

  @override
  String get describeMealText => 'Describe your meal in text';

  @override
  String get useTemplate => 'Use Template';

  @override
  String get chooseSavedMeals => 'Choose from saved meals';

  @override
  String get trackExerciseWorkouts => 'Track your exercise and workouts';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get german => 'German';

  @override
  String get languageChanged => 'Language changed to English';

  @override
  String get languageChangedRestart =>
      'The language has been changed. Please restart the app to see the changes.';

  @override
  String get aiProviders => 'AI Providers';

  @override
  String get generalSettings => 'General Settings';

  @override
  String get cuisineItalian => 'Italian';

  @override
  String get cuisineAsian => 'Asian';

  @override
  String get cuisineAmerican => 'American';

  @override
  String get cuisineMexican => 'Mexican';

  @override
  String get cuisineIndian => 'Indian';

  @override
  String get cuisineMediterranean => 'Mediterranean';

  @override
  String get cuisineGerman => 'German';

  @override
  String get cuisineOther => 'Other';

  @override
  String get germanFoods => 'German Foods';

  @override
  String get commonGermanFoods => 'Common German Foods';

  @override
  String get searchGermanFoods => 'Search German foods...';

  @override
  String get measurementCategories => 'Measurement Categories';

  @override
  String get categoryLiquid => 'Liquid';

  @override
  String get categoryPowder => 'Powder';

  @override
  String get categorySolid => 'Solid';

  @override
  String get categoryBulk => 'Bulk';

  @override
  String get categoryCustom => 'Custom';

  @override
  String get unitMilliliter => 'Milliliter';

  @override
  String get unitDeciliter => 'Deciliter';

  @override
  String get unitLiter => 'Liter';

  @override
  String get unitCup => 'Cup';

  @override
  String get unitGlass => 'Glass';

  @override
  String get unitBottle => 'Bottle';

  @override
  String get unitMug => 'Mug';

  @override
  String get unitTeaspoon => 'Teaspoon';

  @override
  String get unitTablespoon => 'Tablespoon';

  @override
  String get unitGram => 'Gram';

  @override
  String get unitKilogram => 'Kilogram';

  @override
  String get unitPiece => 'Piece';

  @override
  String get unitSlice => 'Slice';

  @override
  String get unitPortion => 'Portion';

  @override
  String get unitHandful => 'Handful';

  @override
  String get unitScoop => 'Scoop';

  @override
  String get unitBowl => 'Bowl';

  @override
  String get unitPlate => 'Plate';

  @override
  String get captureFood => 'Capture Food';

  @override
  String get portionEstimation => 'Portion Estimation';

  @override
  String get takePhotoOfFood => 'Take a photo of your food';

  @override
  String get selectFromGallery => 'Select from Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get analyzeFood => 'Analyze Food';

  @override
  String get retakePhoto => 'Retake Photo';

  @override
  String get confirmPhoto => 'Confirm Photo';

  @override
  String get portionSize => 'Portion Size';

  @override
  String get selectPortion => 'Select portion size';

  @override
  String get small => 'Small';

  @override
  String get medium => 'Medium';

  @override
  String get large => 'Large';

  @override
  String get extraLarge => 'Extra Large';

  @override
  String get estimatePortions => 'Estimate Portions';

  @override
  String get useAR => 'Use AR Mode';

  @override
  String get standard => 'Standard';

  @override
  String get portionGuide => 'Portion Guide';

  @override
  String get retake => 'Retake';

  @override
  String get addFoodByText => 'Add Food by Text';

  @override
  String get describeFoodPlaceholder => 'Describe your food';

  @override
  String get portions => 'Portions';

  @override
  String get portionExamples =>
      'Examples: \"2 cups rice\", \"1 tbsp olive oil\", \"3 medium apples\"';

  @override
  String get simpleTextExamples =>
      'Examples: \"Grilled chicken breast with rice\", \"Large apple\", \"oatmeal with banana\"';

  @override
  String get whenDidYouEat => 'When did you eat this?';

  @override
  String get getNutritionInfo => 'Get Nutrition Info';

  @override
  String get enterFoodDescription => 'Enter a food description to get started';

  @override
  String get todayProgress => 'Today\'s Progress';

  @override
  String get dailyMacroDistribution => 'Daily Macro Distribution';

  @override
  String get weeklySummary => 'Weekly Summary';

  @override
  String get totalCalories => 'Total Calories';

  @override
  String get totalProtein => 'Total Protein';

  @override
  String get totalCarbs => 'Total Carbs';

  @override
  String get totalFat => 'Total Fat';

  @override
  String get averageCalories => 'Average Calories';

  @override
  String get highestDay => 'Highest Day';

  @override
  String get lowestDay => 'Lowest Day';

  @override
  String get thisWeekAvg => 'This Week Avg';

  @override
  String get lastWeekAvg => 'Last Week Avg';

  @override
  String get weekComparison => 'Week Comparison';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get noEntriesFound => 'No entries found for this period';

  @override
  String get loadingData => 'Loading data...';

  @override
  String get refreshData => 'Refresh Data';

  @override
  String get dayOfWeek => 'Day of Week';

  @override
  String get proteinGrams => 'Protein (g)';

  @override
  String get carbsGrams => 'Carbs (g)';

  @override
  String get fatGrams => 'Fat (g)';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String get sun => 'Sun';

  @override
  String get nutritionGoals => 'Nutrition Goals';

  @override
  String get dailyGoals => 'Daily Goals';

  @override
  String get exceeded => 'Exceeded';

  @override
  String get remaining => 'Remaining';

  @override
  String get achieved => 'Achieved';

  @override
  String get calorieGoal => 'Calorie Goal';

  @override
  String get dailyIntake => 'Daily Intake';

  @override
  String get weeklyTrend => 'Weekly Trend';

  @override
  String get monthlyTrend => 'Monthly Trend';

  @override
  String get nutritionInsights => 'Nutrition Insights';

  @override
  String get metabolicInsights => 'Metabolic Insights';

  @override
  String get foodHistory => 'Food History';

  @override
  String get recentMeals => 'Recent Meals';

  @override
  String get mealHistory => 'Meal History';

  @override
  String get breakfast => 'Breakfast';

  @override
  String get lunch => 'Lunch';

  @override
  String get dinner => 'Dinner';

  @override
  String get snack => 'Snack';

  @override
  String get morningSnack => 'Morning Snack';

  @override
  String get afternoonSnack => 'Afternoon Snack';

  @override
  String get eveningSnack => 'Evening Snack';

  @override
  String get lateNightSnack => 'Late Night Snack';

  @override
  String get topFoods => 'Top Foods';

  @override
  String get daysLogged => 'Days Logged';

  @override
  String get clearSelection => 'Clear Selection';

  @override
  String get enterManually => 'Enter Manually';

  @override
  String get retryAnalysis => 'Retry Analysis';

  @override
  String get looksGood => 'Looks Good';

  @override
  String get partiallyCorrect => 'Partially Correct';

  @override
  String get notCorrect => 'Not Correct';

  @override
  String get helpAI => 'Help AI';

  @override
  String get saveFoodEntry => 'Save Food Entry';

  @override
  String foundPortions(int count) {
    return 'Found $count portion(s) - using smart measurement mode';
  }

  @override
  String get formUpdatedWithAI => 'Form updated with AI analysis';

  @override
  String get foodEntrySavedSuccess => 'Food entry saved successfully!';

  @override
  String errorSavingEntry(String error) {
    return 'Error saving entry: $error';
  }

  @override
  String get helpAIIdentify => 'Help AI Identify';

  @override
  String get reAnalyze => 'Re-analyze';

  @override
  String get partialCorrection => 'Partial Correction';

  @override
  String get applyCorrection => 'Apply Correction';

  @override
  String get metabolicAnalysis => 'Metabolic Analysis';

  @override
  String get aiAnalyzingFood => 'AI is analyzing your food description...';

  @override
  String analysisFailed(String error) {
    return 'Analysis failed: $error';
  }

  @override
  String get addAll => 'Add All';

  @override
  String get clear => 'Clear';

  @override
  String addedIngredients(int count) {
    return 'Added $count ingredients';
  }

  @override
  String addedPortion(Object food, Object portion) {
    return 'Added $portion of $food';
  }

  @override
  String get measurementGuide => 'Measurement Guide';

  @override
  String get interactiveGuide => 'Interactive Guide';

  @override
  String errorMessage(Object error) {
    return 'Error: $error';
  }

  @override
  String get showVisualReferences => 'Show Visual References';

  @override
  String get displayHandObjectComparisons =>
      'Display hand and object comparisons';

  @override
  String get showMeasurementTips => 'Show Measurement Tips';

  @override
  String get displayTipsAndMistakes =>
      'Display how-to tips and common mistakes';

  @override
  String get showApproximateWeights => 'Show Approximate Weights';

  @override
  String get displayEstimatedWeights => 'Display estimated gram weights';

  @override
  String get compactMode => 'Compact Mode';

  @override
  String get showCondensedView => 'Show condensed view';

  @override
  String get preferredReferenceType => 'Preferred Reference Type';

  @override
  String get previous => 'Previous';

  @override
  String get startInteractiveGuide => 'Start Interactive Guide';

  @override
  String get useWeight => 'Use Weight';

  @override
  String get addAnotherPortion => 'Add Another Portion';

  @override
  String get retry => 'Retry';

  @override
  String get correct => 'Correct';

  @override
  String get aiPoweredAnalysis => 'AI-powered nutrition analysis';

  @override
  String get portionEstimationAccuracy =>
      'Portion estimation for better accuracy';

  @override
  String get costAnalysis => 'Cost Analysis';

  @override
  String get primaryProviderDescription =>
      'Primary Provider: Your main AI service for food analysis\\nFallback Provider: Used when primary fails\\nImage Enhancement: Pre-processes images for better recognition';

  @override
  String get portionSizeLabel => 'Portion';

  @override
  String get custom => 'Custom';

  @override
  String get readyToAnalyze => 'Ready to analyze your food for nutrition info';

  @override
  String get startTracking => 'Start Tracking';

  @override
  String get beginNutritionJourney =>
      'Begin your nutrition journey by logging your first meal';

  @override
  String get tapAddFoodToStart => 'Tap \'Add Food\' to get started';

  @override
  String get trackMetabolicState =>
      'Track your metabolic state and timing patterns';

  @override
  String get currentMetabolicState => 'Current Metabolic State';

  @override
  String get recoveryMode => 'Recovery Mode';

  @override
  String lastMeal(Object time) {
    return 'Last meal: $time ago';
  }

  @override
  String get extendedFastGrowthHormone =>
      'Extended Fast - Growth hormone active';

  @override
  String get considerProteinRichMeal =>
      'Consider protein-rich meal to support muscle building';

  @override
  String fatBurning(Object percentage) {
    return 'Fat burning: $percentage%';
  }

  @override
  String get aiInsight => 'AI Insight';

  @override
  String get currentState => 'Current State';

  @override
  String get extendedFastingFatBurning => 'Extended fasting - fat burning mode';

  @override
  String get recommendation => 'Recommendation';

  @override
  String get peakFatBurningWindow =>
      'Peak fat burning window - consider workout or protein meal';

  @override
  String get actionItems => 'Action Items';

  @override
  String get considerLightExercise => 'Consider light exercise';

  @override
  String get searchActivities => 'Search activities...';

  @override
  String get quickAdd => 'Quick Add';

  @override
  String get walking => 'Walking';

  @override
  String get running => 'Running';

  @override
  String get cycling => 'Cycling';

  @override
  String get categories => 'Categories';

  @override
  String get all => 'All';

  @override
  String get activities => 'Activities';

  @override
  String get runningModeratePace => 'Running at moderate pace';

  @override
  String get runningFastPace => 'Running at fast pace';

  @override
  String get runningVeryFastPace => 'Running at very fast pace';

  @override
  String activities_count(Object count) {
    return 'Activities ($count)';
  }

  @override
  String get naturalLanguageInput => 'Natural Language Input';

  @override
  String get naturalLanguagePlaceholder =>
      'e.g., \"2 cups rice\" or \"1 tbsp olive oil\"';
}
