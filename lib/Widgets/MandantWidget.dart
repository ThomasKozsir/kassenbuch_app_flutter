import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MandantWidget extends StatefulWidget{
  String _name;

  MandantWidget(this._name);

  @override
  State<StatefulWidget> createState() {
    return new MandantWidgetState(_name);
  }

}

class MandantWidgetState extends State{
  String _name;
  double _height = 60.0;
  double _width = 110.0;

  MandantWidgetState(this._name);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          //icon with white background
          new Container(
            height: _height,
            width: _width,
            alignment: Alignment.center,
            color: Colors.white,
            child: Image.asset("assets/mandator_icon.png", color: Colors.black,),
          ),
          new Container(
            alignment: Alignment.center,
            height: _height,
            width: _width,
            color: Colors.grey,
            child: new Text(_name, textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}