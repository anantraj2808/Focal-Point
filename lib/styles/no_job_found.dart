import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget noJobFound(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 250.0,
        width: 250.0,
        child: Image.asset('assets/images/no_job_found.png'),
      ),
      SizedBox(height: 20.0,),
      RegularTextMedCenter("Nothing found !", 30.0, DARK_BLUE)
    ],
  );
}