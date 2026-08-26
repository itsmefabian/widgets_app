import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const new({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI controls')),
      body: _UIControlsView(),
    );
  }
}

enum Transportation { car, plane, boat }

extension TransportationExtension on Transportation {
  String get title {
    switch (this) {
      case Transportation.car:
        return 'Car';
      case Transportation.plane:
        return 'Plane';
      case Transportation.boat:
        return 'Boat';
    }
  }
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = false;
  bool wantsBreak = false;
  bool wantsWork = false;

  Transportation transportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer mode'),
          subtitle: const Text('Advanced mode'),
          onChanged: (value) => setState(() => isDeveloper = value),
        ),

        ExpansionTile(
          title: const Text('Transport media type'),
          subtitle: Text(transportation.title),
          children: [
            RadioGroup<Transportation>(
              groupValue: transportation,
              onChanged: (value) => setState(() {
                transportation = value!;
              }),
              child: Column(
                children: Transportation.values.map((item) {
                  return RadioListTile<Transportation>(
                    value: item,
                    title: Text(item.title),
                  );
                }).toList(),
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Take a break'),
          value: wantsBreak,
          onChanged: (value) => setState(() => wantsBreak = value!),
        ),
        CheckboxListTile(
          title: const Text('Return to work'),
          value: wantsWork,
          onChanged: (value) => setState(() => wantsWork = value!),
        ),
      ],
    );
  }
}
