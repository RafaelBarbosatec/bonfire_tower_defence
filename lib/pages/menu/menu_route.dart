import 'package:bonfire_defense/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';

abstract class MenuRoute {
  static const routeName = '/';

  static Map<String, Widget Function(BuildContext)> build() {
    return {
      routeName: (_) => const MenuPage(),
    };
  }

  static open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }
}
