import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/ui/ui.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  void navigateToHomeView() {
    _navigationService.replaceWith(Routes.homeView);
  }

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    FocusScope.of(context).unfocus();
    final response = await _loginService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    isLoading.value = false;

    if (response != null) {
      final box = GetStorage();
      box.write('token', response);
      navigateToHomeView();
    } else {
      CustomSnackBars.showErrorSnackBar(
        message: 'Unable to log in, verify your credentials',
      );
    }
  }
}
