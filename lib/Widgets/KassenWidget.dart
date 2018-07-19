import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kassenbuch_app/KassenBewegungen.dart';

class KassenWidget extends StatefulWidget{
  String _name;

  KassenWidget(this._name);

  @override
  State<StatefulWidget> createState() {
    return new KassenWidgetState(_name);
  }

}

class KassenWidgetState extends State{
  String _name;
  double _height = 60.0;
  double _width = 110.0;

  KassenWidgetState(this._name);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new KassenBewegungen(_name)));
        },
        child: new Column(
          children: <Widget>[
            //icon with white background
            new Container(
              height: _height,
              width: _width,
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.asset("assets/cash_icon.png", color: Colors.green,),
            ),
            new Container(
              alignment: Alignment.center,
              height: _height,
              width: _width,
              color: Colors.grey,
              child:  new Text(_name, textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}