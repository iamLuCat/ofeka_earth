import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/burning_trees.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/desertification_suthern_angola.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/plastic_substances.dart';

class DonationCauses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    String desertificationImage;
    String trashImage;
    String burninTreesImage;

    String currentLanguage = Localizations.localeOf(context).languageCode;

    switch (currentLanguage) {
      case 'en':
        desertificationImage = 'assets/icones/desertification_iona_en.png';
        trashImage = 'assets/icones/dealing_with_trash_en.png';
        burninTreesImage = 'assets/icones/burnin_trees_en.png';
        break;
      case 'pt':
        desertificationImage = 'assets/icones/desertification_iona_pt.png';
        trashImage = 'assets/icones/dealing_with_trash_pt.png';
        burninTreesImage = 'assets/icones/burnin_trees_pt.png';
        break;
      case 'ja':
        desertificationImage = 'assets/icones/desertification_iona_ja.png';
        trashImage = 'assets/icones/dealing_with_trash_ja.png';
        burninTreesImage = 'assets/icones/burnin_trees_ja.png';
        break;
      default:
        desertificationImage = 'assets/icones/desertification_iona_en.png';
        trashImage = 'assets/icones/dealing_with_trash_en.png';
        burninTreesImage = 'assets/icones/burnin_trees_en.png';
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
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: screenSize.width - 32,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          desertificationImage,
                          fit: BoxFit.cover,
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
                          MaterialPageRoute(
                            builder: (context) =>
                                DesertificationSuthernAngola(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.t5,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: screenSize.width - 32,
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlasticSubstances(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.t5,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: screenSize.width - 32,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          burninTreesImage,
                          fit: BoxFit.cover,
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
                          MaterialPageRoute(
                            builder: (context) => BurningTrees(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.t5,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "#MIRABILISGAMESTUDIO",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
