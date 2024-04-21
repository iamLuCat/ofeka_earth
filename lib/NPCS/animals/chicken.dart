import 'dart:ui';

import 'package:angola_sustentavel/NPCS/animals/chicken_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';

const double captan_chicken = 25;

class CapitanChicken extends SimpleEnemy with ObjectCollision {
  CapitanChicken(Vector2 position)
      : super(
            position: position,
            height: captan_chicken,
            width: captan_chicken,
            animation: SimpleDirectionAnimation(
                idleLeft: ChickenSpriteSheet.chickenIdleLeft,
                idleRight: ChickenSpriteSheet.chickenIdleRight,
                runRight: ChickenSpriteSheet.chickenIdleLeft,
                runLeft: ChickenSpriteSheet.chickenIdleRight)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(15, 15),
            align: Vector2(6, 5),
          ),
        ],
      ),
    );
  }
}

class CapitanChickenLeft extends SimpleEnemy with ObjectCollision {
  CapitanChickenLeft(Vector2 position)
      : super(
            position: position,
            height: captan_chicken,
            width: captan_chicken,
            animation: SimpleDirectionAnimation(
                idleLeft: ChickenSpriteSheet.chickenIdleRight,
                idleRight: ChickenSpriteSheet.chickenIdleLeft,
                runRight: ChickenSpriteSheet.chickenIdleLeft,
                runLeft: ChickenSpriteSheet.chickenIdleRight)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(15, 15),
            align: Vector2(6, 5),
          ),
        ],
      ),
    );
  }
}
