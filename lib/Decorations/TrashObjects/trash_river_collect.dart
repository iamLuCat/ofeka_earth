import 'dart:ui';

import 'package:angola_sustentavel/Decorations/decoration_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';

class TrashCollectables extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones,
          position: position,
          width: 9,
          height: 32,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(20, 27),
            align: Vector2(0, 5),
          ),
        ],
      ),
    );
  }

  void onMoveDrag(int pointer, Offset position) {
    super.onMoveDrag(pointer, position);

    // Verificar se a posição do componente está sobreposta à posição do caixote de lixo
    if (isOverlappingWithTrashCan(position)) {
      print('Componente está sobreposta a um caixote de lixo!');
    }
  }

  bool isOverlappingWithTrashCan(Offset position) {
    // Verificar se a posição do componente está sobreposta à posição do caixote de lixo
    // Por exemplo, você pode comparar as posições x e y do componente com as do caixote de lixo
    // Suponha que as posições dos caixotes de lixo estejam armazenadas em uma lista chamada trashCans
    var trashCans;
    for (var trashCan in trashCans) {
      if (this.position.overlaps(trashCan.position & trashCan.size)) {
        return true;
      }
    }
    return false;
  }
}

class TrashCollectables02 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool playerIsClose = false;
  TrashCollectables02(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones02,
          position: position,
          width: 19.5,
          height: 32,
        );
}

class TrashCollectables03 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables03(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones03,
          position: position,
          width: 18,
          height: 32,
        );
}

class TrashCollectables04 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables04(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones04,
          position: position,
          width: 20,
          height: 32,
        );
}

class TrashCollectables05 extends GameDecoration
    with DragGesture, ObjectCollision {
  Sprite? trashIcone_05;
  bool playerIsClose = false;
  TrashCollectables05(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones05,
          position: position,
          width: 19,
          height: 32,
        );
}

class TrashCollectables06 extends GameDecoration
    with DragGesture, ObjectCollision {
  Sprite? trashIcone_06;
  bool playerIsClose = false;
  TrashCollectables06(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones06,
          position: position,
          width: 17.5,
          height: 32,
        );
}

class TrashCollectables07 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables07(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones07,
          position: position,
          width: 10,
          height: 32,
        );
}

class TrashCollectables08 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables08(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones08,
          position: position,
          width: 12.5,
          height: 32,
        );
}

class TrashCollectables09 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables09(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones09,
          position: position,
          width: 9,
          height: 32,
        );
}

class TrashCollectables10 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables10(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones10,
          position: position,
          width: 12.5,
          height: 32,
        );
}

class TrashCollectables11 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables11(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones11,
          position: position,
          width: 12,
          height: 32,
        );
}

class TrashCollectables12 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables12(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones12,
          position: position,
          width: 9,
          height: 32,
        );
}

class TrashCollectables17 extends GameDecoration with ObjectCollision {
  Sprite? trashIcone_17;
  bool playerIsClose = false;
  TrashCollectables17(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones17,
          position: position,
          width: 20,
          height: 27,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(20, 27),
            align: Vector2(0, 5),
          ),
        ],
      ),
    );
  }
}

class TrashCollectables18 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables18(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones18,
          position: position,
          width: 19,
          height: 15,
        );
}

class TrashCollectables19 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables19(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones19,
          position: position,
          width: 16,
          height: 6,
        );
}

class TrashCollectables20 extends GameDecoration
    with DragGesture, ObjectCollision {
  TrashCollectables20(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones20,
          position: position,
          width: 18,
          height: 21,
        );
}
