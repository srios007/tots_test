import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/ui.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
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
                  top: Get.height / 4 - (Get.width * 0.4) / 2,
                  child: Image.asset(
                    ImageRoutes.blurRightHome,
                    width: Get.width * 0.7,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Center(
                        child: Image.asset(
                          ImageRoutes.logo,
                          height: 45,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'CLIENTS',
                        style: TextStyle(
                          color: Palette.greySubtitle,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
