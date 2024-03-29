import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_health/ui/utilities/Constant.dart';
import 'package:pro_health/ui/pages/OtpScreen.dart';

const BaseColor = Color(0xff10218B);

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  static String tag = 'LoginPage';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: Image.asset('assets/logo-icon.png'),
      ),
    );

    final logoTitle = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
      child: Text(
        'Complete Healthcare Solutions in your pocket', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'RobotoMono', fontSize: 12.0, color: kBodyTextColor, fontWeight: FontWeight.w400),
      ),
    );

    final name = TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      keyboardType: TextInputType.text,
      validator: numberValidator,
      autofocus: false,
      initialValue: '',
      style: TextStyle(fontFamily:"Segoe", fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.person),
      ),
    );

    final mobile = TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(11)],
      keyboardType: TextInputType.number,
      validator: numberValidator,
      autofocus: false,
      initialValue: '',
      style: TextStyle(fontFamily:"Segoe", fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Phone Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.phonelink_lock_rounded),
      ),
    );

    final bmdc = TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(11)],
      keyboardType: TextInputType.streetAddress,
      validator: numberValidator,
      autofocus: false,
      initialValue: '',
      style: TextStyle(fontFamily:"Segoe", fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        hintText: 'BMDC Registration No.',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.app_registration),
      ),
    );

    final email = TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(40)],
      keyboardType: TextInputType.emailAddress,
      validator: numberValidator,
      autofocus: false,
      initialValue: '',
      style: TextStyle(fontFamily:"Segoe", fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        hintText: 'E-mail Address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.email),
      ),
    );

    final accountValidation = Padding(
      padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 15.0),
      child: Text(
        'Paid Version: 365 days', textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Segoe', fontSize: 15.0, color: kBodyTextColor, fontWeight: FontWeight.w500),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(OtpScreen.tag);
        },
        padding: EdgeInsets.all(8),
        color: kDashBoxColor,
        child: Text('Get OTP', style: TextStyle(fontFamily: "Poppins-Bold", fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 2.0),
            logoTitle,
            SizedBox(height: 30.0),
            name,
            SizedBox(height: 8.0,),
            mobile,
            SizedBox(height: 8.0),
            bmdc,
            SizedBox(height: 8.0,),
            email,
            SizedBox(height: 18.0,),
            accountValidation,
            // password,
            SizedBox(height: 5.0),
            loginButton,
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