import 'package:flutter/material.dart';

class NewsWidget extends Card{

  String dateText, subjectText, messageText;

  NewsWidget(this.dateText, this.subjectText, this.messageText);

  @override
  Widget build(BuildContext context){
    return new Card(
      elevation: 6.0,
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Container(
                alignment: Alignment.center,
                child: new Text("Neues im Simba Portal"),
                color: Colors.pink,
              ),
            ),
            new Text(dateText, style: TextStyle(fontStyle: FontStyle.italic)),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Text(subjectText, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            new Text(messageText)
          ],
        ),
      ),
    );
  }
}