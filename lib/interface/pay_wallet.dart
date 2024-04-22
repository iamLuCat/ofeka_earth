import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void main() => runApp(const MaterialApp(home: MyApp()));

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text("DONATIONS"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: OfekaCircleButton(
            size: 35,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: (orientation == Orientation.portrait) ? 50 : 20,),
                Image.asset("assets/images/icone.png"),
                const SizedBox(height: 20,),
                SizedBox(
                  height: (orientation == Orientation.portrait) ? 150.0 : 30,
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: (orientation == Orientation.portrait) ? 28.0 : 20,
                      fontFamily: 'LondrinaSolid',
                    ),
                    textAlign: TextAlign.justify,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          AppLocalizations.of(context)!.t1,
                        ),
                        TypewriterAnimatedText(
                          AppLocalizations.of(context)!.t2,
                        ),
                        TypewriterAnimatedText(
                          AppLocalizations.of(context)!.t3,
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                SizedBox(height: (orientation == Orientation.portrait) ? 50 : 20,),
                AddToGoogleWalletButton(
                  pass: _examplePass,
                  onError: (Object error) => _onError(context, error),
                  onSuccess: () => _onSuccess(context),
                  onCanceled: () => _onCanceled(context),
                  // Unsupported locale. Button will display English version.
                  locale: const Locale('und'),
                ),
                // const SizedBox(height: 8.0),
                // AddToGoogleWalletButton(
                //   pass: _examplePass,
                //   onError: (Object error) => _onError(context, error),
                //   onSuccess: () => _onSuccess(context),
                //   onCanceled: () => _onCanceled(context),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onError(BuildContext context, Object error) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );

  void _onSuccess(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content:
              Text('Pass has been successfully added to the Google Wallet.'),
        ),
      );

  void _onCanceled(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('Adding a pass has been canceled.'),
        ),
      );
}

final String _passId = const Uuid().v4();
const String _passClass = 'ofekaearth';
const String _issuerId = '3388000000022336904';
const String _issuerEmail = 'com.example.angola_sustentavel';

final String _examplePass = """
    {
      "iss": "$_issuerEmail",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "$_issuerId.$_passId",
            "classId": "$_issuerId.$_passClass",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#7B060A",
            "logo": {
              "sourceUri": {
                "uri": "https://d112y698adiu2z.cloudfront.net/photos/production/software_thumbnail_photos/002/807/402/datas/medium.jpg"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Ofeka Earth Project Game"
              }
            },
            "subheader": {
              "defaultValue": {
                "language": "en",
                "value": "Attendee"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "Replaciment of trees"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "$_passId"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://d112y698adiu2z.cloudfront.net/photos/production/software_thumbnail_photos/002/807/402/datas/medium.jpg"
              }
            },
            "textModulesData": [
              {
                "header": "DONATION",
                "body": "1234",
                "id": "points"
              }
            ]
          }
        ]
      }
    }
""";
