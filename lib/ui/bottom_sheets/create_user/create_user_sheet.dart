import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

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
      height: Get.height * 0.8,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          verticalSpaceLarge,
          // Añade más contenido aquí
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
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
