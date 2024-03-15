import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/game.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:bonfire_defense/util/defenders.dart';
import 'package:bonfire_defense/util/end_drag_in_tile.dart';
import 'package:flutter/material.dart';

class Archer extends Defender with DragGesture, EndDragInTile {
  bool _showVision = true;
  Paint drawVisionPaint = Paint()..color = Colors.cyan.withOpacity(0.2);

  Archer({required super.position})
      : super(
          size: Vector2.all(32),
          animation: CharacterSpritesheet(
            fileName: 'archer.png',
          ).getAnimation(),
          initDirection: Direction.down,
        );

  @override
  void update(double dt) {
    seeComponentType<Enemy>(
      observed: (enemies) {
        if (checkInterval('attack', 1000, dt)) {
          _executeAttack(enemies.first);
        }
      },
      radiusVision: radiusVision,
    );

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_showVision) {
      canvas.drawCircle(
        (size / 2).toOffset(),
        radiusVision,
        drawVisionPaint,
      );
    }

    super.render(canvas);
  }

  double get radiusVision => BonfireDefense.tileSize * 2.5;

  void _executeAttack(Enemy enemy) {
    final enemyDirection = getComponentDirectionFromMe(enemy);
    animation?.playOnceOther(
      'attack-range-${enemyDirection.name}',
      onStart: () => _executeDamage(enemy),
    );
  }

  void _executeDamage(Enemy enemy) {
    enemy.receiveDamage(
      AttackFromEnum.PLAYER_OR_ALLY,
      30,
      null,
    );
  }

  @override
  void showRadiusVision(bool show) {
    _showVision = show;
  }
}
