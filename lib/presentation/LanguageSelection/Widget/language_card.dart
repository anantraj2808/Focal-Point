import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';

Widget languageCard(userProvider,index){
  return Card(
    color: userProvider.language == LANGUAGE_LIST[index] ? BLUE_GREY : WHITE,
    elevation: 5.0,
    shadowColor: GREY,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        //color: userProvider.language == LANGUAGE_LIST[index] ? BLUE_GREY : WHITE,
      ),
      alignment: Alignment.center,
      height: 50.0,
      child: Text(LANGUAGE_LIST[index],
        style: TextStyle(
            fontSize: userProvider.language == LANGUAGE_LIST[index] ? 20.0 : 16.0,
            color: userProvider.language == LANGUAGE_LIST[index] ? WHITE : BLACK,
            fontWeight: userProvider.language == LANGUAGE_LIST[index] ? FontWeight.bold : FontWeight.normal
        ),),
    ),
  );
}