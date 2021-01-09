import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:focal_point/models/Users.dart';

Widget professionBox(int globalIndex, List professions){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: DARK_BLUE),
      color: professions.contains(PROFESSION_LIST[globalIndex]) ? DARK_BLUE : WHITE,
    ),
    alignment: Alignment.center,
    child: ListTile(
      dense: true,
      leading: Icon(PROFESSION_ICON_LIST[globalIndex],size: 22.0,
        color: professions.contains(PROFESSION_LIST[globalIndex]) ? WHITE : DARK_BLUE,),
      title: RegularTextReg(PROFESSION_LIST[globalIndex], 18.0, professions.contains(PROFESSION_LIST[globalIndex]) ? WHITE : DARK_BLUE,),
      trailing: professions.contains(PROFESSION_LIST[globalIndex]) ? GestureDetector(
        child: Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: RED,
          ),
          child: Icon(Icons.delete,color: WHITE,),
        ),
      ) : Container(
        height: 24.0,
        width: 24.0,
      ),
    ),
  );
}