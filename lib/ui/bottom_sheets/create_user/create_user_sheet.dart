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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: Get.width,
        height: Get.height * 0.8,
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: viewModel.key,
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
                        onTap: () {
                          viewModel.pickImage(context);
                        },
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: viewModel.profilePicture != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(viewModel.profilePicture!,
                                      fit: BoxFit.cover),
                                )
                              : Image.asset(ImageRoutes.uploadImage),
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
                    EmailInput(
                      titleText: 'Email address*',
                      textEditingController: viewModel.emailController,
                      width: Get.width - 50,
                    ),
                    const SizedBox(height: 13),
                    NormalInput(
                      titleText: 'Address*',
                      textEditingController: viewModel.addressController,
                    ),
                    const SizedBox(height: 20),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.35,
                          child: TextButton(
                            onPressed: Get.back,
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Palette.black.withOpacity(0.4),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          width: Get.width * 0.5,
                          buttonText: 'SAVE',
                          isLoading: viewModel.isLoading,
                          onPressed: () => viewModel.saveUser(context),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreateUserSheetModel viewModelBuilder(BuildContext context) =>
      CreateUserSheetModel();
}
