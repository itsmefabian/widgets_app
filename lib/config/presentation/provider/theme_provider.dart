import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// class ThemeNotifier extends Notifier<bool> {
//   @override
//   bool build() {
//     return false;
//   }

//   void toggle() => state = !state;
// }

// final themeProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);

//final themeProvider = StateProvider((theme) => false);

final colorListProvider = Provider((color) => colorList);

// class ColorNotifier extends Notifier<int> {
//   @override
//   int build() {
//     return 0;
//   }

//   void change(int newColor) => state = newColor;
// }

// final selectedColorProvider = NotifierProvider<ColorNotifier, int>(
//   ColorNotifier.new,
// );

// final themeNotifierProvide = StateNotifierProvider<ThemeController, AppTheme>(
//   (ref) => ThemeController(),
// );

final themeNotifierProvider = NotifierProvider<ThemeController, AppTheme>(
  ThemeController.new,
);

class ThemeController extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return AppTheme();
  }

  void toggle() => state = state.copyWith(isDarkMode: !state.isDarkMode);
  void change(int newColor) => state = state.copyWith(selectedColor: newColor);
}

// class ThemeController extends StateNotifier<AppTheme>{
//   new(super.state);

// }
