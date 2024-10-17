import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/pages/game/game.dart';
import 'package:bonfire_defense/util/defender.dart';

mixin EndDragInTile on DragGesture {
  @override
  void onEndDrag(GestureEvent event) {
    Vector2 tilePosition = (event.worldPosition / BonfireDefense.tileSize)
      ..floor();
    position = (tilePosition * BonfireDefense.tileSize) - Vector2.all(8);
    bool thereIsOtherDefender = gameRef
        .query<Defender>()
        .where((e) => e.rectCollision.overlaps(rectCollision) && e != this)
        .isNotEmpty;
    if (thereIsOtherDefender) {
      if (event.worldPosition.x > x) {
        position.add(Vector2(-BonfireDefense.tileSize, 0));
      } else {
        position.add(Vector2(BonfireDefense.tileSize, 0));
      }
    }
    super.onEndDrag(event);
  }
}
