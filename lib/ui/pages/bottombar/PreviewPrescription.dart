import 'package:flutter/material.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class PreviewPrescription extends StatefulWidget {
  static String tag = 'PreviewPrescription';
  @override
  PreviewPrescriptionState createState() => new PreviewPrescriptionState();
}

class PreviewPrescriptionState extends State<PreviewPrescription> {

  final doctorInfo = Card(
    borderOnForeground: true,
    color: kTextLightColor,
    elevation: 10,
      child: Row(
        children: [
          Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.0, top: 10.0, right: 0.0, bottom: 5.0),
                          child: Text(
                            'Dr. Umme Salma', textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'Segoe', fontSize: 14, color: kTitleTextColor),
                          ),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            'MBBS, BCS (Health)', textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                          ),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            'FCPS (Obs & Gynae)', textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                          ),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            'Consultant (Gynae and High Risk Pregnancy)', textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                          ),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            'Consultation Fees', textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'Segoe', color: kTitleTextColor),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),

          SizedBox(
            child: Container(
              width: 70,
              height: 90,
              color: kShadowColor,
              padding: EdgeInsets.only(top: 8.0, left: 2.0, bottom: 2.0, right: 2.0),
              child: Card(
                color: Colors.white,
                elevation: 1.0,
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      //leading: Icon(Icons.receipt_long, color: Colors.white, size: 50),
                      title: Icon(Icons.qr_code, size: 40,),
                      subtitle: Text('A12S568',
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 8.0, color: Colors.black87), textAlign: TextAlign.justify,),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0, top: 10.0, right: 0.0, bottom: 5.0),
                        child: Text(
                          'Dr. Umme Salma', textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Segoe', fontSize: 14, color: kTitleTextColor),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'MBBS, BCS (Health)', textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'FCPS (Obs & Gynae)', textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Consultant (Gynae and High Risk Pregnancy)', textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Consultation Fees', textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Segoe', color: kTitleTextColor),
                        ),
                      )
                  ),
                ],
              ),
            ],
          )
        ],
      ),
  );

  final patientInfo = Card(
    borderOnForeground: true,
    color: kWhiteShadow,
    elevation: 3,
    child: Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 5.0),
                      child: Text(
                        'Dr. Umme Salma', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 14, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'MBBS, BCS (Health)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'FCPS (Obs & Gynae)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 10.0, right: 0.0, bottom: 5.0),
                      child: Text(
                        'Dr. Umme Salma', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 14, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'MBBS, BCS (Health)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'FCPS (Obs & Gynae)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 10.0, right: 0.0, bottom: 5.0),
                      child: Text(
                        'Dr. Umme Salma', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 14, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'MBBS, BCS (Health)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        'FCPS (Obs & Gynae)', textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Segoe', fontSize: 10, color: kTitleTextColor),
                      ),
                    )
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );

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
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: PopupMenuButton(
              icon: Container(
                  child: IconButton(icon: Icon(Icons.share, color: Colors.indigo,),
                    onPressed: () {  },
                  ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: kWhiteShade,
                    width: 0.8,
                  ),
                ),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String> (
                    value: 'Save Locally',
                    child: Text('Save Locally'),
                  ),
                  PopupMenuItem<String> (
                    value: 'Share to Media',
                    child: Text('Share to Media'),
                  ),
                  PopupMenuItem<String> (
                    value: 'Share to 1',
                    child: Text('Share to 1'),
                  ),
                  PopupMenuItem<String> (
                    value: 'Sending by email',
                    child: Text('Sending by email'),
                  ),
                ];
              },
            ),
          )
        ],
        title: Text('Preview Prescription',
            style: TextStyle(fontFamily:'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
      ),
      body: Center(
        child: ListView(
          children: <Widget> [
            SizedBox(height: 10,),
            doctorInfo,
            patientInfo,
          ],
        ),
      ),
    );
  }
}