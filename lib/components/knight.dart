import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:bonfire_defense/util/defender.dart';
import 'package:flutter/material.dart';

class Knight extends Defender {
  Knight({required super.position})
      : super(
          size: Vector2.all(32),
          animation: CharacterSpritesheet(
            fileName: 'human-soldier-red.png',
          ).getAnimation(),
          initDirection: Direction.down,
          visionTile: 1,
          colorVision: Colors.red,
        );

  @override
  void update(double dt) {
    seeComponentType<Enemy>(
      observed: (enemies) {
        if (checkInterval('attack', 1500, dt)) {
          _executeAttack(enemies);
        }
      },
      radiusVision: radiusVision,
    );

    super.update(dt);
  }

  void _executeAttack(List<Enemy> enemies) {
    final enemyDirection = getComponentDirectionFromMe(enemies.first);
    animation?.playOnceOther(
      'attack-meele-${enemyDirection.name}',
      onFinish: () => _executeDamage(enemies),
    );
  }

  void _executeDamage(List<Enemy> enemies) {
    for (var enemy in enemies) {
      enemy.receiveDamage(
        AttackFromEnum.PLAYER_OR_ALLY,
        30,
        null,
      );
    }
  }
}
