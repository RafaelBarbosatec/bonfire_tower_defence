import 'package:bonfire/bonfire.dart';

class EndGameSensor extends GameDecoration with Sensor {
  int counter = 0;

  EndGameSensor({required super.position, required super.size});
  @override
  void onContact(GameComponent component) {
    if (component is Enemy) {
      counter++;
      component.removeFromParent();
    }
    super.onContact(component);
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(size: size),
    );
    return super.onLoad();
  }
}
