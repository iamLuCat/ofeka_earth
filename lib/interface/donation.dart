import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyDonations(),
  ));
}

class MyDonations extends StatelessWidget {
  const MyDonations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.donationsbar),
      ),
      body: SingleChildScrollView(
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
                    MaterialPageRoute(
                        builder: (context) => const MySocaialCausePage(
                              title: 'Social Causes',
                            )),
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
                  color: Colors.black,
                  fontSize: 14,
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
      width: 200,
      height: 200,
      margin: const EdgeInsets.only(
          bottom: 20), // Adicionando margem apenas na parte inferior do cartão
      decoration: BoxDecoration(
        color: const Color(0xFF202020),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.shop_page),
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

class MySocaialCausePage extends StatelessWidget {
  final String title;

  const MySocaialCausePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOCIAL CAUSES'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('BE PART OF REVOLUATION'),
          ],
        ),
      ),
    );
  }
}
