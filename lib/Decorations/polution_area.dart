import 'package:angola_sustentavel/Decorations/decoration_sprite_sheet.dart';
import 'package:angola_sustentavel/Decorations/TrashObjects/trash_river_collect.dart';
import 'package:bonfire/bonfire.dart';

class PolutionArea extends GameDecoration with ObjectCollision {
  PolutionArea(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.polution_area_icone,
          position: position,
          width: 520,
          height: 349,
        );

  @override
  void update(double dt) {
    if (trashcollected_count.value == 15) {
      removeFromParent();
    }
    super.update(dt);
  }
}
