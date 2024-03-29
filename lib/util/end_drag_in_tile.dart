import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/pages/game/game.dart';

mixin EndDragInTile on DragGesture {
  @override
  void onEndDrag(GestureEvent event) {
    Vector2 tilePosition = (event.worldPosition / BonfireDefense.tileSize)
      ..floor();
    position = (tilePosition * BonfireDefense.tileSize) - Vector2.all(8);
    super.onEndDrag(event);
  }
}
