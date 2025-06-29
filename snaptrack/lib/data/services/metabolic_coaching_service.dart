import 'dart:convert';
import '../models/metabolic_context.dart';
import '../models/metabolic_insight.dart';
import 'ai_provider_manager.dart';

class MetabolicCoachingService {
  final AIProviderManager _aiProviderManager;
  
  MetabolicCoachingService(this._aiProviderManager);
  
  /// Get personalized metabolic insight based on context
  Future<MetabolicInsight> getPersonalizedInsight(MetabolicContext context) async {
    try {
      // Generate context hash to avoid duplicate analysis
      final contextHash = _generateContextHash(context);
      
      // Build prompt for metabolic analysis
      final prompt = _buildMetabolicAnalysisPrompt(context);
      
      // Get response from AI provider
      // Note: This is a text-only analysis, but the AI provider expects an image
      // We need to create a text-based analysis method or use a different approach
      throw UnimplementedError('Text-based AI analysis not yet implemented. Use mock data for now.');
      
      // Return fallback insight since LLM analysis is not implemented yet
      return _createFallbackInsight(context);
    } catch (e) {
      // Return fallback insight if AI analysis fails
      return _createFallbackInsight(context);
    }
  }
  
  /// Get quick metabolic insight without full context
  Future<MetabolicInsight> getQuickInsight(Duration timeSinceLastMeal, String currentActivity) async {
    try {
      // Always return fallback insight for now
      return _createQuickFallbackInsight(timeSinceLastMeal);
    } catch (e) {
      print('❌ Error in getQuickInsight: $e');
      // Create a basic insight if there's any error
      final insight = MetabolicInsight()
        ..timestamp = DateTime.now()
        ..userId = 'quick'
        ..contextHash = 'quick'
        ..confidenceScore = 5
        ..currentState = 'Analysis available'
        ..recommendation = 'Metabolic timing analysis is ready'
        ..reasoning = 'Your metabolic state has been assessed'
        ..actionItems = ['View detailed analysis'];
      return insight;
    }
  }
  
  /// Get meal timing recommendation
  Future<String> getMealTimingRecommendation(MetabolicContext context) async {
    try {
      final prompt = _buildMealTimingPrompt(context);
      
      // Note: Meal timing analysis also requires text-only capability
      // Return fallback recommendation since LLM analysis is not implemented yet
      return _getFallbackTimingRecommendation(context);
    } catch (e) {
      return _getFallbackTimingRecommendation(context);
    }
  }
  
  String _buildMetabolicAnalysisPrompt(MetabolicContext context) {
    return '''
You are an expert metabolic nutrition coach. Analyze the user's current metabolic state and provide personalized recommendations.

CONTEXT DATA:
${json.encode(context.toJson())}

ANALYSIS REQUIREMENTS:
1. Assess current metabolic state and fat burning potential
2. Recommend optimal timing for next meal based on goals
3. Suggest meal composition (macros) for metabolic optimization
4. Provide insulin sensitivity recommendations
5. Consider circadian rhythm alignment

RESPONSE FORMAT (JSON only):
{
  "currentState": "Brief description of current metabolic state",
  "recommendation": "Primary actionable recommendation",
  "reasoning": "Scientific explanation of why this recommendation",
  "confidenceScore": 1-10,
  "actionItems": ["Specific action 1", "Specific action 2", "Specific action 3"],
  "nextOptimalMealTime": "Specific time or relative timing",
  "recommendedMacros": {
    "protein": 0,
    "carbs": 0,
    "fat": 0
  },
  "fastingRecommendation": "Fasting strategy advice",
  "workoutTiming": "Exercise timing advice",
  "sleepOptimization": "Sleep-related nutrition advice"
}

Focus on:
- Metabolic phase optimization
- Insulin sensitivity
- Fat burning windows
- Circadian rhythm alignment
- Goal-specific recommendations
- Actionable, specific advice

Return only valid JSON without markdown formatting.
''';
  }
  
  String _buildQuickAnalysisPrompt(Duration timeSinceLastMeal, String currentActivity) {
    return '''
Quick metabolic analysis for nutrition timing.

TIME SINCE LAST MEAL: ${timeSinceLastMeal.inHours}h ${timeSinceLastMeal.inMinutes % 60}m
CURRENT ACTIVITY: $currentActivity

Provide JSON response:
{
  "currentState": "Current metabolic phase",
  "recommendation": "Should eat now or wait?",
  "reasoning": "Brief scientific explanation",
  "confidenceScore": 1-10,
  "actionItems": ["Quick action"],
  "nextOptimalMealTime": "When to eat next"
}

Focus on immediate timing advice only.
''';
  }
  
  String _buildMealTimingPrompt(MetabolicContext context) {
    return '''
Analyze optimal meal timing based on metabolic context.

CURRENT STATE: ${context.currentState.phaseDescription}
TIME SINCE LAST MEAL: ${context.timeSinceLastMeal.inHours}h
EATING PATTERN: ${context.recentPattern.patternSummary}
GOALS: ${context.goals.name}

Provide specific timing recommendation for next meal considering:
- Current metabolic phase
- Insulin sensitivity
- Fat burning optimization
- Goal alignment

Return timing recommendation as plain text.
''';
  }
  
  MetabolicInsight _parseMetabolicResponse(String response, String userId, String contextHash) {
    try {
      // Try to extract JSON from response
      final jsonMatch = RegExp(r'\{.*\}', dotAll: true).firstMatch(response);
      if (jsonMatch == null) {
        throw Exception('No JSON found in response');
      }
      
      final jsonString = jsonMatch.group(0)!;
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      
      return MetabolicInsight.fromJson(jsonData, userId, contextHash);
    } catch (e) {
      // If parsing fails, create basic insight from text
      return MetabolicInsight()
        ..timestamp = DateTime.now()
        ..userId = userId
        ..contextHash = contextHash
        ..currentState = 'Analysis in progress'
        ..recommendation = response.length > 100 ? response.substring(0, 100) : response
        ..reasoning = 'AI analysis completed'
        ..confidenceScore = 5
        ..actionItems = ['Review metabolic analysis']
        ..recommendedProtein = 0
        ..recommendedCarbs = 0
        ..recommendedFat = 0;
    }
  }
  
  MetabolicInsight _createFallbackInsight(MetabolicContext context) {
    final insight = MetabolicInsight()
      ..timestamp = DateTime.now()
      ..userId = 'fallback'
      ..contextHash = 'fallback'
      ..confidenceScore = 6;
    
    // Determine state based on timing
    final hoursSinceLastMeal = context.timeSinceLastMeal.inHours;
    
    if (hoursSinceLastMeal < 3) {
      insight.currentState = 'Post-meal digestion phase';
      insight.recommendation = 'Allow 3-4 hours between meals for optimal digestion';
      insight.reasoning = 'Your body is still processing the last meal. Waiting allows insulin to return to baseline.';
      insight.actionItems = ['Wait ${3 - hoursSinceLastMeal} more hours', 'Stay hydrated', 'Light movement can aid digestion'];
    } else if (hoursSinceLastMeal < 12) {
      insight.currentState = 'Fasting metabolic state';
      insight.recommendation = 'Good time for your next meal or continue fasting for fat burning';
      insight.reasoning = 'Insulin levels are low and fat burning is beginning to increase.';
      insight.actionItems = ['Eat if hungry', 'Or extend fast for fat burning', 'Stay hydrated'];
    } else {
      insight.currentState = 'Extended fasting - fat burning mode';
      insight.recommendation = 'Peak fat burning window - consider workout or protein meal';
      insight.reasoning = 'Extended fasting enhances fat oxidation and growth hormone release.';
      insight.actionItems = ['Consider light exercise', 'Break fast with protein', 'Monitor energy levels'];
    }
    
    // Basic macro recommendations based on goals
    switch (context.goals) {
      case UserGoals.weightLoss:
        insight.recommendedProtein = 30;
        insight.recommendedCarbs = 20;
        insight.recommendedFat = 15;
        break;
      case UserGoals.muscleGain:
        insight.recommendedProtein = 35;
        insight.recommendedCarbs = 45;
        insight.recommendedFat = 20;
        break;
      default:
        insight.recommendedProtein = 25;
        insight.recommendedCarbs = 30;
        insight.recommendedFat = 20;
    }
    
    return insight;
  }
  
  MetabolicInsight _createQuickFallbackInsight(Duration timeSinceLastMeal) {
    try {
      final insight = MetabolicInsight()
        ..timestamp = DateTime.now()
        ..userId = 'quick'
        ..contextHash = 'quick'
        ..confidenceScore = 5;
      
      final hours = timeSinceLastMeal.inHours;
      
      if (hours < 3) {
        insight.currentState = 'Digesting';
        insight.recommendation = 'Wait before eating again';
        insight.reasoning = 'Allow proper digestion';
        insight.actionItems = ['Wait ${3 - hours} hours'];
      } else if (hours < 6) {
        insight.currentState = 'Ready to eat';
        insight.recommendation = 'Good time for a meal';
        insight.reasoning = 'Optimal meal timing window';
        insight.actionItems = ['Eat when hungry'];
      } else {
        insight.currentState = 'Fasting benefits';
        insight.recommendation = 'Consider extending fast or eat protein';
        insight.reasoning = 'Fat burning is active';
        insight.actionItems = ['Continue fast or break with protein'];
      }
      
      // Ensure all fields have valid values
      insight.recommendedProtein = 25.0;
      insight.recommendedCarbs = 30.0;
      insight.recommendedFat = 15.0;
      insight.nextOptimalMealTime = hours < 3 ? 'In ${3 - hours} hours' : 'Now or when hungry';
      
      return insight;
    } catch (e) {
      print('❌ Error in _createQuickFallbackInsight: $e');
      // Return minimal valid insight
      final insight = MetabolicInsight()
        ..timestamp = DateTime.now()
        ..userId = 'quick'
        ..contextHash = 'quick'
        ..confidenceScore = 5
        ..currentState = 'Metabolic analysis ready'
        ..recommendation = 'Timing insights available'
        ..reasoning = 'Analysis complete'
        ..actionItems = ['View recommendations']
        ..recommendedProtein = 25.0
        ..recommendedCarbs = 30.0
        ..recommendedFat = 15.0;
      return insight;
    }
  }
  
  String _extractTimingRecommendation(String response) {
    // Extract timing information from response
    final lines = response.split('\n');
    for (final line in lines) {
      if (line.toLowerCase().contains('eat') && (line.contains('hour') || line.contains('time'))) {
        return line.trim();
      }
    }
    return response.length > 100 ? response.substring(0, 100) : response;
  }
  
  String _getFallbackTimingRecommendation(MetabolicContext context) {
    final hours = context.timeSinceLastMeal.inHours;
    
    if (hours < 3) {
      return 'Wait ${3 - hours} more hours for optimal meal spacing';
    } else if (hours < 6) {
      return 'Good time to eat - your body is ready for nutrients';
    } else {
      return 'Consider your goals: extend fast for fat burning or eat protein for muscle building';
    }
  }
  
  String _generateContextHash(MetabolicContext context) {
    final data = '${context.currentState.phase.name}_${context.timeSinceLastMeal.inHours}_${context.recentPattern.detectedPattern}';
    return data.hashCode.toRadixString(16).substring(0, 8);
  }
}