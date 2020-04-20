import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void _selectedImage(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var choiceApp = options[number];

    print("Escolha do App: " + choiceApp);
    print("Escolha do usuário: " + userChoice);

    switch(choiceApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    if((userChoice == "pedra" && choiceApp == "tesoura") ||
        (userChoice == "tesoura" && choiceApp == "papel") ||
        (userChoice == "papel" && choiceApp == "pedra")) {
      setState(() {
        this._message = "Parabéns!!! Você ganhou :)";
      });
    } else if((choiceApp == "pedra" && userChoice == "tesoura") ||
              (choiceApp == "tesoura" && userChoice == "papel") ||
              (choiceApp == "papel" && userChoice == "pedra")) {
      setState(() {
        this._message = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: _imageApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedImage("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedImage("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedImage("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              )
              /*Image.asset("images/pedra.png", height: 100),
              Image.asset("images/papel.png", height: 100),
              Image.asset("images/tesoura.png", height: 100),*/
            ],
          )
        ],
      ),
    );
  }
}
