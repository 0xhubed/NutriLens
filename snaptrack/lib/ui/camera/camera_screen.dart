import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/providers/camera_providers.dart';
import '../analysis/analysis_screen.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(selectedImageProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageState != null) ...[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(imageState.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ref.read(selectedImageProvider.notifier).state = null;
                      },
                      child: const Text('Retake'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnalysisScreen(
                              imageFile: File(imageState.path),
                            ),
                          ),
                        );
                      },
                      child: const Text('Analyze'),
                    ),
                  ),
                ],
              ),
            ] else ...[
              const Icon(
                Icons.camera_alt_outlined,
                size: 120,
                color: Colors.grey,
              ),
              const SizedBox(height: 32),
              Text(
                'Take a photo of your food',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Get instant nutrition information',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (Theme.of(context).platform != TargetPlatform.linux) ...[
                FilledButton.icon(
                  onPressed: () => _pickImage(ref, ImageSource.camera, context),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take Photo'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              FilledButton.icon(
                onPressed: () => _pickImage(ref, ImageSource.gallery, context),
                icon: const Icon(Icons.photo_library),
                label: Text(Theme.of(context).platform == TargetPlatform.linux 
                    ? 'Choose Photo' 
                    : 'Choose from Gallery'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
              if (Theme.of(context).platform == TargetPlatform.linux) ...[
                const SizedBox(height: 16),
                const Text(
                  'Desktop mode: Use sample food images for testing',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
  
  Future<void> _pickImage(WidgetRef ref, ImageSource source, BuildContext context) async {
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
            content: Text(
              source == ImageSource.camera 
                ? 'Camera not available on this platform. Please choose from gallery.'
                : 'Could not access gallery: $e'
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }
}