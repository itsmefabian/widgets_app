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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Invalid theme');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
  );

  AppTheme copyWith({bool? isDarkMode, int? selectedColor}) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode,
    selectedColor: selectedColor ?? this.selectedColor,
  );
}
