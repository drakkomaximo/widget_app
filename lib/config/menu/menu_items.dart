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
  MenuItem(
      icon: Icons.refresh_rounded,
      link: '/progress',
      subtitle: 'Generales y controlados',
      title: 'ProgressIndicators'),
  MenuItem(
      icon: Icons.refresh_rounded,
      link: '/snackbars',
      subtitle: 'Indicadores en pantalla',
      title: 'Snackbars y dialogos'),
  MenuItem(
      icon: Icons.check_box_outline_blank_outlined,
      link: '/animated',
      subtitle: 'Stateful widget animado',
      title: 'Animated Container'),
  MenuItem(
      icon: Icons.car_rental_outlined,
      link: '/ui-controls',
      subtitle: 'Una serie de controles de Flutter',
      title: 'UI Controls + Tiles'),
  MenuItem(
      icon: Icons.accessible_rounded,
      link: '/tutorial',
      subtitle: 'Pequeño tutorial introductorio',
      title: 'Introducción a lo aplicación'),
  MenuItem(
      icon: Icons.list_alt_rounded,
      link: '/infinite',
      subtitle: 'Listas infinitas y pull to refresh',
      title: 'InfiniteScroll y Pull'),
];
