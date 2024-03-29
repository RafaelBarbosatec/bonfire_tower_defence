
import 'package:bonfire_defense/pages/stages/stages_page.dart';
import 'package:flutter/material.dart';

abstract class StagesRoute {
  static const routeName = '/stages';

  static Map<String, Widget Function(BuildContext)> build() {
    return {
      routeName: (_) => const StagesPage(),
    };
  }

  static open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }
}
