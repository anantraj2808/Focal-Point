import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/services/app_localizations.dart';

Text RegularTextMed(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_MED),);
}

Text RegularTextReg(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_REG),);
}