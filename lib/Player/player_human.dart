import 'package:angola_sustentavel/Decorations/TrashObjects/trash_river_collect.dart';
import 'package:angola_sustentavel/Decorations/polution_area.dart';
import 'package:angola_sustentavel/Decorations/reforestation.dart';
import 'package:angola_sustentavel/Player/game_player_sprite.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PlayerHuman extends SimplePlayer with ObjectCollision {
  bool collisionArea = false;
  bool alreadyShowedWinDialog = false;

  PlayerHuman(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleLeft: GameSpriteSheet.playerIdleLeft,
            idleRight: GameSpriteSheet.playerIdleRight,
            runRight: GameSpriteSheet.playerRunRight,
            runLeft: GameSpriteSheet.playerRunLeft,
          ),
          speed: 60,
          width: 32,
          height: 32,
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

  @override
  void update(double dt) {
    if ((!alreadyShowedWinDialog) &&
        (trashcollected_count.value == 15) &&
        (ReforestationTrees.treeCollected.value == 16)) {
      alreadyShowedWinDialog = true;
      _showWinDialog(context);
    }

    //Contaminated area
    seeComponentType<PolutionArea>(observed: (PolutionArea) {
      if (!collisionArea) {
        collisionArea = true;
        while (collisionArea) {
          receiveDamage(0.1, PolutionArea);
          if (collisionArea = false) {
            break;
          }
        }

        if (life <= 0) {
          removeFromParent();
        }
      }
    });

    super.update(dt);
  }

  void _showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Parabéns!"),
          content: Text("Você venceu o jogo!"),
          actions: [
            const SizedBox(height: 16),
            GameButton(
              onPressed: () {
                // Resetando as variáveis para zero
                trashcollected_count.value = 0;
                ReforestationTrees.treeCollected.value = 0;
                // Voltando para o menu principal
                Navigator.popAndPushNamed(context, '/mainmenu');
              },
              text: ("Continue"),
            ),
          ],
        );
      },
    );
  }
}
