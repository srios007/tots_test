import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ui/ui.dart';
import '../widgets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 60,
    this.height = 60,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const LoadingWidget();
      },
      errorWidget: (context, url, error) {
        return _defaultErrorWidget();
      },
    );
  }

  Widget _defaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palette.black),
        ),
        child: const Icon(Icons.person),
      ),
    );
  }
}
