class ImageRoutes {
  factory ImageRoutes() {
    return _instance;
  }

  ImageRoutes._internal();

  static final _instance = ImageRoutes._internal();

  static const String blurBottom = 'assets/images/blur_bottom.png';
  static const String blurLeft = 'assets/images/blur_left.png';
  static const String blurTop = 'assets/images/blur_top.png';
  static const String logo = 'assets/images/logo.png';
}
