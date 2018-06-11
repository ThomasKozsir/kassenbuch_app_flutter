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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //email
                new Row(
                    children: <Widget>[
                      new Text("E-Mail:"),
                      new Expanded(child:
                      new TextField(keyboardType: TextInputType.emailAddress)
                      )
                    ]
                ),
                //password
                new Row(
                  children: <Widget>[
                    new Text("Passwort:"),
                    new Expanded(child: new TextField(obscureText: true))
                  ],
                ),
                //login button
                new Row(
                  children: <Widget>[
                    new RaisedButton(
                      color: Colors.pinkAccent,
                      child: new Text("Anmelden", style: new TextStyle(color: Colors.white)),
                      onPressed: ()=>{
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Overview()))
                      }
                    )
                  ]
                )
              ],
            ),
          ),
        )
    );
  }

}