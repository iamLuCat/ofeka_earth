import 'package:bonfire/bonfire.dart';

class CowSpriteSheet {
//Idle Moviment
  static Future<SpriteAnimation> get cowIdleLeft => SpriteAnimation.load(
        'cow.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(96, 96),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get cowIdleRight => SpriteAnimation.load(
        'cow.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(96, 96),
            texturePosition: Vector2(0, 96)),
      );
}
