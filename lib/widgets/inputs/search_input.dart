import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

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
      width: Get.width * 0.5,
      height: 38,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        onFieldSubmitted: onChanged,
        decoration: InputDecoration(
          border: Styles().borderTextFieldSearch,
          disabledBorder: Styles().borderTextFieldSearch,
          enabledBorder: Styles().borderTextFieldSearch,
          errorBorder: Styles().errorBorderTextField,
          errorStyle: Styles().errorStyle,
          focusedBorder: Styles().borderTextFieldSearch,
          focusedErrorBorder: Styles().errorBorderTextField,
          hintText: 'Search...',
          hintStyle: Styles().hintTextStyleRegister,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(IconRoutes.search, width: 20),
          ),
          prefixIconColor: Palette.black,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
