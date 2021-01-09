import 'package:flutter/material.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

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
      body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 80.00,
                  height: 80.00,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/consulthistory.png'),
                        fit: BoxFit.fitHeight,
                      )),
                ),
                /*Text(
                  "Leaderboard",
                  style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                ),*/
              ),
              SizedBox(height: 20),
              _buildName(imageAsset: 'assets/apatient.png', name: "Sohail Mahmud", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 2", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 3", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 4", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 5", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 6", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 7", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 8", id: "pid-001", view: "View Details"),
              _buildName(imageAsset: 'assets/apatient.png', name: "Patient 9", id: "pid-001", view: "View Details"),
              SizedBox(height: 20,),
            ],
          ),
        ),
    );
  }

  Widget _buildName({String imageAsset, String name, String id, String view}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Container(height: 0.8, color: Colors.teal),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imageAsset),
                radius: 30,
                backgroundColor: kShadowColor,
              ),
              SizedBox(width: 10),
              Text(name),
              Spacer(),
              Text(id),
              SizedBox(width: 8),
              RawMaterialButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ),
                fillColor: kWhiteShadow,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("${view}", style: TextStyle(color: kResendBtnColor),),
                onPressed: () {

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}