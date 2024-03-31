import 'package:bonfire/bonfire.dart';

class CharacterSpritesheet {
  final String path;
  static const _size = 32.0;

  CharacterSpritesheet({
    required String fileName,
  }) : path = 'character/$fileName';

  SimpleDirectionAnimation getAnimation() {
    return SimpleDirectionAnimation(
      idleRight: _getIdleRight,
      idleDown: _getIdleDown,
      runRight: _getRunRight,
      runUp: _getRunUp,
      runDown: _getRunDown,
      others: {
        ..._getRangeAttack(),
        ..._getMeeleAttack(),
        ..._getHurt(),
      },
    );
  }

  Map<String, Future<SpriteAnimation>> _getHurt() {
    final hurt = _getAnimations(count: 3, startXPosition: 20, stepTime: 0.1);
    Map<String, Future<SpriteAnimation>> animation = {};
    for (var direction in Direction.values) {
      animation['hurt-${direction.name}'] = hurt[direction]!;
    }
    return animation;
  }

  Map<String, Future<SpriteAnimation>> _getRangeAttack() {
    final range = _getAnimations(count: 4, startXPosition: 8);
    Map<String, Future<SpriteAnimation>> animation = {};
    for (var direction in Direction.values) {
      animation['attack-range-${direction.name}'] = range[direction]!;
    }
    return animation;
  }

  Map<String, Future<SpriteAnimation>> _getMeeleAttack() {
    final meele = _getAnimations(count: 4, startXPosition: 4);
    Map<String, Future<SpriteAnimation>> animation = {};
    for (var direction in Direction.values) {
      animation['attack-meele-${direction.name}'] = meele[direction]!;
    }
    return animation;
  }

  Future<SpriteAnimation> get _getIdleRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(0, 2 * _size),
        ),
      );

  Future<SpriteAnimation> get _getIdleDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get _getRunRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(_size, 2 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRunUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(_size, 4 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRunDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(_size, 0),
        ),
      );

  Map<Direction, Future<SpriteAnimation>> _getAnimations({
    required int startXPosition,
    required int count,
    double stepTime = 0.2,
  }) {
    Map<Direction, Future<SpriteAnimation>> map = {};
    Vector2 textureSize = Vector2.all(_size);
    double xPosition = startXPosition * textureSize.x;
    double yPosition = 0;

    List.generate(8, (index) {
      yPosition = index * textureSize.y;
      map[_getDirectionByIndex(index)] = SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: count,
          stepTime: stepTime,
          textureSize: textureSize,
          texturePosition: Vector2(xPosition, yPosition),
        ),
      );
    });
    return map;
  }

  Direction _getDirectionByIndex(int index) {
    switch (index) {
      case 0:
        return Direction.down;
      case 1:
        return Direction.downRight;
      case 2:
        return Direction.right;
      case 3:
        return Direction.upRight;
      case 4:
        return Direction.up;
      case 5:
        return Direction.upLeft;
      case 6:
        return Direction.left;
      case 7:
        return Direction.downLeft;
      default:
        return Direction.down;
    }
  }
}
