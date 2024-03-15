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
        'attack-range-down': _getRangeDown,
        'attack-range-downRight': _getRangeDownRight,
        'attack-range-right': _getRangeRight,
        'attack-range-upRight': _getRangeUpRight,
        'attack-range-up': _getRangeUp,
        'attack-range-upLeft': _getRangeUpLeft,
        'attack-range-left': _getRangeLeft,
        'attack-range-downLeft': _getRangeDownLeft,
        'hurt-down': _getHurtDown,
        'hurt-downRight': _getHurtDownRight,
        'hurt-right': _getHurtRight,
        'hurt-upRight': _getHurtUpRight,
        'hurt-up': _getHurtUp,
        'hurt-upLeft': _getHurtUpLeft,
        'hurt-left': _getHurtLeft,
        'hurt-downLeft': _getHurtDownLeft,
      },
    );
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

  Future<SpriteAnimation> get _getRangeDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 0),
        ),
      );

  Future<SpriteAnimation> get _getRangeDownRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 2 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeUpRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 3 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 4 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeUpLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 5 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 6 * _size),
        ),
      );

  Future<SpriteAnimation> get _getRangeDownLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(8 * _size, 7 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 0),
        ),
      );

  Future<SpriteAnimation> get _getHurtDownRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 2 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtUpRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 3 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 4 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtUpLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 5 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 6 * _size),
        ),
      );

  Future<SpriteAnimation> get _getHurtDownLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2.all(_size),
          texturePosition: Vector2(20 * _size, 7 * _size),
        ),
      );
}
