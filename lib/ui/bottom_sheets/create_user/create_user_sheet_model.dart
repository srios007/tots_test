import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/ui.dart';

import '../../../services/services.dart';
import '../../../widgets/widgets.dart';

class CreateUserSheetModel extends BaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final imagePicker = ImagePicker();

  final key = GlobalKey<FormState>();
  File? profilePicture;
  bool hasProfilePiture = false;
  bool isLoadingProfilePicture = false;
  RxBool isLoading = false.obs;
  saveUser() {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      UserService().createUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        address: addressController.text,
      );
      isLoading.value = false;
    }
  }

  pickImage(BuildContext context) {
    ImagePick().showBottomSheet(
      context: context,
      fromPhoto: () => pickPicture(isCamera: true),
      fromGallery: () => pickPicture(),
    );
  }

  /// Escoge una imagen de la galería o la cámara
  pickPicture({bool isCamera = false}) async {
    try {
      isLoadingProfilePicture = true;
      rebuildUi();
      final result = await imagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (result != null) {
        profilePicture = File(result.path);
        hasProfilePiture = true;
      }
      isLoadingProfilePicture = false;
      rebuildUi();
    } catch (e) {
      log('Error: $e');
      CustomSnackBars.showErrorSnackBar(
        message: 'There was an unexpected error',
      );
      isLoadingProfilePicture = false;
    }
  }
}
