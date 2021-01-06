import 'package:flutter/material.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class PharmaUpdates extends StatefulWidget {
  static String tag = 'PharmaUpdates';
  @override
  PharmaUpdatesState createState() => new PharmaUpdatesState();

}

class PharmaUpdatesState extends State<PharmaUpdates> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        shape: RoundedRectangleBorder (
          borderRadius: BorderRadius.vertical (
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 2.0,
        backgroundColor: kBackgroundColor,
        shadowColor: Colors.teal,
        centerTitle: true,
        leading: Container (
          width: 40,
          padding: EdgeInsets.fromLTRB(28.0, 0.0, 0.0, 0.0),
          child: Image.asset('assets/pharmaupdates.png'),
          alignment: Alignment(-3.3, 0),
        ),
        title: Text('Pharma Updates',
            style: TextStyle(fontFamily: 'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0)),
      ),
        backgroundColor: kBackgroundColor,
        body: Container(
        ),
    );
  }
}