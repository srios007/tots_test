import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/widgets/widgets.dart';

import '../../ui.dart';
import 'create_user_sheet_model.dart';

class CreateUserSheet extends StackedView<CreateUserSheetModel> {
  const CreateUserSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateUserSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: Get.width,
      height: Get.height * 0.7,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Add new client',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Palette.blackBottomSheet,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 120,
                child: Image.asset(ImageRoutes.uploadImage),
              ),
            ),
          ),
          const SizedBox(height: 20),
          NormalInput(
            titleText: 'First name*',
            textEditingController: viewModel.firstNameController,
          ),
          const SizedBox(height: 13),
          NormalInput(
            titleText: 'Last name*',
            textEditingController: viewModel.lastNameController,
          ),
          const SizedBox(height: 13),
          NormalInput(
            titleText: 'Email address*',
            textEditingController: viewModel.emailController,
          ),
          const SizedBox(height: 20),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.35,
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Palette.blackBottomSheet,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              CustomButton(
                width: Get.width * 0.5,
                buttonText: 'SAVE',
                isLoading: false.obs,
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  CreateUserSheetModel viewModelBuilder(BuildContext context) =>
      CreateUserSheetModel();
}
