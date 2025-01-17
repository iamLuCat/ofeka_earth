import 'package:angola_sustentavel/Decorations/TrashObjects/trash_river_collect.dart';
import 'package:angola_sustentavel/Decorations/polution_area.dart';
import 'package:angola_sustentavel/Decorations/reforestation.dart';
import 'package:angola_sustentavel/Player/game_player_sprite.dart';
import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.yellowColor, width: 3.0),
          ),
          title: Center(
              child: Text(
                AppLocalizations.of(context)!.congrats_title,
            textAlign: TextAlign.center,
          )),
          content: FittedBox(
            child: Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.win_title,
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                          height: 100, width: 100, "assets/icones/natureza.png")),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 3)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.tree_replaced,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          trashcollected_count.value.toString(),
                          style: TextStyle(
                              color: AppColors.greenColor, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context)!.waste_collected,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          trashcollected_count.value.toString(),
                          style:
                              TextStyle(color: Colors.orangeAccent, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GameButton(
                  onPressed: () {
                    // Resetando as variáveis para zero
                    trashcollected_count.value = 0;
                    ReforestationTrees.treeCollected.value = 0;
                    // Voltando para o menu principal
                    Navigator.popAndPushNamed(context, '/mainmenu');
                  },
                  text: AppLocalizations.of(context)!.continue_title,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
