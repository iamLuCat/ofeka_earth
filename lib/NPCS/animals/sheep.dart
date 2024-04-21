import 'dart:ui';

import 'package:angola_sustentavel/NPCS/animals/sheep_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';

const double sheep_size = 40;

class SheepAnimal extends SimpleEnemy with ObjectCollision {
  SheepAnimal(Vector2 position)
      : super(
          position: position,
          height: sheep_size,
          width: sheep_size,
          animation: SimpleDirectionAnimation(
              idleLeft: SheepSpriteSheet.sheepIdleLeft,
              idleRight: SheepSpriteSheet.sheepIdleRight,
              runRight: SheepSpriteSheet.sheepIdleLeft,
              runLeft: SheepSpriteSheet.sheepIdleRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(20, 20),
            align: Vector2(6, 12),
          ),
        ],
      ),
    );
  }
}

class SheepAnimalLeft extends SimpleEnemy with ObjectCollision {
  SheepAnimalLeft(Vector2 position)
      : super(
          position: position,
          height: sheep_size,
          width: sheep_size,
          animation: SimpleDirectionAnimation(
              idleLeft: SheepSpriteSheet.sheepIdleRight,
              idleRight: SheepSpriteSheet.sheepIdleLeft,
              runRight: SheepSpriteSheet.sheepIdleLeft,
              runLeft: SheepSpriteSheet.sheepIdleRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(20, 20),
            align: Vector2(6, 12),
          ),
        ],
      ),
    );
  }
}
