import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'numberWidget.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

int x = 0;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text("DICE GAME"),
        ),
        body: Game(),
      ),
    );
  }
}


class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  bool pressed = false;
  int diceNumber = 1,totalScore = 0;

  void changeImage(){
    Random r = Random();
    diceNumber = r.nextInt(6)+1;
  }

  void displayAlert(){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Oops!",
      desc: "Tap on the number first",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            "TAP ON A NUMBER",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            NumberWidget(number: 1,),
            NumberWidget(number: 2,),
            NumberWidget(number: 3,),
            NumberWidget(number: 4,),
            NumberWidget(number: 5,),
            NumberWidget(number: 6,),
          ],
        ),
        TextButton(
          onPressed: (){
            if(onTapped == false){
              displayAlert();
            }
            else{
              onTapped = false;
              x = NumberWidget().getTappedNumber();
              setState(() {
                changeImage();
              });
              if(x == diceNumber){
                setState(() {
                  totalScore += (x + diceNumber);
                });
              }
              else if(totalScore != 0){
                if(totalScore - 2 >= 0){
                  setState(() {
                    totalScore = totalScore - 2;
                  });
                }
                else{
                  setState(() {
                    totalScore = 0;
                  });
                }
              }
            }
          },
          child: Image(
            image: AssetImage("images/dice$diceNumber.png"),
            color: Colors.pink,
            height: 150,
            width:  150,
          ),
        ),
        Text(
          "Click on the Die to roll",
          style: kTextStyle,
        ),
        Text(
          "TOTAL SCORE",
          style: kTextStyle,
        ),
        Text(
          totalScore.toString(),
          style: kTextStyle,
        ),
        TextButton(
          onPressed: (){
            setState(() {
              totalScore = 0;
              diceNumber = 1;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
          ),
          child: Text(
            "Reset Game",
            style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}


