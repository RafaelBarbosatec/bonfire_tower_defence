import 'package:bonfire_defense/pages/game/game.dart';
import 'package:bonfire_defense/pages/stages/stages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class GameRoute {
  static const routeName = '/game';

  static Map<String, Widget Function(BuildContext)> build() {
    return {
      routeName: (context) => BonfireDefense(
            config: GameStages.get(
              ModalRoute.of(context)?.settings.arguments as GameStageEnum,
            ),
          ),
    };
  }

  static open(BuildContext context, GameStageEnum stage) {
    Navigator.of(context).pushNamed(routeName, arguments: stage);
  }
}
