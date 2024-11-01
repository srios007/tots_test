import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.errorWidget,
    this.width = 60,
    this.height = 60,
  });

  final String imageUrl;
  final Widget? errorWidget;
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
        return _buildErrorWidget(context, imageUrl.replaceAll('jpg', 'png'));
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String fallbackUrl) {
    return CachedNetworkImage(
      imageUrl: fallbackUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const LoadingWidget();
      },
      errorWidget: (context, url, error) {
        return errorWidget ?? _defaultErrorWidget();
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
      child: Image.asset('assets/images/default.jpg'),
    );
  }
}
