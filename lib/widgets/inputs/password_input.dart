import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    this.titleText,
    required this.textEditingController,
    this.helperText = '',
    this.validator,
    this.color,
    this.hintColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
  });

  final String helperText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? hintColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    final showPassword = false.obs;
    return Obx(
      () => SizedBox(
        width: Get.width - 100,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(
              color: Palette.black,
              fontSize: 16,
            ),
            suffixIcon: GestureDetector(
              onTap: () => showPassword.toggle(),
              child: Icon(
                showPassword.value ? Icons.visibility : Icons.visibility_off,
                color: Palette.grey,
              ),
            ),
          ),
          controller: textEditingController,
          inputFormatters: inputFormatters ?? [],
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: !showPassword.value,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          validator: validator ??
              (String? _) {
                if (textEditingController.text.isEmpty) {
                  return 'Por favor, rellena este campo';
                } else {
                  return null;
                }
              },
        ),
      ),
    );
  }
}
