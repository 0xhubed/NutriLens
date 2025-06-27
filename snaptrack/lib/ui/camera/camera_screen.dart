import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_theme.dart';
import '../../data/providers/camera_providers.dart';
import '../analysis/analysis_screen.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(selectedImageProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Capture Food',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: imageState != null 
              ? _buildImagePreview(context, ref, imageState, colorScheme)
              : _buildCameraInterface(context, ref, colorScheme),
        ),
      ),
    );
  }
  
  Widget _buildImagePreview(BuildContext context, WidgetRef ref, XFile imageState, ColorScheme colorScheme) {
    return Column(
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
              child: ClipRRect(
                borderRadius: AppRadius.extraLarge,
                child: Image.file(
                  File(imageState.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildImageActions(context, ref, imageState, colorScheme),
      ],
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
                      'Ready to analyze your food for nutrition info',
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
  
  Widget _buildCameraInterface(BuildContext context, WidgetRef ref, ColorScheme colorScheme) {
    return Column(
      children: [
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
            'AI-powered nutrition analysis',
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
            'Take a clear photo of your food for instant nutrition analysis',
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
                      'Desktop mode: Camera access limited, use gallery instead',
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
      
      // On Linux desktop, camera access is not supported
      // Fall back to gallery only
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