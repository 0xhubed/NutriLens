import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'NutriLens'**
  String get appTitle;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @analyticsTab.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analyticsTab;

  /// No description provided for @historyTab.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTab;

  /// No description provided for @activityTab.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activityTab;

  /// No description provided for @balanceTab.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balanceTab;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning!'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon!'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening!'**
  String get goodEvening;

  /// No description provided for @readyToTrack.
  ///
  /// In en, this message translates to:
  /// **'Ready to track your nutrition?'**
  String get readyToTrack;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @takePhotoDescription.
  ///
  /// In en, this message translates to:
  /// **'Scan your meal instantly'**
  String get takePhotoDescription;

  /// No description provided for @typeFood.
  ///
  /// In en, this message translates to:
  /// **'Type Food'**
  String get typeFood;

  /// No description provided for @typeFoodDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe your meal'**
  String get typeFoodDescription;

  /// No description provided for @addFood.
  ///
  /// In en, this message translates to:
  /// **'Add Food'**
  String get addFood;

  /// No description provided for @addFoodDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how you\'d like to track your meal'**
  String get addFoodDescription;

  /// No description provided for @noMealsToday.
  ///
  /// In en, this message translates to:
  /// **'No meals logged today'**
  String get noMealsToday;

  /// No description provided for @noMealsCta.
  ///
  /// In en, this message translates to:
  /// **'Start tracking your nutrition by taking a photo or typing your meal'**
  String get noMealsCta;

  /// No description provided for @todaySummary.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Summary'**
  String get todaySummary;

  /// No description provided for @energyBalance.
  ///
  /// In en, this message translates to:
  /// **'Energy Balance'**
  String get energyBalance;

  /// No description provided for @quickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccess;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @analyticsDescription.
  ///
  /// In en, this message translates to:
  /// **'View your trends'**
  String get analyticsDescription;

  /// No description provided for @templates.
  ///
  /// In en, this message translates to:
  /// **'Templates'**
  String get templates;

  /// No description provided for @templatesDescription.
  ///
  /// In en, this message translates to:
  /// **'Saved meals'**
  String get templatesDescription;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;

  /// No description provided for @grams.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get grams;

  /// No description provided for @meals.
  ///
  /// In en, this message translates to:
  /// **'{count} meals'**
  String meals(int count);

  /// No description provided for @meal.
  ///
  /// In en, this message translates to:
  /// **'meal'**
  String get meal;

  /// No description provided for @macroDistribution.
  ///
  /// In en, this message translates to:
  /// **'Macro Distribution'**
  String get macroDistribution;

  /// No description provided for @dailyProgress.
  ///
  /// In en, this message translates to:
  /// **'Daily Progress'**
  String get dailyProgress;

  /// No description provided for @weeklyStats.
  ///
  /// In en, this message translates to:
  /// **'Weekly Stats'**
  String get weeklyStats;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @metabolicData.
  ///
  /// In en, this message translates to:
  /// **'Metabolic Data'**
  String get metabolicData;

  /// No description provided for @logActivity.
  ///
  /// In en, this message translates to:
  /// **'Log Activity'**
  String get logActivity;

  /// No description provided for @activityName.
  ///
  /// In en, this message translates to:
  /// **'Activity Name'**
  String get activityName;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @intensity.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensity;

  /// No description provided for @caloriesBurned.
  ///
  /// In en, this message translates to:
  /// **'Calories Burned'**
  String get caloriesBurned;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @intensityLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get intensityLight;

  /// No description provided for @intensityModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get intensityModerate;

  /// No description provided for @intensityVigorous.
  ///
  /// In en, this message translates to:
  /// **'Vigorous'**
  String get intensityVigorous;

  /// No description provided for @cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get cardio;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @flexibility.
  ///
  /// In en, this message translates to:
  /// **'Flexibility'**
  String get flexibility;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @measurementUnits.
  ///
  /// In en, this message translates to:
  /// **'Measurement Units'**
  String get measurementUnits;

  /// No description provided for @grams_short.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get grams_short;

  /// No description provided for @kilograms_short.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kilograms_short;

  /// No description provided for @milliliters_short.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get milliliters_short;

  /// No description provided for @deciliters_short.
  ///
  /// In en, this message translates to:
  /// **'dl'**
  String get deciliters_short;

  /// No description provided for @liters_short.
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get liters_short;

  /// No description provided for @tablespoon_short.
  ///
  /// In en, this message translates to:
  /// **'tbsp'**
  String get tablespoon_short;

  /// No description provided for @teaspoon_short.
  ///
  /// In en, this message translates to:
  /// **'tsp'**
  String get teaspoon_short;

  /// No description provided for @cup_short.
  ///
  /// In en, this message translates to:
  /// **'cup'**
  String get cup_short;

  /// No description provided for @piece.
  ///
  /// In en, this message translates to:
  /// **'piece'**
  String get piece;

  /// No description provided for @slice.
  ///
  /// In en, this message translates to:
  /// **'slice'**
  String get slice;

  /// No description provided for @portion.
  ///
  /// In en, this message translates to:
  /// **'portion'**
  String get portion;

  /// No description provided for @handful.
  ///
  /// In en, this message translates to:
  /// **'handful'**
  String get handful;

  /// No description provided for @scoop.
  ///
  /// In en, this message translates to:
  /// **'scoop'**
  String get scoop;

  /// No description provided for @proteins.
  ///
  /// In en, this message translates to:
  /// **'Proteins'**
  String get proteins;

  /// No description provided for @carbohydrates.
  ///
  /// In en, this message translates to:
  /// **'Carbohydrates'**
  String get carbohydrates;

  /// No description provided for @fats.
  ///
  /// In en, this message translates to:
  /// **'Fats'**
  String get fats;

  /// No description provided for @vegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get vegetables;

  /// No description provided for @fruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get fruits;

  /// No description provided for @dairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get dairy;

  /// No description provided for @grains.
  ///
  /// In en, this message translates to:
  /// **'Grains'**
  String get grains;

  /// No description provided for @nuts.
  ///
  /// In en, this message translates to:
  /// **'Nuts'**
  String get nuts;

  /// No description provided for @seeds.
  ///
  /// In en, this message translates to:
  /// **'Seeds'**
  String get seeds;

  /// No description provided for @beverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get beverages;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgo(int count);

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get lastWeek;

  /// No description provided for @selectWeek.
  ///
  /// In en, this message translates to:
  /// **'Select Week'**
  String get selectWeek;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @trends.
  ///
  /// In en, this message translates to:
  /// **'Trends'**
  String get trends;

  /// No description provided for @comparison.
  ///
  /// In en, this message translates to:
  /// **'Comparison'**
  String get comparison;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @setGoals.
  ///
  /// In en, this message translates to:
  /// **'Set Goals'**
  String get setGoals;

  /// No description provided for @caloriesTrend.
  ///
  /// In en, this message translates to:
  /// **'Calories Trend'**
  String get caloriesTrend;

  /// No description provided for @macroTrends.
  ///
  /// In en, this message translates to:
  /// **'Macro Trends'**
  String get macroTrends;

  /// No description provided for @weeklyAverage.
  ///
  /// In en, this message translates to:
  /// **'Weekly Average'**
  String get weeklyAverage;

  /// No description provided for @dailyAverage.
  ///
  /// In en, this message translates to:
  /// **'Daily Average'**
  String get dailyAverage;

  /// No description provided for @exportOptions.
  ///
  /// In en, this message translates to:
  /// **'Export Options'**
  String get exportOptions;

  /// No description provided for @exportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export as CSV'**
  String get exportCsv;

  /// No description provided for @exportJson.
  ///
  /// In en, this message translates to:
  /// **'Export as JSON'**
  String get exportJson;

  /// No description provided for @exportPdf.
  ///
  /// In en, this message translates to:
  /// **'Export as PDF'**
  String get exportPdf;

  /// No description provided for @shareData.
  ///
  /// In en, this message translates to:
  /// **'Share Data'**
  String get shareData;

  /// No description provided for @errorLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get errorLoadingData;

  /// No description provided for @errorSavingData.
  ///
  /// In en, this message translates to:
  /// **'Error saving data'**
  String get errorSavingData;

  /// No description provided for @errorNetworkConnection.
  ///
  /// In en, this message translates to:
  /// **'Network connection error'**
  String get errorNetworkConnection;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get errorUnknown;

  /// No description provided for @retryAction.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryAction;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @dailyCalorieGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily Calorie Goal'**
  String get dailyCalorieGoal;

  /// No description provided for @proteinGoal.
  ///
  /// In en, this message translates to:
  /// **'Protein Goal'**
  String get proteinGoal;

  /// No description provided for @carbsGoal.
  ///
  /// In en, this message translates to:
  /// **'Carbs Goal'**
  String get carbsGoal;

  /// No description provided for @fatGoal.
  ///
  /// In en, this message translates to:
  /// **'Fat Goal'**
  String get fatGoal;

  /// No description provided for @goalAchieved.
  ///
  /// In en, this message translates to:
  /// **'Goal Achieved!'**
  String get goalAchieved;

  /// No description provided for @goalProgress.
  ///
  /// In en, this message translates to:
  /// **'Goal Progress'**
  String get goalProgress;

  /// No description provided for @recalculateTotals.
  ///
  /// In en, this message translates to:
  /// **'Recalculate totals'**
  String get recalculateTotals;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptions;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get editItem;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete item'**
  String get deleteItem;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @noMealsLogged.
  ///
  /// In en, this message translates to:
  /// **'No meals logged today'**
  String get noMealsLogged;

  /// No description provided for @startTrackingMeal.
  ///
  /// In en, this message translates to:
  /// **'Start tracking your nutrition by taking a photo or typing your meal'**
  String get startTrackingMeal;

  /// No description provided for @todaysSummary.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Summary'**
  String get todaysSummary;

  /// No description provided for @errorLoadingNutrition.
  ///
  /// In en, this message translates to:
  /// **'Error loading nutrition data'**
  String get errorLoadingNutrition;

  /// No description provided for @recalculatingTotals.
  ///
  /// In en, this message translates to:
  /// **'Recalculating nutrition totals...'**
  String get recalculatingTotals;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @unableToLoadBalance.
  ///
  /// In en, this message translates to:
  /// **'Unable to load balance data'**
  String get unableToLoadBalance;

  /// No description provided for @takeAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a Photo'**
  String get takeAPhoto;

  /// No description provided for @snapPictureAI.
  ///
  /// In en, this message translates to:
  /// **'Snap a picture and let AI analyze it'**
  String get snapPictureAI;

  /// No description provided for @typeDescription.
  ///
  /// In en, this message translates to:
  /// **'Type Description'**
  String get typeDescription;

  /// No description provided for @describeMealText.
  ///
  /// In en, this message translates to:
  /// **'Describe your meal in text'**
  String get describeMealText;

  /// No description provided for @useTemplate.
  ///
  /// In en, this message translates to:
  /// **'Use Template'**
  String get useTemplate;

  /// No description provided for @chooseSavedMeals.
  ///
  /// In en, this message translates to:
  /// **'Choose from saved meals'**
  String get chooseSavedMeals;

  /// No description provided for @trackExerciseWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Track your exercise and workouts'**
  String get trackExerciseWorkouts;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed to English'**
  String get languageChanged;

  /// No description provided for @languageChangedRestart.
  ///
  /// In en, this message translates to:
  /// **'The language has been changed. Please restart the app to see the changes.'**
  String get languageChangedRestart;

  /// No description provided for @aiProviders.
  ///
  /// In en, this message translates to:
  /// **'AI Providers'**
  String get aiProviders;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @cuisineItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get cuisineItalian;

  /// No description provided for @cuisineAsian.
  ///
  /// In en, this message translates to:
  /// **'Asian'**
  String get cuisineAsian;

  /// No description provided for @cuisineAmerican.
  ///
  /// In en, this message translates to:
  /// **'American'**
  String get cuisineAmerican;

  /// No description provided for @cuisineMexican.
  ///
  /// In en, this message translates to:
  /// **'Mexican'**
  String get cuisineMexican;

  /// No description provided for @cuisineIndian.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get cuisineIndian;

  /// No description provided for @cuisineMediterranean.
  ///
  /// In en, this message translates to:
  /// **'Mediterranean'**
  String get cuisineMediterranean;

  /// No description provided for @cuisineGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get cuisineGerman;

  /// No description provided for @cuisineOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get cuisineOther;

  /// No description provided for @germanFoods.
  ///
  /// In en, this message translates to:
  /// **'German Foods'**
  String get germanFoods;

  /// No description provided for @commonGermanFoods.
  ///
  /// In en, this message translates to:
  /// **'Common German Foods'**
  String get commonGermanFoods;

  /// No description provided for @searchGermanFoods.
  ///
  /// In en, this message translates to:
  /// **'Search German foods...'**
  String get searchGermanFoods;

  /// No description provided for @measurementCategories.
  ///
  /// In en, this message translates to:
  /// **'Measurement Categories'**
  String get measurementCategories;

  /// No description provided for @categoryLiquid.
  ///
  /// In en, this message translates to:
  /// **'Liquid'**
  String get categoryLiquid;

  /// No description provided for @categoryPowder.
  ///
  /// In en, this message translates to:
  /// **'Powder'**
  String get categoryPowder;

  /// No description provided for @categorySolid.
  ///
  /// In en, this message translates to:
  /// **'Solid'**
  String get categorySolid;

  /// No description provided for @categoryBulk.
  ///
  /// In en, this message translates to:
  /// **'Bulk'**
  String get categoryBulk;

  /// No description provided for @categoryCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get categoryCustom;

  /// No description provided for @unitMilliliter.
  ///
  /// In en, this message translates to:
  /// **'Milliliter'**
  String get unitMilliliter;

  /// No description provided for @unitDeciliter.
  ///
  /// In en, this message translates to:
  /// **'Deciliter'**
  String get unitDeciliter;

  /// No description provided for @unitLiter.
  ///
  /// In en, this message translates to:
  /// **'Liter'**
  String get unitLiter;

  /// No description provided for @unitCup.
  ///
  /// In en, this message translates to:
  /// **'Cup'**
  String get unitCup;

  /// No description provided for @unitGlass.
  ///
  /// In en, this message translates to:
  /// **'Glass'**
  String get unitGlass;

  /// No description provided for @unitBottle.
  ///
  /// In en, this message translates to:
  /// **'Bottle'**
  String get unitBottle;

  /// No description provided for @unitMug.
  ///
  /// In en, this message translates to:
  /// **'Mug'**
  String get unitMug;

  /// No description provided for @unitTeaspoon.
  ///
  /// In en, this message translates to:
  /// **'Teaspoon'**
  String get unitTeaspoon;

  /// No description provided for @unitTablespoon.
  ///
  /// In en, this message translates to:
  /// **'Tablespoon'**
  String get unitTablespoon;

  /// No description provided for @unitGram.
  ///
  /// In en, this message translates to:
  /// **'Gram'**
  String get unitGram;

  /// No description provided for @unitKilogram.
  ///
  /// In en, this message translates to:
  /// **'Kilogram'**
  String get unitKilogram;

  /// No description provided for @unitPiece.
  ///
  /// In en, this message translates to:
  /// **'Piece'**
  String get unitPiece;

  /// No description provided for @unitSlice.
  ///
  /// In en, this message translates to:
  /// **'Slice'**
  String get unitSlice;

  /// No description provided for @unitPortion.
  ///
  /// In en, this message translates to:
  /// **'Portion'**
  String get unitPortion;

  /// No description provided for @unitHandful.
  ///
  /// In en, this message translates to:
  /// **'Handful'**
  String get unitHandful;

  /// No description provided for @unitScoop.
  ///
  /// In en, this message translates to:
  /// **'Scoop'**
  String get unitScoop;

  /// No description provided for @unitBowl.
  ///
  /// In en, this message translates to:
  /// **'Bowl'**
  String get unitBowl;

  /// No description provided for @unitPlate.
  ///
  /// In en, this message translates to:
  /// **'Plate'**
  String get unitPlate;

  /// No description provided for @captureFood.
  ///
  /// In en, this message translates to:
  /// **'Capture Food'**
  String get captureFood;

  /// No description provided for @portionEstimation.
  ///
  /// In en, this message translates to:
  /// **'Portion Estimation'**
  String get portionEstimation;

  /// No description provided for @takePhotoOfFood.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of your food'**
  String get takePhotoOfFood;

  /// No description provided for @selectFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get selectFromGallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzing;

  /// No description provided for @analyzeFood.
  ///
  /// In en, this message translates to:
  /// **'Analyze Food'**
  String get analyzeFood;

  /// No description provided for @retakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Retake Photo'**
  String get retakePhoto;

  /// No description provided for @confirmPhoto.
  ///
  /// In en, this message translates to:
  /// **'Confirm Photo'**
  String get confirmPhoto;

  /// No description provided for @portionSize.
  ///
  /// In en, this message translates to:
  /// **'Portion Size'**
  String get portionSize;

  /// No description provided for @selectPortion.
  ///
  /// In en, this message translates to:
  /// **'Select portion size'**
  String get selectPortion;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @extraLarge.
  ///
  /// In en, this message translates to:
  /// **'Extra Large'**
  String get extraLarge;

  /// No description provided for @estimatePortions.
  ///
  /// In en, this message translates to:
  /// **'Estimate Portions'**
  String get estimatePortions;

  /// No description provided for @useAR.
  ///
  /// In en, this message translates to:
  /// **'Use AR Mode'**
  String get useAR;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// No description provided for @portionGuide.
  ///
  /// In en, this message translates to:
  /// **'Portion Guide'**
  String get portionGuide;

  /// No description provided for @retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// No description provided for @addFoodByText.
  ///
  /// In en, this message translates to:
  /// **'Add Food by Text'**
  String get addFoodByText;

  /// No description provided for @describeFoodPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Describe your food'**
  String get describeFoodPlaceholder;

  /// No description provided for @portions.
  ///
  /// In en, this message translates to:
  /// **'Portions'**
  String get portions;

  /// No description provided for @portionExamples.
  ///
  /// In en, this message translates to:
  /// **'Examples: \"2 cups rice\", \"1 tbsp olive oil\", \"3 medium apples\"'**
  String get portionExamples;

  /// No description provided for @simpleTextExamples.
  ///
  /// In en, this message translates to:
  /// **'Examples: \"Grilled chicken breast with rice\", \"Large apple\", \"oatmeal with banana\"'**
  String get simpleTextExamples;

  /// No description provided for @whenDidYouEat.
  ///
  /// In en, this message translates to:
  /// **'When did you eat this?'**
  String get whenDidYouEat;

  /// No description provided for @getNutritionInfo.
  ///
  /// In en, this message translates to:
  /// **'Get Nutrition Info'**
  String get getNutritionInfo;

  /// No description provided for @enterFoodDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter a food description to get started'**
  String get enterFoodDescription;

  /// No description provided for @todayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get todayProgress;

  /// No description provided for @dailyMacroDistribution.
  ///
  /// In en, this message translates to:
  /// **'Daily Macro Distribution'**
  String get dailyMacroDistribution;

  /// No description provided for @weeklySummary.
  ///
  /// In en, this message translates to:
  /// **'Weekly Summary'**
  String get weeklySummary;

  /// No description provided for @totalCalories.
  ///
  /// In en, this message translates to:
  /// **'Total Calories'**
  String get totalCalories;

  /// No description provided for @totalProtein.
  ///
  /// In en, this message translates to:
  /// **'Total Protein'**
  String get totalProtein;

  /// No description provided for @totalCarbs.
  ///
  /// In en, this message translates to:
  /// **'Total Carbs'**
  String get totalCarbs;

  /// No description provided for @totalFat.
  ///
  /// In en, this message translates to:
  /// **'Total Fat'**
  String get totalFat;

  /// No description provided for @averageCalories.
  ///
  /// In en, this message translates to:
  /// **'Average Calories'**
  String get averageCalories;

  /// No description provided for @highestDay.
  ///
  /// In en, this message translates to:
  /// **'Highest Day'**
  String get highestDay;

  /// No description provided for @lowestDay.
  ///
  /// In en, this message translates to:
  /// **'Lowest Day'**
  String get lowestDay;

  /// No description provided for @thisWeekAvg.
  ///
  /// In en, this message translates to:
  /// **'This Week Avg'**
  String get thisWeekAvg;

  /// No description provided for @lastWeekAvg.
  ///
  /// In en, this message translates to:
  /// **'Last Week Avg'**
  String get lastWeekAvg;

  /// No description provided for @weekComparison.
  ///
  /// In en, this message translates to:
  /// **'Week Comparison'**
  String get weekComparison;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @noEntriesFound.
  ///
  /// In en, this message translates to:
  /// **'No entries found for this period'**
  String get noEntriesFound;

  /// No description provided for @loadingData.
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get loadingData;

  /// No description provided for @refreshData.
  ///
  /// In en, this message translates to:
  /// **'Refresh Data'**
  String get refreshData;

  /// No description provided for @dayOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Day of Week'**
  String get dayOfWeek;

  /// No description provided for @proteinGrams.
  ///
  /// In en, this message translates to:
  /// **'Protein (g)'**
  String get proteinGrams;

  /// No description provided for @carbsGrams.
  ///
  /// In en, this message translates to:
  /// **'Carbs (g)'**
  String get carbsGrams;

  /// No description provided for @fatGrams.
  ///
  /// In en, this message translates to:
  /// **'Fat (g)'**
  String get fatGrams;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @nutritionGoals.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Goals'**
  String get nutritionGoals;

  /// No description provided for @dailyGoals.
  ///
  /// In en, this message translates to:
  /// **'Daily Goals'**
  String get dailyGoals;

  /// No description provided for @exceeded.
  ///
  /// In en, this message translates to:
  /// **'Exceeded'**
  String get exceeded;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @achieved.
  ///
  /// In en, this message translates to:
  /// **'Achieved'**
  String get achieved;

  /// No description provided for @calorieGoal.
  ///
  /// In en, this message translates to:
  /// **'Calorie Goal'**
  String get calorieGoal;

  /// No description provided for @dailyIntake.
  ///
  /// In en, this message translates to:
  /// **'Daily Intake'**
  String get dailyIntake;

  /// No description provided for @weeklyTrend.
  ///
  /// In en, this message translates to:
  /// **'Weekly Trend'**
  String get weeklyTrend;

  /// No description provided for @monthlyTrend.
  ///
  /// In en, this message translates to:
  /// **'Monthly Trend'**
  String get monthlyTrend;

  /// No description provided for @nutritionInsights.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Insights'**
  String get nutritionInsights;

  /// No description provided for @metabolicInsights.
  ///
  /// In en, this message translates to:
  /// **'Metabolic Insights'**
  String get metabolicInsights;

  /// No description provided for @foodHistory.
  ///
  /// In en, this message translates to:
  /// **'Food History'**
  String get foodHistory;

  /// No description provided for @recentMeals.
  ///
  /// In en, this message translates to:
  /// **'Recent Meals'**
  String get recentMeals;

  /// No description provided for @mealHistory.
  ///
  /// In en, this message translates to:
  /// **'Meal History'**
  String get mealHistory;

  /// No description provided for @breakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get breakfast;

  /// No description provided for @lunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// No description provided for @dinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get dinner;

  /// No description provided for @snack.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get snack;

  /// No description provided for @morningSnack.
  ///
  /// In en, this message translates to:
  /// **'Morning Snack'**
  String get morningSnack;

  /// No description provided for @afternoonSnack.
  ///
  /// In en, this message translates to:
  /// **'Afternoon Snack'**
  String get afternoonSnack;

  /// No description provided for @eveningSnack.
  ///
  /// In en, this message translates to:
  /// **'Evening Snack'**
  String get eveningSnack;

  /// No description provided for @lateNightSnack.
  ///
  /// In en, this message translates to:
  /// **'Late Night Snack'**
  String get lateNightSnack;

  /// No description provided for @topFoods.
  ///
  /// In en, this message translates to:
  /// **'Top Foods'**
  String get topFoods;

  /// No description provided for @daysLogged.
  ///
  /// In en, this message translates to:
  /// **'Days Logged'**
  String get daysLogged;

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get clearSelection;

  /// No description provided for @enterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter Manually'**
  String get enterManually;

  /// No description provided for @retryAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Retry Analysis'**
  String get retryAnalysis;

  /// No description provided for @looksGood.
  ///
  /// In en, this message translates to:
  /// **'Looks Good'**
  String get looksGood;

  /// No description provided for @partiallyCorrect.
  ///
  /// In en, this message translates to:
  /// **'Partially Correct'**
  String get partiallyCorrect;

  /// No description provided for @notCorrect.
  ///
  /// In en, this message translates to:
  /// **'Not Correct'**
  String get notCorrect;

  /// No description provided for @helpAI.
  ///
  /// In en, this message translates to:
  /// **'Help AI'**
  String get helpAI;

  /// No description provided for @saveFoodEntry.
  ///
  /// In en, this message translates to:
  /// **'Save Food Entry'**
  String get saveFoodEntry;

  /// No description provided for @foundPortions.
  ///
  /// In en, this message translates to:
  /// **'Found {count} portion(s) - using smart measurement mode'**
  String foundPortions(int count);

  /// No description provided for @formUpdatedWithAI.
  ///
  /// In en, this message translates to:
  /// **'Form updated with AI analysis'**
  String get formUpdatedWithAI;

  /// No description provided for @foodEntrySavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Food entry saved successfully!'**
  String get foodEntrySavedSuccess;

  /// No description provided for @errorSavingEntry.
  ///
  /// In en, this message translates to:
  /// **'Error saving entry: {error}'**
  String errorSavingEntry(String error);

  /// No description provided for @helpAIIdentify.
  ///
  /// In en, this message translates to:
  /// **'Help AI Identify'**
  String get helpAIIdentify;

  /// No description provided for @reAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Re-analyze'**
  String get reAnalyze;

  /// No description provided for @partialCorrection.
  ///
  /// In en, this message translates to:
  /// **'Partial Correction'**
  String get partialCorrection;

  /// No description provided for @applyCorrection.
  ///
  /// In en, this message translates to:
  /// **'Apply Correction'**
  String get applyCorrection;

  /// No description provided for @metabolicAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Metabolic Analysis'**
  String get metabolicAnalysis;

  /// No description provided for @aiAnalyzingFood.
  ///
  /// In en, this message translates to:
  /// **'AI is analyzing your food description...'**
  String get aiAnalyzingFood;

  /// No description provided for @analysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed: {error}'**
  String analysisFailed(String error);

  /// No description provided for @addAll.
  ///
  /// In en, this message translates to:
  /// **'Add All'**
  String get addAll;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @addedIngredients.
  ///
  /// In en, this message translates to:
  /// **'Added {count} ingredients'**
  String addedIngredients(int count);

  /// No description provided for @addedPortion.
  ///
  /// In en, this message translates to:
  /// **'Added {portion} of {food}'**
  String addedPortion(Object food, Object portion);

  /// No description provided for @measurementGuide.
  ///
  /// In en, this message translates to:
  /// **'Measurement Guide'**
  String get measurementGuide;

  /// No description provided for @interactiveGuide.
  ///
  /// In en, this message translates to:
  /// **'Interactive Guide'**
  String get interactiveGuide;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorMessage(Object error);

  /// No description provided for @showVisualReferences.
  ///
  /// In en, this message translates to:
  /// **'Show Visual References'**
  String get showVisualReferences;

  /// No description provided for @displayHandObjectComparisons.
  ///
  /// In en, this message translates to:
  /// **'Display hand and object comparisons'**
  String get displayHandObjectComparisons;

  /// No description provided for @showMeasurementTips.
  ///
  /// In en, this message translates to:
  /// **'Show Measurement Tips'**
  String get showMeasurementTips;

  /// No description provided for @displayTipsAndMistakes.
  ///
  /// In en, this message translates to:
  /// **'Display how-to tips and common mistakes'**
  String get displayTipsAndMistakes;

  /// No description provided for @showApproximateWeights.
  ///
  /// In en, this message translates to:
  /// **'Show Approximate Weights'**
  String get showApproximateWeights;

  /// No description provided for @displayEstimatedWeights.
  ///
  /// In en, this message translates to:
  /// **'Display estimated gram weights'**
  String get displayEstimatedWeights;

  /// No description provided for @compactMode.
  ///
  /// In en, this message translates to:
  /// **'Compact Mode'**
  String get compactMode;

  /// No description provided for @showCondensedView.
  ///
  /// In en, this message translates to:
  /// **'Show condensed view'**
  String get showCondensedView;

  /// No description provided for @preferredReferenceType.
  ///
  /// In en, this message translates to:
  /// **'Preferred Reference Type'**
  String get preferredReferenceType;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @startInteractiveGuide.
  ///
  /// In en, this message translates to:
  /// **'Start Interactive Guide'**
  String get startInteractiveGuide;

  /// No description provided for @useWeight.
  ///
  /// In en, this message translates to:
  /// **'Use Weight'**
  String get useWeight;

  /// No description provided for @addAnotherPortion.
  ///
  /// In en, this message translates to:
  /// **'Add Another Portion'**
  String get addAnotherPortion;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @aiPoweredAnalysis.
  ///
  /// In en, this message translates to:
  /// **'AI-powered nutrition analysis'**
  String get aiPoweredAnalysis;

  /// No description provided for @portionEstimationAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Portion estimation for better accuracy'**
  String get portionEstimationAccuracy;

  /// No description provided for @costAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Cost Analysis'**
  String get costAnalysis;

  /// No description provided for @primaryProviderDescription.
  ///
  /// In en, this message translates to:
  /// **'Primary Provider: Your main AI service for food analysis\\nFallback Provider: Used when primary fails\\nImage Enhancement: Pre-processes images for better recognition'**
  String get primaryProviderDescription;

  /// No description provided for @portionSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Portion'**
  String get portionSizeLabel;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @readyToAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Ready to analyze your food for nutrition info'**
  String get readyToAnalyze;

  /// No description provided for @startTracking.
  ///
  /// In en, this message translates to:
  /// **'Start Tracking'**
  String get startTracking;

  /// No description provided for @beginNutritionJourney.
  ///
  /// In en, this message translates to:
  /// **'Begin your nutrition journey by logging your first meal'**
  String get beginNutritionJourney;

  /// No description provided for @tapAddFoodToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add Food\' to get started'**
  String get tapAddFoodToStart;

  /// No description provided for @trackMetabolicState.
  ///
  /// In en, this message translates to:
  /// **'Track your metabolic state and timing patterns'**
  String get trackMetabolicState;

  /// No description provided for @currentMetabolicState.
  ///
  /// In en, this message translates to:
  /// **'Current Metabolic State'**
  String get currentMetabolicState;

  /// No description provided for @recoveryMode.
  ///
  /// In en, this message translates to:
  /// **'Recovery Mode'**
  String get recoveryMode;

  /// No description provided for @lastMeal.
  ///
  /// In en, this message translates to:
  /// **'Last meal: {time} ago'**
  String lastMeal(Object time);

  /// No description provided for @extendedFastGrowthHormone.
  ///
  /// In en, this message translates to:
  /// **'Extended Fast - Growth hormone active'**
  String get extendedFastGrowthHormone;

  /// No description provided for @considerProteinRichMeal.
  ///
  /// In en, this message translates to:
  /// **'Consider protein-rich meal to support muscle building'**
  String get considerProteinRichMeal;

  /// No description provided for @fatBurning.
  ///
  /// In en, this message translates to:
  /// **'Fat burning: {percentage}%'**
  String fatBurning(Object percentage);

  /// No description provided for @aiInsight.
  ///
  /// In en, this message translates to:
  /// **'AI Insight'**
  String get aiInsight;

  /// No description provided for @currentState.
  ///
  /// In en, this message translates to:
  /// **'Current State'**
  String get currentState;

  /// No description provided for @extendedFastingFatBurning.
  ///
  /// In en, this message translates to:
  /// **'Extended fasting - fat burning mode'**
  String get extendedFastingFatBurning;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @peakFatBurningWindow.
  ///
  /// In en, this message translates to:
  /// **'Peak fat burning window - consider workout or protein meal'**
  String get peakFatBurningWindow;

  /// No description provided for @actionItems.
  ///
  /// In en, this message translates to:
  /// **'Action Items'**
  String get actionItems;

  /// No description provided for @considerLightExercise.
  ///
  /// In en, this message translates to:
  /// **'Consider light exercise'**
  String get considerLightExercise;

  /// No description provided for @searchActivities.
  ///
  /// In en, this message translates to:
  /// **'Search activities...'**
  String get searchActivities;

  /// No description provided for @quickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick Add'**
  String get quickAdd;

  /// No description provided for @walking.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get walking;

  /// No description provided for @running.
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get running;

  /// No description provided for @cycling.
  ///
  /// In en, this message translates to:
  /// **'Cycling'**
  String get cycling;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @activities.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get activities;

  /// No description provided for @runningModeratePace.
  ///
  /// In en, this message translates to:
  /// **'Running at moderate pace'**
  String get runningModeratePace;

  /// No description provided for @runningFastPace.
  ///
  /// In en, this message translates to:
  /// **'Running at fast pace'**
  String get runningFastPace;

  /// No description provided for @runningVeryFastPace.
  ///
  /// In en, this message translates to:
  /// **'Running at very fast pace'**
  String get runningVeryFastPace;

  /// No description provided for @activities_count.
  ///
  /// In en, this message translates to:
  /// **'Activities ({count})'**
  String activities_count(Object count);

  /// No description provided for @naturalLanguageInput.
  ///
  /// In en, this message translates to:
  /// **'Natural Language Input'**
  String get naturalLanguageInput;

  /// No description provided for @naturalLanguagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'e.g., \"2 cups rice\" or \"1 tbsp olive oil\"'**
  String get naturalLanguagePlaceholder;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
