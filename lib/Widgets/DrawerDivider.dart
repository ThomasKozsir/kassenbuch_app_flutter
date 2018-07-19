import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
      child: new Divider(
        color: Colors.white,
      ),
    );
  }

}