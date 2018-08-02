import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Classes/Transaktion.dart';

class TransaktionWidget extends StatefulWidget {
  Transaktion transaktion;


  TransaktionWidget(this.transaktion);

  @override
  State<StatefulWidget> createState() {
    return new TransaktionWidgetState(transaktion);
  }
}

class TransaktionWidgetState extends State<TransaktionWidget> {
  Transaktion transaktion;


  TransaktionWidgetState(this.transaktion);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {},
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Text("Datum"),
                        new Text(transaktion.datum)
                      ],
                    ),
                    /*new Column(
                    children: <Widget>[
                      new Text("Belegnummer"),
                      new Text(transaktion.belegnummer)
                    ],
                  ),*/
                    new Column(
                      children: <Widget>[
                        new Text("Saldoänderung"),
                        CreateColoredSaldoText(transaktion)
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new Text("Konto"),
                        new Text(transaktion.konto),
                      ],
                    ),
                    /*new Column(
                    children: <Widget>[
                      new Text("USt. %"),
                      new Text(transaktion.ust)
                    ],
                  ),*/
                    /*new Column(
                    children: <Widget>[
                      new Text("Kostenstelle"),
                      new Text(transaktion.kostenstelle),
                    ],
                  ),*/
                    /*new Column(
                    children: <Widget>[
                      new Text("Kostenträger"),
                      new Text(transaktion.kostentraeger)
                    ],
                  ),*/
                    new Column(
                      children: <Widget>[
                        new Text("Buchungstext"),
                        new Text(transaktion.buchungstext),
                      ],
                    ),
                    GetUploadedStatusImage(transaktion),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Divider(
                  color: Colors.black,
                  height: 0.0,
                ),
              )
            ],
          ),
        ),
      );

  }

  CreateColoredSaldoText(Transaktion transaktion) {
    if (transaktion.plus != null) {
      return transaktion.plus
          ? new Text(transaktion.saldoAenderung,
              style: new TextStyle(color: Colors.green))
          : new Text(transaktion.saldoAenderung,
              style: new TextStyle(color: Colors.red));
    } else {
      return new Text(transaktion.saldoAenderung,
          style: new TextStyle(color: Colors.green));
    }
  }

  Image GetUploadedStatusImage(Transaktion transaktion) {
    double height = 20.0;
    double width = 20.0;

    if (transaktion.hochgeladen) {
      return new Image.asset("assets/check.png",
          color: Colors.green, height: height, width: height);
    } else {
      return new Image.asset("assets/upload.png",
          color: Colors.red, height: height, width: height);
    }
  }
}
