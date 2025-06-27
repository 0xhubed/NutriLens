import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_providers.dart';

class BulkIngredientInputWidget extends ConsumerStatefulWidget {
  final Function(List<FoodPortion>) onPortionsParsed;
  final String? initialText;

  const BulkIngredientInputWidget({
    super.key,
    required this.onPortionsParsed,
    this.initialText,
  });

  @override
  ConsumerState<BulkIngredientInputWidget> createState() => _BulkIngredientInputWidgetState();
}

class _BulkIngredientInputWidgetState extends ConsumerState<BulkIngredientInputWidget> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  List<FoodPortion> _parsedPortions = [];
  List<String> _parseErrors = [];
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? '');
    
    if (widget.initialText?.isNotEmpty == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _parseText();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
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
            _buildInputField(colorScheme),
            if (_parsedPortions.isNotEmpty || _parseErrors.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              _buildResults(colorScheme),
            ],
            if (_controller.text.isEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              _buildExamples(colorScheme),
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
        Row(
          children: [
            Icon(
              Icons.list_alt_rounded,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Bulk Ingredient Input',
              style: AppTextStyles.titleLarge.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (_parsedPortions.isNotEmpty)
          TextButton.icon(
            onPressed: _addAllPortions,
            icon: const Icon(Icons.add_rounded, size: 16),
            label: const Text('Add All'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryGreen,
            ),
          ),
      ],
    );
  }

  Widget _buildInputField(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter ingredients (one per line):',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          maxLines: 8,
          decoration: InputDecoration(
            hintText: '''2 cups rice
1 tbsp olive oil
3 medium apples
half cup milk''',
            filled: true,
            fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: AppRadius.medium,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.medium,
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(AppSpacing.md),
          ),
          style: AppTextStyles.bodyMedium,
          onChanged: (value) {
            // Debounce parsing to avoid too frequent updates
            _debounceParseText();
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: _isProcessing ? null : _parseText,
              icon: _isProcessing 
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.auto_awesome_rounded, size: 16),
              label: Text(_isProcessing ? 'Processing...' : 'Parse'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.small,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            TextButton.icon(
              onPressed: _controller.text.isEmpty ? null : _clearInput,
              icon: const Icon(Icons.clear_rounded, size: 16),
              label: const Text('Clear'),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResults(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Parsing Results:',
          style: AppTextStyles.titleMedium.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        
        // Successfully parsed portions
        if (_parsedPortions.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              borderRadius: AppRadius.medium,
              border: Border.all(
                color: AppColors.primaryGreen.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primaryGreen,
                      size: 16,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'Successfully Parsed (${_parsedPortions.length})',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ..._parsedPortions.map((portion) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${portion.formattedQuantity} of ${portion.foodName}',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _removePortion(portion),
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: colorScheme.error,
                          size: 16,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
        
        // Parse errors
        if (_parseErrors.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer.withOpacity(0.3),
              borderRadius: AppRadius.medium,
              border: Border.all(
                color: colorScheme.error.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: colorScheme.error,
                      size: 16,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'Could Not Parse (${_parseErrors.length})',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ..._parseErrors.map((error) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Text(
                    '• $error',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildExamples(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example format:',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2 cups basmati rice',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                '1 tbsp olive oil',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                '3 medium chicken breasts',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                'half cup coconut milk',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                '1/4 teaspoon black pepper',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Timer? _debounceTimer;
  
  void _debounceParseText() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), _parseText);
  }

  void _parseText() async {
    if (_controller.text.trim().isEmpty) {
      setState(() {
        _parsedPortions = [];
        _parseErrors = [];
        _isProcessing = false;
      });
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    final conversionService = ref.read(conversionServiceProvider);
    final lines = _controller.text
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    final newPortions = <FoodPortion>[];
    final newErrors = <String>[];

    for (final line in lines) {
      final parsedPortions = ref.read(parseIngredientListProvider(line));
      
      if (parsedPortions.isNotEmpty) {
        for (final portion in parsedPortions) {
          // Calculate weight estimation
          try {
            final result = await conversionService.convertToGrams(
              quantity: portion.quantity,
              unitId: portion.unitId,
              foodName: portion.foodName,
            );
            portion.estimatedGrams = result.grams;
            newPortions.add(portion);
          } catch (e) {
            newErrors.add('$line (conversion failed)');
          }
        }
      } else {
        newErrors.add(line);
      }
    }

    setState(() {
      _parsedPortions = newPortions;
      _parseErrors = newErrors;
      _isProcessing = false;
    });
  }

  void _clearInput() {
    _controller.clear();
    setState(() {
      _parsedPortions = [];
      _parseErrors = [];
      _isProcessing = false;
    });
  }

  void _removePortion(FoodPortion portion) {
    setState(() {
      _parsedPortions.removeWhere((p) => 
        p.foodName == portion.foodName && 
        p.quantity == portion.quantity && 
        p.unitId == portion.unitId
      );
    });
  }

  void _addAllPortions() {
    if (_parsedPortions.isNotEmpty) {
      widget.onPortionsParsed(_parsedPortions);
      _clearInput();
      
      // Show success feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added ${_parsedPortions.length} ingredients'),
            backgroundColor: AppColors.primaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.medium,
            ),
          ),
        );
      }
    }
  }
}

