import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/common/common.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.isLoading,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.fontSize,
    this.color,
    this.colorText,
    this.iconStart,
    this.borderRadius,
    this.borderColor,
    this.fontWeight,
    this.elevation,
  });

  final RxBool isLoading;
  final String buttonText;
  final Widget? icon;
  final bool? iconStart;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Color? colorText;
  final double? borderRadius;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: width ?? Get.width - 100,
        height: height ?? 52,
        child: InkWell(
          onTap: isLoading.value ? () {} : onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Palette.black,
              borderRadius: BorderRadius.circular(borderRadius ?? 34),
              boxShadow: [
                BoxShadow(
                  color: Palette.shadow.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Center(
              child: isLoading.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Palette.white,
                        ),
                      ),
                    )
                  : Text(
                      buttonText,
                      style: TextStyle(
                          color: colorText ?? Palette.white,
                          fontSize: fontSize ?? 14,
                          fontWeight: fontWeight ?? FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
