import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:flutter/widgets.dart';

class Orc extends SimpleEnemy with PathFinding, UseLifeBar {
  final List<Vector2> path;
  Orc({
    required super.position,
    required this.path,
  }) : super(
          size: Vector2.all(32),
          speed: 30,
          animation: CharacterSpritesheet(fileName: 'orc.png').getAnimation(),
        ) {
    setupPathFinding(
      linePathEnabled: false,
    );
    setupLifeBar(
      barLifeDrawPosition: BarLifeDrawPorition.bottom,
      showLifeText: false,
      borderRadius: BorderRadius.circular(20),
      size: Vector2(16, 4),
      offset: Vector2(0, -2.5),
    );
    movementOnlyVisible = false;
  }

  @override
  void onMount() {
    moveAlongThePath(path);
    super.onMount();
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2.all(16),
        isSolid: true,
        position: size / 4,
      ),
    );
    return super.onLoad();
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    animation?.playOnceOther(
      'hurt-${lastDirection.name}',
      runToTheEnd: true,
    );
    super.receiveDamage(attacker, damage, identify);
  }
}
