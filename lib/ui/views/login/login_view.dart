import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/widgets.dart';
import '../../ui.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    ImageRoutes.blurTopLogin,
                    width: Get.width * 0.8,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    ImageRoutes.blurBottomLogin,
                    width: Get.width,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: Get.height / 2 - (Get.width * 0.4) / 2,
                  child: Image.asset(
                    ImageRoutes.blurLeftLogin,
                    width: Get.width * 0.4,
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        const Spacer(flex: 7),
                        const SizedBox(height: 20),
                        Image.asset(
                          ImageRoutes.logo,
                          width: 200,
                        ),
                        const SizedBox(height: 20),
                        const Spacer(flex: 2),
                        Text(
                          'LOG IN',
                          style: TextStyle(
                            color: Palette.black.withOpacity(0.85),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 20),
                        EmailInput(
                          textEditingController: viewModel.emailController,
                        ),
                        const SizedBox(height: 30),
                        PasswordInput(
                          textEditingController: viewModel.passwordController,
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          buttonText: 'LOG IN',
                          isLoading: viewModel.isLoading,
                          onPressed: viewModel.login,
                        ),
                        const SizedBox(height: 20),
                        const Spacer(flex: 7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
