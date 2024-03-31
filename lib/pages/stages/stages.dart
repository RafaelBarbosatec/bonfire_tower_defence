import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/pages/game/game.dart';
import 'package:bonfire_defense/util/stage_config.dart';

enum GameStageEnum { stage1, stage2 }

abstract class GameStages {
  static StageConfig get(GameStageEnum stage) => _stages[stage]!;

  static final Map<GameStageEnum, StageConfig> _stages = {
    GameStageEnum.stage1: StageConfig(
      tiledMapPath: 'map/map.tmj',
      enemies: [
        EnemyType.orc,
        EnemyType.orc,
      ],
      defenders: [
        DefenderType.arch,
      ],
      enemyIntialPosition: Vector2(
        -1 * BonfireDefense.tileSize,
        7 * BonfireDefense.tileSize,
      ),
      enemyPath: [
        Vector2(
          6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          3 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          12 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          3 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          12 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          20 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
      ],
    ),
    GameStageEnum.stage2: StageConfig(
      tiledMapPath: 'map/map2.tmj',
      enemies: [
        EnemyType.orc,
        EnemyType.orc,
        EnemyType.orc,
        EnemyType.orc,
        EnemyType.orc,
      ],
      defenders: [
        DefenderType.arch,
        DefenderType.knight,
      ],
      enemyIntialPosition: Vector2(
        -1 * BonfireDefense.tileSize,
        2 * BonfireDefense.tileSize,
      ),
      enemyPath: [
        Vector2(
          4 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          2 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          4 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          8 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          8 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          5 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          12 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          5 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          12 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          2 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
        Vector2(
          20 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
          2 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        ),
      ],
    ),
  };
}
