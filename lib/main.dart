import 'package:angola_sustentavel/Utils/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bonfire/bonfire.dart';

import 'Decorations/Farm/Vegetables/vegetables_plant.dart';
import 'Decorations/TrashObjects/trash_river_collect.dart';
import 'Decorations/reforestation.dart';
import 'NPCS/ngola_friends.dart';
import 'Player/player_human.dart';
import 'Utils/app_colors.dart';
import 'game_menu.dart';
import 'interface/Menu/Donations/donation.dart';
import 'interface/player_interface.dart';
import 'interface/splach_screen_game.dart';

const double tileSize = 12;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ofeka Earth',
      theme: ThemeData(
        primaryColor: AppColors.redColor,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          background: Colors.black,
        ),
        dialogBackgroundColor: Colors.black,
        fontFamily: "LondrinaSolid",
        useMaterial3: false
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      home: const SplashScreenGame(),
      routes: {
        '/level01': (context) => const MyHomePage(),
        '/wallet': (context) => const MyDonations(),
        '/mainmenu': (context) => const MenuGame()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final directionButtonSize = AppDimens.directionButtonSize;

    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.black,
          margin: EdgeInsets.only(
            left: (screenWidth - directionButtonSize)/1.5,
            right: (screenWidth - directionButtonSize)/1.5,
            bottom: 100
          ),
          size: directionButtonSize
        ),
        actions: [
          /*JoystickAction(
            actionId: 1,
            color: Colors.white,
            margin: const EdgeInsets.all(40),
          ),*/
        ],
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.arrows,
        ),
      ),
      map: TiledWorldMap(
        'map/mundo.json',
        forceTileSize: const Size(tileSize, tileSize),
        objectsBuilder: {
          //NPCs
          'ngolafriends': (properties) => NgonaFriends(properties.position),
          //TreesCollectables
          'treestem': (properties) => ReforestationTrees(properties.position),
          //TrachaGameObjects
          'trash': (properties) => TrashCollectables(properties.position),
          'trash02': (properties) => TrashCollectables02(properties.position),
          'trash03': (properties) => TrashCollectables03(properties.position),
          'trash04': (properties) => TrashCollectables04(properties.position),
          'trash05': (properties) => TrashCollectables05(properties.position),
          'trash06': (properties) => TrashCollectables06(properties.position),
          'trash07': (properties) => TrashCollectables07(properties.position),
          'trash08': (properties) => TrashCollectables08(properties.position),
          'trash09': (properties) => TrashCollectables09(properties.position),
          'trash10': (properties) => TrashCollectables10(properties.position),
          'trash11': (properties) => TrashCollectables11(properties.position),
          'trash12': (properties) => TrashCollectables12(properties.position),
          //GarbageColactbleIcone
          'garbage': (properties) => TrashCan(properties.position),
          'trash18': (properties) => TrashCollectables18(properties.position),
          'trash19': (properties) => TrashCollectables19(properties.position),
          'trash20': (properties) => TrashCollectables20(properties.position),
          //Farm Objects
          'tomato_plant': (properties) => TomatoPlant(properties.position),
          'pepper_plant': (properties) => PepperPlant(properties.position),
          'corn_plant': (properties) => CornPlant(properties.position),
          //Farm Vegetables Products Collectables
          'tomato_collect': (properties) => TomatoCollect(properties.position),
        },
      ),
      player: PlayerHuman(
        Vector2(16 * tileSize, 46 * tileSize),
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(
              game: game,
            ),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        sizeMovementWindow: const Size(tileSize * 3, tileSize * 3),
        zoom: 1.5,
      ),
      progress: Material(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/icones/logo_game.png',
            ),
          ),
        ),
      ),
    );
  }
}
