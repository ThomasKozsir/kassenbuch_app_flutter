import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Widgets/MandantWidget.dart';

class MandantenBereich extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MandantenBereichState();
  }

}

class MandantenBereichState extends State<MandantenBereich> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new MandantWidget("Kanzlei Demo Bilanzierer"),
              new MandantWidget("Kanzlei Demo EÜR")
            ],
          ),
        ),
      ],
    );
  }
}