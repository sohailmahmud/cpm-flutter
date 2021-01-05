import 'package:flutter/material.dart';

class ConsultationHistory extends StatefulWidget {
  static String tag = 'ConsultationHistory';
  @override
  ConsultationHistoryState createState() => new ConsultationHistoryState();
}

class ConsultationHistoryState extends State<ConsultationHistory> {

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
        title: Text('Consultation History', style: TextStyle(fontFamily:'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0),),
      ),
      body: Container(

      ),
    );
  }


}