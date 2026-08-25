import 'package:flutter/material.dart';
// import 'package:widgets_app/config/presentation/buttons/buttons.dart';
// import 'package:widgets_app/config/presentation/cards/cards.dart';
//import 'package:widgets_app/config/presentation/screen/home/home.dart';
import 'package:widgets_app/config/router/app_router.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).getTheme(),
      //home: HomeScreen(),
      // routes: {
      //   '/buttons': (context) => ButtonsScreen(),
      //   '/cards': (context) => CardsScreen(),
      // },
    );
  }
}
