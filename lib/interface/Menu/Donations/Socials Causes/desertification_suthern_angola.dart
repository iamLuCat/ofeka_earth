import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter/material.dart';

class DesertificationSuthernAngola extends StatelessWidget {
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
                          "assets/icones/iona_wellcome.png",
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
                        "The Village Of Iona is located in the southern region of Namibe, a province of the Republic of Angola. This entire region of the African continent, faces desertification due to deforestation, unsustainable agricultural practices and climate change. The lack of rainfall and arid soils is putting the lives of local communities at risk, since they rely a lot on cattle breeding as part of their culture and, as a consequence, have to walk long distances in search of pasture. This poses serious threats to their lives in many different ways: low food reserves, malnutrition, deseases and illiteracy because children are kept out of school to help with cattle breading. There is an urgent need to promote reforestation, sustainable agricultural practices, and access to clean water, and Ngola needs you to prevent the effects of drought and help the communities of Iona to overcome these challenges.",
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
