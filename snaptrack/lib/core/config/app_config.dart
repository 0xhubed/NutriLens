class AppConfig {
  // App Information
  static const String appName = 'SnapTrack';
  static const String appVersion = '1.0.0';
  
  // Database
  static const String databaseName = 'snaptrack_db';
  
  // OpenAI Configuration
  static const String openAIBaseUrl = 'https://api.openai.com/v1';
  static const String openAIModel = 'gpt-4-vision-preview';
  static const int openAIMaxTokens = 300;
  
  // Image Processing
  static const int maxImageWidth = 1024;
  static const int maxImageHeight = 1024;
  static const int imageQuality = 85;
  
  // UI Constants
  static const double cardBorderRadius = 12.0;
  static const double defaultPadding = 16.0;
  
  // Nutrition Defaults (for manual entry)
  static const Map<String, double> defaultNutrition = {
    'calories': 0,
    'protein': 0,
    'carbs': 0,
    'fat': 0,
  };
}