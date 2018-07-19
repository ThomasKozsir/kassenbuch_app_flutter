import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Overview.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
          child:
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: ListView(
              children: <Widget>[
                new Image(
                    image: new AssetImage("assets/icon.png"),
                    alignment: Alignment.topLeft,
                  fit: BoxFit.scaleDown,
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      hintText: "Email Adresse eingeben",
                      labelText: "E-Mail",
                    ),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: true,
                    hintText: "Passwort eingeben",
                    labelText: "Passwort",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new RaisedButton(
                    color: Colors.pinkAccent,
                    child: new Text("Anmelden", style: new TextStyle(color: Colors.white)),
                    onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => new Overview()));
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}