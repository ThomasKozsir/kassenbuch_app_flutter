import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderlinedHeadline extends StatelessWidget {
  final String _text;
  final double fontSize;

  UnderlinedHeadline(this._text, {this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Container(
        decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(color: Colors.pink))),
        child: new Text(_text, style: new TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
      ),
    );
  }
}
