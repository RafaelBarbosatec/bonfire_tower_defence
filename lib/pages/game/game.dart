import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/end_game_sensor.dart';
import 'package:bonfire_defense/components/game_controller.dart';
import 'package:bonfire_defense/util/stage_config.dart';
import 'package:bonfire_defense/widgets/start_button.dart';
import 'package:flutter/material.dart';

class BonfireDefense extends StatefulWidget {
  static const tileSize = 16.0;
  final StageConfig config;
  const BonfireDefense({
    super.key,
    required this.config,
  });

  @override
  State<BonfireDefense> createState() => _BonfireDefenseState();
}

class _BonfireDefenseState extends State<BonfireDefense> {
  late GameController controller;

  @override
  void initState() {
    controller = GameController(config: widget.config);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset(widget.config.tiledMapPath),
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
