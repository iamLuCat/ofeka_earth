import 'dart:io';
import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/diagonal_path_clipper.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:angola_sustentavel/main.dart';

class MenuGame extends StatefulWidget {
  const MenuGame({Key? key}) : super(key: key);

  @override
  _MenuGameState createState() => _MenuGameState();
}

class _MenuGameState extends State<MenuGame> with WidgetsBindingObserver {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = 'English'; // Default language
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Ofeka Earth',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: OfekaCircleButton(
            size: 30,
            icon: ImageIcon(
              AssetImage('assets/icones/language_logo.png'),
            ),
            onPressed: _showLanguageDialog,
          ),
        )
      ],
    );
  }

  void _showLanguageDialog() {
    String selectedLanguage =
        AppLocalizations.of(context)!.select_your_language;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(selectedLanguage)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.yellowColor, width: 3.0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _buildLanguageItem('English', '🇬🇧', 'en'),
                _buildLanguageItem('Português', '🇵🇹', 'pt'),
                _buildLanguageItem('日本語', '🇯🇵', 'ja'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem(String language, String flag, String languageCode) {
    return ListTile(
      leading: Text(
        flag,
        style: TextStyle(fontSize: 35),
      ),
      title: Text(
        language,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.pop(context);
        _changeLanguage(languageCode);
      },
      selected: _selectedLanguage == language,
    );
  }

  void _changeLanguage(String languageCode) {
    MyApp.setLocale(context, Locale(languageCode, ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: DiagonalPathClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _buildAppBar(),
          ),
          _buildBody(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Text(
              '#OFEKAEARTH',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    String play = AppLocalizations.of(context)!.play;
    String wallet = AppLocalizations.of(context)!.make_donation;
    String quit = AppLocalizations.of(context)!.quit;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/icones/logo_game.png',
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildButton(play, '/level01'),
          const SizedBox(height: 16),
          _buildButton(wallet, '/wallet'),
          const SizedBox(height: 16),
          //_buildButton(options, ''),
          //const SizedBox(height: 16),
          _buildButton(quit, ''),
        ],
      ),
    );
  }

  Widget _buildButton(String text, String route) {
    return SizedBox(
      height: 50,
      width: 200,
      child: GameButton(
        text: text,
        onPressed: () {
          if (route.isNotEmpty) {
            Navigator.pushNamed(context, route);
          } else {
            if (text == AppLocalizations.of(context)!.quit) {
              _showQuitDialog();
            }
          }
        },
      ),
    );
  }

  void _showQuitDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(
            AppLocalizations.of(context)!.quit_confirmation,
            textAlign: TextAlign.center,
          )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.yellowColor, width: 3.0),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: GameButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: AppLocalizations.of(context)!.no_button,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: GameButton(
                  onPressed: () {
                    exit(0);
                  },
                  text: AppLocalizations.of(context)!.yes_button,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
