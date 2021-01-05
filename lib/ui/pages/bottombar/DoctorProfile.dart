import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:pro_health/ui/utilities/Constant.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorProfile extends StatefulWidget {
  DoctorProfile({Key key, this.title}) : super(key: key);
  final String title;
  static String tag = 'DoctorProfile';
  @override
  DoctorProfileState createState() => new DoctorProfileState();
}

class DoctorProfileState extends State<DoctorProfile> {
  var rating = 4.5;
  double radius = 40;
  double iconSize = 24;
  double distance = 2;

  @override
  Widget build(BuildContext context) {

    final editProfile = Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('s');
        },
        padding: EdgeInsets.all(12),
        color: kDashBoxColor,
        child: Text('My Profile', style: TextStyle(fontFamily: "Segoe", fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white)),
      ),
    );

    final doctorImg = Center(
      child: Stack(
        alignment: Alignment.center,
        // ignore: deprecated_member_use
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            radius: 65,
            backgroundColor: kDashBoxColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 61.0,
              child: Image.asset('assets/doctorimg.png'),
            ),
          ),
          Positioned(
              top: -(radius - distance),
              right: -(radius + iconSize + distance),
              bottom: -iconSize - distance - 85,
              left: radius,
              child: Icon(
                Icons.circle,
                color: Colors.green,
                size: iconSize,
              )),
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
      color: kWhiteShade,
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
                child: VerticalDivider(color: Colors.black54, thickness: 0.8,)),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 5.0),
                child: Text(
                  ' CN-1234', textAlign: TextAlign.center,
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
                      '   Consultation Fees ', textAlign: TextAlign.center,
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
                    padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
                    child: Text(
                      '   Follow-up Fees ', textAlign: TextAlign.center,
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
                  padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
                  child: Text(
                    ' 1,000 TK.', textAlign: TextAlign.center,
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
              'Sat-Tuesday', textAlign: TextAlign.left,
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
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            editProfile,
            SizedBox(height: 6.0),
            doctorImg,
            SizedBox(height: 6.0),
            doctorName,
            doctorDegree,
            doctorWorkPlace,
            SizedBox(height: 5,),
            specialtyButton,
            bmdcNumber,
            experience,
            starRating,
            const Divider(
              color: kBodyTextColor,
              height: 20,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
            consultations,
            const Divider(
              color: kBodyTextColor,
              height: 20,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
            chamberAddress1,
            FDottedLine(
              color: kBodyTextColor,
              width: 160.0,
              strokeWidth: 0.5,
              dottedLength: 8.0,
              space: 2.0,
            ),
            chamberAddress2,
            const Divider(
              color: kBodyTextColor,
              height: 20,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
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