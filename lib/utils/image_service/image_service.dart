import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tots_test/services/services.dart';

class ImageService {
  final ImagePicker imagePicker = ImagePicker();
  bool isLoadingProfilePicture = false;
  File? profilePicture;

  Future<void> pickImage({
    required Function(File) onImagePicked,
    required Function(String) onError,
    bool isCamera = false,
  }) async {
    try {
      isLoadingProfilePicture = true;
      final result = await imagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (result != null) {
        profilePicture = File(result.path);
        onImagePicked(profilePicture!);
      }
      isLoadingProfilePicture = false;
    } catch (e) {
      log('Error: $e');
      onError('There was an unexpected error');
      isLoadingProfilePicture = false;
    }
  }

  Future<String> uploadImage(File image) async {
    final result = await StorageService().uploadFile(image);
    log('Result: $result');
    return result;
  }
}
