import 'package:flutter/material.dart';
import '../../generated/l10n/app_localizations.dart';
import 'metabolic_state.dart';

extension MetabolicStateLocalizations on MetabolicState {
  String getPhaseDescription(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Fed State - Digesting and storing nutrients'; // Not in screenshots, keeping English
      case MetabolicPhase.fasting:
        return 'Fasting State - Transitioning to fat burning'; // Not in screenshots, keeping English
      case MetabolicPhase.fatBurning:
        return l10n.extendedFastingFatBurning;
      case MetabolicPhase.muscleBuilding:
        return l10n.extendedFastGrowthHormone;
    }
  }
  
  String getRecommendedAction(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Allow 3-4 hours before next meal for optimal digestion'; // Not in screenshots, keeping English
      case MetabolicPhase.fasting:
        return l10n.considerLightExercise;
      case MetabolicPhase.fatBurning:
        return l10n.peakFatBurningWindow;
      case MetabolicPhase.muscleBuilding:
        return l10n.considerProteinRichMeal;
    }
  }
}