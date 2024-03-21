import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/end_game_sensor.dart';
import 'package:bonfire_defense/components/orc.dart';
import 'package:bonfire_defense/util/defender.dart';
import 'package:bonfire_defense/widgets/start_button.dart';
import 'package:flutter/material.dart';

class GameController extends GameComponent {
  final Vector2 enemyIntialPosition;
  final List<Vector2> enemyPath;
  final int maxEnemy;
  final int countEnemyPermited;

  int _countEnemy = 0;
  bool _running = false;

  GameController({
    required this.enemyIntialPosition,
    required this.enemyPath,
    required this.countEnemyPermited,
    this.maxEnemy = 5,
  });

  @override
  void update(double dt) {
    if (_running) {
      if (_countEnemy < maxEnemy) {
        if (checkInterval('addsEnemy', 4000, dt)) {
          _addsEnemy();
        }
      }

      if (checkInterval('checkEndGame', 1000, dt)) {
        _checkEndGame();
      }
    }

    super.update(dt);
  }

  void startStage() {
    _running = true;
    gameRef.overlays.remove(StartButton.overlayName);
    gameRef.query<Defender>().forEach(
      (element) {
        element.showRadiusVision(false);
      },
    );
  }

  void _addsEnemy() {
    gameRef.add(
      Orc(
        position: Vector2(
          enemyIntialPosition.x - 8,
          enemyIntialPosition.y - 8,
        ),
        path: List.of(enemyPath),
      ),
    );
    _countEnemy++;
  }

  void _checkEndGame() {
    if (maxEnemy == _countEnemy) {
      final enemies = gameRef.query<Enemy>();
      if (enemies.isEmpty) {
        _running = false;
        final gameSensor = gameRef.query<EndGameSensor>().first;
        if (gameSensor.counter > countEnemyPermited) {
          showDialogEndGame('Game over!');
        } else {
          showDialogEndGame('Win!');
        }
      }
    }
  }

  void showDialogEndGame(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }
}
