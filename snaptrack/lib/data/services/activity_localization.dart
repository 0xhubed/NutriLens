import '../../generated/l10n/app_localizations.dart';

class ActivityLocalization {
  /// Localizes activity descriptions based on the current locale
  static String localizeActivityDescription(String description, AppLocalizations l10n) {
    // Map common activity descriptions to localized versions
    switch (description) {
      case 'Running at moderate pace':
        return l10n.runningModeratePace;
      case 'Running at fast pace':
        return l10n.runningFastPace;
      case 'Running at very fast pace':
        return l10n.runningVeryFastPace;
      
      // For descriptions that aren't specifically localized yet,
      // we return the original description
      default:
        return description;
    }
  }
  
  /// Localizes activity names based on the current locale
  static String localizeActivityName(String name, AppLocalizations l10n) {
    // For now, we keep activity names in their original form
    // since they often include specific measurements (like km/h, MET values)
    // that are already internationally standardized
    
    // Simple replacements for common terms
    if (name.contains('Walking')) {
      return name.replaceAll('Walking', l10n.walking);
    } else if (name.contains('Running')) {
      return name.replaceAll('Running', l10n.running);
    } else if (name.contains('Cycling')) {
      return name.replaceAll('Cycling', l10n.cycling);
    }
    
    return name;
  }
}