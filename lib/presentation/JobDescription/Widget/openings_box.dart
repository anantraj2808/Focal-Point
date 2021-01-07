import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget openingsBox(String numberOfOpenings){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
    height: 25.0,
    width: 80.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: DARK_BLUE
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegularTextMed(numberOfOpenings, 14.0, WHITE),
        RegularTextReg(numberOfOpenings == "1" ? " Opening" : " Openings", 14.0, WHITE)
      ],
    ),
  );
}