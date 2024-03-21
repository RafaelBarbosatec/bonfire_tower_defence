import 'package:bonfire_defense/components/game_controller.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  static String overlayName = 'startButton';
  final GameController controller;
  const StartButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            controller.startStage();
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
