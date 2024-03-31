import 'dart:ui' as ui;

import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/pages/game/game.dart';
import 'package:bonfire_defense/util/end_drag_in_tile.dart';
import 'package:flutter/material.dart';

abstract class Defender extends SimpleAlly with DragGesture, EndDragInTile {
  final int visionTile;
  bool _showVision = true;
  late Paint drawVisionPaint;
  final Color colorVision;
  Defender({
    required super.position,
    required super.size,
    required this.visionTile,
    this.colorVision = Colors.cyan,
    super.animation,
    super.initDirection,
  }) {
    drawVisionPaint = Paint()
      ..shader = ui.Gradient.radial(
        (size / 2).toOffset(),
        radiusVision,
        [
          Colors.transparent,
          colorVision.withOpacity(0.4),
        ],
      );
  }

  double get radiusVision => BonfireDefense.tileSize * (visionTile + 0.5);

  void showRadiusVision(bool show) {
    _showVision = show;
    if (!show) {
      enableDrag = false;
    }
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
}
