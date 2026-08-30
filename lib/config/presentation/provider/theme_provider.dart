import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class ThemeNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() => state = !state;
}

final themeProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);

//final themeProvider = StateProvider((theme) => false);

final colorListProvider = Provider((color) => colorList);

class ColorNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void change(int newColor) => state = newColor;
}

final selectedColorProvider = NotifierProvider<ColorNotifier, int>(
  ColorNotifier.new,
);
