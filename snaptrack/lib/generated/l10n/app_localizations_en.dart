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
}
