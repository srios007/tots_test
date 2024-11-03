import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

class NormalInput extends StatelessWidget {
  const NormalInput({
    super.key,
    required this.titleText,
    required this.textEditingController,
    this.width,
  });

  final double? width;
  final String titleText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width - 50,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: titleText,
          labelStyle: const TextStyle(
            color: Palette.black,
            fontSize: 16,
          ),
        ),
        controller: textEditingController,
        validator: (String? _) {
          if (textEditingController.text.isEmpty) {
            return 'Please fill in this field';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
