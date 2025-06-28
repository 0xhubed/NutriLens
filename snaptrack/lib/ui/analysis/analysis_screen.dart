import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/food_entry.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/analysis_providers.dart';
import '../../data/services/analytics_service.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/providers/camera_providers.dart';
import '../../data/providers/measurement_providers.dart';
import '../../data/services/database_service.dart';
import '../../data/services/ai_provider.dart';
import '../common/date_time_picker_widget.dart';
import '../widgets/multi_unit_input_widget.dart';
import '../widgets/natural_language_input_widget.dart';
import '../widgets/metabolic_insights_card.dart';
import '../screens/measurement_guide_screen.dart';
import '../../data/providers/metabolic_providers.dart';
import '../../data/models/metabolic_context.dart';
import '../../data/models/metabolic_insight.dart';
import '../../data/models/metabolic_state.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  final File imageFile;
  final DateTime? initialDateTime;
  
  const AnalysisScreen({
    super.key,
    required this.imageFile,
    this.initialDateTime,
  });

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen> 
    with TickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatController = TextEditingController();
  
  bool _showAlternatives = false;
  bool _userConfirmedCorrect = false;
  bool _usePortionMode = false;
  List<FoodPortion> _portions = [];
  late DateTime _selectedDateTime;
  
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  void _invalidateAnalyticsProviders(DateTime affectedDate) {
    // Always invalidate global providers
    ref.invalidate(foodEntriesProvider);
    ref.invalidate(todayNutritionProvider);
    
    // Invalidate date-specific providers
    ref.invalidate(foodEntriesByDateProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(null)); // Today's progress
    
    // Invalidate weekly stats for the affected week
    final weekStart = _getWeekStart(affectedDate);
    ref.invalidate(weeklyStatsProvider(weekStart));
    
    // Invalidate current week if different
    final currentWeekStart = _getWeekStart(DateTime.now());
    if (weekStart != currentWeekStart) {
      ref.invalidate(weeklyStatsProvider(currentWeekStart));
    }
  }

  DateTime _getWeekStart(DateTime date) {
    final daysFromMonday = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysFromMonday);
  }
  
  @override
  void initState() {
    super.initState();
    
    // Initialize DateTime
    _selectedDateTime = widget.initialDateTime ?? DateTime.now();
    
    // Initialize animations
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    // Start animations and analysis
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
      _startAnalysis();
    });
  }
  
  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final analysisState = ref.watch(foodAnalysisProvider);
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          _buildModernAppBar(context, colorScheme),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildHeroImage(colorScheme),
                const SizedBox(height: AppSpacing.xl),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: analysisState.when(
                      data: (result) => result != null ? _buildAnalysisContent(result, colorScheme) : Container(),
                      loading: () => _buildModernLoadingState(colorScheme),
                      error: (error, stack) => _buildModernErrorState(error, colorScheme),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildModernAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 56,
          bottom: AppSpacing.md,
        ),
        title: Text(
          'AI Analysis',
          style: AppTextStyles.headlineLarge.copyWith(
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
                colorScheme.primary.withOpacity(0.05),
                colorScheme.tertiary.withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.of(context).pop(),
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceVariant.withOpacity(0.8),
          foregroundColor: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
  
  Widget _buildHeroImage(ColorScheme colorScheme) {
    return Hero(
      tag: 'selected-image',
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          borderRadius: AppRadius.extraLarge,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: AppRadius.extraLarge,
          child: Image.file(
            widget.imageFile,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
  
  Widget _buildModernLoadingState(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withOpacity(0.1),
                    colorScheme.secondary.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Analyzing Your Food',
            style: AppTextStyles.headlineMedium.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.5),
              borderRadius: AppRadius.extraLarge,
            ),
            child: Text(
              'AI is identifying nutrition info',
              style: AppTextStyles.labelMedium.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'This may take a few seconds while our AI analyzes your meal',
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _buildModernErrorState(Object error, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: AppColors.error.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: 40,
              color: AppColors.error,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Analysis Failed',
            style: AppTextStyles.headlineMedium.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.05),
              borderRadius: AppRadius.medium,
            ),
            child: Text(
              error.toString(),
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _enterManually,
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text('Enter Manually'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _retryAnalysis,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retry Analysis'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildAnalysisContent(FoodAnalysis result, ColorScheme colorScheme) {
    return Column(
      children: [
        if (!_userConfirmedCorrect) _buildAIConfirmationCard(result, colorScheme),
        if (_showAlternatives) ...[
          const SizedBox(height: AppSpacing.lg),
          _buildAlternativeSuggestions(result, colorScheme),
        ],
        const SizedBox(height: AppSpacing.lg),
        _buildModernNutritionForm(colorScheme),
      ],
    );
  }
  
  Widget _buildAIConfirmationCard(FoodAnalysis result, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withOpacity(0.3),
            colorScheme.secondaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.15),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.psychology_rounded,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Detection',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Is this identification correct?',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: AppRadius.large,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.name,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _buildNutritionPreview(result, colorScheme),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildMetabolicInsights(),
          const SizedBox(height: AppSpacing.lg),
          _buildConfirmationButtons(result, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildNutritionPreview(FoodAnalysis result, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildNutritionChip(
            'Cal',
            '${result.calories.toStringAsFixed(0)}',
            AppColors.secondaryOrange,
            Icons.local_fire_department_rounded,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildNutritionChip(
            'Protein',
            '${result.protein.toStringAsFixed(1)}g',
            AppColors.proteinPurple,
            Icons.fitness_center_rounded,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildNutritionChip(
            'Carbs',
            '${result.carbs.toStringAsFixed(1)}g',
            AppColors.carbsBlue,
            Icons.grain_rounded,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildNutritionChip(
            'Fat',
            '${result.fat.toStringAsFixed(1)}g',
            AppColors.fatsYellow,
            Icons.water_drop_rounded,
          ),
        ),
      ],
    );
  }
  
  Widget _buildNutritionChip(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTextStyles.labelLarge.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: color.withOpacity(0.8),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildConfirmationButtons(FoodAnalysis result, ColorScheme colorScheme) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () {
              setState(() {
                _userConfirmedCorrect = true;
                _showAlternatives = false;
              });
              _updateFormFields(result);
              _slideController.forward();
            },
            icon: const Icon(Icons.check_circle_rounded),
            label: const Text('Looks Good'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.success,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _showPartialCorrectionDialog(result),
                icon: const Icon(Icons.tune_rounded),
                label: const Text('Partially Correct'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.carbsBlue.withOpacity(0.1),
                  foregroundColor: AppColors.carbsBlue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showAlternatives = true;
                  });
                },
                icon: const Icon(Icons.close_rounded),
                label: const Text('Not Correct'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warning.withOpacity(0.1),
                  foregroundColor: AppColors.warning,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildAlternativeSuggestions(FoodAnalysis result, ColorScheme colorScheme) {
    final alternatives = _generateAlternatives(result.name);
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.lightbulb_outline_rounded,
                  color: AppColors.warning,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Alternative Suggestions',
                style: AppTextStyles.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ...alternatives.map((alt) => _buildAlternativeOption(alt, colorScheme)),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showHintDialog(result),
                  icon: const Icon(Icons.help_outline_rounded),
                  label: const Text('Help AI'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.tertiary.withOpacity(0.1),
                    foregroundColor: colorScheme.tertiary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    setState(() {
                      _userConfirmedCorrect = true;
                      _showAlternatives = false;
                    });
                    _enterManually();
                  },
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text('Enter Manually'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildAlternativeOption(String option, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () => _selectAlternative(option),
        borderRadius: AppRadius.medium,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant.withOpacity(0.5),
            borderRadius: AppRadius.medium,
            border: Border.all(
              color: colorScheme.outline.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.restaurant_rounded,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  option,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.onSurfaceVariant,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildModernNutritionForm(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: AppRadius.small,
                    ),
                    child: Icon(
                      _usePortionMode ? Icons.straighten_rounded : Icons.restaurant_menu_rounded,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    _usePortionMode ? 'Portion Entry' : 'Nutrition Details',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              _buildInputModeToggle(colorScheme),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          
          // Food Name Field (always shown)
          _buildFormField(
            controller: _nameController,
            label: 'Food Name',
            icon: Icons.label_rounded,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: AppSpacing.md),
          
          // Conditional form content based on mode
          if (_usePortionMode) ...[
            // Portion-based input mode
            _buildPortionInputSection(colorScheme),
          ] else ...[
            // Traditional nutrition input mode
            _buildTraditionalNutritionInput(colorScheme),
          ],
          const SizedBox(height: AppSpacing.lg),
          
          // Date and Time Selection
          DateTimePickerWidget(
            initialDateTime: _selectedDateTime,
            onDateTimeChanged: (newDateTime) {
              setState(() {
                _selectedDateTime = newDateTime;
              });
            },
            label: 'When did you eat this?',
          ),
          
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _saveFoodEntry,
              icon: const Icon(Icons.save_rounded),
              label: const Text('Save Food Entry'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.large,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildInputModeToggle(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleOption(
            'Nutrition',
            Icons.restaurant_menu_rounded,
            !_usePortionMode,
            () => setState(() => _usePortionMode = false),
            colorScheme,
          ),
          _buildToggleOption(
            'Portions',
            Icons.straighten_rounded,
            _usePortionMode,
            () => setState(() => _usePortionMode = true),
            colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
    ColorScheme colorScheme,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: AppRadius.medium,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTraditionalNutritionInput(ColorScheme colorScheme) {
    return Column(
      children: [
        _buildFormField(
          controller: _caloriesController,
          label: 'Calories (kcal)',
          icon: Icons.local_fire_department_rounded,
          keyboardType: TextInputType.number,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: _buildFormField(
                controller: _proteinController,
                label: 'Protein (g)',
                icon: Icons.fitness_center_rounded,
                keyboardType: TextInputType.number,
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildFormField(
                controller: _carbsController,
                label: 'Carbs (g)',
                icon: Icons.grain_rounded,
                keyboardType: TextInputType.number,
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildFormField(
                controller: _fatController,
                label: 'Fat (g)',
                icon: Icons.water_drop_rounded,
                keyboardType: TextInputType.number,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPortionInputSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quick natural language input
        NaturalLanguageInputWidget(
          onPortionParsed: (portion) {
            setState(() {
              if (_portions.isEmpty || _portions.first.foodName != portion.foodName) {
                _portions = [portion];
              } else {
                _portions.add(portion);
              }
            });
            _updateNutritionFromPortions();
          },
          initialValue: '',
          hintText: 'e.g., "2 cups rice" or "1 tbsp oil"',
          showExamples: false,
        ),
        const SizedBox(height: AppSpacing.md),
        
        // Multi-unit input widget
        MultiUnitInputWidget(
          foodName: _nameController.text.isNotEmpty ? _nameController.text : 'Food Item',
          portions: _portions,
          onPortionsChanged: (portions) {
            setState(() {
              _portions = portions;
            });
            _updateNutritionFromPortions();
          },
          showToggle: false,
        ),
        
        // Show calculated nutrition summary
        if (_portions.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          _buildPortionNutritionSummary(colorScheme),
        ],
      ],
    );
  }

  Widget _buildPortionNutritionSummary(ColorScheme colorScheme) {
    final totalWeight = _portions.fold(0.0, (sum, p) => sum + p.effectiveGrams);
    final totalCalories = double.tryParse(_caloriesController.text) ?? 0.0;
    final totalProtein = double.tryParse(_proteinController.text) ?? 0.0;
    final totalCarbs = double.tryParse(_carbsController.text) ?? 0.0;
    final totalFat = double.tryParse(_fatController.text) ?? 0.0;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calculate_rounded,
                color: colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Portion Summary',
                style: AppTextStyles.labelLarge.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutritionSummaryItem('Weight', '${totalWeight.toStringAsFixed(0)}g', AppColors.primaryGreen),
              _buildNutritionSummaryItem('Calories', '${totalCalories.toStringAsFixed(0)}', AppColors.secondaryOrange),
              _buildNutritionSummaryItem('Protein', '${totalProtein.toStringAsFixed(1)}g', AppColors.proteinPurple),
              _buildNutritionSummaryItem('Carbs', '${totalCarbs.toStringAsFixed(1)}g', AppColors.carbsBlue),
              _buildNutritionSummaryItem('Fat', '${totalFat.toStringAsFixed(1)}g', AppColors.fatsYellow),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.labelLarge.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: color.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  void _updateNutritionFromPortions() {
    if (_portions.isEmpty) return;
    
    // For now, use simple estimation. In a real app, you'd use the conversion service
    // to calculate nutrition based on portions and food database
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;
    
    for (final portion in _portions) {
      // These would come from a food database lookup
      // For demo purposes, using rough estimates per 100g
      final weight = portion.effectiveGrams;
      totalCalories += weight * 1.5; // ~150 cal per 100g average
      totalProtein += weight * 0.1;  // ~10g protein per 100g average
      totalCarbs += weight * 0.2;    // ~20g carbs per 100g average
      totalFat += weight * 0.05;     // ~5g fat per 100g average
    }
    
    _caloriesController.text = totalCalories.toStringAsFixed(0);
    _proteinController.text = totalProtein.toStringAsFixed(1);
    _carbsController.text = totalCarbs.toStringAsFixed(1);
    _fatController.text = totalFat.toStringAsFixed(1);
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ColorScheme colorScheme,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppTextStyles.bodyLarge,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: colorScheme.primary,
          size: 20,
        ),
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(
            color: colorScheme.outline.withOpacity(0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
  
  void _startAnalysis() {
    // Use portion-aware analysis by default to get portion information from first call
    ref.read(foodAnalysisProvider.notifier).analyzeImageWithPortions(widget.imageFile);
  }
  
  void _updateFormFields(FoodAnalysis result) {
    // Check if AI provided portion data
    if (result.hasPortionData && result.detectedPortions != null && result.detectedPortions!.isNotEmpty) {
      print('🍽️ AI provided ${result.detectedPortions!.length} portion(s), enabling portion mode');
      
      setState(() {
        _usePortionMode = true;
        _portions = List.from(result.detectedPortions!);
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.restaurant_rounded,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text('Found ${result.detectedPortions!.length} portion(s) - using smart measurement mode'),
            ],
          ),
          backgroundColor: AppColors.primaryGreen,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.medium,
          ),
          margin: const EdgeInsets.all(AppSpacing.md),
        ),
      );
    } else {
      // Fallback to traditional weight-based input
      print('📏 No portion data from AI, using traditional weight input');
      
      _nameController.text = result.name;
      _caloriesController.text = result.calories.toStringAsFixed(0);
      _proteinController.text = result.protein.toStringAsFixed(1);
      _carbsController.text = result.carbs.toStringAsFixed(1);
      _fatController.text = result.fat.toStringAsFixed(1);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              const Text('Form updated with AI analysis'),
            ],
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.medium,
          ),
          margin: const EdgeInsets.all(AppSpacing.md),
        ),
      );
    }
  }
  
  void _retryAnalysis() {
    ref.invalidate(foodAnalysisProvider);
    _startAnalysis();
  }
  
  void _enterManually() {
    // Clear any existing form data and let user enter manually
    _nameController.clear();
    _caloriesController.clear();
    _proteinController.clear();
    _carbsController.clear();
    _fatController.clear();
  }
  
  void _saveFoodEntry() async {
    try {
      final entry = FoodEntry()
        ..name = _nameController.text.isNotEmpty ? _nameController.text : 'Unknown Food'
        ..calories = double.tryParse(_caloriesController.text) ?? 0
        ..protein = double.tryParse(_proteinController.text) ?? 0
        ..carbs = double.tryParse(_carbsController.text) ?? 0
        ..fat = double.tryParse(_fatController.text) ?? 0
        ..timestamp = _selectedDateTime
        ..imageBase64 = ''
        ..usePortions = _usePortionMode
        ..portions = _usePortionMode ? _portions : [];
      
      await ref.read(databaseServiceProvider).saveFoodEntry(entry);
      
      // Invalidate analytics providers to refresh all statistics
      _invalidateAnalyticsProviders(_selectedDateTime);
      
      // Reset camera state
      ref.read(selectedImageProvider.notifier).state = null;
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                const Text('Food entry saved successfully!'),
              ],
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.medium,
            ),
            margin: const EdgeInsets.all(AppSpacing.md),
            action: SnackBarAction(
              label: 'Add Another',
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                context.push('/camera');
              },
            ),
          ),
        );
        
        // Navigate back to home
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text('Error saving entry: $e'),
              ],
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.medium,
            ),
            margin: const EdgeInsets.all(AppSpacing.md),
          ),
        );
      }
    }
  }
  
  void _selectAlternative(String alternative) {
    // Create a mock result for the alternative and re-analyze
    _reanalyzeWithHint(alternative);
  }
  
  List<String> _generateAlternatives(String detectedFood) {
    final alternatives = <String>[];
    final lower = detectedFood.toLowerCase();
    
    if (lower.contains('quinoa') || lower.contains('bowl')) {
      alternatives.addAll([
        'Rice Bowl',
        'Grain Bowl',
        'Buddha Bowl',
        'Couscous Bowl',
        'Farro Bowl',
      ]);
    } else if (lower.contains('pasta')) {
      alternatives.addAll([
        'Spaghetti',
        'Penne',
        'Fusilli',
        'Linguine',
        'Macaroni',
      ]);
    } else if (lower.contains('chicken')) {
      alternatives.addAll([
        'Grilled Chicken',
        'Baked Chicken',
        'Chicken Breast',
        'Chicken Thigh',
        'Fried Chicken',
      ]);
    } else {
      alternatives.addAll([
        'Mixed Salad',
        'Vegetable Stir Fry',
        'Sandwich',
        'Soup',
        'Pizza',
      ]);
    }
    
    return alternatives.take(4).toList();
  }
  
  void _showHintDialog(FoodAnalysis originalResult) {
    final hintController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.help_outline_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('Help AI Identify'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Describe what the food actually is to help improve AI accuracy:',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: hintController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'e.g., "This is actually oatmeal with berries and honey"',
                border: OutlineInputBorder(
                  borderRadius: AppRadius.medium,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              _reanalyzeWithHint(hintController.text);
            },
            child: const Text('Re-analyze'),
          ),
        ],
      ),
    );
  }
  
  void _reanalyzeWithHint(String hint) {
    setState(() {
      _showAlternatives = false;
    });
    // Use portion-aware analysis when re-analyzing with hints to maintain portion data
    ref.read(foodAnalysisProvider.notifier).analyzeImageWithPortions(widget.imageFile, hint: hint);
  }
  
  void _showPartialCorrectionDialog(FoodAnalysis originalResult) {
    final correctionController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.tune_rounded,
              color: AppColors.carbsBlue,
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('Partial Correction'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: AppRadius.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI detected:',
                    style: AppTextStyles.labelMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    originalResult.name,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'What needs to be corrected?',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: correctionController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'e.g., "without fruits" or "add more vegetables"',
                border: OutlineInputBorder(
                  borderRadius: AppRadius.medium,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              _reanalyzeWithPartialCorrection(originalResult, correctionController.text);
            },
            child: const Text('Apply Correction'),
          ),
        ],
      ),
    );
  }
  
  void _reanalyzeWithPartialCorrection(FoodAnalysis originalResult, String correction) {
    final hint = '${originalResult.name}, but $correction';
    _reanalyzeWithHint(hint);
  }
  
  Widget _buildMetabolicInsights() {
    return Consumer(
      builder: (context, ref, child) {
        // Use a hardcoded user ID for now - in a real app this would come from auth
        const userId = 'current_user';
        
        final quickInsightParams = QuickInsightParams(
          timeSinceLastMeal: const Duration(hours: 4), // Default assumption
          currentActivity: 'analyzing_food',
        );
        
        final asyncInsight = ref.watch(quickMetabolicInsightProvider(quickInsightParams));
        
        return asyncInsight.when(
          data: (insight) => MetabolicInsightsCard(
            insight: insight,
            onTap: () {
              // Navigate to full metabolic dashboard
              _showMetabolicAnalysisDialog(insight);
            },
          ),
          loading: () => _buildMetabolicLoadingCard(),
          error: (error, stack) => _buildMetabolicErrorCard(),
        );
      },
    );
  }
  
  Widget _buildMetabolicLoadingCard() {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Text(
              'Analyzing metabolic timing...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMetabolicErrorCard() {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Icon(
              Icons.timeline,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.md),
            Text(
              'Metabolic insights temporarily unavailable',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showMetabolicAnalysisDialog(MetabolicInsight insight) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Metabolic Analysis'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MetabolicStatusWidget(
                state: MetabolicState.calculate(
                  timeSinceLastMeal: const Duration(hours: 4),
                  lastMealCalories: 500,
                  lastMealCarbs: 60,
                  timestamp: DateTime.now(),
                ),
                timeSinceLastMeal: const Duration(hours: 4),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Detailed Analysis',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(insight.formatForDisplay()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}