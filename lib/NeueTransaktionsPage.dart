import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NeueTransaktionsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NeueTransaktionsPageState();
  }

}

class NeueTransaktionsPageState extends State<NeueTransaktionsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Neue Bewegung"),
      ),
      body: new Hero(
        tag: "fabToBackground",
        child: new Container(
          child: new Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}