import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/widgets.dart';

class CreateUserSheetModel extends BaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final key = GlobalKey<FormState>();

  saveUser() {
    if (key.currentState!.validate()) {
      // Save user
    }
  }

  pickImage(BuildContext context) {
    ImagePick().showBottomSheet(
      context: context,
      fromPhoto: () {},
      fromGallery: () {},
      // fromPhoto: () => controller.pickPicture(
      //   isCamera: true,
      //   isEvidence: false,
      // ),
      // fromGallery: () => controller.pickPicture(
      //   isCamera: false,
      //   isEvidence: false,
      // ),
    );
  }
}
