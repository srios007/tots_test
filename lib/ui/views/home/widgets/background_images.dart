import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tots_test/ui/ui.dart';

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            ImageRoutes.blurTopHome,
            width: Get.width * 0.8,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            ImageRoutes.blurBottomLeftHome,
            width: Get.width * 0.5,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            ImageRoutes.blurBottomRightHome,
            width: Get.width * 0.5,
          ),
        ),
        Positioned(
          right: 0,
          top: Get.height / 3 - (Get.width * 0.4) / 2,
          child: Image.asset(
            ImageRoutes.blurRightHome,
            width: Get.width * 0.7,
          ),
        ),
      ],
    );
  }
}
