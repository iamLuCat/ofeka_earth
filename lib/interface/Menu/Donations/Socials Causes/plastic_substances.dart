import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter/material.dart';

class PlasticSubstances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SOCIAL CAUSES'),
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
                  "Hi, and welcome to the Ofeka Earth Project!",
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
                  "We invite you to join us in the fight for a more sustainable future.",
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
                  "Please follow the instructions of our game, and take the chance to learn a little about the Iona region.",
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
                  "MAKE YOUR DONATION",
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
                          "assets/icones/namibe_trash.png",
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
                        "Plastic is invading schools, neighbourhoods, beaches and rivers in Angola. Local people need to become aware of the consequences, and engage themselves in the quest to reduce this environmental threat. Help us make a difference! With just 1 USD, you can support our campaign to help children in need and receive a leaflet, t-shirt or other gift in exchange. Join us in the fight against plastic pollution and in promoting the education and well-being of angolan children. Every contribution counts. Join us today!",
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
                    "MAKE DONATION",
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
