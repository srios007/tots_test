import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/ui.dart';
import 'package:tots_test/utils/utils.dart';

import '../../../services/services.dart';
import '../../../widgets/widgets.dart';

class CreateUserSheetModel extends BaseViewModel {
  bool hasProfilePiture = false;
  File? profilePicture;
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final key = GlobalKey<FormState>();
  final lastNameController = TextEditingController();
  RxBool isLoading = false.obs;
  bool isEditing = false;
  final imageService = ImageService();

  /// Saves the user after validating the form and uploading the profile picture.
  void saveUser(BuildContext context) async {
    if (key.currentState!.validate()) {
      if (profilePicture == null) {
        CustomSnackBars.showErrorSnackBar(
          message: 'Profile picture is required',
        );
        return;
      }

      FocusScope.of(context).unfocus();
      isLoading.value = true;
      rebuildUi();
      final imageUrl = await imageService.uploadImage(profilePicture!);
      final result = await UserService().createUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        address: addressController.text,
        imageUrl: imageUrl,
      );
      isLoading.value = false;
      rebuildUi();
      if (result) {
        fireEventNewUSer();
        Get.back();
        CustomSnackBars.showSuccessSnackBar(
          message: 'User created successfully',
        );
      } else {
        CustomSnackBars.showErrorSnackBar(
          message: 'There was an unexpected error',
        );
      }
    }
  }

  /// Fires an event indicating that a new user has been created.
  void fireEventNewUSer() => EventBus().fire(MyEvent('new_user'));

  /// Shows a bottom sheet to pick an image from the camera or gallery.
  void pickImage(BuildContext context) {
    ImagePick().showBottomSheet(
      context: context,
      fromPhoto: () => imageService.pickImage(
        onImagePicked: (image) {
          profilePicture = image;
          hasProfilePiture = true;
          rebuildUi();
        },
        onError: (message) {
          CustomSnackBars.showErrorSnackBar(message: message);
        },
        isCamera: true,
      ),
      fromGallery: () => imageService.pickImage(
        onImagePicked: (image) {
          profilePicture = image;
          hasProfilePiture = true;
          rebuildUi();
        },
        onError: (message) {
          CustomSnackBars.showErrorSnackBar(message: message);
        },
      ),
    );
  }
}
