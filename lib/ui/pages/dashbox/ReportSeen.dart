import 'package:flutter/material.dart';

class ReportSeen extends StatefulWidget {
  static String tag = 'News';
  @override
  ReportSeenState createState() => new ReportSeenState();
}

class ReportSeenState extends State<ReportSeen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Report Seen', style: TextStyle(fontFamily: 'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
      ),
      body: Container(

      ),
    );
  }
}