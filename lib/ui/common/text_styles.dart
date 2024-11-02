import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tots_test/ui/common/common.dart';

final currencyFormat = NumberFormat.currency(symbol: r'$', decimalDigits: 0);
final requestFormat = NumberFormat.currency(
  symbol: '',
  decimalDigits: 0,
  locale: 'es_ES',
);

class Styles {
  factory Styles() {
    return _instance;
  }

  Styles._internal();
  static final Styles _instance = Styles._internal();

  TextStyle tittleRegister = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
  TextStyle errorStyle = const TextStyle(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );
  TextStyle requiredRegister = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle hintTextStyleRegister = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
  OutlineInputBorder borderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(68)),
    borderSide: BorderSide(color: Palette.black.withOpacity(0.3)),
  );

  OutlineInputBorder errorBorderTextField = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(68)),
    borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
  );
}
