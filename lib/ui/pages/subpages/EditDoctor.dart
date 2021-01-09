import 'package:flutter/material.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class EditDoctor extends StatefulWidget {
  static String tag = 'EditDoctor';
  @override
  EditDoctorState createState() => new EditDoctorState();

}

class EditDoctorState extends State<EditDoctor> {

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
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Edit Doctor Profile',
            style: TextStyle(fontFamily: 'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.0)),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
      ),
    );
  }
}