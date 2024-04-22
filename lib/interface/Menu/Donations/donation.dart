import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:angola_sustentavel/Utils/ofeka_circle_button.dart';
import 'package:angola_sustentavel/interface/Menu/shop_page.dart';
import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:angola_sustentavel/interface/Menu/Donations/Socials%20Causes/social_causes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MyDonations extends StatelessWidget {
  const MyDonations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.donationsbar),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10), // Espaço entre o título e o cartão
              GestureDetector(
                onTap: () {
                  // Navegar para a página de doações com os textos
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWallet()),
                  );
                },
                child: _buildCard(
                  context,
                  'assets/icones/donate.png',
                  AppLocalizations.of(context)!.donationsbar,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navegar para a página de loja
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SocialCauses()),
                  );
                },
                child: _buildCard(
                  context,
                  'assets/icones/handshakecare.png',
                  AppLocalizations.of(context)!.social_causes,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navegar para a página de loja
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShopPage()),
                  );
                },
                child: _buildCard(
                  context,
                  'assets/icones/store.png',
                  AppLocalizations.of(context)!.shop,
                ),
              ),
              const SizedBox(height: 5), // Espaço entre o texto e a descrição
              const Text(
                '#MIRABILISGAMESTUDIO',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String imagePath, String title) {
    return Container(
      width: 190,
      height: 190,
      margin: const EdgeInsets.only(
          bottom: 20), // Adicionando margem apenas na parte inferior do cartão
      decoration: BoxDecoration(
        color: const Color(0xFF202020),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.yellowColor, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}