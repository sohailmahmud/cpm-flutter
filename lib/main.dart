import 'package:flutter/material.dart';
import 'package:pro_health/ui/pages/Dashboard.dart';
import 'package:pro_health/ui/pages/LoginPage.dart';
import 'package:pro_health/ui/pages/OtpScreen.dart';
import 'package:pro_health/ui/pages/HomeScreen.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomeScreen.tag: (context) => HomeScreen(),
    LoginPage.tag: (context) => LoginPage(),
    OtpScreen.tag: (context) => OtpScreen(mobileno: '',),
    Dashboard.tag: (context) => Dashboard(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: kBaseColor,
        fontFamily: 'RobotoMono',
      ),
      home: HomeScreen(),
      routes: routes,
    );
  }
}