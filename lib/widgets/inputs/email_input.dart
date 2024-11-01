import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    this.titleText,
    required this.textEditingController,
    this.helperText = '',
    this.border,
    this.textStyle,
    this.width,
  });

  final String? titleText;
  final String helperText;
  final TextEditingController textEditingController;
  final InputBorder? border;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width - 100,
      child: TextFormField(
        style: textStyle,
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
            return 'Por favor, rellena este campo';
          } else if (!GetUtils.isEmail(textEditingController.text)) {
            return 'Por favor, ingresa un email válido';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
