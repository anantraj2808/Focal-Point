import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: Text("Your Opportunities",style: TextStyle(color: BLACK),),
      ),
    );
  }
}
