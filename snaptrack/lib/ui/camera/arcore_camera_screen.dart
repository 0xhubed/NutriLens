import 'dart:io';

import 'package:ar_flutter_plugin_2/ar_flutter_plugin_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../../core/theme/app_theme.dart';
import '../../data/providers/camera_providers.dart';
import '../analysis/analysis_screen.dart';

class ARCoreCameraScreen extends ConsumerStatefulWidget {
  const ARCoreCameraScreen({super.key});

  @override
  ConsumerState<ARCoreCameraScreen> createState() => _ARCoreCameraScreenState();
}

class _ARCoreCameraScreenState extends ConsumerState<ARCoreCameraScreen> {
  ARView? arView;
  bool _isARMode = false;
  double? _estimatedVolume;
  Map<String, ARObject> anchorObjects = {};
  String _selectedReference = 'credit_card';
  bool _hasPlacedReference = false;
  XFile? _capturedImage;
  
  // Reference object dimensions (in meters)
  static const Map<String, Map<String, dynamic>> referenceObjects = {
    'credit_card': {
      'name': 'Credit Card',
      'width': 0.0856,
      'height': 0.0539,
      'depth': 0.001,
      'icon': Icons.credit_card,
    },
    'smartphone': {
      'name': 'Smartphone',
      'width': 0.146,
      'height': 0.071,
      'depth': 0.008,
      'icon': Icons.smartphone,
    },
    'coin': {
      'name': 'Coin',
      'width': 0.024,
      'height': 0.024,
      'depth': 0.002,
      'icon': Icons.monetization_on,
    },
  };
  
  // Simple volume estimation for fallback mode
  final Map<String, double> _commonPortions = {
    'Small (4 oz)': 4.0,
    'Medium (8 oz)': 8.0,
    'Large (12 oz)': 12.0,
    'Extra Large (16 oz)': 16.0,
  };
  
  String? _selectedPortion;

  @override
  void dispose() {
    arView?.dispose();
    super.dispose();
  }

  void _onArViewCreated(ARView view) {
    arView = view;
    arView!.onARViewCreated = () {
      arView!.planeDetectionConfig = PlaneDetectionConfig.horizontalAndVertical;
    };
  }

  void _handleTap(TapDetails details) async {
    if (!_hasPlacedReference && arView != null) {
      final hits = await arView!.hitTest(
        details.localPosition.dx,
        details.localPosition.dy,
      );
      if (hits.isNotEmpty) {
        _addReferenceObject(hits.first);
      }
    } else if (_hasPlacedReference) {
      _showVolumeEstimation();
    }
  }

  void _addReferenceObject(ARHitTestResult hit) async {
    // Remove existing reference objects
    for (final obj in anchorObjects.values) {
      await arView!.removeObject(obj);
    }
    anchorObjects.clear();

    // Get reference object properties
    final refObject = referenceObjects[_selectedReference]!;
    
    // Create reference object
    final arObject = ARObject(
      type: ARObjectType.cube,
      position: hit.worldTransform.translation,
      scale: vector.Vector3(
        refObject['width'] as double,
        refObject['height'] as double,
        refObject['depth'] as double,
      ),
      name: 'reference_$_selectedReference',
    );
    
    // Add object to AR scene
    await arView!.addObject(arObject);
    anchorObjects[arObject.name!] = arObject;
    
    setState(() {
      _hasPlacedReference = true;
    });
    
    // Simulate volume calculation (in real app, would use computer vision)
    _calculateFoodVolume();
  }

  void _calculateFoodVolume() {
    // This is a simplified simulation
    // In a real implementation, you would:
    // 1. Capture the camera frame
    // 2. Use computer vision to detect food boundaries
    // 3. Compare food size to reference object size
    // 4. Calculate estimated volume
    
    setState(() {
      // Simulate different volumes based on reference type
      switch (_selectedReference) {
        case 'credit_card':
          _estimatedVolume = 8.5; // Medium portion
          break;
        case 'smartphone':
          _estimatedVolume = 12.0; // Large portion
          break;
        case 'coin':
          _estimatedVolume = 4.0; // Small portion
          break;
      }
    });
  }

  void _showVolumeEstimation() {
    if (_estimatedVolume != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Estimated volume: ${_estimatedVolume!.toStringAsFixed(1)} oz'),
          backgroundColor: AppColors.primaryGreen,
        ),
      );
    }
  }

  Future<void> _captureWithAR() async {
    if (_estimatedVolume == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please place a reference object first'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // In a real implementation, we would capture the AR view
    // For now, we'll use the regular camera
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (image != null && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AnalysisScreen(
            imageFile: File(image.path),
            initialDateTime: DateTime.now(),
            estimatedVolume: _estimatedVolume,
          ),
        ),
      );
    }
  }

  Widget _buildARView(ColorScheme colorScheme) {
    return Stack(
      children: [
        GestureDetector(
          onTapDown: _handleTap,
          child: ARView(
            onARViewCreated: _onArViewCreated,
          ),
        ),
        _buildAROverlay(colorScheme),
        Positioned(
          bottom: AppSpacing.xxl,
          left: 0,
          right: 0,
          child: Center(
            child: FloatingActionButton.extended(
              onPressed: _captureWithAR,
              label: const Text('Capture with Measurement'),
              icon: const Icon(Icons.camera),
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAROverlay(ColorScheme colorScheme) {
    return Positioned(
      top: AppSpacing.xl,
      left: AppSpacing.md,
      right: AppSpacing.md,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: AppRadius.large,
          border: Border.all(
            color: colorScheme.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.view_in_ar,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'AR Measurement Mode',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              _hasPlacedReference
                  ? 'Reference object placed. Tap to see volume.'
                  : 'Tap to place reference object next to food',
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            if (_estimatedVolume != null) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.2),
                  borderRadius: AppRadius.medium,
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.straighten,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '${_estimatedVolume!.toStringAsFixed(1)} oz',
                      style: AppTextStyles.headlineMedium.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '(${(_estimatedVolume! * 29.5735).toStringAsFixed(0)} ml)',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colorScheme.primary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            Text(
              'Select Reference Object:',
              style: AppTextStyles.labelMedium.copyWith(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: referenceObjects.entries.map((entry) {
                final isSelected = _selectedReference == entry.key;
                return ActionChip(
                  avatar: Icon(
                    entry.value['icon'] as IconData,
                    size: 18,
                    color: isSelected ? colorScheme.primary : Colors.white70,
                  ),
                  label: Text(entry.value['name'] as String),
                  onPressed: () {
                    setState(() {
                      _selectedReference = entry.key;
                      _hasPlacedReference = false;
                      _estimatedVolume = null;
                    });
                  },
                  backgroundColor: isSelected
                      ? colorScheme.primary.withOpacity(0.3)
                      : colorScheme.surfaceVariant.withOpacity(0.3),
                  labelStyle: AppTextStyles.labelSmall.copyWith(
                    color: isSelected ? colorScheme.primary : Colors.white,
                  ),
                  side: BorderSide(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline.withOpacity(0.3),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStandardCamera(ColorScheme colorScheme) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 100,
              color: colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Standard Camera Mode',
              style: AppTextStyles.headlineMedium.copyWith(
                color: Colors.white,
              ),
            ),
            if (_selectedPortion != null) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.2),
                  borderRadius: AppRadius.medium,
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.5),
                  ),
                ),
                child: Text(
                  'Selected: $_selectedPortion',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
              onPressed: _captureStandardImage,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Take Photo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.md,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _captureStandardImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (image != null && mounted) {
      // Use selected portion volume or null
      final volume = _selectedPortion != null
          ? _commonPortions[_selectedPortion]
          : null;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AnalysisScreen(
            imageFile: File(image.path),
            initialDateTime: DateTime.now(),
            estimatedVolume: volume,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(
          _isARMode ? 'AR Portion Estimation' : 'Capture Food',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Mode Toggle
            Container(
              margin: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: AppRadius.medium,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildModeButton(
                      'Standard',
                      Icons.camera_alt,
                      !_isARMode,
                      () => setState(() => _isARMode = false),
                      colorScheme,
                    ),
                  ),
                  Expanded(
                    child: _buildModeButton(
                      'AR Measure',
                      Icons.view_in_ar,
                      _isARMode,
                      () => setState(() => _isARMode = true),
                      colorScheme,
                    ),
                  ),
                ],
              ),
            ),
            
            // Camera View
            Expanded(
              child: _isARMode
                  ? _buildARView(colorScheme)
                  : _buildStandardCamera(colorScheme),
            ),
            
            // Portion Selection (Standard Mode Only)
            if (!_isARMode) ...[
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                color: colorScheme.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Portion Size (Optional)',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: _commonPortions.keys.map((portion) {
                        final isSelected = _selectedPortion == portion;
                        return ChoiceChip(
                          label: Text(portion),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedPortion = selected ? portion : null;
                            });
                          },
                          selectedColor: colorScheme.primary.withOpacity(0.2),
                          labelStyle: AppTextStyles.bodyMedium.copyWith(
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildModeButton(
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
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: AppRadius.medium,
          border: isSelected
              ? Border.all(color: colorScheme.primary, width: 2)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}