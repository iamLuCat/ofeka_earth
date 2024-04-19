import 'package:angola_sustentavel/NPCS/ngola_friends_sprite_sheet.dart';
import 'package:angola_sustentavel/Player/game_player_sprite.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

const double ngolaFriendsSize = 32;

class NgonaFriends extends SimpleEnemy with TapGesture {
  NgonaFriends(Vector2 position)
      : super(
          position: position,
          height: ngolaFriendsSize,
          width: ngolaFriendsSize,
          animation: SimpleDirectionAnimation(
              idleLeft: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft,
              idleRight: NgolaFriendsSpriteSheet.ngolaFriendIdleRight,
              runRight: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft,
              runLeft: NgolaFriendsSpriteSheet.ngolaFriendIdleRight),
        );

  @override
  void onTap() {
    //My Dialogue with Mayouma
    String dialogue_01 = AppLocalizations.of(context)!.dialogue1;
    String dialogue_02 = AppLocalizations.of(context)!.dialogue2;
    String dialogue_03 = AppLocalizations.of(context)!.dialogue3;
    String dialogue_04 = AppLocalizations.of(context)!.dialogue4;
    String dialogue_05 = AppLocalizations.of(context)!.dialogue5;
    String dialogue_06 = AppLocalizations.of(context)!.dialogue6;
    String dialogue_07 = AppLocalizations.of(context)!.dialogue7;
    String dialogue_08 = AppLocalizations.of(context)!.dialogue8;

    TalkDialog.show(context, [
      Say(
        text: [
          TextSpan(
              text: dialogue_01,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: GameSpriteSheet.playerIdleRight.asWidget(),
        ),
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_02,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_03,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: GameSpriteSheet.playerIdleRight.asWidget(),
        ),
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_04,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_05,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: GameSpriteSheet.playerIdleRight.asWidget(),
        ),
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_06,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_07,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: GameSpriteSheet.playerIdleRight.asWidget(),
        ),
      ),
      Say(
        text: [
          TextSpan(
              text: dialogue_08,
              style: TextStyle(fontFamily: "LondrinaSolid-Thin")),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: NgolaFriendsSpriteSheet.ngolaFriendIdleLeft.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
    ]);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Offset position) {}

  @override
  void onTapUp(int pointer, Offset position) {}
}
