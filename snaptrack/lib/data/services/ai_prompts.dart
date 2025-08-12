import 'dart:ui';

/// Helper class for generating AI prompts in different languages
class AIPrompts {
  /// Generates a food image analysis prompt in the specified locale
  static String getFoodAnalysisPrompt(String locale, {String? userHint}) {
    switch (locale) {
      case 'de':
        return _getGermanFoodAnalysisPrompt(userHint: userHint);
      case 'en':
      default:
        return _getEnglishFoodAnalysisPrompt(userHint: userHint);
    }
  }

  /// Generates a text description analysis prompt in the specified locale
  static String getTextAnalysisPrompt(String locale, String description) {
    switch (locale) {
      case 'de':
        return _getGermanTextAnalysisPrompt(description);
      case 'en':
      default:
        return _getEnglishTextAnalysisPrompt(description);
    }
  }

  /// Generates a system prompt for text analysis in the specified locale
  static String getTextAnalysisSystemPrompt(String locale) {
    switch (locale) {
      case 'de':
        return _getGermanTextAnalysisSystemPrompt();
      case 'en':
      default:
        return _getEnglishTextAnalysisSystemPrompt();
    }
  }

  static String _getGermanFoodAnalysisPrompt({String? userHint}) {
    return '''
Analysiere dieses Lebensmittelbild und stelle detaillierte Nährwert- und Kategorisierungsinformationen MIT GEWICHTSSCHÄTZUNG bereit.
${userHint != null ? '\nBeschreibung des Nutzers: "$userHint"\nBitte verwende diese Informationen, um das Essen genau zu identifizieren.\n' : ''}

WICHTIG: Schätze das Gewicht der Lebensmittel basierend auf visuellen Hinweisen wie Tellergröße, Portionsgröße und Lebensmitteldichte. Berücksicksichtige typische Portionsgrößen und visuelle Referenzen.

Gib NUR ein gültiges JSON-Objekt zurück, ohne zusätzlichen Text, Markdown-Formatierung oder Erklärung. Das JSON sollte dieser exakten Struktur folgen:
{
  "name": "Gesamter Mahlzeit-/Lebensmittelname",
  "calories": Zahl,
  "protein": Zahl (Gramm), 
  "carbs": Zahl (Gramm),
  "fat": Zahl (Gramm),
  "estimatedWeight": Zahl (geschätztes Gesamtgewicht in Gramm),
  "detectedItems": [
    {
      "name": "Einzelnes Lebensmittel",
      "calories": Zahl,
      "protein": Zahl,
      "carbs": Zahl,
      "fat": Zahl,
      "portion": "Größenbeschreibung",
      "estimatedWeight": Zahl (geschätztes Gewicht in Gramm)
    }
  ],
  "suggestedMealType": "breakfast|lunch|dinner|snack",
  "suggestedFoodGroups": ["proteins", "carbohydrates", "fats", "vegetables", "fruits", "dairy", "grains", "nuts", "seeds", "beverages"],
  "suggestedCuisine": "italian|asian|american|mexican|indian|mediterranean|german|other",
  "suggestedDietaryTags": ["vegetarian", "vegan", "gluten-free", "dairy-free", "low-carb", "high-protein", "keto"]
}

Alle Nährwerte sollten für die GESAMTE sichtbare Portion berechnet werden. Verwende deutsche Begriffe in den Namen der Lebensmittel.
''';
  }

  static String _getEnglishFoodAnalysisPrompt({String? userHint}) {
    return '''
Analyze this food image and provide detailed nutrition and categorization information WITH WEIGHT ESTIMATION.
${userHint != null ? '\nUser description: "$userHint"\nPlease use this information to help identify the food accurately.\n' : ''}

IMPORTANT: Estimate the weight of the food items based on visual cues like plate size, portion size, and food density. Consider typical serving sizes and visual references.

Return ONLY a valid JSON object with no additional text, markdown formatting, or explanation. The JSON should follow this exact structure:
{
  "name": "Overall meal/food name",
  "calories": number,
  "protein": number (grams), 
  "carbs": number (grams),
  "fat": number (grams),
  "estimatedWeight": number (total estimated weight in grams),
  "detectedItems": [
    {
      "name": "Individual food item",
      "calories": number,
      "protein": number,
      "carbs": number,
      "fat": number,
      "portion": "size description",
      "estimatedWeight": number (estimated weight in grams)
    }
  ],
  "suggestedMealType": "breakfast|lunch|dinner|snack",
  "suggestedFoodGroups": ["proteins", "carbohydrates", "fats", "vegetables", "fruits", "dairy", "grains", "nuts", "seeds", "beverages"],
  "suggestedCuisine": "italian|asian|american|mexican|indian|mediterranean|german|other",
  "suggestedDietaryTags": ["vegetarian", "vegan", "gluten-free", "dairy-free", "low-carb", "high-protein", "keto"]
}

All nutritional values should be calculated for the TOTAL visible portion.
''';
  }

  static String _getGermanTextAnalysisPrompt(String description) {
    return '''
Analysiere diese Lebensmittelbeschreibung und stelle detaillierte Nährwertinformationen bereit: $description

Gib NUR ein gültiges JSON-Objekt zurück, ohne zusätzlichen Text, Markdown-Formatierung oder Erklärung. Das JSON sollte dieser exakten Struktur folgen:
{
  "suggestions": [
    {
      "name": "Lebensmittelname",
      "calories": Zahl,
      "protein": Zahl (Gramm),
      "carbs": Zahl (Gramm),
      "fat": Zahl (Gramm),
      "estimatedWeight": Zahl (geschätztes Gewicht in Gramm),
      "portionDescription": "Portionsbeschreibung",
      "description": "Kurze Beschreibung des Lebensmittels"
    }
  ]
}

Verwende deutsche Begriffe in den Namen der Lebensmittel und Beschreibungen.
''';
  }

  static String _getEnglishTextAnalysisPrompt(String description) {
    return 'Analyze this food description: $description';
  }

  static String _getGermanTextAnalysisSystemPrompt() {
    return '''Du bist ein Ernährungsexperte. Analysiere die Lebensmittelbeschreibung und gib 2-3 Lebensmittelvorschläge mit geschätzten Portionen, Einheiten und Nährwertinformationen an.

WICHTIG: Antworte nur mit gültigem JSON, kein zusätzlicher Text.

Für jeden Lebensmittelvorschlag gib an:
1. Name: Spezifischer, klarer Lebensmittelname auf Deutsch
2. Gewicht: Geschätztes Gewicht in Gramm
3. Portionsdaten: Menge und passende Einheit (z.B. 1 Tasse, 2 EL, 3 oz)
4. Nährwerte für die gesamte Portion

Häufige Einheiten:
- Flüssigkeiten: Tasse, ml, dl, l, Glas, Flasche, Becher
- Pulver: TL, EL, Tasse, Löffel
- Feststoffe: Stück, Scheibe, oz, g, Portion, Portion
- Schüttgut: Handvoll, Tasse, Schüssel

Antwortformat:
{
  "suggestions": [
    {
      "name": "Lebensmittelname auf Deutsch",
      "weight": geschätztes_gewicht_in_gramm,
      "calories": kalorien_für_diese_portion,
      "protein": protein_für_diese_portion,
      "carbs": kohlenhydrate_für_diese_portion,
      "fat": fett_für_diese_portion,
      "quantity": zahl,
      "unitId": "einheit_id",
      "unitDisplayName": "einheit anzeigename",
      "description": "Kurze Erklärung einschließlich Portionsgröße auf Deutsch"
    }
  ]
}''';
  }

  static String _getEnglishTextAnalysisSystemPrompt() {
    return '''You are a nutrition expert. Analyze the food description and provide 2-3 food suggestions with estimated portions, units, and nutritional information.

IMPORTANT: Respond with valid JSON only, no additional text.

For each food suggestion, provide:
1. Name: Specific, clear food name
2. Weight: Estimated weight in grams
3. Portion data: Quantity and appropriate unit (e.g., 1 cup, 2 tbsp, 3 oz)
4. Nutrition for the total portion

Common units to use:
- Liquids: cup, ml, dl, l, glass, bottle, mug
- Powders: tsp, tbsp, cup, scoop
- Solids: piece, slice, oz, g, portion, serving
- Bulk: handful, cup, bowl

Response format:
{
  "suggestions": [
    {
      "name": "Food name",
      "weight": estimated_weight_in_grams,
      "calories": calories_for_this_portion,
      "protein": protein_for_this_portion,
      "carbs": carbs_for_this_portion,
      "fat": fat_for_this_portion,
      "quantity": number,
      "unitId": "unit_id",
      "unitDisplayName": "unit display name",
      "description": "Brief explanation including portion size"
    }
  ]
}''';
  }
}