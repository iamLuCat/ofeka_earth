import 'package:angola_sustentavel/Decorations/TrashObjects/trash_river_collect.dart';
import 'package:angola_sustentavel/Decorations/reforestation.dart';
import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async' as async;

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;

  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  double life = 0;
  double widthCurrent = 100;
  final double widthMax = 100;

  late async.Timer _lifeTime;

  @override
  void initState() {
    _lifeTime =
        async.Timer.periodic(const Duration(microseconds: 100), _verifyLife);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 60.0,
              bottom: 45.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Image.asset('assets/icones/parque.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: widthCurrent,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 80,
            child: GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'assets/icones/tree_collecter.png',
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Positioned(
            right: 28,
            top: 115,
            child: ValueListenableBuilder<int>(
              valueListenable: ReforestationTrees.treeCollected,
              builder: (context, value, child) {
                return Text(
                  '$value/20',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 68,
            top: 115,
            child: ValueListenableBuilder<int>(
              valueListenable: trashcollected_count,
              builder: (context, value, child) {
                return Text(
                  '$value/20',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 20,
            top: 40,
            child: GestureDetector(
              onTap: _showPauseMenu,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('assets/icones/pause.png'),
              ),
            ),
          ),
          Positioned(
            right: 60,
            top: 40,
            child: GestureDetector(
              onTap: _showHintDialog,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('assets/icones/hint.png'),
              ),
            ),
          ),
          Positioned(
            right: 60,
            top: 80,
            child: GestureDetector(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('assets/icones/trash_can.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _verifyLife(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life / (widget.game.player?.maxLife ?? 0);
        widthCurrent = widthMax * percent;
      });
    }
  }

  void _showPauseMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(AppLocalizations.of(context)!.pause_menu)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.yellowColor, width: 3.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GameButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: AppLocalizations.of(context)!.back_game,
              ),
              const SizedBox(height: 16),
              GameButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/mainmenu');
                },
                text: AppLocalizations.of(context)!.back_menu,
              ),
              const SizedBox(height: 16),
              GameButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: AppLocalizations.of(context)!.game_shop,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHintDialog() {
    String imagePath;
    String currentLanguage = Localizations.localeOf(context).languageCode;

    switch (currentLanguage) {
      case 'en':
        imagePath = 'assets/icones/game_hints_en.png';
        break;
      case 'pt':
        imagePath = 'assets/icones/game_hints_pt.png';
        break;
      case 'ja':
        imagePath = 'assets/icones/game_hints_ja.png';
        break;
      default:
        imagePath = 'assets/icones/game_hints.png';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.hints),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.yellowColor, width: 3.0),
          ),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(5),
              child: Image.asset(imagePath)),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GameButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: AppLocalizations.of(context)!.back_game,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  // ignore: deprecated_member_use
  return WillPopScope(
    onWillPop: () => _showExitConfirmationDialog(context),
    child: Stack(
      children: [
        // ... other UI elements of PlayerInterface
      ],
    ),
  );
}

Future<bool> _showExitConfirmationDialog(BuildContext context) async {
  // final localization = AppLocalizations.of(context)!;
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Exit the game"),
      content: Text("Areu sure that you want to exit"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text("Yes"),
        ),
      ],
    ),
  );
}
