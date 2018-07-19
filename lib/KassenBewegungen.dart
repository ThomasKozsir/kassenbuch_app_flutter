import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Classes/Transaktion.dart';
import 'package:kassenbuch_app/Widgets/TransaktionWidget.dart';

class KassenBewegungen extends StatefulWidget {
  String _kassenName;

  KassenBewegungen(this._kassenName);

  @override
  State<StatefulWidget> createState() {
    return new KassenBewegungenState(_kassenName);
  }
}

class KassenBewegungenState extends State<KassenBewegungen> {
  String _kassenName;
  List<TransaktionWidget> _transaktionsWidgetListe;
  List<Transaktion> _transaktionenListe;

  KassenBewegungenState(this._kassenName) {
    _transaktionenListe = _GetTransaktionen();
    _transaktionsWidgetListe =
        _ErstelleListeVonTransaktionsWidgets(_transaktionenListe);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(_kassenName),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.grey,
          ),
          child: new ListView(
            children: _transaktionsWidgetListe,
          ),
        ),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, "/NeueTransaktionsPage");
          },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        heroTag: "fabToBackground",
        child: new Icon(Icons.add),
          ),

    );

  }

  List<TransaktionWidget> _ErstelleListeVonTransaktionsWidgets(
      List<Transaktion> transaktionen) {
    List<TransaktionWidget> list = new List<TransaktionWidget>();

    for (var s in transaktionen) {
      list.add(new TransaktionWidget(s));
    }

    return list;
  }

  List<Transaktion> _GetTransaktionen() {
    List<Transaktion> liste = new List<Transaktion>();

    Transaktion t1 = new Transaktion("14.04.2018", "0000001", "123.00 €",
        "0815", "19.00 %", "180", "2010", "Bewirtung", true);
    Transaktion t2 = new Transaktion("10.06.2018", "0000002", "145.00 €",
        "1360", "7.00 %", "-", "-", "Bewirtung", false);
    Transaktion t3 = new Transaktion("14.06.2018", "0000003", "23.00 €",
        "1360", "19.00 %", "-", "-", "Bewirtung", false);

    liste.add(t1);
    liste.add(t2);
    liste.add(t3);

    return liste;
  }
}
