import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/food_entry.dart';
import '../../data/providers/analysis_providers.dart';
import '../../data/services/analytics_service.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/providers/camera_providers.dart';
import '../../data/services/database_service.dart';
import '../../data/services/ai_provider.dart';
import '../common/date_time_picker_widget.dart';

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
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.restaurant_menu_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Nutrition Details',
                style: AppTextStyles.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildFormField(
            controller: _nameController,
            label: 'Food Name',
            icon: Icons.label_rounded,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: AppSpacing.md),
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
    ref.read(foodAnalysisProvider.notifier).analyzeImage(widget.imageFile);
  }
  
  void _updateFormFields(FoodAnalysis result) {
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
        ..imageBase64 = '';
      
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
    ref.read(foodAnalysisProvider.notifier).analyzeImageWithHint(widget.imageFile, hint);
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
}