// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'NutriLens';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get add => 'Hinzufügen';

  @override
  String get remove => 'Entfernen';

  @override
  String get search => 'Suchen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get loading => 'Lädt...';

  @override
  String get error => 'Fehler';

  @override
  String get success => 'Erfolg';

  @override
  String get close => 'Schließen';

  @override
  String get next => 'Weiter';

  @override
  String get back => 'Zurück';

  @override
  String get done => 'Fertig';

  @override
  String get homeTab => 'Start';

  @override
  String get analyticsTab => 'Analysen';

  @override
  String get historyTab => 'Verlauf';

  @override
  String get activityTab => 'Aktivität';

  @override
  String get balanceTab => 'Bilanz';

  @override
  String get goodMorning => 'Guten Morgen!';

  @override
  String get goodAfternoon => 'Guten Tag!';

  @override
  String get goodEvening => 'Guten Abend!';

  @override
  String get readyToTrack => 'Bereit, deine Ernährung zu verfolgen?';

  @override
  String get takePhoto => 'Foto machen';

  @override
  String get takePhotoDescription => 'Scanne deine Mahlzeit sofort';

  @override
  String get typeFood => 'Essen eingeben';

  @override
  String get typeFoodDescription => 'Beschreibe deine Mahlzeit';

  @override
  String get addFood => 'Essen hinzufügen';

  @override
  String get addFoodDescription =>
      'Wähle, wie du deine Mahlzeit erfassen möchtest';

  @override
  String get noMealsToday => 'Heute keine Mahlzeiten erfasst';

  @override
  String get noMealsCta =>
      'Beginne mit der Ernährungsverfolgung durch ein Foto oder eine Beschreibung deiner Mahlzeit';

  @override
  String get todaySummary => 'Heutige Zusammenfassung';

  @override
  String get energyBalance => 'Energiebilanz';

  @override
  String get quickAccess => 'Schnellzugriff';

  @override
  String get viewAll => 'Alle anzeigen';

  @override
  String get analytics => 'Analysen';

  @override
  String get analyticsDescription => 'Zeige deine Trends';

  @override
  String get templates => 'Vorlagen';

  @override
  String get templatesDescription => 'Gespeicherte Mahlzeiten';

  @override
  String get calories => 'Kalorien';

  @override
  String get protein => 'Eiweiß';

  @override
  String get carbs => 'Kohlenhydrate';

  @override
  String get fat => 'Fett';

  @override
  String get kcal => 'kcal';

  @override
  String get grams => 'g';

  @override
  String meals(int count) {
    return '$count Mahlzeiten';
  }

  @override
  String get meal => 'Mahlzeit';

  @override
  String get macroDistribution => 'Makronährstoffverteilung';

  @override
  String get dailyProgress => 'Tagesfortschritt';

  @override
  String get weeklyStats => 'Wöchentliche Statistiken';

  @override
  String get insights => 'Einblicke';

  @override
  String get metabolicData => 'Stoffwechseldaten';

  @override
  String get logActivity => 'Aktivität erfassen';

  @override
  String get activityName => 'Aktivitätsname';

  @override
  String get duration => 'Dauer';

  @override
  String get intensity => 'Intensität';

  @override
  String get caloriesBurned => 'Verbrannte Kalorien';

  @override
  String get minutes => 'Minuten';

  @override
  String get hours => 'Stunden';

  @override
  String get intensityLight => 'Leicht';

  @override
  String get intensityModerate => 'Moderat';

  @override
  String get intensityVigorous => 'Intensiv';

  @override
  String get cardio => 'Ausdauer';

  @override
  String get strength => 'Kraft';

  @override
  String get sports => 'Sport';

  @override
  String get flexibility => 'Flexibilität';

  @override
  String get water => 'Wasser';

  @override
  String get other => 'Andere';

  @override
  String get measurementUnits => 'Maßeinheiten';

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
  String get tablespoon_short => 'EL';

  @override
  String get teaspoon_short => 'TL';

  @override
  String get cup_short => 'Tasse';

  @override
  String get piece => 'Stück';

  @override
  String get slice => 'Scheibe';

  @override
  String get portion => 'Portion';

  @override
  String get handful => 'Handvoll';

  @override
  String get scoop => 'Löffel';

  @override
  String get proteins => 'Proteine';

  @override
  String get carbohydrates => 'Kohlenhydrate';

  @override
  String get fats => 'Fette';

  @override
  String get vegetables => 'Gemüse';

  @override
  String get fruits => 'Obst';

  @override
  String get dairy => 'Milchprodukte';

  @override
  String get grains => 'Getreideprodukte';

  @override
  String get nuts => 'Nüsse';

  @override
  String get seeds => 'Samen';

  @override
  String get beverages => 'Getränke';

  @override
  String get justNow => 'Gerade eben';

  @override
  String minutesAgo(int count) {
    return 'vor $count Min.';
  }

  @override
  String hoursAgo(int count) {
    return 'vor $count Std.';
  }

  @override
  String daysAgo(int count) {
    return 'vor $count Tag(en)';
  }

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String get lastWeek => 'Letzte Woche';

  @override
  String get selectWeek => 'Woche auswählen';

  @override
  String get selectDate => 'Datum auswählen';

  @override
  String get overview => 'Übersicht';

  @override
  String get trends => 'Trends';

  @override
  String get comparison => 'Vergleich';

  @override
  String get exportData => 'Daten exportieren';

  @override
  String get setGoals => 'Ziele setzen';

  @override
  String get caloriesTrend => 'Kalorien-Trend';

  @override
  String get macroTrends => 'Makronährstoff-Trends';

  @override
  String get weeklyAverage => 'Wöchentlicher Durchschnitt';

  @override
  String get dailyAverage => 'Täglicher Durchschnitt';

  @override
  String get exportOptions => 'Export-Optionen';

  @override
  String get exportCsv => 'Als CSV exportieren';

  @override
  String get exportJson => 'Als JSON exportieren';

  @override
  String get exportPdf => 'Als PDF exportieren';

  @override
  String get shareData => 'Daten teilen';

  @override
  String get errorLoadingData => 'Fehler beim Laden der Daten';

  @override
  String get errorSavingData => 'Fehler beim Speichern der Daten';

  @override
  String get errorNetworkConnection => 'Netzwerkverbindungsfehler';

  @override
  String get errorUnknown => 'Ein unbekannter Fehler ist aufgetreten';

  @override
  String get retryAction => 'Wiederholen';

  @override
  String get contactSupport => 'Support kontaktieren';

  @override
  String get dailyCalorieGoal => 'Tägliches Kalorienziel';

  @override
  String get proteinGoal => 'Eiweißziel';

  @override
  String get carbsGoal => 'Kohlenhydratziel';

  @override
  String get fatGoal => 'Fettziel';

  @override
  String get goalAchieved => 'Ziel erreicht!';

  @override
  String get goalProgress => 'Zielfortschritt';

  @override
  String get recalculateTotals => 'Summen neu berechnen';

  @override
  String get moreOptions => 'Weitere Optionen';

  @override
  String get editItem => 'Element bearbeiten';

  @override
  String get deleteItem => 'Element löschen';

  @override
  String get addItem => 'Element hinzufügen';

  @override
  String get viewDetails => 'Details anzeigen';

  @override
  String get noMealsLogged => 'Heute keine Mahlzeiten erfasst';

  @override
  String get startTrackingMeal =>
      'Beginne mit der Ernährungsverfolgung durch ein Foto oder eine Beschreibung deiner Mahlzeit';

  @override
  String get todaysSummary => 'Heutige Zusammenfassung';

  @override
  String get errorLoadingNutrition => 'Fehler beim Laden der Ernährungsdaten';

  @override
  String get recalculatingTotals => 'Ernährungssummen werden neu berechnet...';

  @override
  String get food => 'Essen';

  @override
  String get unableToLoadBalance => 'Bilanzdaten können nicht geladen werden';

  @override
  String get takeAPhoto => 'Foto machen';

  @override
  String get snapPictureAI =>
      'Mache ein Foto und lass es von der KI analysieren';

  @override
  String get typeDescription => 'Beschreibung eingeben';

  @override
  String get describeMealText => 'Beschreibe deine Mahlzeit als Text';

  @override
  String get useTemplate => 'Vorlage verwenden';

  @override
  String get chooseSavedMeals => 'Wähle aus gespeicherten Mahlzeiten';

  @override
  String get trackExerciseWorkouts => 'Verfolge deine Übungen und Trainings';

  @override
  String get language => 'Sprache';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get english => 'Englisch';

  @override
  String get german => 'Deutsch';

  @override
  String get languageChanged => 'Sprache auf Deutsch geändert';

  @override
  String get languageChangedRestart =>
      'Die Sprache wurde geändert. Bitte starten Sie die App neu, um die Änderungen zu sehen.';

  @override
  String get aiProviders => 'KI-Anbieter';

  @override
  String get generalSettings => 'Allgemeine Einstellungen';

  @override
  String get cuisineItalian => 'Italienisch';

  @override
  String get cuisineAsian => 'Asiatisch';

  @override
  String get cuisineAmerican => 'Amerikanisch';

  @override
  String get cuisineMexican => 'Mexikanisch';

  @override
  String get cuisineIndian => 'Indisch';

  @override
  String get cuisineMediterranean => 'Mediterran';

  @override
  String get cuisineGerman => 'Deutsch';

  @override
  String get cuisineOther => 'Andere';

  @override
  String get germanFoods => 'Deutsche Küche';

  @override
  String get commonGermanFoods => 'Häufige deutsche Gerichte';

  @override
  String get searchGermanFoods => 'Deutsche Gerichte suchen...';

  @override
  String get measurementCategories => 'Maßeinheiten-Kategorien';

  @override
  String get categoryLiquid => 'Flüssigkeit';

  @override
  String get categoryPowder => 'Pulver';

  @override
  String get categorySolid => 'Feststoff';

  @override
  String get categoryBulk => 'Schüttgut';

  @override
  String get categoryCustom => 'Benutzerdefiniert';

  @override
  String get unitMilliliter => 'Milliliter';

  @override
  String get unitDeciliter => 'Deziliter';

  @override
  String get unitLiter => 'Liter';

  @override
  String get unitCup => 'Tasse';

  @override
  String get unitGlass => 'Glas';

  @override
  String get unitBottle => 'Flasche';

  @override
  String get unitMug => 'Becher';

  @override
  String get unitTeaspoon => 'Teelöffel';

  @override
  String get unitTablespoon => 'Esslöffel';

  @override
  String get unitGram => 'Gramm';

  @override
  String get unitKilogram => 'Kilogramm';

  @override
  String get unitPiece => 'Stück';

  @override
  String get unitSlice => 'Scheibe';

  @override
  String get unitPortion => 'Portion';

  @override
  String get unitHandful => 'Handvoll';

  @override
  String get unitScoop => 'Löffel';

  @override
  String get unitBowl => 'Schüssel';

  @override
  String get unitPlate => 'Teller';

  @override
  String get captureFood => 'Essen fotografieren';

  @override
  String get portionEstimation => 'Portionsschätzung';

  @override
  String get takePhotoOfFood => 'Fotografiere dein Essen';

  @override
  String get selectFromGallery => 'Aus Galerie auswählen';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galerie';

  @override
  String get analyzing => 'Analysiere...';

  @override
  String get analyzeFood => 'Essen analysieren';

  @override
  String get retakePhoto => 'Foto wiederholen';

  @override
  String get confirmPhoto => 'Foto bestätigen';

  @override
  String get portionSize => 'Portionsgröße';

  @override
  String get selectPortion => 'Portionsgröße auswählen';

  @override
  String get small => 'Klein';

  @override
  String get medium => 'Mittel';

  @override
  String get large => 'Groß';

  @override
  String get extraLarge => 'Extra Groß';

  @override
  String get estimatePortions => 'Portionen schätzen';

  @override
  String get useAR => 'AR-Modus verwenden';

  @override
  String get standard => 'Standard';

  @override
  String get portionGuide => 'Portionsführer';

  @override
  String get retake => 'Wiederholen';

  @override
  String get addFoodByText => 'Essen per Text hinzufügen';

  @override
  String get describeFoodPlaceholder => 'Beschreibe dein Essen';

  @override
  String get portions => 'Portionen';

  @override
  String get portionExamples =>
      'Beispiele: \"2 Tassen Reis\", \"1 EL Olivenöl\", \"3 mittlere Äpfel\"';

  @override
  String get simpleTextExamples =>
      'Beispiele: \"Gegrillte Hähnchenbrust mit Reis\", \"Großer Apfel\", \"Haferflocken mit Banane\"';

  @override
  String get whenDidYouEat => 'Wann hast du das gegessen?';

  @override
  String get getNutritionInfo => 'Nährwertinfo abrufen';

  @override
  String get enterFoodDescription =>
      'Gib eine Essensbeschreibung ein, um zu beginnen';

  @override
  String get todayProgress => 'Heutiger Fortschritt';

  @override
  String get dailyMacroDistribution => 'Tägliche Makronährstoffverteilung';

  @override
  String get weeklySummary => 'Wöchentliche Zusammenfassung';

  @override
  String get totalCalories => 'Gesamtkalorien';

  @override
  String get totalProtein => 'Gesamteiweiß';

  @override
  String get totalCarbs => 'Gesamtkohlenhydrate';

  @override
  String get totalFat => 'Gesamtfett';

  @override
  String get averageCalories => 'Durchschnittskalorien';

  @override
  String get highestDay => 'Höchster Tag';

  @override
  String get lowestDay => 'Niedrigster Tag';

  @override
  String get thisWeekAvg => 'Diese Woche Ø';

  @override
  String get lastWeekAvg => 'Letzte Woche Ø';

  @override
  String get weekComparison => 'Wochenvergleich';

  @override
  String get noDataAvailable => 'Keine Daten verfügbar';

  @override
  String get noEntriesFound => 'Keine Einträge für diesen Zeitraum gefunden';

  @override
  String get loadingData => 'Lade Daten...';

  @override
  String get refreshData => 'Daten aktualisieren';

  @override
  String get dayOfWeek => 'Wochentag';

  @override
  String get proteinGrams => 'Eiweiß (g)';

  @override
  String get carbsGrams => 'Kohlenhydrate (g)';

  @override
  String get fatGrams => 'Fett (g)';

  @override
  String get monday => 'Montag';

  @override
  String get tuesday => 'Dienstag';

  @override
  String get wednesday => 'Mittwoch';

  @override
  String get thursday => 'Donnerstag';

  @override
  String get friday => 'Freitag';

  @override
  String get saturday => 'Samstag';

  @override
  String get sunday => 'Sonntag';

  @override
  String get mon => 'Mo';

  @override
  String get tue => 'Di';

  @override
  String get wed => 'Mi';

  @override
  String get thu => 'Do';

  @override
  String get fri => 'Fr';

  @override
  String get sat => 'Sa';

  @override
  String get sun => 'So';

  @override
  String get nutritionGoals => 'Ernährungsziele';

  @override
  String get dailyGoals => 'Tagesziele';

  @override
  String get exceeded => 'Überschritten';

  @override
  String get remaining => 'Verbleibend';

  @override
  String get achieved => 'Erreicht';

  @override
  String get calorieGoal => 'Kalorienziel';

  @override
  String get dailyIntake => 'Tägliche Aufnahme';

  @override
  String get weeklyTrend => 'Wöchentlicher Trend';

  @override
  String get monthlyTrend => 'Monatlicher Trend';

  @override
  String get nutritionInsights => 'Ernährungseinblicke';

  @override
  String get metabolicInsights => 'Stoffwechseleinblicke';

  @override
  String get foodHistory => 'Essensverlauf';

  @override
  String get recentMeals => 'Kürzliche Mahlzeiten';

  @override
  String get mealHistory => 'Mahlzeitenverlauf';

  @override
  String get breakfast => 'Frühstück';

  @override
  String get lunch => 'Mittagessen';

  @override
  String get dinner => 'Abendessen';

  @override
  String get snack => 'Snack';

  @override
  String get morningSnack => 'Vormittagssnack';

  @override
  String get afternoonSnack => 'Nachmittagssnack';

  @override
  String get eveningSnack => 'Abendsnack';

  @override
  String get lateNightSnack => 'Spätabendsnack';

  @override
  String get topFoods => 'Top-Lebensmittel';

  @override
  String get daysLogged => 'Tage Erfasst';

  @override
  String get clearSelection => 'Auswahl Löschen';

  @override
  String get enterManually => 'Manuell eingeben';

  @override
  String get retryAnalysis => 'Analyse wiederholen';

  @override
  String get looksGood => 'Sieht gut aus';

  @override
  String get partiallyCorrect => 'Teilweise korrekt';

  @override
  String get notCorrect => 'Nicht korrekt';

  @override
  String get helpAI => 'KI helfen';

  @override
  String get saveFoodEntry => 'Lebensmitteleintrag speichern';

  @override
  String foundPortions(int count) {
    return '$count Portion(en) gefunden - verwende smarten Messmodus';
  }

  @override
  String get formUpdatedWithAI => 'Formular mit KI-Analyse aktualisiert';

  @override
  String get foodEntrySavedSuccess =>
      'Lebensmitteleintrag erfolgreich gespeichert!';

  @override
  String errorSavingEntry(String error) {
    return 'Fehler beim Speichern des Eintrags: $error';
  }

  @override
  String get helpAIIdentify => 'KI beim Identifizieren helfen';

  @override
  String get reAnalyze => 'Neu analysieren';

  @override
  String get partialCorrection => 'Teilkorrektur';

  @override
  String get applyCorrection => 'Korrektur anwenden';

  @override
  String get metabolicAnalysis => 'Stoffwechselanalyse';

  @override
  String get aiAnalyzingFood =>
      'KI analysiert deine Lebensmittelbeschreibung...';

  @override
  String analysisFailed(String error) {
    return 'Analyse fehlgeschlagen: $error';
  }

  @override
  String get addAll => 'Alle hinzufügen';

  @override
  String get clear => 'Löschen';

  @override
  String addedIngredients(int count) {
    return '$count Zutaten hinzugefügt';
  }

  @override
  String addedPortion(Object food, Object portion) {
    return '$portion von $food hinzugefügt';
  }

  @override
  String get measurementGuide => 'Messanleitung';

  @override
  String get interactiveGuide => 'Interaktive Anleitung';

  @override
  String errorMessage(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get showVisualReferences => 'Visuelle Referenzen anzeigen';

  @override
  String get displayHandObjectComparisons =>
      'Hand- und Objektvergleiche anzeigen';

  @override
  String get showMeasurementTips => 'Messtipps anzeigen';

  @override
  String get displayTipsAndMistakes =>
      'Anleitungen und häufige Fehler anzeigen';

  @override
  String get showApproximateWeights => 'Ungefähre Gewichte anzeigen';

  @override
  String get displayEstimatedWeights => 'Geschätzte Grammgewichte anzeigen';

  @override
  String get compactMode => 'Kompaktmodus';

  @override
  String get showCondensedView => 'Kompakte Ansicht anzeigen';

  @override
  String get preferredReferenceType => 'Bevorzugter Referenztyp';

  @override
  String get previous => 'Zurück';

  @override
  String get startInteractiveGuide => 'Interaktive Anleitung starten';

  @override
  String get useWeight => 'Gewicht verwenden';

  @override
  String get addAnotherPortion => 'Weitere Portion hinzufügen';

  @override
  String get retry => 'Wiederholen';

  @override
  String get correct => 'Korrekt';

  @override
  String get aiPoweredAnalysis => 'KI-gestützte Nährwertanalyse';

  @override
  String get portionEstimationAccuracy =>
      'Portionsschätzung für bessere Genauigkeit';

  @override
  String get costAnalysis => 'Kostenanalyse';

  @override
  String get primaryProviderDescription =>
      'Hauptanbieter: Ihr primärer KI-Dienst für Lebensmittelanalysen\\nFallback-Anbieter: Wird verwendet, wenn der Hauptanbieter fehlschlägt\\nBildverbesserung: Verbessert Bilder für bessere Erkennung';

  @override
  String get portionSizeLabel => 'Portion';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get readyToAnalyze =>
      'Bereit zur Analyse deines Essens für Nährwertinfos';

  @override
  String get startTracking => 'Tracking starten';

  @override
  String get beginNutritionJourney =>
      'Beginne deine Ernährungsreise, indem du deine erste Mahlzeit erfasst';

  @override
  String get tapAddFoodToStart =>
      'Tippe auf \'Essen hinzufügen\', um zu starten';

  @override
  String get trackMetabolicState =>
      'Verfolge deinen Stoffwechselzustand und Timing-Muster';

  @override
  String get currentMetabolicState => 'Aktueller Stoffwechselzustand';

  @override
  String get recoveryMode => 'Erholungsmodus';

  @override
  String lastMeal(Object time) {
    return 'Letzte Mahlzeit: vor $time';
  }

  @override
  String get extendedFastGrowthHormone =>
      'Verlängertes Fasten - Wachstumshormon aktiv';

  @override
  String get considerProteinRichMeal =>
      'Erwäge proteinreiche Mahlzeit zur Muskelunterstützung';

  @override
  String fatBurning(Object percentage) {
    return 'Fettverbrennung: $percentage%';
  }

  @override
  String get aiInsight => 'KI-Einblick';

  @override
  String get currentState => 'Aktueller Zustand';

  @override
  String get extendedFastingFatBurning =>
      'Verlängertes Fasten - Fettverbrennungsmodus';

  @override
  String get recommendation => 'Empfehlung';

  @override
  String get peakFatBurningWindow =>
      'Höchste Fettverbrennung - erwäge Training oder Proteinmahlzeit';

  @override
  String get actionItems => 'Handlungsempfehlungen';

  @override
  String get considerLightExercise => 'Erwäge leichtes Training';

  @override
  String get searchActivities => 'Aktivitäten suchen...';

  @override
  String get quickAdd => 'Schnell hinzufügen';

  @override
  String get walking => 'Gehen';

  @override
  String get running => 'Laufen';

  @override
  String get cycling => 'Radfahren';

  @override
  String get categories => 'Kategorien';

  @override
  String get all => 'Alle';

  @override
  String get activities => 'Aktivitäten';

  @override
  String get runningModeratePace => 'Laufen in moderatem Tempo';

  @override
  String get runningFastPace => 'Laufen in schnellem Tempo';

  @override
  String get runningVeryFastPace => 'Laufen in sehr schnellem Tempo';

  @override
  String activities_count(Object count) {
    return 'Aktivitäten ($count)';
  }

  @override
  String get naturalLanguageInput => 'Natürlichsprachliche Eingabe';

  @override
  String get naturalLanguagePlaceholder =>
      'z.B. \"2 Tassen Reis\" oder \"1 EL Olivenöl\"';
}
