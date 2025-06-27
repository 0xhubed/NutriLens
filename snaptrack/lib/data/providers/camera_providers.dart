import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// Provider for the selected image
final selectedImageProvider = StateProvider<XFile?>((ref) => null);