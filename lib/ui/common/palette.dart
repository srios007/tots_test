import 'package:flutter/material.dart';

class Palette {
  factory Palette() {
    return _instance;
  }

  Palette._internal();

  static final _instance = Palette._internal();
  static const mainColor = Color(0xFFE4F353);
  static const black = Color(0xFF0D1111);
  static const blackTitle = Color(0xFF161B14);
  static const blackBottomSheet = Color(0xFF222222);
  static const grey = Color(0xFFA3AAB1);
  static const greySearch = Color(0xFF76757D);
  static const greySubtitle = Color(0xFF434545);
  static const white = Color(0xFFFFFFFF);
  static const shadow = Color(0x402D2C83);
}
