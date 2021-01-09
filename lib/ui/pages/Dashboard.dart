import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:pro_health/ui/utilities/Constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'bottombar/Appointments.dart';
import 'bottombar/PharmaUpdates.dart';
import 'bottombar/Home.dart';
import 'bottombar/Prescription.dart';
import 'bottombar/DoctorProfile.dart';

const String _AccountName = 'Prof. Mohammed Hanif';
const String _AccountEmail = 'doctor101@prohealth.com';

class Dashboard extends StatefulWidget {
  static String tag = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 2;
  List<Widget> listWidgets = [Appointments(), PharmaUpdates(), Home(), Prescription(), DoctorProfile()];



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
                onTap: (){Navigator.of(context).pushNamed(Home.tag);},
              ),
              ListTile(
                dense: true,
                title: Text("Patients", style: TextStyle(color: kBaseColor, fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                leading: Icon(Icons.wheelchair_pickup, size: 28, color: kBaseColor),
                onTap: (){},
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

    return Scaffold(
        drawer: drawer,
      appBar: AppBar(
        /*centerTitle: true,
        title: Text('Pro Health', style: TextStyle(color: kBaseColor),),*/
        elevation: 0,
        backgroundColor: kWhiteShade,
        iconTheme: IconThemeData(color: kBaseColor),
        toolbarHeight: 50,
        actions: <Widget>[
          IconBadge(
            icon: Icon(Icons.notifications_active_outlined, color: kBaseColor,),
            itemCount: 50,
            badgeColor: Colors.red,
            itemColor: Colors.white,
            maxCount: 45,
            hideZero: true,
            onTap: () {

            },
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: PopupMenuButton(
              icon: Container(
                child:  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60.0,
                    child: Image.asset('assets/doctorimg.png'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: kBaseColor,
                    width: 0.8,
                  ),
                  boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black, spreadRadius: 0.7)],
                ),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String> (
                    value: 'View Profile',
                    child: Text('View Profile'),
                  ),
                  PopupMenuItem<String> (
                    value: 'Edit Profile',
                    child: Text('Edit Profile'),
                  ),
                ];
              },
            ),
          )
        ],
       ),
      backgroundColor: kBackgroundColor,
      body: listWidgets[selectedIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: kBaseColor,
          color: Colors.white,
          height: 42,
          top: -25,
          curveSize: 85,
          style: TabStyle.reactCircle,
          items: [
            TabItem(icon: Image.asset('assets/appoint.png', scale: 12.0,), title: ''),
            TabItem(icon: Image.asset('assets/blog.png', scale: 12.0,), title: ''),
            TabItem(icon: Image.asset('assets/home.png', scale: 11.0,), title: ''),
            TabItem(icon: Image.asset('assets/rx.png', scale: 15.0,), title: ''),
            TabItem(icon: Image.asset('assets/profile.png', scale: 12.0,), title: ''),
          ],
          initialActiveIndex: selectedIndex,
          activeColor: Colors.white,
          onTap: onItemTapped,
        )
    );
  }
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}