import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/archer.dart';
import 'package:bonfire_defense/components/end_game_sensor.dart';
import 'package:bonfire_defense/components/game_controller.dart';
import 'package:bonfire_defense/widgets/start_button.dart';
import 'package:flutter/material.dart';

class BonfireDefense extends StatefulWidget {
  static const tileSize = 16.0;
  final Vector2 enemyIntialPosition;
  final List<Vector2> enemyPath;
  final int countEnemyPermited;
  const BonfireDefense({
    super.key,
    required this.enemyIntialPosition,
    required this.enemyPath,
    this.countEnemyPermited = 1,
  });

  @override
  State<BonfireDefense> createState() => _BonfireDefenseState();
}

class _BonfireDefenseState extends State<BonfireDefense> {
  late GameController controller;

  @override
  void initState() {
    controller = GameController(
      enemyIntialPosition: widget.enemyIntialPosition,
      enemyPath: widget.enemyPath,
      countEnemyPermited: widget.countEnemyPermited,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('map/map.tmj'),
        objectsBuilder: {
          'endGame': (properties) {
            return EndGameSensor(
              position: properties.position,
              size: properties.size,
            );
          }
        },
      ),
      backgroundColor: const Color(0xff85a643),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        initialMapZoomFit: InitialMapZoomFitEnum.fitWidth,
      ),
      components: [
        Archer(
          position: Vector2(
            1 * BonfireDefense.tileSize - 8,
            1 * BonfireDefense.tileSize - 8,
          ),
        ),
        Archer(
          position: Vector2(
            1 * BonfireDefense.tileSize + 32,
            1 * BonfireDefense.tileSize - 8,
          ),
        ),
        controller,
      ],
      overlayBuilderMap: {
        StartButton.overlayName: (context, game) => StartButton(
              controller: controller,
            ),
      },
      initialActiveOverlays: [
        StartButton.overlayName,
      ],
    );
  }
}
