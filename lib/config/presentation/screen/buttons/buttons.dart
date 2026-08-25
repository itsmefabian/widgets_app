import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const new({super.key});

  static const String name = 'button_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('data')),
            ElevatedButton(onPressed: null, child: const Text('data')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_rounded),
              label: Text('Elevated icon'),
            ),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc),
              label: Text('Filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.accessibility_new),
              label: Text('Filled icon'),
            ),
            TextButton(onPressed: () {}, child: Text('Text')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.r_mobiledata),
              label: Text('Text icon'),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.face_2_outlined)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.face_2_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(theme.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: theme.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('data', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
