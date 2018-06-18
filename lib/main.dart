import 'package:flutter/material.dart';
import 'package:kassenbuch_app/LoginPage.dart';

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
      home: new LoginPage(title: 'Service Portal Mandanten'),
    );
  }
}


