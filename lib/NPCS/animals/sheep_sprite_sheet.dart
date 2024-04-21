import 'package:bonfire/bonfire.dart';

class SheepSpriteSheet {
  //Idle Moviment
  static Future<SpriteAnimation> get sheepIdleLeft => SpriteAnimation.load(
        'sheep_animal.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(96, 96),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get sheepIdleRight => SpriteAnimation.load(
        'sheep_animal.png',
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.8,
            textureSize: Vector2(96, 96),
            texturePosition: Vector2(0, 96)),
      );
}
