import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.textEditingController,
    this.titleText,
    this.width,
  });

  final double? width;
  final String? titleText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width - 100,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Mail',
          labelStyle: TextStyle(
            color: Palette.black,
            fontSize: 16,
          ),
        ),
        controller: textEditingController,
        validator: (String? _) {
          if (textEditingController.text.isEmpty) {
            return 'Please fill in this field';
          } else if (!GetUtils.isEmail(textEditingController.text)) {
            return 'Please enter a valid email address';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
