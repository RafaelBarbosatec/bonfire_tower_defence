import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/orc.dart';
import 'package:bonfire_defense/util/defenders.dart';
import 'package:bonfire_defense/widgets/start_button.dart';

class GameController extends GameComponent {
  final Vector2 enemyIntialPosition;
  final List<Vector2> enemyPath;
  final int maxEnemy;

  int _countEnemy = 0;

  bool _running = false;

  GameController({
    required this.enemyIntialPosition,
    required this.enemyPath,
    this.maxEnemy = 5,
  });

  @override
  void update(double dt) {
    if (_running && _countEnemy < maxEnemy) {
      if (checkInterval('addsEnemy', 4000, dt)) {
        gameRef.add(
          Orc(
            position: Vector2(
              enemyIntialPosition.x - 8,
              enemyIntialPosition.y - 8,
            ),
            path: List.of(enemyPath),
          ),
        );
        _countEnemy++;
      }
    }
    super.update(dt);
  }

  void startStage() {
    _running = true;
    gameRef.overlays.remove(StartButton.overlayName);
    gameRef.query<Defender>().forEach(
      (element) {
        element.showRadiusVision(false);
      },
    );
  }
}
