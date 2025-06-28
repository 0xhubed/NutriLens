import 'package:isar/isar.dart';
import 'macro_profile.dart';

part 'metabolic_insight.g.dart';

@collection
class MetabolicInsight {
  Id id = Isar.autoIncrement;
  
  late DateTime timestamp;
  late String userId;
  
  // Core insight data
  late String currentState; // "Fat burning mode", "Post-meal recovery"
  late String recommendation; // "Wait 2 more hours before eating"
  late String reasoning; // "Your insulin levels are dropping..."
  late int confidenceScore; // 1-10
  
  // Action items
  List<String> actionItems = [];
  
  // Timing recommendations
  String? nextOptimalMealTime;
  
  // Macro recommendations
  late double recommendedProtein;
  late double recommendedCarbs;
  late double recommendedFat;
  
  // Additional insights
  String? fastingRecommendation;
  String? workoutTiming;
  String? sleepOptimization;
  
  // Context hash to avoid duplicate analysis
  late String contextHash;
  
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
  @ignore
  MacroGrams get recommendedMacros {
    return MacroGrams(
      protein: recommendedProtein,
      carbs: recommendedCarbs,
      fat: recommendedFat,
    );
  }
  
  // Quality checks
  @ignore
  bool get isHighConfidence => confidenceScore >= 7;
  @ignore
  bool get hasActionItems => actionItems.isNotEmpty;
  @ignore
  bool get hasTimingRecommendation => nextOptimalMealTime != null;
  @ignore
  bool get hasMacroRecommendation => recommendedProtein > 0 || recommendedCarbs > 0 || recommendedFat > 0;
  
  // Get confidence description
  @ignore
  String get confidenceDescription {
    if (confidenceScore >= 8) return 'Very High';
    if (confidenceScore >= 6) return 'High';
    if (confidenceScore >= 4) return 'Medium';
    return 'Low';
  }
  
  // Get priority level
  @ignore
  String get priorityLevel {
    if (confidenceScore >= 8 && actionItems.length >= 3) return 'Critical';
    if (confidenceScore >= 6 && actionItems.length >= 2) return 'High';
    if (confidenceScore >= 4) return 'Medium';
    return 'Low';
  }
  
  // Summary for notifications
  @ignore
  String get shortSummary {
    if (recommendation.length <= 50) return recommendation;
    return '${recommendation.substring(0, 47)}...';
  }
  
  // Age of insight
  @ignore
  Duration get age => DateTime.now().difference(timestamp);
  
  @ignore
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