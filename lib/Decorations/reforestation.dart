import 'package:angola_sustentavel/Decorations/decoration_sprite_sheet.dart';
import 'package:angola_sustentavel/Player/player_human.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ReforestationTrees extends GameDecoration
    with ObjectCollision, TapGesture {
  bool playerIsClose = false;
  static ValueNotifier<int> treeCollected = ValueNotifier<int>(0);

  Sprite? removeStem, plantTree;

  ReforestationTrees(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.removeStem,
          position: position,
          width: 32,
          height: 32,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(15, 5),
            align: Vector2(9, 20),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeComponentType<PlayerHuman>(
      observed: (player) {
        if (!playerIsClose) {
          playerIsClose = true;
        }
      },
      notObserved: () {
        playerIsClose = false;
      },
      radiusVision: 32,
    );
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    plantTree = await DecorationSpriteSheet.plantTree;
    removeStem = await DecorationSpriteSheet.removeStem;
    return super.onLoad();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text(AppLocalizations.of(context)!.message_tree),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  void onTap() {
    if (playerIsClose) {
      _showDialog();
      sprite = plantTree;
      treeCollected.value++;
    }

    print(treeCollected.value);
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Offset position) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Offset position) {
    // TODO: implement onTapUp
  }
}
