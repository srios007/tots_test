import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/widgets/widgets.dart';

import '../../ui.dart';
import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  const AuthBackgroundImages(),
                  _buildForm(context, viewModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(),
    );
  }

  Widget _buildForm(BuildContext context, RegisterViewModel viewModel) {
    return SizedBox(
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
              'REGISTER',
              style: TextStyle(
                color: Palette.black.withOpacity(0.85),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 20),
            NormalInput(
              textEditingController: viewModel.nameController,
              titleText: 'Name',
              width: Get.width - 100,
            ),
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
              buttonText: 'REGISTER',
              isLoading: viewModel.isLoading,
              onPressed: () => viewModel.register(context),
            ),
            const SizedBox(height: 20),
                        TextButton(
              onPressed: () => viewModel.navigateToLogin(),
              child: const Text(
                "Already have an account? Log in",
                style: TextStyle(color: Palette.greySearch),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
