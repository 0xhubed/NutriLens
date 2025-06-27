import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

class ImageUtils {
  static Future<String> fileToBase64(File file) async {
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }
  
  static Uint8List base64ToBytes(String base64String) {
    return base64Decode(base64String);
  }
  
  static Future<File> compressImage(File file, {
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 85,
  }) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    
    if (image == null) return file;
    
    // Resize if needed
    img.Image resized = image;
    if (image.width > maxWidth || image.height > maxHeight) {
      resized = img.copyResize(
        image,
        width: maxWidth,
        height: maxHeight,
        interpolation: img.Interpolation.linear,
      );
    }
    
    // Compress to JPEG
    final compressedBytes = img.encodeJpg(resized, quality: quality);
    
    // Write to temporary file
    final tempFile = File('${file.path}_compressed.jpg');
    await tempFile.writeAsBytes(compressedBytes);
    
    return tempFile;
  }
  
  static double calculateImageSize(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024); // Size in MB
  }
}