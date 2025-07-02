import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_theme.dart';
import '../../data/providers/camera_providers.dart';
import '../analysis/analysis_screen.dart';

class EnhancedCameraScreen extends ConsumerStatefulWidget {
  const EnhancedCameraScreen({super.key});

  @override
  ConsumerState<EnhancedCameraScreen> createState() => _EnhancedCameraScreenState();
}

class _EnhancedCameraScreenState extends ConsumerState<EnhancedCameraScreen> {
  bool _isARMode = false;
  double? _estimatedVolume;
  bool _isCapturing = false;
  XFile? _capturedImage;
  
  // Simple volume estimation based on common food portions
  final Map<String, double> _commonPortions = {
    'Small (4 oz)': 4.0,
    'Medium (8 oz)': 8.0,
    'Large (12 oz)': 12.0,
    'Extra Large (16 oz)': 16.0,
  };
  
  String? _selectedPortion;

  @override
  Widget build(BuildContext context) {
    final imageState = ref.watch(selectedImageProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(
          _isARMode ? 'Portion Estimation' : 'Capture Food',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (Theme.of(context).platform != TargetPlatform.linux)
            IconButton(
              icon: Icon(_isARMode ? Icons.camera_alt : Icons.straighten),
              onPressed: () {
                setState(() {
                  _isARMode = !_isARMode;
                  _estimatedVolume = null;
                  _selectedPortion = null;
                });
              },
              tooltip: _isARMode ? 'Standard Mode' : 'Portion Estimation',
            ),
        ],
      ),
      body: SafeArea(
        child: imageState != null 
            ? _buildImagePreview(context, ref, imageState, colorScheme)
            : _isARMode && Theme.of(context).platform != TargetPlatform.linux
                ? _buildPortionEstimationView(colorScheme)
                : _buildStandardCameraInterface(context, ref, colorScheme),
      ),
    );
  }
  
  Widget _buildPortionEstimationView(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          _buildPortionEstimationToggle(colorScheme),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPortionHero(colorScheme),
                const SizedBox(height: AppSpacing.xl),
                _buildPortionInstructions(context, colorScheme),
                const SizedBox(height: AppSpacing.xl),
                _buildPortionSelector(colorScheme),
              ],
            ),
          ),
          _buildCameraActions(context, ref, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildPortionEstimationToggle(ColorScheme colorScheme) {
    if (Theme.of(context).platform == TargetPlatform.linux) {
      return const SizedBox.shrink();
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: SegmentedButton<bool>(
        segments: const [
          ButtonSegment(
            value: false,
            label: Text('Standard'),
            icon: Icon(Icons.camera_alt),
          ),
          ButtonSegment(
            value: true,
            label: Text('Portion Guide'),
            icon: Icon(Icons.straighten),
          ),
        ],
        selected: {_isARMode},
        onSelectionChanged: (Set<bool> newSelection) {
          setState(() {
            _isARMode = newSelection.first;
            _estimatedVolume = null;
            _selectedPortion = null;
          });
        },
        style: SegmentedButton.styleFrom(
          backgroundColor: colorScheme.surface,
          selectedForegroundColor: colorScheme.onPrimary,
          selectedBackgroundColor: colorScheme.primary,
        ),
      ),
    );
  }
  
  Widget _buildPortionHero(ColorScheme colorScheme) {
    return Container(
      width: 200,
      height: 200,
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
          color: colorScheme.primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.straighten,
            size: 80,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
  
  Widget _buildPortionInstructions(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          'Estimate Portion Size',
          style: AppTextStyles.displayMedium.copyWith(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.5),
            borderRadius: AppRadius.extraLarge,
          ),
          child: Text(
            'Smart portion estimation for better accuracy',
            style: AppTextStyles.labelLarge.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            'Select the portion size that best matches your food, then take a photo',
            style: AppTextStyles.bodyLarge.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
  
  Widget _buildPortionSelector(ColorScheme colorScheme) {
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
          Text(
            'Select portion size:',
            style: AppTextStyles.titleMedium.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _commonPortions.entries.map((entry) {
              final isSelected = _selectedPortion == entry.key;
              return FilterChip(
                label: Text(entry.key),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedPortion = selected ? entry.key : null;
                    _estimatedVolume = selected ? entry.value : null;
                  });
                },
                backgroundColor: colorScheme.surface,
                selectedColor: colorScheme.primaryContainer,
                checkmarkColor: colorScheme.primary,
                labelStyle: AppTextStyles.labelMedium.copyWith(
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                ),
              );
            }).toList(),
          ),
          if (_estimatedVolume != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: AppRadius.medium,
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Estimated volume: ${_estimatedVolume!.toStringAsFixed(1)} oz',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildImagePreview(BuildContext context, WidgetRef ref, XFile imageState, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'selected-image',
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.extraLarge,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: AppRadius.extraLarge,
                      child: Image.file(
                        File(imageState.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    if (_estimatedVolume != null)
                      Positioned(
                        top: AppSpacing.md,
                        right: AppSpacing.md,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: AppRadius.medium,
                            border: Border.all(
                              color: AppColors.primaryGreen.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.straighten,
                                color: AppColors.primaryGreen,
                                size: 16,
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                '${_estimatedVolume!.toStringAsFixed(1)} oz',
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          _buildImageActions(context, ref, imageState, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildImageActions(BuildContext context, WidgetRef ref, XFile imageState, ColorScheme colorScheme) {
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
                  Icons.check_circle_outline_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Image Ready',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      _estimatedVolume != null 
                          ? 'Portion: ${_selectedPortion ?? "Custom"} (${_estimatedVolume!.toStringAsFixed(1)} oz)'
                          : 'Ready to analyze your food for nutrition info',
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.read(selectedImageProvider.notifier).state = null;
                    setState(() {
                      _estimatedVolume = null;
                      _selectedPortion = null;
                    });
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retake'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.md,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AnalysisScreen(
                          imageFile: File(imageState.path),
                          initialDateTime: DateTime.now(),
                          estimatedVolume: _estimatedVolume,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.analytics_rounded),
                  label: const Text('Analyze Food'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.md,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildStandardCameraInterface(BuildContext context, WidgetRef ref, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          _buildPortionEstimationToggle(colorScheme),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCameraHero(colorScheme),
                const SizedBox(height: AppSpacing.xl),
                _buildCameraInstructions(context, colorScheme),
              ],
            ),
          ),
          _buildCameraActions(context, ref, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildCameraHero(ColorScheme colorScheme) {
    return Container(
      width: 200,
      height: 200,
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
          color: colorScheme.primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.camera_alt_rounded,
            size: 80,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
  
  Widget _buildCameraInstructions(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          'Capture Your Meal',
          style: AppTextStyles.displayMedium.copyWith(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.5),
            borderRadius: AppRadius.extraLarge,
          ),
          child: Text(
            _isARMode ? 'Portion estimation for better accuracy' : 'AI-powered nutrition analysis',
            style: AppTextStyles.labelLarge.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            _isARMode 
                ? 'Use the portion guide to estimate food portions accurately'
                : 'Take a clear photo of your food for instant nutrition analysis',
            style: AppTextStyles.bodyLarge.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
  
  Widget _buildCameraActions(BuildContext context, WidgetRef ref, ColorScheme colorScheme) {
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
        children: [
          if (Theme.of(context).platform != TargetPlatform.linux) ...[
            _buildActionButton(
              context,
              'Take Photo',
              'Use your camera to capture food',
              Icons.camera_alt_rounded,
              colorScheme.primary,
              () => _pickImage(ref, ImageSource.camera, context),
              true,
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          _buildActionButton(
            context,
            Theme.of(context).platform == TargetPlatform.linux ? 'Choose Photo' : 'Choose from Gallery',
            'Select an existing photo',
            Icons.photo_library_rounded,
            colorScheme.secondary,
            () => _pickImage(ref, ImageSource.gallery, context),
            false,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildActionButton(
            context,
            'Type Description',
            'Describe your food in text',
            Icons.edit_rounded,
            colorScheme.tertiary,
            () => context.push('/text-entry'),
            false,
          ),
          if (Theme.of(context).platform == TargetPlatform.linux) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: AppRadius.small,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 16,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Desktop mode: Camera and portion estimation features are not available',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildActionButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onPressed,
    bool isPrimary,
  ) {
    return SizedBox(
      width: double.infinity,
      child: isPrimary
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(AppSpacing.lg),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.large,
                ),
              ),
              child: _buildButtonContent(title, subtitle, icon),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color.withOpacity(0.1),
                foregroundColor: color,
                elevation: 0,
                padding: const EdgeInsets.all(AppSpacing.lg),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.large,
                  side: BorderSide(
                    color: color.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              child: _buildButtonContent(title, subtitle, icon),
            ),
    );
  }
  
  Widget _buildButtonContent(String title, String subtitle, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.labelLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.white.withOpacity(0.7),
        ),
      ],
    );
  }
  
  Future<void> _pickImage(WidgetRef ref, ImageSource source, BuildContext context) async {
    final colorScheme = Theme.of(context).colorScheme;
    
    try {
      final picker = ImagePicker();
      
      final actualSource = Theme.of(context).platform == TargetPlatform.linux && 
                          source == ImageSource.camera 
                          ? ImageSource.gallery 
                          : source;
      
      final pickedFile = await picker.pickImage(
        source: actualSource,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      
      if (pickedFile != null) {
        ref.read(selectedImageProvider.notifier).state = pickedFile;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    source == ImageSource.camera 
                        ? 'Camera not available on this platform. Please choose from gallery.'
                        : 'Could not access gallery. Please try again.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.warning,
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
}