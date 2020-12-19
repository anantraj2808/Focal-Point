import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget descriptionItems(String title, String text, int position){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
    child: Column(
      children: [
        Row(
          children: [
            Icon(DESCRIPTION_ICONS[position],size: 20.0,color: DARK_BLUE,),
            Container(
              alignment: Alignment.centerLeft,
              child: RegularTextMed(" "+title + "\:", 20.0, DARK_BLUE),
            ),
          ],
        ),
        SizedBox(height: 5.0,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          alignment: Alignment.centerLeft,
          child: RegularTextReg(text, 16.0, DARK_BLUE),
        )
      ],
    ),
  );
}