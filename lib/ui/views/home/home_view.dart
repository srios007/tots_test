import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/models/user.dart';
import 'package:tots_test/ui/ui.dart';
import '../../../widgets/widgets.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                _buildBackgroundImages(),
                _buildContent(context, viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(),
    );
  }

  Widget _buildBackgroundImages() {
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

  Widget _buildContent(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      width: Get.width,
      height: Get.height - kToolbarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Center(child: Image.asset(ImageRoutes.logo, height: 45)),
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
          _buildSearchAndAddButton(viewModel),
          const SizedBox(height: 20),
          _buildUserList(viewModel),
        ],
      ),
    );
  }

  Widget _buildSearchAndAddButton(HomeViewModel viewModel) {
    return Row(
      children: [
        SearchInput(
          textEditingController: viewModel.searchController,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            height: 29,
            width: Get.width,
            buttonText: 'ADD NEW',
            isLoading: false.obs,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildUserList(HomeViewModel viewModel) {
    return Expanded(
      child: Visibility(
        visible: !viewModel.isLoading,
        replacement: const LoadingWidget(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(viewModel.users.length, (index) {
                final item = viewModel.users[index];
                return _userItem(item);
              }),
              CustomButton(
                width: Get.width - 94,
                buttonText: 'LOAD MORE',
                isLoading: false.obs,
                onPressed: () {},
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userItem(User item) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Palette.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15),
          CachedNetworkImageWidget(imageUrl: item.photo ?? ''),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item.firstname!} ${item.lastname!}',
                style: const TextStyle(
                  color: Palette.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                item.email!,
                style: const TextStyle(
                  color: Palette.greySubtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}