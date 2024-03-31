import 'package:bonfire_defense/pages/game/game_route.dart';
import 'package:bonfire_defense/pages/stages/stages.dart';
import 'package:flutter/material.dart';

class StagesPage extends StatelessWidget {
  const StagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stages'),
      ),
      backgroundColor: const Color(0xff85a643),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          shrinkWrap: true,
          children: GameStageEnum.values.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => GameRoute.open(context, e),
                  child: Text(e.name),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
