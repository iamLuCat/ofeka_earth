import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/game_button.dart';
import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/social_causes_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialCauses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SocialCause> socialCauses = [
      SocialCause(
          image: "assets/images/desertification.png",
          title: AppLocalizations.of(context)!.cause1,
          description: AppLocalizations.of(context)!.t6),
      SocialCause(
          image: "assets/images/plastic.png",
          title: AppLocalizations.of(context)!.cause2,
          description: AppLocalizations.of(context)!.t7),
      SocialCause(
          image: "assets/images/burning_trees.png",
          title: AppLocalizations.of(context)!.cause3,
          description: AppLocalizations.of(context)!.t8),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.social_causes,
          style: TextStyle(color: Colors.black),
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
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, bottom: 25),
        itemCount: socialCauses.length,
        itemBuilder: (BuildContext context, int index) {
          final socialCause = socialCauses[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _socialCausesCard(context,
                title: socialCause.title,
                image: socialCause.image, onAction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SocialCauseDetails(
                            cause: socialCause,
                          )));
            }),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

Widget _socialCausesCard(
  BuildContext context, {
  required String image,
  required String title,
  required Function() onAction,
}) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.yellowColor, width: 3),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.fitWidth,
            )),
      ),
      Positioned(
        bottom: 3,
        left: 3,
        right: 3,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(9))),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  GameButton(
                    text: AppLocalizations.of(context)!.t5,
                    height: 35,
                    width: 140,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    onPressed: onAction,
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ],
  );
}

class SocialCause {
  final String image;
  final String title;
  final String description;
  final String? extraField;

  SocialCause({
    required this.image,
    required this.title,
    required this.description,
    this.extraField,
  });
}
