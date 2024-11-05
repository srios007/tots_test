import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/user.dart';
import 'package:tots_test/services/user/user_service.dart';
import 'package:tots_test/ui/ui.dart';
import 'package:tots_test/ui/views/home/services/user_edit_service.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class EditUserSheetModel extends BaseViewModel implements Initialisable {
  bool hasProfilePiture = false;
  File? profilePicture;
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final key = GlobalKey<FormState>();
  final lastNameController = TextEditingController();
  RxBool isLoading = false.obs;
  final imageService = ImageService();
  final _userEditService = locator<UserEditService>();
  late User user;
  @override
  void initialise() {
    user = _userEditService.selectedUserNotifier.value!;
    firstNameController.text = user.firstname!;
    lastNameController.text = user.lastname!;
    emailController.text = user.email!;
    addressController.text = user.address!;
  }

  /// Saves the user after validating the form and uploading the profile picture.
  void saveUser(BuildContext context) async {
    if (key.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      isLoading.value = true;
      rebuildUi();
      String imageUrl;
      if (profilePicture != null) {
        imageUrl = await imageService.uploadImage(profilePicture!);
      } else {
        imageUrl = user.photo ?? '';
      }
      final result = await UserService().editUser(
        id: user.id.toString(),
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
