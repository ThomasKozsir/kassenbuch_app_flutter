import 'package:flutter/material.dart';
import 'package:kassenbuch_app/KassenBewegungen.dart';
import 'package:kassenbuch_app/KassenbuchPage.dart';
import 'package:kassenbuch_app/LoginPage.dart';
import 'package:kassenbuch_app/NeueTransaktionsPage.dart';
import 'package:kassenbuch_app/Overview.dart';

void main() => runApp(new KassenbuchApp());

class KassenbuchApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kassenbuch App',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        accentColor: Colors.white,
      ),
      home: new LoginPage(title: 'Login'),
      routes: <String, WidgetBuilder>{
        '/Übersicht': (_)=> new Overview(),
        '/Login': (_)=> new LoginPage(),
        '/Kassenbuch':(_)=> new KassenbuchPage(),
        '/KassenBewegungen': (_)=> new KassenBewegungen("Standart Kasse"),
        '/NeueTransaktionsPage': (_)=> new NeueTransaktionsPage(),
      },
    );
  }
}


