import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/activity_entry.dart';
import '../../data/providers/activity_providers.dart';
import '../../data/services/activity_database.dart';
import '../../data/services/activity_service.dart';

class ActivityFormScreen extends ConsumerStatefulWidget {
  final String activityName;
  
  const ActivityFormScreen({
    super.key,
    required this.activityName,
  });

  @override
  ConsumerState<ActivityFormScreen> createState() => _ActivityFormScreenState();
}

class _ActivityFormScreenState extends ConsumerState<ActivityFormScreen> {
  final _notesController = TextEditingController();
  final _durationController = TextEditingController(text: '30');
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final activity = ActivityDatabase.getActivityByName(widget.activityName);
      if (activity != null) {
        ref.read(activityFormProvider.notifier).selectActivity(activity);
      }
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formState = ref.watch(activityFormProvider);
    final userWeight = ref.watch(userWeightProvider);

    if (formState.selectedActivity == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Activity Not Found'),
        ),
        body: const Center(
          child: Text('Activity not found'),
        ),
      );
    }

    final activity = formState.selectedActivity!;
    final estimatedCalories = formState.calculateCalories(userWeight);

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, activity, colorScheme),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildActivityInfo(activity, colorScheme),
                const SizedBox(height: AppSpacing.xl),
                _buildDurationSection(formState, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildIntensitySection(formState, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildDateTimeSection(formState, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildCaloriePreview(estimatedCalories, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildNotesSection(colorScheme),
                const SizedBox(height: AppSpacing.xl),
                _buildSaveButton(formState, userWeight, colorScheme),
                const SizedBox(height: AppSpacing.xxxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Activity activity, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: AppSpacing.md + 40,
          bottom: AppSpacing.md,
        ),
        title: Text(
          'Log Activity',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _getCategoryColor(activity.category).withOpacity(0.1),
                _getCategoryColor(activity.category).withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityInfo(Activity activity, ColorScheme colorScheme) {
    final categoryColor = _getCategoryColor(activity.category);
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.large,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: categoryColor.withOpacity(0.1),
              borderRadius: AppRadius.medium,
            ),
            child: Icon(
              _getCategoryIcon(activity.category),
              color: categoryColor,
              size: 32,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.name,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  activity.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: categoryColor.withOpacity(0.1),
                    borderRadius: AppRadius.small,
                  ),
                  child: Text(
                    '${activity.baseMET} MET',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: categoryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationSection(ActivityFormState formState, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration',
          style: AppTextStyles.titleLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Minutes',
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: AppRadius.medium,
                    borderSide: BorderSide.none,
                  ),
                  suffixText: 'min',
                ),
                onChanged: (value) {
                  final minutes = int.tryParse(value) ?? 30;
                  ref.read(activityFormProvider.notifier).setDuration(minutes);
                },
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            _buildDurationChip('15', 15, formState, colorScheme),
            const SizedBox(width: AppSpacing.sm),
            _buildDurationChip('30', 30, formState, colorScheme),
            const SizedBox(width: AppSpacing.sm),
            _buildDurationChip('60', 60, formState, colorScheme),
          ],
        ),
      ],
    );
  }

  Widget _buildDurationChip(String label, int minutes, ActivityFormState formState, ColorScheme colorScheme) {
    final isSelected = formState.durationMinutes == minutes;
    
    return InkWell(
      onTap: () {
        _durationController.text = minutes.toString();
        ref.read(activityFormProvider.notifier).setDuration(minutes);
      },
      borderRadius: AppRadius.small,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.1)
              : colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: AppRadius.small,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary.withOpacity(0.3)
                : colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Text(
          '$label min',
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildIntensitySection(ActivityFormState formState, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intensity',
          style: AppTextStyles.titleLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: Intensity.values.map((intensity) {
            final isSelected = formState.intensity == intensity;
            final color = _getIntensityColor(intensity);
            
            return Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: intensity != Intensity.values.last ? AppSpacing.sm : 0,
                ),
                child: InkWell(
                  onTap: () => ref.read(activityFormProvider.notifier).setIntensity(intensity),
                  borderRadius: AppRadius.medium,
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? color.withOpacity(0.1)
                          : colorScheme.surfaceVariant.withOpacity(0.5),
                      borderRadius: AppRadius.medium,
                      border: Border.all(
                        color: isSelected
                            ? color.withOpacity(0.3)
                            : colorScheme.outline.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          _getIntensityIcon(intensity),
                          color: isSelected ? color : colorScheme.onSurfaceVariant,
                          size: 24,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          intensity.displayName,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: isSelected ? color : colorScheme.onSurfaceVariant,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateTimeSection(ActivityFormState formState, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date & Time',
          style: AppTextStyles.titleLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        InkWell(
          onTap: () => _selectDateTime(formState),
          borderRadius: AppRadius.medium,
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.5),
              borderRadius: AppRadius.medium,
              border: Border.all(
                color: colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.schedule_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    _formatDateTime(formState.timestamp),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaloriePreview(double calories, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryOrange.withOpacity(0.1),
            AppColors.secondaryOrange.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.large,
        border: Border.all(
          color: AppColors.secondaryOrange.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.secondaryOrange.withOpacity(0.15),
              borderRadius: AppRadius.medium,
            ),
            child: Icon(
              Icons.local_fire_department_rounded,
              color: AppColors.secondaryOrange,
              size: 32,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimated Calories Burned',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.secondaryOrange,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${calories.toStringAsFixed(0)} cal',
                  style: AppTextStyles.displayMedium.copyWith(
                    color: AppColors.secondaryOrange,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes (Optional)',
          style: AppTextStyles.titleLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any notes about your workout...',
            filled: true,
            fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: AppRadius.medium,
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            ref.read(activityFormProvider.notifier).setNotes(value);
          },
        ),
      ],
    );
  }

  Widget _buildSaveButton(ActivityFormState formState, double userWeight, ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: formState.isValid ? () => _saveActivity(formState, userWeight) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.all(AppSpacing.lg),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.large,
          ),
        ),
        child: Text(
          'Log Activity',
          style: AppTextStyles.titleLarge.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(ActivityFormState formState) async {
    final date = await showDatePicker(
      context: context,
      initialDate: formState.timestamp,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(formState.timestamp),
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        ref.read(activityFormProvider.notifier).setTimestamp(newDateTime);
      }
    }
  }

  Future<void> _saveActivity(ActivityFormState formState, double userWeight) async {
    try {
      final activityService = ref.read(activityServiceProvider);
      
      final entry = await activityService.createActivityEntry(
        activityName: formState.selectedActivity!.name,
        durationMinutes: formState.durationMinutes,
        intensity: formState.intensity,
        userWeight: userWeight,
        timestamp: formState.timestamp,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
      );

      await activityService.logActivity(entry);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Activity logged successfully!'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        
        // Reset form and navigate back
        ref.read(activityFormProvider.notifier).reset();
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to log activity: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final activityDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    
    String dateStr;
    if (activityDate == today) {
      dateStr = 'Today';
    } else if (activityDate == today.subtract(const Duration(days: 1))) {
      dateStr = 'Yesterday';
    } else {
      dateStr = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
    
    final timeStr = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    return '$dateStr at $timeStr';
  }

  IconData _getCategoryIcon(ActivityCategory category) {
    switch (category) {
      case ActivityCategory.cardio:
        return Icons.directions_run_rounded;
      case ActivityCategory.strength:
        return Icons.fitness_center_rounded;
      case ActivityCategory.sports:
        return Icons.sports_basketball_rounded;
      case ActivityCategory.flexibility:
        return Icons.self_improvement_rounded;
      case ActivityCategory.water:
        return Icons.pool_rounded;
      case ActivityCategory.other:
        return Icons.more_horiz_rounded;
    }
  }

  Color _getCategoryColor(ActivityCategory category) {
    switch (category) {
      case ActivityCategory.cardio:
        return AppColors.secondaryOrange;
      case ActivityCategory.strength:
        return AppColors.proteinPurple;
      case ActivityCategory.sports:
        return AppColors.carbsBlue;
      case ActivityCategory.flexibility:
        return AppColors.primaryGreen;
      case ActivityCategory.water:
        return AppColors.carbsBlue;
      case ActivityCategory.other:
        return Theme.of(context).colorScheme.tertiary;
    }
  }

  IconData _getIntensityIcon(Intensity intensity) {
    switch (intensity) {
      case Intensity.light:
        return Icons.trending_flat_rounded;
      case Intensity.moderate:
        return Icons.trending_up_rounded;
      case Intensity.vigorous:
        return Icons.trending_up_rounded;
    }
  }

  Color _getIntensityColor(Intensity intensity) {
    switch (intensity) {
      case Intensity.light:
        return AppColors.primaryGreen;
      case Intensity.moderate:
        return AppColors.secondaryOrange;
      case Intensity.vigorous:
        return AppColors.proteinPurple;
    }
  }
}