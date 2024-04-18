import 'package:angola_sustentavel/Decorations/decoration_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

ValueNotifier<int> trashcollected_count = ValueNotifier<int>(0);

class TrashCan extends GameDecoration with ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCan(Vector2 position)
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

class TrashCollectables extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;

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

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables02 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables02(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones02,
          position: position,
          width: 19.5,
          height: 32,
        );
  //we use this method for check if the trash object is close to the trashcan
  //and if the trash is close to the trashcan it's deteled and add a score on the trashes collected
  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables03 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables03(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones03,
          position: position,
          width: 18,
          height: 32,
        );
  //we use this method for check if the trash object is close to the trashcan
  //and if the trash is close to the trashcan it's deteled and add a score on the trashes collected
  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables04 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables04(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones04,
          position: position,
          width: 20,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables05 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables05(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones05,
          position: position,
          width: 19,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables06 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables06(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones06,
          position: position,
          width: 17.5,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables07 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables07(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones07,
          position: position,
          width: 10,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables08 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables08(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones08,
          position: position,
          width: 12.5,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables09 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables09(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones09,
          position: position,
          width: 9,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables10 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables10(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones10,
          position: position,
          width: 12.5,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables11 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables11(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones11,
          position: position,
          width: 12,
          height: 32,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables12 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables12(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones12,
          position: position,
          width: 9,
          height: 32,
        );
}

class TrashCollectables18 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables18(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones18,
          position: position,
          width: 19,
          height: 15,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables19 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables19(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones19,
          position: position,
          width: 16,
          height: 6,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}

class TrashCollectables20 extends GameDecoration
    with DragGesture, ObjectCollision {
  bool objectTrashIsClose = false;
  TrashCollectables20(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.trashIcones20,
          position: position,
          width: 18,
          height: 21,
        );

  @override
  void update(double dt) {
    seeComponentType<TrashCan>(
      observed: (TrashCan) {
        if (!objectTrashIsClose) {
          objectTrashIsClose = true;
          removeFromParent();
          print("The trash object was colected");
          trashcollected_count.value++;
          print("Trach collected: " + trashcollected_count.value.toString());
        }
      },
      notObserved: () {
        objectTrashIsClose = false;
      },
      radiusVision: 5,
    );
    super.update(dt);
  }
}
