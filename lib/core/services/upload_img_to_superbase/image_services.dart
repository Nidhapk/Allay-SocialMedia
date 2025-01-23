import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuperbaseServices {
  Future<String?> uploadImageToSupabase(XFile image) async {
    try {
      File file = File(image.path);

      // Choose a bucket for storing images
      final storage = Supabase.instance.client.storage.from('post_images');

      // Upload image to Supabase Storage
      final uploadResponse = await storage.upload(
        '${DateTime.now().millisecondsSinceEpoch}.jpg', // Save image with timestamp or unique name
        file,
        fileOptions: const FileOptions(cacheControl: '3600'),
      );
      log('response${uploadResponse}');

      // Check if the response is not null and proceed
      if (uploadResponse.isEmpty) {
        log('Upload error: Empty response from Supabase');
        return null;
      }
      final data = uploadResponse.split('/')[1];

      // Get public URL of the image
      final publicUrl = storage
          .getPublicUrl(data); // Assuming uploadResponse is a key
      return publicUrl;
    } catch (error) {
      log('Error uploading image: $error');
      return null;
    }
  }
}
