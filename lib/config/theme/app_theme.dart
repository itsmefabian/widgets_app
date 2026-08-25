import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.yellowAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Invalid theme');

  ThemeData getTheme() => ThemeData(colorSchemeSeed: colorList[selectedColor]);
}
