import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/archer.dart';
import 'package:bonfire_defense/components/end_game_sensor.dart';
import 'package:bonfire_defense/components/orc.dart';
import 'package:bonfire_defense/pages/game/game.dart';
import 'package:bonfire_defense/util/defender.dart';
import 'package:bonfire_defense/util/stage_config.dart';
import 'package:bonfire_defense/widgets/start_button.dart';
import 'package:flutter/material.dart';

class GameController extends GameComponent {
  final StageConfig config;

  int _countEnemy = 0;
  bool _running = false;

  GameController({
    required this.config,
  });

  @override
  void update(double dt) {
    if (_running) {
      if (_countEnemy < config.enemies.length) {
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
    Enemy enemy;
    switch (config.enemies[_countEnemy]) {
      case EnemyType.orc:
        enemy = Orc(
          position: Vector2(
            config.enemyIntialPosition.x - 8,
            config.enemyIntialPosition.y - 8,
          ),
          path: List.of(config.enemyPath),
        );
        break;
    }
    gameRef.add(enemy);
    _countEnemy++;
  }

  void _checkEndGame() {
    if (config.enemies.length == _countEnemy) {
      final enemies = gameRef.query<Enemy>();
      if (enemies.isEmpty) {
        _running = false;
        final gameSensor = gameRef.query<EndGameSensor>().first;
        if (gameSensor.counter > config.countEnemyPermited) {
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

  @override
  void onMount() {
    int count = 1;
    for (var defender in config.defenders) {
      switch (defender) {
        case DefenderType.arch:
          gameRef.add(
            Archer(
              position: Vector2(
                count * 1 * BonfireDefense.tileSize - 8,
                1 * BonfireDefense.tileSize - 8,
              ),
            ),
          );
          break;
      }
      count = count + 3;
    }

    super.onMount();
  }
}
