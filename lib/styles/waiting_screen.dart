import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';

Widget waitingObject(){
  return Center(
    child: Container(
      height: 100.0,
      width: 100.0,
      child: Stack(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/circular_logo.png"),
          ),
          SizedBox(
            height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(DARK_BLUE),))
        ],
      )
    ),
  );
}