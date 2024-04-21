import 'dart:ui';

import 'package:angola_sustentavel/NPCS/animals/cow_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';

const double cow_size = 64;

class CowAnimal extends SimpleEnemy with ObjectCollision {
  CowAnimal(Vector2 position)
      : super(
          position: position,
          height: cow_size,
          width: cow_size,
          animation: SimpleDirectionAnimation(
              idleLeft: CowSpriteSheet.cowIdleLeft,
              idleRight: CowSpriteSheet.cowIdleRight,
              runRight: CowSpriteSheet.cowIdleRight,
              runLeft: CowSpriteSheet.cowIdleLeft),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(55, 20),
            align: Vector2(6, 20),
          ),
        ],
      ),
    );
  }
}

class CowAnimalLeft extends SimpleEnemy with ObjectCollision {
  CowAnimalLeft(Vector2 position)
      : super(
          position: position,
          height: cow_size,
          width: cow_size,
          animation: SimpleDirectionAnimation(
              idleLeft: CowSpriteSheet.cowIdleRight,
              idleRight: CowSpriteSheet.cowIdleLeft,
              runRight: CowSpriteSheet.cowIdleLeft,
              runLeft: CowSpriteSheet.cowIdleRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(55, 20),
            align: Vector2(6, 20),
          ),
        ],
      ),
    );
  }
}
