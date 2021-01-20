import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pro_health/ui/utilities/Constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'Home.dart';
import 'PharmaUpdates.dart';

const String _AccountName = 'Prof. Mohammed Hanif';
const String _AccountEmail = 'doctor101@prohealth.com';

class DoctorProfile extends StatefulWidget {
  DoctorProfile({Key key, this.title}) : super(key: key);
  final String title;
  static String tag = 'DoctorProfile';

  @override
  DoctorProfileState createState() => new DoctorProfileState();
}

class DoctorProfileState extends State<DoctorProfile> {
  var rating = 4.5;
  double radius = 32;
  double iconSize = 20;
  double distance = 2;

  final format = DateFormat("hh:mm a");

  final values = <bool>[true, false, true, false, true, false, true];

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertElevation: 10,
    alertAlignment: Alignment.topCenter,
  );

  get editDoctor => Alert(
      context: context,
      style: alertStyle,
      title: '',
      content: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 0,),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.only(top: 1, left: 68, bottom: 5, right: 68),
              color: kBaseColor,
              child: Text('Edit Profile Info',
                  style: TextStyle(fontFamily: "Segoe", fontWeight: FontWeight.w700, fontSize: 18, color: kWhiteShade),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('');
              },
            ),
          ),
          SizedBox(height: 15,),
          Container(
            child: Stack(
              alignment: Alignment.center,
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  radius: 58,
                  backgroundColor: kDashBoxColor,
                  child: CircleAvatar(
                    backgroundColor: kWhiteShade,
                    radius: 56,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55.0,
                      child: Image.asset('assets/doctorimg.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: -(iconSize + radius),
                  right: -(radius + iconSize - distance - 40),
                  bottom: iconSize - 95,
                  left: radius + iconSize + 50,
                  child: RawMaterialButton(
                    elevation: 5.0,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                      size: iconSize,
                    ),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(3.0),
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditDoctor()));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Center(
           child: FDottedLine(
            color: kDashBoxColor,
            width: 298.0,
            strokeWidth: 1.0,
            dottedLength: 10.0,
            space: 2.0,
            corner: FDottedLineCorner.all(6.0),
           ),
          ),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Name',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Qualification',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Working Station',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Specialty',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'BMDC No.',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Experience',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Consultations No.',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Consultation Fees',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Follow-Up Fees',
            ),
          ),
          TextField(
            obscureText: false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Chamber Address - 1',
            ),
            maxLines: 25,
            minLines: 2,
            scrollPadding: const EdgeInsets.all(20),
          ),
          TextField(
            obscureText: false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              //icon: Icon(Icons.lock),
              labelText: 'Chamber Address - 2',
            ),
            maxLines: 25,
            minLines: 2,
            scrollPadding: const EdgeInsets.all(20),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.topLeft,
            child: Text('Consultation Day', style: TextStyle(fontSize: 16),),
          ),
          SizedBox(height: 10,),
          WeekdaySelector(
            displayedDays: {
              DateTime.saturday,
              DateTime.sunday,
              DateTime.monday,
              DateTime.tuesday,
              DateTime.wednesday,
              DateTime.thursday,
              DateTime.friday,
            },
            firstDayOfWeek: DateTime.saturday,
            selectedFillColor: kBaseColor,
            onChanged: (v) {
              printIntAsDay(v);
              setState(() {
                values[v % 7] = !values[v % 7];
              });
            },
            selectedElevation: 15,
            elevation: 5,
            disabledElevation: 0,
            values: values,
          ),
          DateTimeField(
            format: format,
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: false),
                    child: child),
              );
              return DateTimeField.convert(time);
            },
            decoration: InputDecoration(
              labelText: 'Consultation Start Time'
            ),
          ),
          DateTimeField(
            format: format,
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: false),
                    child: child),
              );
              return DateTimeField.convert(time);
            },
            decoration: InputDecoration(
                labelText: 'Consultation End Time'
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          width: 275,
          child: Text(
            "Update Info",
            style: TextStyle(color: kWhiteShade, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          padding: EdgeInsets.all(5),
          onPressed: () => Navigator.pop(context),
          color: kDashBoxColor,
          radius: BorderRadius.circular(20),
        )
      ],).show();

  @override
  Widget build(BuildContext context) {

    var drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: kBaseColor,
            ),
            accountName: const Text(_AccountName, style: TextStyle(fontFamily: 'Segoe', fontSize: 16),),
            accountEmail: const Text(_AccountEmail, style: TextStyle(fontFamily: 'Segoe', fontSize: 13),),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundColor: kInfectedColor,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 48.0,
                child: Image.asset('assets/doctorimg.png'),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: kBackgroundColor,
            child: Column(children: <Widget>[
              ListTile(
                dense: true,
                title: Text("Home", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.home, size: 28, color: kBaseColor,),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
                },
              ),
              ListTile(
                dense: true,
                title: Text("Pharma Updates", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.wheelchair_pickup, size: 28, color: kBaseColor),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PharmaUpdates()));
                },
              ),
              ListTile(
                dense: true,
                title: Text("News", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.speaker_notes, size: 28, color: kBaseColor),
                onTap: (){
                  Navigator.pushNamed(context, "/news");
                },
              ),

              ListTile(
                dense: true,
                title: Text("Appointments", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.domain_verification, size: 28, color: kBaseColor),
                onTap: (){
                  Navigator.pushNamed(context, "/appointment");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Settings", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.settings, size: 28, color: kBaseColor),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Profile", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.person, size: 28, color: kBaseColor),
                onTap: (){
                  Navigator.pushNamed(context, "/profile");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Sign Out", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.logout, size: 28, color: kBaseColor),
                onTap: () async {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
              Divider(height: 2, thickness: 1, color: kBaseColor ),
              ListTile(
                dense: true,
                title: Text("Reviews", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.star_half, size: 28, color: kBaseColor,),
                onTap: (){
                  Navigator.pushNamed(context, "/reviews");
                },
              ),
            ],),
          ),
        ],
      ),
    );

    final doctorImg = Center(
      child: Stack(
        alignment: Alignment.center,
        // ignore: deprecated_member_use
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: kDashBoxColor,
            child: CircleAvatar(
              backgroundColor: kWhiteShade,
              radius: 53,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Image.asset('assets/doctorimg.png'),
              ),
            ),
          ),
          Positioned(
              top: -(radius - distance),
              right: -(radius + iconSize + distance),
              bottom: -iconSize - distance - 70,
              left: radius,
              child: Icon(
                Icons.circle,
                color: Colors.green,
                size: iconSize,
              ),
          ),
          Positioned(
              top: -(iconSize + radius),
              right: -(radius + iconSize - distance - 40),
              bottom: iconSize - 40,
              left: radius + iconSize + 38,
              child: RawMaterialButton(
                elevation: 5.0,
                child: Image.asset('assets/edit.png'),
                shape: CircleBorder(),
                fillColor: Colors.white,
                padding: const EdgeInsets.all(3.0),
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditDoctor()));
                  editDoctor;
                },
              ),
          ),
        ],
      ),
    );

    final doctorName = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
      child: Text(
        'Prof. Mohammed Hanif', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kBaseColor, fontWeight: FontWeight.w700),
      ),
    );

    final doctorDegree = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
      child: Text(
        'MBBS, FCPS, FRCP (Edin)', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kBodyTextColor, fontWeight: FontWeight.w600),
      ),
    );

    final doctorWorkPlace = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
      child: Text(
        'Dhaka Shishu Hospital', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
      ),
    );

    final specialtyButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 100),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kDashBoxColor,
        child: Text('Pediatrician', style: TextStyle(fontFamily: "Segoe", fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );

    final bmdcNumber = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
      child: Text(
        'BMDC Registration No. 12568', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
      ),
    );

    final experience = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
      child: Text(
        'Experience: 25 years', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
      ),
    );
    
    final starRating = Center(
      //padding: EdgeInsets.only(left: 0.0),
      child: SmoothStarRating(
          allowHalfRating: false,
          onRated: (v) {
          },
          starCount: 5,
          rating: rating,
          size: 30.0,
          isReadOnly:true,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          color: Colors.amber,
          borderColor: Colors.amber,
          spacing:0.0
      ),
    );

    final consultations = Card(
      borderOnForeground: true,
      color: Color(0xFFE5E4E2),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
           children: [
            Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 5.0),
                  child: Text(
                    '   Consultations Number ', textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
                  ),
                )
            ),
            Container(
                height: 30,
                child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, top: 10.0, right: 0.0, bottom: 5.0),
                child: Text(
                  '54', textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
                    child: Text(
                      '   Consultation Fees (Online)', textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
                    ),
                  )
              ),
              Container(
                  height: 30,
                  child: VerticalDivider(color: Colors.black54, thickness: 0.8,)),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
                  child: Text(
                    ' 1,000 TK.', textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
                    child: Text(
                      '   Consultation Fees (Physical)', textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
                    ),
                  )
              ),
              Container(
                  height: 30,
                  child: VerticalDivider(color: Colors.black54, thickness: 0.8,)),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
                  child: Text(
                    ' 1,500 TK.', textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 15.0),
                    child: Text(
                      '   Follow-up Fees ', textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
                    ),
                  )
              ),
              Container(
                  height: 30,
                  child: VerticalDivider(color: Colors.black54, thickness: 0.8,)),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 15.0),
                  child: Text(
                    ' 500 TK.', textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Segoe', fontSize: 18.0, color: kTextLightColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final chamberAddress1 = Row(
      children: [
        Container(
            child: Padding(
              padding: EdgeInsets.only(left: 7.0, top: 0.0, right: 0.0, bottom: 5.0),
              child: Text(
                'Chamber Address- 1:', textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
              ),
            )
        ),
        Container(
          height: 55,
          child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 5.0),
            child: Text(
              'Popular Diagnostic Centre, Dhanmondi, Dhaka-1209', textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTextLightColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );

    final chamberAddress2 = Row(
      children: [
        Container(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, top: 0.0, right: 0.0, bottom: 0.0),
              child: Text(
                'Chamber Address- 2:', textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
              ),
            )
        ),
        Container(
          height: 55,
          child: VerticalDivider(color: Colors.black54, thickness: 0.8,),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
            child: Text(
              'IBN Sina Diagnostic Centre, Dhanmondi, Dhaka-1209', textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTextLightColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );

    final consultationDay = Row(
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
              child: Text(
                'Consultation Day:', textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
              ),
            )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
            child: Text(
              'Sat - Tuesday', textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'Segoe', fontSize: 16.0, color: kTextLightColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );

    final consultationTime = Row(
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
              child: Text(
                'Consultation Time:', textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Segoe', fontSize: 14.0, color: kTitleTextColor, fontWeight: FontWeight.w600),
              ),
            )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
            child: Text(
              '5.00 PM - 10.00 PM', textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'Segoe', fontSize: 16.0, color: kTextLightColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: kBaseColor,
        shadowColor: Colors.teal,
        iconTheme: IconThemeData(color: kWhiteShade),
        toolbarHeight: 40,
        title: Text('My Profile', style: TextStyle(fontFamily:'Segoe', color: kWhiteShade, fontWeight: FontWeight.w700),),
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 4.0),
            doctorImg,
            SizedBox(height: 4.0),
            const Divider(
              color: kBodyTextColor,
              height: 25,
              thickness: 0.6,
              indent: 0.0,
              endIndent: 0.0,
            ),
            doctorName,
            doctorDegree,
            doctorWorkPlace,
            SizedBox(height: 5,),
            specialtyButton,
            bmdcNumber,
            experience,
            starRating,
            SizedBox(height: 4,),
            consultations,
            SizedBox(height: 8,),
            chamberAddress1,
            FDottedLine(
              color: kBodyTextColor,
              width: 160.0,
              strokeWidth: 0.5,
              dottedLength: 8.0,
              space: 2.0,
            ),
            chamberAddress2,
            SizedBox(height: 10.0,),
            consultationDay,
            SizedBox(height: 2,),
            consultationTime,
            SizedBox(height: 50.0,),
            //forgotLabel,
            //SignInWithFB,
            //SocialLogin,
            //SignUp
          ],
        ),
      ),
    );
  }

  printIntAsDay(int day) {
    print('Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
  }
  String intDayToEnglish(int day) {
    if (day % 7 == DateTime.saturday % 7) return 'Saturday';
    if (day % 7 == DateTime.sunday % 7) return 'Sunday';
    if (day % 7 == DateTime.monday % 7) return 'Monday';
    if (day % 7 == DateTime.tuesday % 7) return 'Tuesday';
    if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
    if (day % 7 == DateTime.thursday % 7) return 'Thursday';
    if (day % 7 == DateTime.friday % 7) return 'Friday';
    throw '🐞 This should never have happened: $day';
  }
}

String numberValidator(String value) {
  if(value == null) {
    return null;
  }
  final n = num.tryParse(value);
  if(n == null) {
    return '"$value" is not a valid number!';
  }
  return null;
}