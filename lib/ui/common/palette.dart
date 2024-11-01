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
  static const grey = Color(0xFFA3AAB1);
  static const greySubtitle = Color(0xFF434545);
  static const white = Color(0xFFFFFFFF);
}
