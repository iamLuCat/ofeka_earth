import 'package:angola_sustentavel/Decorations/TrashObjects/trash_river_collect.dart';
import 'package:angola_sustentavel/Decorations/reforestation.dart';
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: widthCurrent,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
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
          title: Text(AppLocalizations.of(context)!.pause_menu),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.back_game),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushReplacement(

                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => MenuGame(),
                  //   ),
                  // );
                },
                child: Text(AppLocalizations.of(context)!.back_menu),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.game_shop),
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
          content: Image.asset(imagePath),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        );
      },
    );
  }
}
