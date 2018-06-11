

import 'package:flutter/material.dart';

class Overview extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }

}

class OverviewState extends State<Overview>{


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
                child: new Image.asset("assets/icon.png")
            )
          ],
        )
      )
    );
  }

}