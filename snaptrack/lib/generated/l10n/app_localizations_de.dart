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
}
