import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pro_health/ui/utilities/Constant.dart';

class News extends StatefulWidget {
  static String tag = 'News';
  @override
  NewsState createState() => new NewsState();
}

class NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar
          (
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('News Updates', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
        ),
        body: Container(),
    );
  }
}