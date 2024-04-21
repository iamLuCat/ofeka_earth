import 'package:bonfire/bonfire.dart';

class ChickenSpriteSheet {
  //Idle Moviment
  static Future<SpriteAnimation> get chickenIdleLeft => SpriteAnimation.load(
        'capitain_chicken.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(90, 90),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get chickenIdleRight => SpriteAnimation.load(
        'capitain_chicken.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(90, 90),
            texturePosition: Vector2(0, 90)),
      );
}
