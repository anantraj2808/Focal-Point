import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: Container(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Image.asset("assets/images/logo.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
