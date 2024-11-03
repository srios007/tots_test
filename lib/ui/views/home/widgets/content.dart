import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tots_test/models/user.dart';
import 'package:tots_test/ui/ui.dart';

import '../../../../widgets/widgets.dart';

class Content extends StatelessWidget {
  final HomeViewModel viewModel;

  const Content({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
          onChanged: viewModel.onSearchChanged,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            height: 29,
            width: Get.width,
            buttonText: 'ADD NEW',
            isLoading: false.obs,
            onPressed: () => viewModel.showBottomSheetCreateUser(),
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
}
