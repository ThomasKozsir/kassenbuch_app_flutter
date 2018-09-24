import 'package:flutter/material.dart';

class KassensturzWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new KassensturzWidgetState();
  }
}

class KassensturzWidgetState extends State<KassensturzWidget> {
  double sum = 0.0, saldo = 100.0, delta = 0.0;
  TextEditingController
  countFiveHundred = new TextEditingController(),
      countTwoHundred = new TextEditingController(),
      countOnehundred = new TextEditingController(),
      countFifty = new TextEditingController(),
      countTwenty = new TextEditingController(),
      countTen = new TextEditingController(),
      countFive = new TextEditingController(),
      countTwo = new TextEditingController(),
      countOne = new TextEditingController(),
      countFiftyCent = new TextEditingController(),
      countTwentyCent = new TextEditingController(),
      countTenCent = new TextEditingController(),
      countFiveCent = new TextEditingController(),
      countTwoCent = new TextEditingController(),
      countOneCent = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    SetListeners();
    CalculateCashSum();


    return ListView(
      children: <Widget>[
        //header Kassensturz
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: new Text(
              "Kassensturz",
              style: new TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        new Divider(height: 2.0, color: Colors.black),

        //header cash areas
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Expanded(child: Center(child: new Text("Scheine"))),
              Expanded(child: Center(child: new Text("Münzen")))
            ],
          ),
        ),
        //cash area (paper money container left, coins right)
        Row(
          children: <Widget>[
            //paper money
            Expanded(
              child: Center(
                child: new Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Table(
                          children: <TableRow>[
                            //500€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: new Text(
                                "500 € x ",
                                textAlign: TextAlign.center,
                              )),
                              TableCell(
                                  child: new TextField(
                                    keyboardType: TextInputType.number,
                                    controller: countFiveHundred,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                              )),
                            ]),
                            //200€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "200 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: countTwoHundred,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                            //100€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "100 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,

                                      controller: countOnehundred,
                                textAlign:
                                TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                            //50€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "50 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,

                                      controller: countFifty,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                            //20€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "20 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,

                                      controller: countTwenty,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                            //10€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "10 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,

                                      controller: countTen,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                            //5€
                            new TableRow(children: <Widget>[
                              TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: new Text(
                                "5 € x ",
                                textAlign: TextAlign.center,
                              ))),
                              TableCell(
                                  child: new TextField(
                                      keyboardType: TextInputType.number,

                                      controller: countFive,
                                textAlign: TextAlign.center,
                                      style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                  )),
                            ]),
                          ],

                        ),
                      ),
                      //sum info
                    ],
                  ),
                ),
              ),
            ),
            //coin money
            Expanded(
                child: Center(
                  child: new Container(
              child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Table(
                        children: <TableRow>[
                          //2€
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "2 € x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countTwo,
                                  textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)
                                )),
                          ]),
                          //1€
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "1 € x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countOne,
                                  textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]),
                          //50 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "50 Cent x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countFiftyCent,
                                  textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]),
                          //20 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "20 Cent x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countTwentyCent,
                                  textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]),
                          //10 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "10 Cent x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countTenCent,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]),
                          //5 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "5 Cent x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countFiveCent,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]),
                          //2 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "2 Cent x ",
                                      textAlign: TextAlign.center,
                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countTwoCent,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]
                          ),
                          //1 Cent
                          new TableRow(children: <Widget>[
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(
                                    child: new Text(
                                      "1 Cent x ",
                                      textAlign: TextAlign.center,

                                    ))),
                            TableCell(
                                child: new TextField(
                                    keyboardType: TextInputType.number,

                                    controller: countOneCent,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12.0, color: Colors.black)

                                )),
                          ]
                          ),
                        ],
                      ),
                    ),
                  ],
              ),
            ),
                ))
          ],
        ),
        //sum
        new Container(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: new Table(children: <TableRow>[
                  //sum
                  new TableRow(children: <Widget>[
                    TableCell(child: new Text("Gesamtsumme: ")),
                    TableCell(
                      child: new Text(
                          sum.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  //saldo
                  new TableRow(children: <Widget>[
                    new TableCell(child: new Text("Saldo Kassenbuch: ")),
                    new TableCell(child: new Text(saldo.toString())),
                  ]),
                  new TableRow(children: <Widget>[
                    new TableCell(child: new Text("Differenz")),
                    new TableCell(
                        child:
                            new Text(delta.toString())),
                  ])
                ]),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose(){
    countFiveHundred.dispose();
    countTwoHundred.dispose();
    countOnehundred.dispose();
    countFifty.dispose();
    countTwenty.dispose();
    countTen.dispose();
    countFive.dispose();
    countTwo.dispose();
    countOne.dispose();
    countFiftyCent.dispose();
    countTwentyCent.dispose();
    countTenCent.dispose();
    countFiveCent.dispose();
    countTwoCent.dispose();
    countOneCent.dispose();

    countFiveHundred.removeListener(_displayChanges);
    countTwoHundred.removeListener(_displayChanges);
    countOnehundred.removeListener(_displayChanges);
    countFifty.removeListener(_displayChanges);
    countTwenty.removeListener(_displayChanges);
    countTen.removeListener(_displayChanges);
    countFive.removeListener(_displayChanges);
    countTwo.removeListener(_displayChanges);
    countOne.removeListener(_displayChanges);
    countFiftyCent.removeListener(_displayChanges);
    countTwentyCent.removeListener(_displayChanges);
    countTenCent.removeListener(_displayChanges);
    countFiveCent.removeListener(_displayChanges);
    countTwoCent.removeListener(_displayChanges);
    countOneCent.removeListener(_displayChanges);

    super.dispose();
  }

  ///returns the sum of the money in the cash register
  void CalculateCashSum() {
    setState(() {
      sum =
      //paper money
      (double.tryParse(countFiveHundred.text)  ?? 0)* 500
          + (double.tryParse(countTwoHundred.text) ?? 0) * 200
          + (double.tryParse(countOnehundred.text)  ?? 0) * 100
          + (double.tryParse(countFifty.text)  ?? 0) * 50
          + (double.tryParse(countTwenty.text)  ?? 0) * 20
          + (double.tryParse(countTen.text)  ?? 0) * 10
          + (double.tryParse(countFive.text)  ?? 0) * 5

          //coins
          + (double.tryParse(countTwo.text) ?? 0) * 2
          + (double.tryParse(countOne.text) ?? 0) * 1
          + (double.tryParse(countFiftyCent.text) ?? 0)  * 0.5
          + (double.tryParse(countTwentyCent.text)  ?? 0) * 0.2
          + (double.tryParse(countTenCent.text)  ?? 0) * 0.1
          + (double.tryParse(countFiveCent.text)  ?? 0) * 0.05
          + (double.tryParse(countTwoCent.text)  ?? 0) * 0.02
          + (double.tryParse(countOneCent.text)  ?? 0) * 0.01
      ;
    });
  }

  void CalculateDeltaSumMinusSaldo() {
    setState((){
      delta = sum - saldo;
    });
  }

  void _displayChanges(){
    CalculateCashSum();
    CalculateDeltaSumMinusSaldo();
  }

  void SetListeners(){
    countFiveHundred.addListener(_displayChanges);
    countTwoHundred.addListener(_displayChanges);
    countOnehundred.addListener(_displayChanges);
    countFifty.addListener(_displayChanges);
    countTwenty.addListener(_displayChanges);
    countTen.addListener(_displayChanges);
    countFive.addListener(_displayChanges);
    countTwo.addListener(_displayChanges);
    countOne.addListener(_displayChanges);
    countFiftyCent.addListener(_displayChanges);
    countTwentyCent.addListener(_displayChanges);
    countTenCent.addListener(_displayChanges);
    countFiveCent.addListener(_displayChanges);
    countTwoCent.addListener(_displayChanges);
    countOneCent.addListener(_displayChanges);
  }
}
