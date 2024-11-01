import 'package:flutter/material.dart';

class Palette {
  factory Palette() {
    return _instance;
  }

  Palette._internal();

  static final _instance = Palette._internal();
  static const primary = Color(0xFFE4F353);
  static const black = Color(0xFF0D1111);
  static const grey = Color(0xFF474A54);
}
