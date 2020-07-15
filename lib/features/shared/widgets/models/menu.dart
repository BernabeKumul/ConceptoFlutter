import 'package:flutter/material.dart';

class Menu {
  String title;
  IconData icon;

  Menu({this.title, this.icon});
}

List<Menu> menuItems = [
  Menu(title: 'Inicio', icon: Icons.dashboard),
  Menu(title: 'Usuarios', icon: Icons.notification_important),
  Menu(title: 'Productos', icon: Icons.web),
  Menu(title: 'Productos 2', icon: Icons.add_comment),
  Menu(title: 'Productos 3', icon: Icons.add_to_photos)
];
