import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Widgets/DrawerDivider.dart';
import 'package:kassenbuch_app/Widgets/Kassenbereich.dart';
import 'package:kassenbuch_app/Widgets/MandantWidget.dart';
import 'package:kassenbuch_app/Widgets/MandantenBereich.dart';

class KassenbuchPage extends StatefulWidget {
  List<String> _kassenbezeichnungListe;
  String _ausgewaehlteKasse;

  KassenbuchPage(){
    _ausgewaehlteKasse = "Bilanzierer";
    
    _kassenbezeichnungListe = _ErstelleKassenListeFuerGewaehlteKasse(_ausgewaehlteKasse);
  }

  @override
  State<StatefulWidget> createState() {
    return new KassenbuchState(_kassenbezeichnungListe);
  }

  List<String> _ErstelleKassenListeFuerGewaehlteKasse(String kassenName) {
    List<String> kassenListe = new List<String>();
    
    switch(kassenName){
      case "Demo":
        kassenListe.add("Kasse Büro");
        kassenListe.add("Kasse Privat");
        break;
      case "Bilanzierer":
        kassenListe.add("Kasse Hamburg");
        kassenListe.add("Kasse Mannheim");
        kassenListe.add("Kasse München");
        kassenListe.add("Kasse Stuttgart");
        break;
    }
    return kassenListe;
  }
}

class KassenbuchState extends State<KassenbuchPage> {
  List<String> _kassenbezeichnungListe;

  KassenbuchState(this._kassenbezeichnungListe);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kassenbuch"),
      ),
      body: Column(
        children: <Widget>[
          new MandantenBereich(),
          new Divider(color: Colors.black,),
          new Kassenbereich(_kassenbezeichnungListe),
        ],
      ),
    );
  }
}
