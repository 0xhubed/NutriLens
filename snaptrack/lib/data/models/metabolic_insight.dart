import 'package:hive/hive.dart';
import 'macro_profile.dart';

part 'metabolic_insight.g.dart';

@HiveType(typeId: 7)
class MetabolicInsight extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime timestamp = DateTime.now();
  
  @HiveField(2)
  String userId = '';
  
  // Core insight data
  @HiveField(3)
  String currentState = ''; // "Fat burning mode", "Post-meal recovery"
  
  @HiveField(4)
  String recommendation = ''; // "Wait 2 more hours before eating"
  
  @HiveField(5)
  String reasoning = ''; // "Your insulin levels are dropping..."
  
  @HiveField(6)
  int confidenceScore = 5; // 1-10
  
  // Action items
  @HiveField(7)
  List<String> actionItems = [];
  
  // Timing recommendations
  @HiveField(8)
  String? nextOptimalMealTime;
  
  // Macro recommendations
  @HiveField(9)
  double recommendedProtein = 0.0;
  
  @HiveField(10)
  double recommendedCarbs = 0.0;
  
  @HiveField(11)
  double recommendedFat = 0.0;
  
  // Additional insights
  @HiveField(12)
  String? fastingRecommendation;
  
  @HiveField(13)
  String? workoutTiming;
  
  @HiveField(14)
  String? sleepOptimization;
  
  // Context hash to avoid duplicate analysis
  @HiveField(15)
  String contextHash = '';
  
  // Constructor
  MetabolicInsight();
  
  // Create from JSON response
  static MetabolicInsight fromJson(Map<String, dynamic> json, String userId, String contextHash) {
    final insight = MetabolicInsight()
      ..timestamp = DateTime.now()
      ..userId = userId
      ..contextHash = contextHash
      ..currentState = json['currentState'] ?? 'Unknown state'
      ..recommendation = json['recommendation'] ?? 'No specific recommendation'
      ..reasoning = json['reasoning'] ?? 'Analysis in progress'
      ..confidenceScore = (json['confidenceScore'] ?? 5).toInt().clamp(1, 10);
    
    // Parse action items
    if (json['actionItems'] is List) {
      insight.actionItems = List<String>.from(json['actionItems']);
    }
    
    // Parse timing
    insight.nextOptimalMealTime = json['nextOptimalMealTime'];
    
    // Parse macro recommendations
    final macros = json['recommendedMacros'] ?? {};
    insight.recommendedProtein = (macros['protein'] ?? 0).toDouble();
    insight.recommendedCarbs = (macros['carbs'] ?? 0).toDouble();
    insight.recommendedFat = (macros['fat'] ?? 0).toDouble();
    
    // Additional insights
    insight.fastingRecommendation = json['fastingRecommendation'];
    insight.workoutTiming = json['workoutTiming'];
    insight.sleepOptimization = json['sleepOptimization'];
    
    return insight;
  }
  
  // Convert to display format
  Map<String, dynamic> toDisplayMap() {
    return {
      'currentState': currentState,
      'recommendation': recommendation,
      'reasoning': reasoning,
      'confidence': confidenceScore,
      'actionItems': actionItems,
      'nextMealTime': nextOptimalMealTime,
      'macros': {
        'protein': recommendedProtein,
        'carbs': recommendedCarbs,
        'fat': recommendedFat,
      },
      'fasting': fastingRecommendation,
      'workout': workoutTiming,
      'sleep': sleepOptimization,
      'timestamp': timestamp.toIso8601String(),
    };
  }
  
  // Get recommended macro profile
  MacroGrams get recommendedMacros {
    return MacroGrams(
      protein: recommendedProtein,
      carbs: recommendedCarbs,
      fat: recommendedFat,
    );
  }
  
  // Quality checks
  bool get isHighConfidence => confidenceScore >= 7;
  bool get hasActionItems => actionItems.isNotEmpty;
  bool get hasTimingRecommendation => nextOptimalMealTime != null;
  bool get hasMacroRecommendation => recommendedProtein > 0 || recommendedCarbs > 0 || recommendedFat > 0;
  
  // Get confidence description
  String get confidenceDescription {
    if (confidenceScore >= 8) return 'Very High';
    if (confidenceScore >= 6) return 'High';
    if (confidenceScore >= 4) return 'Medium';
    return 'Low';
  }
  
  // Get priority level
  String get priorityLevel {
    if (confidenceScore >= 8 && actionItems.length >= 3) return 'Critical';
    if (confidenceScore >= 6 && actionItems.length >= 2) return 'High';
    if (confidenceScore >= 4) return 'Medium';
    return 'Low';
  }
  
  // Summary for notifications
  String get shortSummary {
    if (recommendation.length <= 50) return recommendation;
    return '${recommendation.substring(0, 47)}...';
  }
  
  // Age of insight
  Duration get age => DateTime.now().difference(timestamp);
  
  bool get isStale => age.inHours > 6; // Insights older than 6 hours considered stale
  
  // Format for user display
  String formatForDisplay() {
    final buffer = StringBuffer();
    buffer.writeln('🎯 ${currentState}');
    buffer.writeln();
    buffer.writeln('💡 ${recommendation}');
    buffer.writeln();
    buffer.writeln('📊 ${reasoning}');
    
    if (actionItems.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('✅ Action Items:');
      for (final item in actionItems) {
        buffer.writeln('• $item');
      }
    }
    
    if (nextOptimalMealTime != null) {
      buffer.writeln();
      buffer.writeln('⏰ Next meal: $nextOptimalMealTime');
    }
    
    if (hasMacroRecommendation) {
      buffer.writeln();
      buffer.writeln('🍽️ Recommended macros:');
      if (recommendedProtein > 0) buffer.writeln('• Protein: ${recommendedProtein.toStringAsFixed(1)}g');
      if (recommendedCarbs > 0) buffer.writeln('• Carbs: ${recommendedCarbs.toStringAsFixed(1)}g');
      if (recommendedFat > 0) buffer.writeln('• Fat: ${recommendedFat.toStringAsFixed(1)}g');
    }
    
    return buffer.toString();
  }
}