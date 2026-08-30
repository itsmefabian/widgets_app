import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/presentation/provider/theme_provider.dart';
// import 'package:widgets_app/config/presentation/buttons/buttons.dart';
// import 'package:widgets_app/config/presentation/cards/cards.dart';
//import 'package:widgets_app/config/presentation/screen/home/home.dart';
import 'package:widgets_app/config/router/app_router.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int selectedColor = ref.watch(selectedColorProvider);
    // final bool isDarkMode = ref.watch(themeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: appTheme.getTheme(),
      /**AppTheme(
        selectedColor: selectedColor,
        isDarkMode: isDarkMode,
      ).getTheme() */
      //home: HomeScreen(),
      // routes: {
      //   '/buttons': (context) => ButtonsScreen(),
      //   '/cards': (context) => CardsScreen(),
      // },
    );
  }
}
