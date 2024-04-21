import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/social_causes.dart';
import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SocialCauseDetails extends StatelessWidget {
  final SocialCause cause;
  const SocialCauseDetails({super.key, required this.cause});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.social_causes,
          style: TextStyle(
              color: Colors.black
          ),
        ),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 25
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(cause.image),
                      fit: BoxFit.cover
                    )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        cause.title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        cause.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
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
              fontSize: 16
            ), // Definindo a cor do texto
          ),
          style: ButtonStyle(
            padding:  MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25
                )
            ),
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.yellowColor, width: 3.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
