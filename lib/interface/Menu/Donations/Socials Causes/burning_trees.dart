import 'package:angola_sustentavel/interface/pay_wallet.dart';
import 'package:flutter/material.dart';

class BurningTrees extends StatelessWidget {
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
                          "assets/icones/burnin_trees.png",
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
                        "Deforestation in Angola is not happening just due to natural causes: There is a battle that we need to fight, against the cutting and burning of trees, which is being done to increase agricultural fields and to produce coal. Join Us to Protect Our Trees And Prevent threatned areas from this massive deforestation! Cutting And Burning Trees Threatens Our Environment And Directly Impacts Vulnerable Communities. With Your Help, We Can Make A Difference: Contribute To Our Campaign Today, And Help Preserve Forests While Supporting Communities In Need. Together, We Can Build A Greener, More Sustainable Future For Everyone.",
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
