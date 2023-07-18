import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      icon: Icons.smart_button_outlined,
      link: '/buttons',
      subtitle: 'Varios botones en Fluter',
      title: 'Botones'),
  MenuItem(
      icon: Icons.credit_card,
      link: '/cards',
      subtitle: 'Un contenedor estilizado',
      title: 'Tarjetas'),
];
