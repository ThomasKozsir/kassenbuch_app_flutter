import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kassenbuch_app/Classes/Transaktion.dart';

class NeueTransaktionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NeueTransaktionsPageState();
  }
}

class NeueTransaktionsPageState extends State<NeueTransaktionsPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController datumController,
      belegnummerController,
      betragController,
      kontoController,
      kostenstellenController,
      kostenTraegerController,
      umsatzsteuerController,
      buchungstextController,
      ausgleichsinfoController;
  String _selectedKonto, _selectedKostenstelle, _selectedKostentraeger, _selectedUSt;

  NeueTransaktionsPageState() {
    datumController = TextEditingController();
    belegnummerController = TextEditingController();
    betragController = TextEditingController();
    kontoController = TextEditingController();
    kostenstellenController = TextEditingController();
    kostenTraegerController = TextEditingController();
    umsatzsteuerController = TextEditingController();
    buchungstextController = TextEditingController();
    ausgleichsinfoController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //final _transactionTextKey = new GlobalKey(debugLabel: 'transactionText');

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Neue Bewegung"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: new ListView(
                children: <Widget>[

                  //TextFormFields

                  //Buchungstext
                  new TextFormField(
                    controller: buchungstextController,
                    validator: (value){
                        if(value.isEmpty){
                          return "Bitte geben Sie einen Buchungstext an";
                        }
                    },
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: true,
                        labelText: "Buchungstext"),
                  ),
                  //Datum
                  new TextFormField(
                    controller: datumController,
                    keyboardType: TextInputType.datetime,
                    validator: (value){
                      if(value.isEmpty){
                        return ("Bitte geben Sie ein Datum an");
                      }
                    },
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      labelText: "Datum",
                    ),
                  ),
                  //Belegnummer
                  new TextFormField(
                    controller: belegnummerController,
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      hintText: "Email Adresse eingeben",
                      labelText: "Belegnummer",
                    ),
                  ),
                  //Gewinn/Verlust
                  new TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Bitte geben Sie den Gewinn/Verlust an";
                      }
                    },
                    controller: betragController,
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      hintText: "Einnahme oder Ausgabe angeben",
                      labelText: "Einnahme/Ausgabe",
                    ),
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  ),

                  //spinner
                  new Table(
                    children: <TableRow>[
                      //Konto
                   new TableRow(
                       children: <TableCell>[
                         TableCell(
                           child: Align(
                             alignment: Alignment.centerLeft ,
                               child: Text("Konto: ")),
                           verticalAlignment: TableCellVerticalAlignment.middle,
                         ),
                         TableCell(
                           child: new DropdownButton(
                             value: _selectedKonto,
                             items: GetKontoValues(),
                             hint: new Text("Konto wählen"),
                             onChanged: ( value) {
                               _selectedKonto = value;
                               setState(() {
                               });
                             },
                           ),
                         ),
                       ]
                   ),
                   //Kostenstelle
                   new TableRow(
                       children: <TableCell>[
                         TableCell(
                           child: Align(
                               alignment: Alignment.centerLeft ,
                               child: Text("Kostenstelle: ")),
                           verticalAlignment: TableCellVerticalAlignment.middle,
                         ),
                         TableCell(
                           child: new DropdownButton(
                             value: _selectedKostenstelle,
                             hint: new Text("Kostenstelle wählen"),
                             items: GetKostenstellenValues(),
                             onChanged: (value){
                               _selectedKostenstelle = value;
                               setState(() {

                               });
                             },
                           ),
                         ),
                       ]
                   ),

                   //Kostenträger
                   new TableRow(
                       children: <TableCell>[
                         TableCell(
                           child: Align(
                               alignment: Alignment.centerLeft ,
                               child: Text("Kostenträger: ")),
                           verticalAlignment: TableCellVerticalAlignment.middle,
                         ),
                         TableCell(
                           child: new DropdownButton(
                               hint: new Text("automatische Wahl"),
                               items: GetKostentraegerItems(), onChanged: null),
                         ),
                       ]
                   ),

                   //USt
                   new TableRow(
                       children: <TableCell>[
                         TableCell(
                           child: Align(
                               alignment: Alignment.centerLeft ,
                               child: Text("USt-Kennziffer: ")),
                           verticalAlignment: TableCellVerticalAlignment.middle,
                         ),
                         TableCell(
                           child: new DropdownButton(
                             hint: new Text("automatische Wahl"),
                             items: GetUStMenuItems(),
                             onChanged: null,
                           ),
                         ),
                       ]
                   ),

                   //OP-Ausgleichsinfo
                   new TableRow(
                       children: <TableCell>[
                         TableCell(
                           child: Align(
                               alignment: Alignment.centerLeft ,
                               child: Text("OP-Ausgleichsinfo: ")),
                           verticalAlignment: TableCellVerticalAlignment.middle,
                         ),
                         TableCell(
                           child: new DropdownButton(
                             hint: new Text("automatische Wahl"),
                             items:  new List<DropdownMenuItem>(),
                             onChanged: null,
                           ),
                         ),
                       ]
                   ),
                   ],
                  ),
                  //Speicher Button
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new MaterialButton(
                        onPressed: () {
                          if(_formKey.currentState.validate())
                            saveTransaktion(context);
                        },
                        child: new Text("Speichern"),
                        color: Colors.pink,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    datumController.dispose();
    belegnummerController.dispose();
    betragController.dispose();
    kontoController.dispose();
    kostenstellenController.dispose();
    kostenTraegerController.dispose();
    umsatzsteuerController.dispose();
    buchungstextController.dispose();
    ausgleichsinfoController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem> GetKontoValues() {
    List<DropdownMenuItem> list = new List();
    list.add(new DropdownMenuItem<String>(
      child: new Text("1360 Bareinlage"),
      value: "1360 Bareinlage",
    ));
    list.add(new DropdownMenuItem(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("4530 Tanken"),
          new Text(
            "Kostenstelle: 180 Kostenträger: 2010",
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
      value: "4530 Tanken",
    ));
    list.add(new DropdownMenuItem<String>(
      child: new Text("4570 Parkgebühren"),
      value: "4570 Parkgebühren",
    ));
    list.add(new DropdownMenuItem<String>(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("4600 Werbekosten"),
          new Text(
            "Kostenstelle: Allgemeine sonst. Kosten 1",
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
      value: "4600 Werbekosten",
    ));
    list.add(new DropdownMenuItem<String>(
      child: new Text("4640 Repräsentationskosten"),
      value: "4640 Repräsentationskosten",
    ));
    list.add(new DropdownMenuItem<String>(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("4651 Bewirtung"),
          new Text(
            "USt: 7% USt/7% VSt",
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
      value: "4651 Bewirtung USt: 7%",
    ));
    list.add(new DropdownMenuItem<String>(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("4651 Bewirtung"),
          new Text(
            "USt: 19% USt/19% VSt",
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
      value: "4651 Bewirtung USt: 19%",
    ));
    list.add(new DropdownMenuItem<String>(child: new Text("4653 Aufmerksamkeiten"), value: "4653 Aufmerksamkeiten",));

    return list;
  }

  List<DropdownMenuItem> GetKostenstellenValues() {
    List<DropdownMenuItem> list = new List();
    list.add(new DropdownMenuItem<String>(
        child: new Text("180 Fuhrpark"), value: "180 Fuhrpark"));

    list.add(new DropdownMenuItem<String>(
        child: new Text("160 Allgemeine sonst. Kosten 1"),
        value: "160 Allgemeine sonst. Kosten 1"));

    return list;
  }

  List<DropdownMenuItem> GetKostentraegerItems() {
    List<DropdownMenuItem> list = new List();
    list.add(new DropdownMenuItem(
      child: new Text("2010 Allgemeine Kosten 1"),
      value: new Text("2010 Allgemeine Kosten 1"),
    ));
    return list;
  }

  List<DropdownMenuItem> GetUStMenuItems() {
    List<DropdownMenuItem> list = new List();
    list.add(new DropdownMenuItem(
      child: new Text("8 7% USt/7% VSt"),
      value: "8 7% USt/7% VSt",
    ));
    list.add(new DropdownMenuItem(
      child: new Text("9 19% USt/19% VSt"),
      value: "8 19% USt/19% VSt",
    ));

    return list;
  }

  saveTransaktion(BuildContext context) {
    Transaktion t = new Transaktion(
        datumController.text,
        belegnummerController.text,
        betragController.text + "€",
        kontoController.text,
        umsatzsteuerController.text,
        kostenstellenController.text,
        kostenTraegerController.text,
        buchungstextController.text,
        false,
        betragController.text.startsWith('-') ? false:true,
    );
    Navigator.of(context).pop(t);
  }
}
