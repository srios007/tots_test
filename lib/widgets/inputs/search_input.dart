import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';
import '../../ui/common/text_styles.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 40,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        onFieldSubmitted: onChanged,
        decoration: InputDecoration(
          border: Styles().borderTextField,
          disabledBorder: Styles().borderTextField,
          enabledBorder: Styles().borderTextField,
          errorBorder: Styles().errorBorderTextField,
          errorStyle: Styles().errorStyle,
          focusedBorder: Styles().borderTextField,
          focusedErrorBorder: Styles().errorBorderTextField,
          hintText: 'Search here',
          suffixIcon: const Icon(Icons.search, color: Palette.black),
          suffixIconColor: Palette.black,
        ),
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
