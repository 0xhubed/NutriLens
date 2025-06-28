import 'dart:async';
import 'metabolic_analysis_service.dart';
import 'metabolic_context_builder.dart';
import 'metabolic_coaching_service.dart';
import '../models/metabolic_context.dart';
import '../models/metabolic_insight.dart';
import '../models/food_entry.dart';

enum TriggerType {
  morningAssessment,
  preMealCheck,
  postWorkout,
  eveningReview,
  userInitiated,
  fastingMilestone,
}

class MetabolicTrigger {
  final TriggerType type;
  final DateTime scheduledTime;
  final String userId;
  final Map<String, dynamic>? context;
  final bool isRecurring;
  final Duration? recurringInterval;
  
  MetabolicTrigger({
    required this.type,
    required this.scheduledTime,
    required this.userId,
    this.context,
    this.isRecurring = false,
    this.recurringInterval,
  });
}

class MetabolicTriggerService {
  final MetabolicAnalysisService _analysisService;
  final MetabolicContextBuilder _contextBuilder;
  final MetabolicCoachingService _coachingService;
  
  final List<MetabolicTrigger> _scheduledTriggers = [];
  Timer? _triggerTimer;
  
  // Callbacks for trigger events
  Function(MetabolicInsight)? onInsightGenerated;
  Function(String message)? onNotificationTriggered;
  
  MetabolicTriggerService(
    this._analysisService,
    this._contextBuilder,
    this._coachingService,
  );
  
  /// Initialize the trigger service
  void initialize() {
    _startTriggerMonitoring();
  }
  
  /// Dispose resources
  void dispose() {
    _triggerTimer?.cancel();
  }
  
  /// Schedule a metabolic analysis trigger
  void scheduleTrigger(MetabolicTrigger trigger) {
    _scheduledTriggers.add(trigger);
    _sortTriggersByTime();
  }
  
  /// Schedule daily recurring triggers for a user
  void scheduleDailyTriggers(String userId) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Morning metabolic assessment (7 AM)
    scheduleTrigger(MetabolicTrigger(
      type: TriggerType.morningAssessment,
      scheduledTime: today.add(const Duration(hours: 7)),
      userId: userId,
      isRecurring: true,
      recurringInterval: const Duration(days: 1),
    ));
    
    // Pre-meal checks (11 AM, 2 PM, 6 PM)
    final preMealTimes = [11, 14, 18];
    for (final hour in preMealTimes) {
      scheduleTrigger(MetabolicTrigger(
        type: TriggerType.preMealCheck,
        scheduledTime: today.add(Duration(hours: hour)),
        userId: userId,
        isRecurring: true,
        recurringInterval: const Duration(days: 1),
      ));
    }
    
    // Evening review (9 PM)
    scheduleTrigger(MetabolicTrigger(
      type: TriggerType.eveningReview,
      scheduledTime: today.add(const Duration(hours: 21)),
      userId: userId,
      isRecurring: true,
      recurringInterval: const Duration(days: 1),
    ));
  }
  
  /// Trigger analysis when user logs a meal
  Future<void> onMealLogged(FoodEntry meal, String userId) async {
    // Immediate post-meal analysis
    await _executeTrigger(MetabolicTrigger(
      type: TriggerType.userInitiated,
      scheduledTime: DateTime.now(),
      userId: userId,
      context: {
        'trigger_reason': 'meal_logged',
        'meal_calories': meal.effectiveCalories,
        'meal_type': meal.mealType.name,
      },
    ));
    
    // Schedule pre-meal check for next meal (4 hours later)
    final nextMealTime = meal.timestamp.add(const Duration(hours: 4));
    if (nextMealTime.isAfter(DateTime.now())) {
      scheduleTrigger(MetabolicTrigger(
        type: TriggerType.preMealCheck,
        scheduledTime: nextMealTime,
        userId: userId,
        context: {'previous_meal_id': meal.id},
      ));
    }
  }
  
  /// Trigger analysis after workout
  Future<void> onWorkoutCompleted(String userId, {
    Duration? workoutDuration,
    String? workoutType,
  }) async {
    await _executeTrigger(MetabolicTrigger(
      type: TriggerType.postWorkout,
      scheduledTime: DateTime.now(),
      userId: userId,
      context: {
        'trigger_reason': 'workout_completed',
        'workout_duration': workoutDuration?.inMinutes,
        'workout_type': workoutType,
      },
    ));
  }
  
  /// User-initiated "Should I eat now?" analysis
  Future<MetabolicInsight> shouldIEatNow(String userId) async {
    final trigger = MetabolicTrigger(
      type: TriggerType.userInitiated,
      scheduledTime: DateTime.now(),
      userId: userId,
      context: {'trigger_reason': 'should_eat_check'},
    );
    
    return await _executeTrigger(trigger);
  }
  
  /// Check for fasting milestones and provide insights
  Future<void> checkFastingMilestones(String userId) async {
    final currentState = await _analysisService.calculateCurrentState(userId);
    final hoursFasting = currentState.timeSinceLastMeal.inHours;
    
    // Check for milestone hours (12, 16, 18, 24)
    final milestones = [12, 16, 18, 24];
    for (final milestone in milestones) {
      if (hoursFasting >= milestone && hoursFasting < milestone + 1) {
        await _executeTrigger(MetabolicTrigger(
          type: TriggerType.fastingMilestone,
          scheduledTime: DateTime.now(),
          userId: userId,
          context: {
            'trigger_reason': 'fasting_milestone',
            'milestone_hours': milestone,
          },
        ));
        break;
      }
    }
  }
  
  void _startTriggerMonitoring() {
    _triggerTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _processPendingTriggers();
    });
  }
  
  void _processPendingTriggers() {
    final now = DateTime.now();
    final triggersToExecute = _scheduledTriggers
        .where((trigger) => trigger.scheduledTime.isBefore(now) || 
                           trigger.scheduledTime.isAtSameMomentAs(now))
        .toList();
    
    for (final trigger in triggersToExecute) {
      _executeTrigger(trigger);
      _scheduledTriggers.remove(trigger);
      
      // Reschedule if recurring
      if (trigger.isRecurring && trigger.recurringInterval != null) {
        final nextTrigger = MetabolicTrigger(
          type: trigger.type,
          scheduledTime: trigger.scheduledTime.add(trigger.recurringInterval!),
          userId: trigger.userId,
          context: trigger.context,
          isRecurring: true,
          recurringInterval: trigger.recurringInterval,
        );
        scheduleTrigger(nextTrigger);
      }
    }
  }
  
  Future<MetabolicInsight> _executeTrigger(MetabolicTrigger trigger) async {
    try {
      // Build context based on trigger type
      final context = await _buildContextForTrigger(trigger);
      
      // Generate insight
      final insight = await _coachingService.getPersonalizedInsight(context);
      
      // Handle trigger-specific logic
      await _handleTriggerSpecificLogic(trigger, insight);
      
      // Notify callbacks
      onInsightGenerated?.call(insight);
      
      return insight;
    } catch (e) {
      // Create fallback insight
      final fallbackContext = await _contextBuilder.buildQuickContext(trigger.userId);
      return await _coachingService.getPersonalizedInsight(fallbackContext);
    }
  }
  
  Future<MetabolicContext> _buildContextForTrigger(MetabolicTrigger trigger) async {
    switch (trigger.type) {
      case TriggerType.morningAssessment:
        return await _contextBuilder.buildContext(
          userId: trigger.userId,
          currentActivity: 'morning_routine',
        );
        
      case TriggerType.preMealCheck:
        return await _contextBuilder.buildContext(
          userId: trigger.userId,
          currentActivity: 'pre_meal_planning',
        );
        
      case TriggerType.postWorkout:
        return await _contextBuilder.buildContext(
          userId: trigger.userId,
          currentActivity: 'post_workout',
          currentStressLevel: 0.3, // Moderate stress after workout
        );
        
      case TriggerType.eveningReview:
        return await _contextBuilder.buildContext(
          userId: trigger.userId,
          currentActivity: 'evening_review',
        );
        
      case TriggerType.fastingMilestone:
        return await _contextBuilder.buildContext(
          userId: trigger.userId,
          currentActivity: 'extended_fasting',
        );
        
      case TriggerType.userInitiated:
      default:
        return await _contextBuilder.buildQuickContext(trigger.userId);
    }
  }
  
  Future<void> _handleTriggerSpecificLogic(MetabolicTrigger trigger, MetabolicInsight insight) async {
    switch (trigger.type) {
      case TriggerType.morningAssessment:
        _sendNotification(
          'Good morning! ${insight.shortSummary}',
          priority: 'normal',
        );
        break;
        
      case TriggerType.preMealCheck:
        if (insight.isHighConfidence && insight.hasTimingRecommendation) {
          _sendNotification(
            'Meal timing insight: ${insight.shortSummary}',
            priority: 'normal',
          );
        }
        break;
        
      case TriggerType.postWorkout:
        _sendNotification(
          'Post-workout nutrition: ${insight.shortSummary}',
          priority: 'high',
        );
        break;
        
      case TriggerType.eveningReview:
        final patterns = await _analysisService.identifyPatterns(
          trigger.userId, 
          const Duration(days: 1),
        );
        if (patterns.isNotEmpty) {
          _sendNotification(
            'Daily review: ${patterns.first}',
            priority: 'low',
          );
        }
        break;
        
      case TriggerType.fastingMilestone:
        final milestoneHours = trigger.context?['milestone_hours'] ?? 0;
        _sendNotification(
          '🎉 ${milestoneHours}h fasting milestone! ${insight.shortSummary}',
          priority: 'high',
        );
        break;
        
      case TriggerType.userInitiated:
        // No automatic notification for user-initiated triggers
        break;
    }
  }
  
  void _sendNotification(String message, {required String priority}) {
    onNotificationTriggered?.call(message);
    // In a real app, this would integrate with push notifications
  }
  
  void _sortTriggersByTime() {
    _scheduledTriggers.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }
  
  /// Get upcoming triggers for debugging/display
  List<MetabolicTrigger> getUpcomingTriggers({int limit = 10}) {
    return _scheduledTriggers.take(limit).toList();
  }
  
  /// Clear all scheduled triggers
  void clearAllTriggers() {
    _scheduledTriggers.clear();
  }
  
  /// Get trigger statistics
  Map<String, dynamic> getTriggerStats() {
    final byType = <TriggerType, int>{};
    for (final trigger in _scheduledTriggers) {
      byType[trigger.type] = (byType[trigger.type] ?? 0) + 1;
    }
    
    return {
      'total_scheduled': _scheduledTriggers.length,
      'by_type': byType.map((k, v) => MapEntry(k.name, v)),
      'next_trigger': _scheduledTriggers.isNotEmpty 
          ? _scheduledTriggers.first.scheduledTime.toIso8601String()
          : null,
    };
  }
}