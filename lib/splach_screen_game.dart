import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:angola_sustentavel/game_menu.dart';

class SplachScreenGame extends StatefulWidget {
  const SplachScreenGame({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplachScreenGameState createState() => _SplachScreenGameState();
}

class _SplachScreenGameState extends State<SplachScreenGame>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late String _backgroundImage;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MenuGame()),
      );
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _setBackgroundImage(BuildContext context) {
    //Check if the orientation of the screen currenctle
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _backgroundImage = 'assets/splach_screen_orzontal_writen.png';
    } else {
      if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        _backgroundImage = 'assets/splachscreengame_windows.png';
      } else {
        _backgroundImage = 'assets/splachscreengame.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _setBackgroundImage(context); // Move your logic here
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
