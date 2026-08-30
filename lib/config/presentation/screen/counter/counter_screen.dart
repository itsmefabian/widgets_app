import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/presentation/provider/counter_provider.dart';
import 'package:widgets_app/config/presentation/provider/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const new({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: isDarkMode
                ? Icon(Icons.dark_mode_rounded)
                : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Value: $counter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          //ref.read(counterProvider.notifier).state++
          ref.read(counterProvider.notifier).update((current) => current + 1),
        },
      ),
    );
  }
}
