import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class FreigabeWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return FreigabeWidgetState();
  }
}

class FreigabeWidgetState extends State<FreigabeWidget>{
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        //Kalender
        new Calendar(
          isExpandable: true,
        ),
        //Tabbar
        new DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              TabBar(
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.pink,
                  tabs: [
                Tab(text: "Freigabe"),
                Tab(text: "Übermittlung"),
              ]),

            ],
          ),
        ),


      ],
    );
  }


}