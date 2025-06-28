import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_providers.dart';
import '../../data/providers/measurement_fallback_provider.dart';

/// A safe unit dropdown that always works with multiple fallback levels
class SafeUnitDropdown extends ConsumerWidget {
  final String foodName;
  final String currentUnitId;
  final String currentUnitDisplayName;
  final Function(MeasurementUnit) onUnitChanged;
  final ColorScheme colorScheme;

  const SafeUnitDropdown({
    super.key,
    required this.foodName,
    required this.currentUnitId,
    required this.currentUnitDisplayName,
    required this.onUnitChanged,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Try multiple providers in order of preference
    return _buildWithFallbacks(ref);
  }

  Widget _buildWithFallbacks(WidgetRef ref) {
    // Level 1: Try smart suggestions (may fail if database not ready)
    final suggestedUnits = ref.watch(suggestedUnitsProvider(foodName));
    
    return suggestedUnits.when(
      data: (units) {
        if (units.isNotEmpty) {
          return _buildDropdown(units, 'Smart suggestions');
        }
        return _buildFallbackLevel2(ref);
      },
      loading: () => _buildLoadingDropdown(),
      error: (_, __) => _buildFallbackLevel2(ref),
    );
  }

  Widget _buildFallbackLevel2(WidgetRef ref) {
    // Level 2: Try static suggestions
    try {
      final staticUnits = ref.read(staticSuggestedUnitsProvider(foodName));
      if (staticUnits.isNotEmpty) {
        return _buildDropdown(staticUnits, 'Static suggestions');
      }
    } catch (e) {
      // Continue to level 3
    }
    
    return _buildFallbackLevel3(ref);
  }

  Widget _buildFallbackLevel3(WidgetRef ref) {
    // Level 3: Try guaranteed units
    try {
      final guaranteedUnits = ref.read(guaranteedUnitsProvider(foodName));
      if (guaranteedUnits.isNotEmpty) {
        return _buildDropdown(guaranteedUnits, 'Guaranteed units');
      }
    } catch (e) {
      // Continue to level 4
    }
    
    return _buildFallbackLevel4(ref);
  }

  Widget _buildFallbackLevel4(WidgetRef ref) {
    // Level 4: Try basic fallback service
    try {
      final fallbackService = ref.read(fallbackMeasurementProvider);
      final basicUnits = fallbackService.getSuggestedUnits(foodName);
      if (basicUnits.isNotEmpty) {
        return _buildDropdown(basicUnits, 'Basic fallback');
      }
    } catch (e) {
      // Continue to final fallback
    }
    
    return _buildFinalFallback();
  }

  Widget _buildFinalFallback() {
    // Final fallback: hardcoded basic units
    final hardcodedUnits = [
      MeasurementUnit.create(
        unitId: 'g',
        displayName: 'Gram',
        shortName: 'g',
        category: MeasurementCategory.solid,
        gramEquivalent: 1.0,
      ),
      MeasurementUnit.create(
        unitId: 'ml',
        displayName: 'Milliliter',
        shortName: 'ml',
        category: MeasurementCategory.liquid,
        gramEquivalent: 1.0,
      ),
      MeasurementUnit.create(
        unitId: 'cup',
        displayName: 'Cup',
        shortName: 'cup',
        category: MeasurementCategory.liquid,
        gramEquivalent: 240.0,
      ),
      MeasurementUnit.create(
        unitId: 'tbsp',
        displayName: 'Tablespoon',
        shortName: 'tbsp',
        category: MeasurementCategory.powder,
        gramEquivalent: 15.0,
      ),
      MeasurementUnit.create(
        unitId: 'piece',
        displayName: 'Piece',
        shortName: 'piece',
        category: MeasurementCategory.solid,
        gramEquivalent: 100.0,
      ),
    ];
    
    return _buildDropdown(hardcodedUnits, 'Emergency fallback');
  }

  Widget _buildDropdown(List<MeasurementUnit> units, String source) {
    // Find current unit in the list or use first available
    MeasurementUnit? selectedUnit = units
        .where((unit) => unit.unitId == currentUnitId)
        .firstOrNull;
    selectedUnit ??= units.first;

    print('📱 Building dropdown with ${units.length} units from: $source');
    print('📱 Selected unit: ${selectedUnit.displayName}');

    return DropdownButtonFormField<MeasurementUnit>(
      value: selectedUnit,
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
          onUnitChanged(unit);
        }
      },
    );
  }

  Widget _buildLoadingDropdown() {
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
}