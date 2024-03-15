import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/archer.dart';
import 'package:bonfire_defense/components/game_controller.dart';
import 'package:bonfire_defense/widgets/start_button.dart';
import 'package:flutter/material.dart';

class BonfireDefense extends StatefulWidget {
  static const tileSize = 16.0;
  final Vector2 enemyIntialPosition;
  final List<Vector2> enemyPath;
  const BonfireDefense(
      {super.key, required this.enemyIntialPosition, required this.enemyPath});

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
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('map/map.tmj'),
      ),
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
