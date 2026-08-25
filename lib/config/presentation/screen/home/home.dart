import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

//import 'package:widgets_app/config/presentation/buttons/buttons.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter widgets')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const new({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: theme.primary),
      trailing: Icon(Icons.arrow_back_ios_rounded, color: theme.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => const ButtonsScreen()));

        //Navigator.pushNamed(context, menuItem.link);
        // context.pushNamed(menuItem.title);
        context.push(menuItem.link);
      },
    );
  }
}
