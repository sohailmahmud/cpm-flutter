import 'package:flutter/material.dart';

class OnlineConsultancy extends StatefulWidget {
  static String tag = 'OnlineConsultancy';
  @override
  OnlineConsultancyState createState() => new OnlineConsultancyState();
}

class OnlineConsultancyState extends State<OnlineConsultancy> {

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
        title: Text('Emergency Online Consultancy', style: TextStyle(fontFamily:'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 20),
         Center(
           child: Container(
            width: 80.00,
            height: 80.00,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage('assets/onlineconsultancy.png'),
                  fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}