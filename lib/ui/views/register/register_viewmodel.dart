import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';
import 'package:tots_test/ui/snackbars/custom_snackbars.dart';

import '../../../services/services.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  void navigateToLoginView() {
    _navigationService.replaceWith(Routes.loginView);
  }

  void navigateToLogin() {
    _navigationService.replaceWith(Routes.loginView);
  }

  void register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    FocusScope.of(context).unfocus();
    final response = await _loginService.register(
      email: emailController.text,
      password: passwordController.text,
      firstName: nameController.text,
    );

    isLoading.value = false;

    if (response) {
      CustomSnackBars.showSuccessSnackBar(
        message: 'User registered successfully, please login',
      );
      navigateToLoginView();
    } else {
      CustomSnackBars.showErrorSnackBar(
        message: 'Unable to register, verify your inputs',
      );
    }
  }
}
