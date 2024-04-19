import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PlasticSubstances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final Size screenSize = MediaQuery.of(context).size;

    String trashImage;

    String currentLanguage = Localizations.localeOf(context).languageCode;

    switch (currentLanguage) {
      case 'en':
        trashImage = 'assets/icones/dealing_with_trash_en.png';
        break;
      case 'pt':
        trashImage = 'assets/icones/dealing_with_trash_pt.png';
        break;
      case 'ja':
        trashImage = 'assets/icones/dealing_with_trash_ja.png';
        break;
      default:
        trashImage = 'assets/icones/dealing_with_trash_en.png';
        break;
    }

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "LondrinaSolid"),
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.social_causes),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Titles
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.t1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.t2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.t3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.t4,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Container with image and text
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: screenSize.width - 32, // 16 de cada lado
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          trashImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Green button
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        AppLocalizations.of(context)!.t7,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyWallet()),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.t4,
                    style: TextStyle(
                      color: Colors.white,
                    ), // Definindo a cor do texto
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "#MIRABILISGAMESTUDIO",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ), // Definindo a cor do texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
