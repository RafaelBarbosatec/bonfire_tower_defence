import 'package:bonfire/bonfire.dart';

class StageConfig {
  final String tiledMapPath;
  final List<Vector2> enemyPath;
  final Vector2 enemyIntialPosition;
  final List<EnemyType> enemies;
  final List<DefenderType> defenders;
  final int countEnemyPermited;

  StageConfig({
    required this.tiledMapPath,
    required this.enemyPath,
    required this.enemyIntialPosition,
    required this.enemies,
    required this.defenders,
    this.countEnemyPermited = 1,
  });
}

enum EnemyType { orc }

enum DefenderType { arch, knight }
