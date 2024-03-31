import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:bonfire_defense/util/defender.dart';

class Archer extends Defender {
  Archer({required super.position})
      : super(
          size: Vector2.all(32),
          animation: CharacterSpritesheet(
            fileName: 'archer.png',
          ).getAnimation(),
          initDirection: Direction.down,
          visionTile: 2,
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
      15,
      null,
    );
  }
}
