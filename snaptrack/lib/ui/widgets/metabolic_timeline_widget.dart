import 'package:flutter/material.dart';
import '../../data/models/metabolic_state.dart';
import '../../data/models/meal_timing_data.dart';
import '../../data/models/food_entry.dart'; // For MealType enum
import '../../core/theme/app_theme.dart';

class MetabolicTimelineWidget extends StatelessWidget {
  final MetabolicState currentState;
  final List<MealTimingData> recentMeals;
  final Duration timeRange; // How many hours to show

  const MetabolicTimelineWidget({
    super.key,
    required this.currentState,
    required this.recentMeals,
    this.timeRange = const Duration(hours: 24),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: 120,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.timeline,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Metabolic Timeline',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              _buildCurrentStateChip(context),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: _buildTimeline(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStateChip(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final stateColor = _getStateColor(currentState.phase, colorScheme);
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: stateColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: stateColor.withOpacity(0.3)),
      ),
      child: Text(
        _getStateLabel(currentState.phase),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: stateColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final startTime = now.subtract(timeRange);
    
    return CustomPaint(
      painter: TimelinePainter(
        currentState: currentState,
        recentMeals: recentMeals,
        startTime: startTime,
        endTime: now,
        colorScheme: colorScheme,
      ),
      child: Container(), // Provides size for CustomPainter
    );
  }

  Color _getStateColor(MetabolicPhase phase, ColorScheme colorScheme) {
    switch (phase) {
      case MetabolicPhase.fed:
        return AppColors.secondaryOrange;
      case MetabolicPhase.fasting:
        return AppColors.primaryGreen;
      case MetabolicPhase.fatBurning:
        return AppColors.proteinPurple;
      case MetabolicPhase.muscleBuilding:
        return AppColors.carbsBlue;
    }
  }

  String _getStateLabel(MetabolicPhase phase) {
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Fed';
      case MetabolicPhase.fasting:
        return 'Fasting';
      case MetabolicPhase.fatBurning:
        return 'Fat Burning';
      case MetabolicPhase.muscleBuilding:
        return 'Recovery';
    }
  }
}

class TimelinePainter extends CustomPainter {
  final MetabolicState currentState;
  final List<MealTimingData> recentMeals;
  final DateTime startTime;
  final DateTime endTime;
  final ColorScheme colorScheme;

  TimelinePainter({
    required this.currentState,
    required this.recentMeals,
    required this.startTime,
    required this.endTime,
    required this.colorScheme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()..style = PaintingStyle.fill;

    // Draw timeline base
    final timelineY = size.height * 0.7;
    paint.color = colorScheme.outline.withOpacity(0.3);
    canvas.drawLine(
      Offset(0, timelineY),
      Offset(size.width, timelineY),
      paint,
    );

    // Draw time markers
    _drawTimeMarkers(canvas, size, timelineY);

    // Draw metabolic phases
    _drawMetabolicPhases(canvas, size, timelineY);

    // Draw meal markers
    _drawMealMarkers(canvas, size, timelineY);

    // Draw current time indicator
    _drawCurrentTimeIndicator(canvas, size, timelineY);
  }

  void _drawTimeMarkers(Canvas canvas, Size size, double timelineY) {
    final paint = Paint()
      ..color = colorScheme.outline.withOpacity(0.5)
      ..strokeWidth = 1;

    final totalDuration = endTime.difference(startTime);
    final hoursToShow = totalDuration.inHours;
    
    for (int i = 0; i <= hoursToShow; i += 6) {
      final x = (i / hoursToShow) * size.width;
      
      // Draw tick mark
      canvas.drawLine(
        Offset(x, timelineY - 5),
        Offset(x, timelineY + 5),
        paint,
      );
      
      // Draw time label
      final timeAtMarker = startTime.add(Duration(hours: i));
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${timeAtMarker.hour}:00',
          style: TextStyle(
            color: colorScheme.onSurface.withOpacity(0.6),
            fontSize: 10,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, timelineY + 10),
      );
    }
  }

  void _drawMetabolicPhases(Canvas canvas, Size size, double timelineY) {
    // This is a simplified visualization
    // In a real implementation, you'd calculate phases based on meal timing
    
    final totalDuration = endTime.difference(startTime);
    final lastMealTime = recentMeals.isNotEmpty 
        ? recentMeals.last.timestamp 
        : startTime;
    
    final timeSinceLastMeal = endTime.difference(lastMealTime);
    final mealPosition = size.width - 
        (timeSinceLastMeal.inMinutes / totalDuration.inMinutes) * size.width;
    
    // Draw fed state (3 hours after meal)
    final fedEndPosition = mealPosition + (3 / totalDuration.inHours) * size.width;
    if (fedEndPosition > 0 && mealPosition < size.width) {
      final rect = Rect.fromLTWH(
        mealPosition.clamp(0, size.width),
        timelineY - 15,
        (fedEndPosition - mealPosition).clamp(0, size.width - mealPosition),
        30,
      );
      
      final paint = Paint()
        ..color = AppColors.secondaryOrange.withOpacity(0.3);
      canvas.drawRect(rect, paint);
    }
    
    // Draw fasting state
    if (fedEndPosition < size.width) {
      final rect = Rect.fromLTWH(
        fedEndPosition.clamp(0, size.width),
        timelineY - 15,
        (size.width - fedEndPosition).clamp(0, size.width),
        30,
      );
      
      final paint = Paint()
        ..color = AppColors.primaryGreen.withOpacity(0.3);
      canvas.drawRect(rect, paint);
    }
  }

  void _drawMealMarkers(Canvas canvas, Size size, double timelineY) {
    final totalDuration = endTime.difference(startTime);
    
    for (final meal in recentMeals) {
      if (meal.timestamp.isBefore(startTime) || meal.timestamp.isAfter(endTime)) {
        continue;
      }
      
      final mealDuration = meal.timestamp.difference(startTime);
      final x = (mealDuration.inMinutes / totalDuration.inMinutes) * size.width;
      
      // Draw meal marker
      final paint = Paint()
        ..color = _getMealColor(meal.mealType)
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(Offset(x, timelineY), 6, paint);
      
      // Draw meal size indicator
      final sizeHeight = (meal.totalCalories / 800 * 20).clamp(5.0, 20.0);
      final rect = Rect.fromLTWH(
        x - 2,
        timelineY - 25 - sizeHeight,
        4,
        sizeHeight,
      );
      
      canvas.drawRect(rect, paint);
    }
  }

  void _drawCurrentTimeIndicator(Canvas canvas, Size size, double timelineY) {
    final paint = Paint()
      ..color = colorScheme.primary
      ..strokeWidth = 2;
    
    // Current time is at the end of timeline
    canvas.drawLine(
      Offset(size.width, timelineY - 25),
      Offset(size.width, timelineY + 25),
      paint,
    );
    
    // Draw arrow
    final path = Path();
    path.moveTo(size.width - 5, timelineY - 20);
    path.lineTo(size.width, timelineY - 25);
    path.lineTo(size.width + 5, timelineY - 20);
    
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  Color _getMealColor(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return AppColors.secondaryOrange;
      case MealType.lunch:
        return AppColors.primaryGreen;
      case MealType.dinner:
        return AppColors.carbsBlue;
      case MealType.snack:
        return AppColors.proteinPurple;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}