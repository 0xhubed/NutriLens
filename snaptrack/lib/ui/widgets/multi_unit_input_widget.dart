import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_providers.dart';
import '../../data/providers/measurement_guide_providers.dart';
import '../../data/services/conversion_service.dart';
import '../screens/measurement_guide_screen.dart';

class MultiUnitInputWidget extends ConsumerStatefulWidget {
  final String foodName;
  final List<FoodPortion> portions;
  final Function(List<FoodPortion>) onPortionsChanged;
  final VoidCallback? onToggleMode; // Switch between weight and portions
  final bool showToggle;

  const MultiUnitInputWidget({
    super.key,
    required this.foodName,
    required this.portions,
    required this.onPortionsChanged,
    this.onToggleMode,
    this.showToggle = true,
  });

  @override
  ConsumerState<MultiUnitInputWidget> createState() => _MultiUnitInputWidgetState();
}

class _MultiUnitInputWidgetState extends ConsumerState<MultiUnitInputWidget> {
  late List<FoodPortion> _portions;

  @override
  void initState() {
    super.initState();
    _portions = List.from(widget.portions);
    if (_portions.isEmpty) {
      _addNewPortion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(colorScheme),
            const SizedBox(height: AppSpacing.md),
            ..._buildPortionInputs(colorScheme),
            const SizedBox(height: AppSpacing.md),
            _buildAddPortionButton(colorScheme),
            if (_portions.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              _buildTotalWeight(colorScheme),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Expanded(
          child: Text(
            'Portions & Measurements',
            style: AppTextStyles.titleLarge.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.help_outline,
            color: colorScheme.primary,
          ),
          onPressed: () => _showMeasurementGuide(context),
          tooltip: 'Measurement Guide',
        ),
        if (widget.showToggle && widget.onToggleMode != null)
          TextButton.icon(
            onPressed: widget.onToggleMode,
            icon: const Icon(Icons.scale_rounded, size: 16),
            label: const Text('Use Weight'),
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.primary,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildPortionInputs(ColorScheme colorScheme) {
    return _portions.asMap().entries.map((entry) {
      final index = entry.key;
      final portion = entry.value;
      
      return Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        child: _PortionInputRow(
          key: ValueKey('portion_$index'),
          portion: portion,
          foodName: widget.foodName,
          showDelete: _portions.length > 1,
          onPortionChanged: (updatedPortion) {
            setState(() {
              _portions[index] = updatedPortion;
            });
            widget.onPortionsChanged(_portions);
          },
          onDelete: () {
            setState(() {
              _portions.removeAt(index);
            });
            widget.onPortionsChanged(_portions);
          },
        ),
      );
    }).toList();
  }

  Widget _buildAddPortionButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _addNewPortion,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Another Portion'),
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.medium,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalWeight(ColorScheme colorScheme) {
    final totalWeight = _portions.fold(0.0, (sum, p) => sum + p.effectiveGrams);
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Weight',
            style: AppTextStyles.titleMedium.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${totalWeight.toStringAsFixed(0)}g',
            style: AppTextStyles.titleMedium.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  void _addNewPortion() {
    setState(() {
      _portions.add(FoodPortion.create(
        foodName: widget.foodName,
        quantity: 1.0,
        unitId: 'g',
        unitDisplayName: 'gram',
        estimatedGrams: 100.0,
      ));
    });
    widget.onPortionsChanged(_portions);
  }
  
  void _showMeasurementGuide(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MeasurementGuideScreen(),
      ),
    );
  }
}

class _PortionInputRow extends ConsumerStatefulWidget {
  final FoodPortion portion;
  final String foodName;
  final bool showDelete;
  final Function(FoodPortion) onPortionChanged;
  final VoidCallback onDelete;

  const _PortionInputRow({
    super.key,
    required this.portion,
    required this.foodName,
    required this.showDelete,
    required this.onPortionChanged,
    required this.onDelete,
  });

  @override
  ConsumerState<_PortionInputRow> createState() => _PortionInputRowState();
}

class _PortionInputRowState extends ConsumerState<_PortionInputRow> {
  late TextEditingController _quantityController;
  late TextEditingController _foodNameController;
  late FoodPortion _portion;
  MeasurementUnit? _selectedUnit;

  @override
  void initState() {
    super.initState();
    _portion = widget.portion;
    _quantityController = TextEditingController(text: _portion.quantity.toString());
    _foodNameController = TextEditingController(text: _portion.foodName);
    
    _quantityController.addListener(_onQuantityChanged);
    _foodNameController.addListener(_onFoodNameChanged);
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _foodNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final suggestedUnits = ref.watch(suggestedUnitsProvider(_portion.foodName));

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Food name input
          TextField(
            controller: _foodNameController,
            decoration: InputDecoration(
              labelText: 'Food item',
              filled: true,
              fillColor: colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: AppRadius.small,
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
            ),
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          
          // Quantity and unit row
          Row(
            children: [
              // Quantity input
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    filled: true,
                    fillColor: colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: AppRadius.small,
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                  ),
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              
              // Unit dropdown
              Expanded(
                flex: 3,
                child: suggestedUnits.when(
                  data: (units) => _buildUnitDropdown(units, colorScheme),
                  loading: () => _buildLoadingDropdown(colorScheme),
                  error: (_, __) => _buildErrorDropdown(colorScheme),
                ),
              ),
              
              // Delete button
              if (widget.showDelete) ...[
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(Icons.delete_outline_rounded),
                  style: IconButton.styleFrom(
                    foregroundColor: colorScheme.error,
                    backgroundColor: colorScheme.errorContainer.withOpacity(0.3),
                  ),
                ),
              ],
            ],
          ),
          
          // Weight estimation and confidence
          const SizedBox(height: AppSpacing.sm),
          _buildWeightEstimation(colorScheme),
        ],
      ),
    );
  }

  Widget _buildUnitDropdown(List<MeasurementUnit> units, ColorScheme colorScheme) {
    return DropdownButtonFormField<MeasurementUnit>(
      value: _selectedUnit ?? (units.isNotEmpty ? units.first : null),
      decoration: InputDecoration(
        labelText: 'Unit',
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: AppRadius.small,
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
      items: units.map((unit) => DropdownMenuItem(
        value: unit,
        child: Text(
          unit.displayName,
          style: AppTextStyles.bodyMedium,
        ),
      )).toList(),
      onChanged: (unit) {
        if (unit != null) {
          setState(() {
            _selectedUnit = unit;
            _portion.unitId = unit.unitId;
            _portion.unitDisplayName = unit.displayName;
          });
          _updateWeightEstimation();
        }
      },
    );
  }

  Widget _buildLoadingDropdown(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.small,
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _buildErrorDropdown(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: AppRadius.small,
      ),
      child: Text(
        'Error loading units',
        style: AppTextStyles.bodyMedium.copyWith(
          color: colorScheme.error,
        ),
      ),
    );
  }

  Widget _buildWeightEstimation(ColorScheme colorScheme) {
    final conversionResult = ref.watch(conversionResultProvider(ConversionRequest(
      quantity: _portion.quantity,
      unitId: _portion.unitId,
      foodName: _portion.foodName,
    )));

    return conversionResult.when(
      data: (result) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: _getConfidenceColor(result.confidence, colorScheme).withOpacity(0.1),
          borderRadius: AppRadius.small,
          border: Border.all(
            color: _getConfidenceColor(result.confidence, colorScheme).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              result.confidence.icon,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                '~${result.grams.toStringAsFixed(0)}g (${result.confidence.displayName})',
                style: AppTextStyles.labelMedium.copyWith(
                  color: _getConfidenceColor(result.confidence, colorScheme),
                ),
              ),
            ),
            if (result.confidence == ConversionConfidence.low ||
                result.confidence == ConversionConfidence.unknown)
              TextButton(
                onPressed: () => _showWeightCorrectionDialog(),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  minimumSize: const Size(0, 0),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                ),
                child: const Text('Correct', style: TextStyle(fontSize: 12)),
              ),
          ],
        ),
      ),
      loading: () => const SizedBox(
        height: 20,
        child: LinearProgressIndicator(),
      ),
      error: (_, __) => Container(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: Text(
          'Unable to estimate weight',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.error,
          ),
        ),
      ),
    );
  }

  Color _getConfidenceColor(ConversionConfidence confidence, ColorScheme colorScheme) {
    switch (confidence) {
      case ConversionConfidence.userProvided:
      case ConversionConfidence.high:
        return AppColors.primaryGreen;
      case ConversionConfidence.medium:
        return AppColors.secondaryOrange;
      case ConversionConfidence.low:
        return AppColors.fatsYellow;
      case ConversionConfidence.unknown:
        return colorScheme.error;
    }
  }

  void _onQuantityChanged() {
    final quantity = double.tryParse(_quantityController.text) ?? 0.0;
    if (quantity != _portion.quantity) {
      setState(() {
        _portion.quantity = quantity;
      });
      _updateWeightEstimation();
    }
  }

  void _onFoodNameChanged() {
    final foodName = _foodNameController.text;
    if (foodName != _portion.foodName) {
      setState(() {
        _portion.foodName = foodName;
      });
      _updateWeightEstimation();
    }
  }

  void _updateWeightEstimation() {
    // Trigger weight estimation update
    ref.invalidate(conversionResultProvider(ConversionRequest(
      quantity: _portion.quantity,
      unitId: _portion.unitId,
      foodName: _portion.foodName,
    )));
    
    widget.onPortionChanged(_portion);
  }

  void _showWeightCorrectionDialog() {
    final controller = TextEditingController(
      text: _portion.estimatedGrams?.toStringAsFixed(0) ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Correct Weight'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Help us improve by providing the actual weight for "${_portion.formattedQuantity}"',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (grams)',
                suffixText: 'g',
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final weight = double.tryParse(controller.text);
              if (weight != null && weight > 0) {
                // Save user correction
                final conversionService = ref.read(conversionServiceProvider);
                await conversionService.saveUserConversion(
                  foodName: _portion.foodName,
                  unitId: _portion.unitId,
                  gramsPerUnit: weight / _portion.quantity,
                  source: 'user-corrected',
                );

                setState(() {
                  _portion.userCorrectedGrams = weight;
                });
                
                widget.onPortionChanged(_portion);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// Provider for conversion results
class ConversionRequest {
  final double quantity;
  final String unitId;
  final String foodName;

  ConversionRequest({
    required this.quantity,
    required this.unitId,
    required this.foodName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionRequest &&
          runtimeType == other.runtimeType &&
          quantity == other.quantity &&
          unitId == other.unitId &&
          foodName == other.foodName;

  @override
  int get hashCode => quantity.hashCode ^ unitId.hashCode ^ foodName.hashCode;
}