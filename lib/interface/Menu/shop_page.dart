import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.shop_page),
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
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.shop_page_title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}