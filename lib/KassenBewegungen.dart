import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Classes/Transaktion.dart';
import 'package:kassenbuch_app/NeueTransaktionsPage.dart';
import 'package:kassenbuch_app/Widgets/FreigabeWidget.dart';
import 'package:kassenbuch_app/Widgets/KassensturzWidget.dart';
import 'package:kassenbuch_app/Widgets/TransaktionWidget.dart';

class KassenBewegungen extends StatefulWidget {
  final String _kassenName;

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
    _transaktionenListe = _GetFakeTransaktionen();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(_kassenName),
          bottom: TabBar(tabs: [
            Tab(text: "Kassen"),
            Tab(text: "Freigabe"),
            Tab(text: "Kassensturz"),
          ]),
        ),
        body:
        TabBarView(
          children: [
            //Transaktionen
            new Container(
              decoration: new BoxDecoration(
                color: Colors.grey,
              ),
              child: GetTransaktionListWidget(),
            ),
            //Freigabe
            new FreigabeWidget(),
            //Kassensturz
            new KassensturzWidget(),

          ],
        ),

        floatingActionButton: new FloatingActionButton(
          onPressed: () async {
            _AddTransaktion();
          },
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  List<Transaktion> _GetFakeTransaktionen() {
    List<Transaktion> liste = new List<Transaktion>();

    Transaktion t1 = new Transaktion("14.04.2018", "0000001", "123.00 €",
        "0815", "19.00 %", "180", "2010", "Bewirtung", true, true);
    Transaktion t2 = new Transaktion("10.06.2018", "0000002", "145.00 €",
        "1360", "7.00 %", "-", "-", "Bewirtung", false, true);
    Transaktion t3 = new Transaktion("14.06.2018", "0000003", "23.00 €", "1360",
        "19.00 %", "-", "-", "Bewirtung", false, true);

    liste.add(t1);
    liste.add(t2);
    liste.add(t3);

    return liste;
  }

  Future _AddTransaktion() async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => new NeueTransaktionsPage()));

    setState(() {
      _transaktionenListe.add(result);
    });
  }

  Widget GetTransaktionListWidget() {
    return new ListView.builder(
      itemCount: _transaktionenListe.length,
      itemBuilder: (context, index) {
        final Transaktion item = _transaktionenListe[index];
        return Dismissible(
          key: Key(item.toString()),
          child: new TransaktionWidget(item),
          direction: DismissDirection.endToStart,
          movementDuration: Duration(seconds: 1),
          background: Container(color: Colors.red),
          secondaryBackground: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: new Text(
                "Löschen",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          onDismissed: (direction) {
            // Remove the item from our data source.
            setState(() {
              _transaktionenListe.remove(item);
            });
          },
        );
      },
    );
  }
}
