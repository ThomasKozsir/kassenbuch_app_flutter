
import 'package:flutter/material.dart';

class KassensturzWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new KassensturzWidgetState();
  }

}

class KassensturzWidgetState extends State<KassensturzWidget> {
  double sum = 0.0, saldo=0.0, delta=0.0;
  int countFiveHundred=0, countTwoHundred=0, countOnehundred=0, countFifty=0,
  countTwenty=0, countTen=0, countFive=0, countTwo=0, countOne=0, countFiftyCent = 0,
  countTwentyCent=0, countTenCent=0, countFiveCent=0, countTwoCent=0, countOneCent=0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          //header Kassensturz
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Kassensturz", style: new TextStyle(fontSize: 20.0), ),
          ),
          new Divider(height: 2.0, color: Colors.black),
          //Money input area
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Table(
              children: <TableRow>[
                new TableRow(children: <Widget>[
                  new TableCell(child: new Text("Scheine")),
                    new TableCell(child: new Text("")),
                  ],
            ),
                //500€
                new TableRow(
                  children: <Widget>[
                    TableCell(child: new Text("500 € x ")),
                    TableCell(child: new TextField()),
                  ]
                )
            ],
            ),
          ),
          //sum info
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: new Table(
              children: <TableRow>[
                //sum
                new TableRow(
                  children: <Widget>[
                    TableCell(
                        child: new Text("Gesamtsumme: ")
                    ),
                    TableCell(
                      child: new Text(CalculateCashSum().toString()),
                    ),
                  ]
                ),
                //saldo
                new TableRow(
                    children: <Widget>[
                      new TableCell(child: new Text("Saldo Kassenbuch: ")),
                      new TableCell(child: new Text(GetSaldo()))
                    ]
                ),
                new TableRow(
                  children: <Widget>[
                    new TableCell(child: new Text("Differenz")),
                    new TableCell(child: new Text(CalculateDeltaSumMinusSaldo().toString())),
                  ]
                )
              ]
            ),
          )
        ],
      ),

    );
  }

  ///returns the sum of the money in the cash register
  double CalculateCashSum() {
    //TODO: actually calculate stuff
    return sum;
  }

  ///return the saldo of our cash register
  String GetSaldo() {
    //TODO: somehow get the saldo. Probably should stay mocked.
    return "100";
  }

  double CalculateDeltaSumMinusSaldo() {
    return sum - saldo;
  }
}