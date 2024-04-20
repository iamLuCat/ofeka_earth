import 'dart:io';
import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/diagonal_path_clipper.dart';
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
    String language = AppLocalizations.of(context)!.language;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        language,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.language,
            color: Colors.white,
          ),
          onPressed: _showLanguageDialog,
        ),
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
          title: Text(selectedLanguage),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _buildLanguageItem(
                    'English', 'assets/images/language/uk_flag.png', 'en'),
                _buildLanguageItem('Português',
                    'assets/images/language/portugal_flag.png', 'pt'),
                _buildLanguageItem(
                    '日本語', 'assets/images/language/japan_flag.png', 'ja'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem(
      String language, String flagImagePath, String languageCode) {
    return ListTile(
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Image.asset(
          flagImagePath,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(language),
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
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    String play = AppLocalizations.of(context)!.play;
    String wallet = AppLocalizations.of(context)!.make_donation;
    String options = AppLocalizations.of(context)!.options;
    String quit = AppLocalizations.of(context)!.quit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAppBar(),
        Center(
          child: Padding(
            padding: _getPadding(context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(play, '/level01'),
                  const SizedBox(height: 16),
                  _buildButton(wallet, '/wallet'),
                  const SizedBox(height: 16),
                  _buildButton(options, ''),
                  const SizedBox(height: 16),
                  _buildButton(quit, ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, String route) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (route.isNotEmpty) {
            Navigator.pushNamed(context, route);
          } else {
            if (text == AppLocalizations.of(context)!.quit) {
              exit(0); // Quit the application
            }
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white, width: 3.0),
          ),
          backgroundColor: AppColors.yellowColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Change the size between the button when we have a different orientation screen
  EdgeInsets _getPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      // Horizontal orientation
      return const EdgeInsets.only(top: 40);
    } else {
      // Vertical Orientation
      return const EdgeInsets.only(top: 250);
    }
  }
}
