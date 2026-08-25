import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const new({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Button',
    subTitle: 'Flutter buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Custom cards',
    link: '/card',
    icon: Icons.credit_card,
  ),
  //MenuItem(title: '', subTitle: '', link: '', icon: Icons.),
];
