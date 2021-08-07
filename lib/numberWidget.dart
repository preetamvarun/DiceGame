import 'package:flutter/material.dart';

int tappedNumber = 0;
bool onTapped = false;

class NumberWidget extends StatefulWidget {

  final number;
  NumberWidget({this.number});

  @override
  _NumberWidgetState createState() => _NumberWidgetState();
  int getTappedNumber(){
    return tappedNumber;
  }
}

class _NumberWidgetState extends State<NumberWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          tappedNumber = widget.number;
          onTapped = true;
        });
      },
      child: Container(
        height: 45,
        width: 45,
        color: Colors.pink,
        child: Center(child: Text(widget.number.toString(),style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)),
      ),
    );
  }
}
