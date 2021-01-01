import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_health/ui/pages/dashbox/Earnings.dart';
import 'package:pro_health/ui/pages/dashbox/ConsultationHistory.dart';
import 'package:pro_health/ui/pages/dashbox/OnlineConsultancy.dart';
import 'package:pro_health/ui/pages/dashbox/ReportSeen.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class Home extends StatelessWidget {
  static String tag = 'Home';

  @override
  Widget build(BuildContext context) {

    final dashboardTitle = Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 25.0, right: 15.0),
            child: Text('Hey there,\n'
                'Today will let you choose your specialty and then customize the type of information accordingly.',
              style: TextStyle(fontFamily: 'Segoe', fontSize: 17.0, color: kBaseColor, letterSpacing: 0.0, wordSpacing: 0.05, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );

    final reportSeen = Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.receipt_long, color: Colors.white, size: 50),
                    /*leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40.0,
                            backgroundImage: AssetImage('assets/reports.png'), // no matter how big it is, it won't overflow
                          ),*/
                    title: Text('Report Seen', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
                    //subtitle: Text('Total Report Seen: 400', style: TextStyle(fontFamily: 'Segoe', color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ],
              ),
              onPressed: () {
                //Navigator.of(context).pushNamed('');
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReportSeen()));
              },
            ),
          ),
        ),
      ],
    );

    final emergencyConsult = Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                //Navigator.of(context).pushNamed('');
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => OnlineConsultancy()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.online_prediction, color: Colors.white, size: 50),
                    title: Text('Emergency Online Consultancy', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
                    //subtitle: Text('Total Online Consultancy: 400', style: TextStyle(fontFamily: 'Segoe', color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final accountBalance = Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                //Navigator.of(context).pushNamed(Earnings.tag);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Earnings()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.account_balance_wallet, color: Colors.white, size: 50),
                    title: Text('Net Estimated Earnings', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
                    //subtitle: Text('Total Earnings: ৳40,000.00', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w500, color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final consultationHistory  = Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.history_rounded, color: Colors.white, size: 50),
                    title: Text('Consultation History', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
                    //subtitle: Text('Consultation History: 400', style: TextStyle(fontFamily: 'Segoe', fontWeight: FontWeight.w500, color: Colors.white), textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final cardWithDivider = Row(
      children: [
        Expanded(
         child: Container(
          width: 195,
          height: 132,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0, right: 2.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: kDashBoxColor,
            elevation: 10,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.receipt_long, color: Colors.white, size: 50),
                  title: Text('Report Seen', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                  //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                ),
                // ignore: deprecated_member_use
                /*ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('List of Patients: 500', style: TextStyle(fontFamily: 'Segoe',color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
        Container(
          height: 135,
          child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
        ),
        Expanded(
          child: Container(
            width: 195,
            height: 132,
            padding: EdgeInsets.only(top: 10.0, left: 2.0, bottom: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.domain, color: Colors.white, size: 50),
                    title: Text('Advises', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                    //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final cardWithDivider2 = Row(
      children: [
        Expanded(
          child: Container(
            width: 195,
            height: 132,
            padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0, right: 2.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.receipt_long, color: Colors.white, size: 50),
                    title: Text('Report Seen', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                    //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                  ),
                  // ignore: deprecated_member_use
                  /*ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('List of Patients: 500', style: TextStyle(fontFamily: 'Segoe',color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),*/
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 135,
          child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
        ),
        Expanded(
          child: Container(
            width: 195,
            height: 132,
            padding: EdgeInsets.only( top: 10.0, left: 2.0, bottom: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.domain, color: Colors.white, size: 50),
                    title: Text('Advises', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                    //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final cardWithDivider3 = Row(
      children: [
        Expanded(
          child: Container(
            width: 195,
            height: 132,
            padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0, right: 2.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.receipt_long, color: Colors.white, size: 50),
                    title: Text('Report Seen', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                    //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                  ),
                  // ignore: deprecated_member_use
                  /*ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('List of Patients: 500', style: TextStyle(fontFamily: 'Segoe',color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),*/
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 135,
          child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
        ),
        Expanded(
          child: Container(
            width: 195,
            height: 132,
            padding: EdgeInsets.only( top: 10.0, left: 2.0, bottom: 10.0, right: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: kDashBoxColor,
              elevation: 10,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConsultationHistory()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.domain, color: Colors.white, size: 50),
                    title: Text('Advises', style: TextStyle(fontFamily: 'Segoe', color: Colors.white)),
                    //subtitle: Text('TWICE', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.teal,
        title: Text('Dashboard', style: TextStyle(fontFamily:'Segoe', color: kBaseColor, fontWeight: FontWeight.w700, fontSize: 26.0)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Quick Access', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14.0)),
                Icon(Icons.arrow_drop_down, color: Colors.black54)
              ],
            ),
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        /*width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(7.0),

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            kBackgroundColor,
            kBackgroundColor,
          ]),
        ),*/
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25,),
            //dashboardTitle,
            /*SizedBox(height: 20),
            reportSeen,
            SizedBox(height: 10),
            emergencyConsult,
            SizedBox(height: 10,),
            accountBalance,
            SizedBox(height: 10,),
            consultationHistory,
            SizedBox(height: 10,),
            SizedBox(height: 30,),*/
            cardWithDivider,
            const Divider(
              color: kBodyTextColor,
              height: 0,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            cardWithDivider2,
            const Divider(
              color: kBodyTextColor,
              height: 0,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            cardWithDivider3,
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}