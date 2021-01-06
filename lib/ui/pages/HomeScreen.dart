import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_health/ui/pages/LoginPage.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  static String tag = 'HomeScreen';
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final homeScreenLogo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 75.0,
        child: Image.asset('assets/prohealthlogo.png'),
      ),
    );

    final signInDoctorCard = Padding(
      padding: EdgeInsets.only(left: 22, top: 0.0, right: 22.0, bottom: 0.0),
      child:
      Container(
        width: 300,
        height: 75,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
          color: kDashBoxColor,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                //leading: Icon(Icons.person_add_sharp, color: Colors.white, size: 40),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 28.0,
                  backgroundImage: AssetImage('assets/doctor.png'), // no matter how big it is, it won't overflow
                ),
                title: Text('Sign In as Doctor',
                  style: TextStyle(fontFamily: 'Segoe', fontStyle: FontStyle.italic, fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text('Connect with our doctors community using phone, tablet or computer.',
                  style: TextStyle(fontFamily: 'Segoe', fontStyle: FontStyle.italic, color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(LoginPage.tag);
          },
        ),
      ),
    );

    final signInPatientCard = Padding(
      padding: EdgeInsets.only(left: 22.0, top: 0.0, right: 22.0, bottom: 0.0),
      child:
      Container(
        width: 300,
        height: 75,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
          color: kDashBoxColor,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                //leading: Icon(Icons.wheelchair_pickup, color: Colors.white, size: 40),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 28.0,
                  backgroundImage: AssetImage('assets/patient.png'), // no matter how big it is, it won't overflow
                ),
                title: Text('Sign In as Patient',
                  style: TextStyle(fontFamily: 'Segoe', fontStyle: FontStyle.italic, fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w700), textAlign: TextAlign.left,
                ),
                subtitle: Text('Just like a clinic visit, our doctors listen to your history of symptoms and diagnose your condition.',
                  style: TextStyle(fontFamily: 'Segoe', fontStyle: FontStyle.italic, color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('');
          },
        ),
      ),
    );

    final sponsorTitle = Container(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
      child: Text(
        'SPONSORED BY', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 12.0, color: kTextLightColor, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
      ),
    );

    final sponsorLogo = Container(
      width: 70,
      height: 60,
      child: Image.asset('assets/sponsor.png'),
    );

    final developedByTitle = Container(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
      child: Text(
        'DEVELOPED BY', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe',fontSize: 12.0, color: kTextLightColor, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
      ),
    );

    final developedByLogo = Container(
      width: 100,
      height: 60,
      child: Image.asset('assets/pharmalogo.png'),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Expanded(
         child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 90.0),
            homeScreenLogo,
            SizedBox(height: 50.0),
            signInDoctorCard,
            SizedBox(height: 15.0),
            signInPatientCard,
            SizedBox(height: 30.0,),
            sponsorTitle,
            sponsorLogo,
            SizedBox(height: 15.0,),
            developedByTitle,
            developedByLogo,
            //forgotLabel,
            //SignInWithFB,
            //SocialLogin,
            //SignUp
          ],
        ),
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