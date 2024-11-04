import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tots_test/ui/ui.dart';

class AuthBackgroundImages extends StatelessWidget {
  const AuthBackgroundImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            ImageRoutes.blurTopLogin,
            width: Get.width * 0.8,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            ImageRoutes.blurBottomLogin,
            width: Get.width,
          ),
        ),
        Positioned(
          left: 0,
          top: Get.height / 2 - (Get.width * 0.4) / 2,
          child: Image.asset(
            ImageRoutes.blurLeftLogin,
            width: Get.width * 0.4,
          ),
        ),
      ],
    );
  }
}
