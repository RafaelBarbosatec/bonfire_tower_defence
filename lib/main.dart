import 'package:bonfire_defense/pages/game/game_route.dart';
import 'package:bonfire_defense/pages/menu/menu_route.dart';
import 'package:bonfire_defense/pages/stages/stages_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        ...MenuRoute.build(),
        ...StagesRoute.build(),
        ...GameRoute.build(),
      },
    );
  }
}