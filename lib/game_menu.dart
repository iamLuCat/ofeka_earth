import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:angola_sustentavel/main.dart';

class MenuGame extends StatefulWidget {
  const MenuGame({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MenuGameState createState() => _MenuGameState();
}

class _MenuGameState extends State<MenuGame> with WidgetsBindingObserver {
  late String _backgroundImage;
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = 'English'; // Idioma padrão
    _setBackgroundImage();
    WidgetsBinding.instance.addObserver(this);
  }

  void _setBackgroundImage() {
    if (Platform.isWindows || Platform.isMacOS) {
      _backgroundImage = 'assets/menupagegame_windows.png';
    } else {
      _backgroundImage = 'assets/menupagegame.png';
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() {
    String language = AppLocalizations.of(context)!.language;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(language),
      backgroundColor: const Color.fromARGB(255, 201, 195, 194),
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: _showLanguageDialog,
        ),
      ],
    );
  }

  void _showLanguageDialog() {
    String selectlanguage = AppLocalizations.of(context)!.select_your_language;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectlanguage),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _buildLanguageItem(
                  'English',
                  'assets/images/language/uk_flag.png',
                  'en',
                ),
                _buildLanguageItem(
                  'Português',
                  'assets/images/language/portugal_flag.png',
                  'pt',
                ),
                _buildLanguageItem(
                  '日本語',
                  'assets/images/language/japan_flag.png',
                  'ja',
                ),
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
        _changeLanguage(
            languageCode); // Chamando a função para alterar o idioma
      },
      selected: _selectedLanguage == language,
    );
  }

  void _changeLanguage(String languageCode) {
    MyApp.setLocale(context, Locale(languageCode, '')); // Alterando o idioma
  }

  @override
  Widget build(BuildContext context) {
    String play = AppLocalizations.of(context)!.play;
    String wallet = AppLocalizations.of(context)!.make_donation;
    String options = AppLocalizations.of(context)!.options;
    String quit = AppLocalizations.of(context)!.quit;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/level01');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 3.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 17),
                      ),
                      child: Text(
                        play,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/wallet');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 3.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 17),
                      ),
                      child: Text(
                        wallet,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        // Adicione a navegação para outras opções
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 3.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 17),
                      ),
                      child: Text(
                        options,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 3.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 17),
                      ),
                      child: Text(
                        quit,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
