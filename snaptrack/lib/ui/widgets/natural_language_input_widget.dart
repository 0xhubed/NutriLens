import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_providers.dart';
import '../../data/providers/measurement_guide_providers.dart';
import '../screens/measurement_guide_screen.dart';

class NaturalLanguageInputWidget extends ConsumerStatefulWidget {
  final Function(FoodPortion) onPortionParsed;
  final String? initialValue;
  final String? hintText;
  final bool showExamples;

  const NaturalLanguageInputWidget({
    super.key,
    required this.onPortionParsed,
    this.initialValue,
    this.hintText,
    this.showExamples = true,
  });

  @override
  ConsumerState<NaturalLanguageInputWidget> createState() => _NaturalLanguageInputWidgetState();
}

class _NaturalLanguageInputWidgetState extends ConsumerState<NaturalLanguageInputWidget> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    
    // Set initial value if provided
    if (widget.initialValue?.isNotEmpty == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(naturalLanguageInputProvider.notifier).setInput(widget.initialValue!);
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
    final inputState = ref.watch(naturalLanguageInputProvider);
    final inputNotifier = ref.read(naturalLanguageInputProvider.notifier);

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
            _buildInputField(colorScheme, inputState, inputNotifier),
            if (inputState.suggestions.isNotEmpty) ...[ 
              const SizedBox(height: AppSpacing.sm),
              _buildSuggestions(colorScheme, inputState, inputNotifier),
            ],
            if (inputState.isValid && inputState.parsedPortion != null) ...[
              const SizedBox(height: AppSpacing.sm),
              _buildParsedResult(colorScheme, inputState),
            ],
            if (widget.showExamples && inputState.input.isEmpty) ...[
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
      children: [
        Icon(
          Icons.chat_bubble_outline_rounded,
          color: colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'Natural Language Input',
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
      ],
    );
  }

  Widget _buildInputField(
    ColorScheme colorScheme,
    NaturalLanguageInputState inputState,
    NaturalLanguageInputNotifier inputNotifier,
  ) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'e.g., "2 cups of rice" or "1 tbsp olive oil"',
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
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (inputState.isValid)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primaryGreen,
                size: 20,
              ),
            if (_controller.text.isNotEmpty)
              IconButton(
                onPressed: () {
                  _controller.clear();
                  inputNotifier.clear();
                },
                icon: Icon(
                  Icons.clear_rounded,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
            const SizedBox(width: AppSpacing.xs),
          ],
        ),
      ),
      style: AppTextStyles.bodyLarge,
      onChanged: (value) {
        inputNotifier.setInput(value);
      },
      onSubmitted: (value) async {
        if (inputState.isValid) {
          await _parsePortion(inputNotifier);
        }
      },
    );
  }

  Widget _buildSuggestions(
    ColorScheme colorScheme,
    NaturalLanguageInputState inputState,
    NaturalLanguageInputNotifier inputNotifier,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggestions:',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: inputState.suggestions.map((suggestion) => 
            ActionChip(
              label: Text(
                suggestion,
                style: AppTextStyles.labelMedium,
              ),
              onPressed: () {
                _controller.text = suggestion;
                inputNotifier.selectSuggestion(suggestion);
              },
              backgroundColor: colorScheme.primaryContainer.withOpacity(0.3),
              side: BorderSide(
                color: colorScheme.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildParsedResult(
    ColorScheme colorScheme,
    NaturalLanguageInputState inputState,
  ) {
    final portion = inputState.parsedPortion!;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: AppColors.primaryGreen.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.primaryGreen,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Parsed: ${portion.formattedQuantity} of ${portion.foodName}',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Unit: ${portion.unitDisplayName}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _parsePortion(ref.read(naturalLanguageInputProvider.notifier));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.small,
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _buildExamples(ColorScheme colorScheme) {
    final examples = [
      '2 cups rice',
      '1 tbsp olive oil',
      '3 medium apples',
      'half cup milk',
      '1/4 teaspoon salt',
      '6 oz chicken breast',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Examples:',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: examples.map((example) => 
            GestureDetector(
              onTap: () {
                _controller.text = example;
                ref.read(naturalLanguageInputProvider.notifier).setInput(example);
                _focusNode.requestFocus();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(0.5),
                  borderRadius: AppRadius.small,
                  border: Border.all(
                    color: colorScheme.outline.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  example,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }

  Future<void> _parsePortion(NaturalLanguageInputNotifier inputNotifier) async {
    final portion = await inputNotifier.parseAndConvert();
    if (portion != null) {
      widget.onPortionParsed(portion);
      _controller.clear();
      inputNotifier.clear();
      
      // Show success feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added ${portion.formattedQuantity} of ${portion.foodName}'),
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
  
  void _showMeasurementGuide(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MeasurementGuideScreen(),
      ),
    );
  }
}