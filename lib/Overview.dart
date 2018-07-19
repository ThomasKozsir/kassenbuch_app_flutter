import 'package:flutter/material.dart';
import 'package:kassenbuch_app/Widgets/DrawerDivider.dart';
import 'package:kassenbuch_app/Widgets/NewsWidget.dart';
import 'package:kassenbuch_app/Widgets/OverviewDrawerItem.dart';
import 'package:kassenbuch_app/Widgets/UnderlinedHeadline.dart';

class Overview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OverviewState();
  }
}

class OverviewState extends State<Overview> {
  List<NewsWidget> _newsList;

  @override
  Widget build(BuildContext context) {
    _newsList = new List<NewsWidget>();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Übersicht"),
      ),
      drawer: new Drawer(
          child: DecoratedBox(
        decoration: new BoxDecoration(
          color: new Color.fromARGB(255, 57, 57, 57),
        ),
        child: ListView(
          children: <Widget>[
            new Container(
              child: new DrawerHeader(
                  child: new Image.asset(
                "assets/icon.png",
                fit: BoxFit.scaleDown,
              )),
            ),

            new DrawerDivider(),
            new OverviewDrawerItem(
                new AssetImage("assets/home_icon.png"), "Übersicht", "/Übersicht"),
            new OverviewDrawerItem(
                new AssetImage("assets/euro_icon.png"), "Web-Kassenbuch", "/Kassenbuch"),
            new OverviewDrawerItem(
                new AssetImage("assets/help_icon.png"), "Hilfe & Support", "/Hilfe"),
            new DrawerDivider(),

            new OverviewDrawerItem(
                new AssetImage("assets/logout_icon.png"), "Abmelden", "/Login"),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Ihre Kanzlei:", style: new TextStyle(color: Colors.grey),),
                  new Text("Projektarbeiten WS17", style: new TextStyle(color: Colors.white),),
                  new Text("Angemeldet als:", style: new TextStyle(color: Colors.grey),),
                  new Text("Max Mustermann", style: new TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: new Column(
          children: <Widget>[
            new UnderlinedHeadline(
              "Willkommen im Mandanten-Bereich des Simba Portals!",
              fontSize: 14.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: new Text(
                  "Wir begrüßen Sie herzlich im Namen Ihrer Kanzlei.\n\nViel Erfolg und viel Freude bei der Anwendung Ihres neuen Web-Kassenbuchs!"),
            ),
            new UnderlinedHeadline("Erste Schritte Web-Kassenbuch",
                fontSize: 14.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: new Text(
                  "Wählen Sie links im Menu das Web-Kassenbuch, um mit der Erfassung Ihrer Kassenbewegungen zu beginnen. Web-Kassenbücher werden für Sie von Ihrer Kanzlei abgelegt und verwaltet."),
            ),
            new SizedBox(
              height: 250.0,
              child: new PageView(
                scrollDirection: Axis.horizontal,
                children: GetNewsList(_newsList),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> GetNewsList(List<NewsWidget> newsList) {
    newsList.add(new NewsWidget(
        "März 2018",
        "Web-Kassenbuch: Neues Druck Layout",
        "Für das Web-Kassenbuch steht nun ein weiteres Druck-Layout mit mehr Details zur Verfügung."));
    newsList.add(new NewsWidget("Januar 2018", "Web-Kassenbuch: Belege als JPG",
        "Belege können nun auch als JPG an Kassen-Bewegungen angehängt werden. Es erfolgt eine automatische Umwandlung in ein PDF-Dokument."));
    newsList.add(new NewsWidget(
        "Dezember 2017",
        "Rollout: Neues Web-Kassenbuch ohne Silverlight",
        "Ab sofort steht das neue Web-Kassenbuch für alle Nutzer bereit. Mit der ansprechenden und komplett neu gestalteten, auf HTML5 basierenden Oberfläche, entfällt die Notwendigkeit des Silverlight-Plugins und es werden alle modernen Web-Browser wie Edge, Chrome und Firefox unterstützt. Neue Mindestversion des Internet Explorers ist in Zukunft Version 11. Auch der Zugriff mit Tablets ist nun möglich."));
    newsList.add(new NewsWidget("November 2017", "Aktuelles GoBD-Testat",
        "Das neue Web-Kassenbuch wurde am 24. November 2017 als GoBD-konform zertifiziert. Das aktuelle Testat finden Sie unter www.simba.de im geschützten Kundenbereich Downloads Software-Testate."));
    return newsList;
  }
}
