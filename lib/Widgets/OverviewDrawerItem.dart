import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class OverviewDrawerItem extends StatelessWidget{
  AssetImage _assetImage;
  String _title;
  String _nextPage;

  OverviewDrawerItem(this._assetImage, this._title, this._nextPage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new GestureDetector(
        onTap: (){
          if(_nextPage != "/Login")
            Navigator.pushNamed(context, _nextPage);
          else{
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: new Image(
                  image: _assetImage,
                  color: Colors.white,
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 15.0),
                child: new Text(
                    _title,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
  
}