import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const new({super.key});

  static const String name = 'theme_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: isDarkMode
                ? Icon(Icons.dark_mode_rounded)
                : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return RadioGroup<int>(
      groupValue: selectedColor,
      onChanged: (newColor) =>
          ref.read(themeNotifierProvider.notifier).change(newColor!),
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile(
            title: Text('Current color theme', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
            value: index,
          );
        },
      ),
    );
  }
}
