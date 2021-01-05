import 'package:flutter/material.dart';

class PharmaUpdates extends StatefulWidget {
  static String tag = 'PharmaUpdates';
  @override
  PharmaUpdatesState createState() => new PharmaUpdatesState();

}

class PharmaUpdatesState extends State<PharmaUpdates> {

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.teal,
        centerTitle: true,
        title: Text('Pharma Updates', style: TextStyle(fontFamily: 'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0)),
      ),
        body: Container(),
    );
  }
}