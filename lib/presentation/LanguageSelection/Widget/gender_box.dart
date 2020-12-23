import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget genderBox(String gender, String iconPath, Users userProvider){
  return GestureDetector(
    onTap: (){
      userProvider.setGender(gender);
    },
    child: Container(
      padding: EdgeInsets.all(5.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: userProvider.gender != gender ? WHITE :
        gender == "Male" ? LIGHT_BLUE : LIGHT_PINK,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Image.asset(iconPath,height: 50.0,),
          SizedBox(height: 10.0,),
          RegularTextReg(gender, 16.0, userProvider.gender == gender ? WHITE : DARK_BLUE)
        ],
      ),
    ),
  );
}