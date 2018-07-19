import 'package:flutter/widgets.dart';
import 'package:kassenbuch_app/Widgets/KassenWidget.dart';

class Kassenbereich extends StatelessWidget{

  List<String> _kassenbezeichnungsListe;

  Kassenbereich(this._kassenbezeichnungsListe);

  @override
  Widget build(BuildContext context) {
    return
       Expanded(
         child: new GridView.count(
           padding: const EdgeInsets.all(20.0),
           scrollDirection: Axis.vertical,
           crossAxisCount: 2,
            children: _ErstelleKassenWidgetListe(_kassenbezeichnungsListe),
    ),
       );
  }

  List<KassenWidget> _ErstelleKassenWidgetListe(List<String> liste){
    List<KassenWidget> kassenListe = new List<KassenWidget>();

    for(var s in liste){
      kassenListe.add(new KassenWidget(s));
    }

    return kassenListe;
  }

}