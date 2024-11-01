import 'package:get/get.dart';

import '../common/common.dart';

class CustomSnackBars {
  factory CustomSnackBars() {
    return _instance;
  }

  CustomSnackBars._internal();
  static final CustomSnackBars _instance = CustomSnackBars._internal();
  static showSuccessSnackBar({required String message}) => Get.showSnackbar(
        GetSnackBar(
          title: '¡Listo!',
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Palette.mainColor,
        ),
      );
  static showErrorSnackBar({required String message}) => Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: message,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        ),
      );
  static showNotificationSnackBar({required String message}) =>
      Get.showSnackbar(
        GetSnackBar(
          message: message,
          duration: const Duration(seconds: 3),
        ),
      );
}
