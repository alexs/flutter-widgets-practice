import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Many buttons on flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'An container stylized',
    link: '/cards',
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Progess indicator examples',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Snack bar examples',
    link: '/snackbar',
    icon: Icons.message_rounded
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Widget animated example',
    link: '/animated',
    icon: Icons.check_box_rounded
  ),
   MenuItem(
    title: 'UI Controls Examples plus tiles',
    subTitle: 'Some examples of controls widgets flutter',
    link: '/ui-controls',
    icon: Icons.card_travel_outlined
  ),
  MenuItem(
    title: 'App Intro tutorial',
    subTitle: 'An example intro tutorial',
    link: '/tutorial',
    icon: Icons.accessibility_new_outlined
  ),
];

