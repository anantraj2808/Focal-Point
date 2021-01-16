import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/services/app_localizations.dart';

//Normal Text
Text RegularTextMed(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_MED),);
}

Text RegularTextReg(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_REG),);
}


//With Center Alignment
Text RegularTextMedCenter(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_MED),textAlign: TextAlign.center,);
}

Text RegularTextRegCenter(String text,double size,Color color){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_REG),textAlign: TextAlign.center,);
}


//With Overflow control
Text RegularTextMedOverflow(String text,double size,Color color, int line){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_MED),overflow: TextOverflow.ellipsis,maxLines: line,);
}

Text RegularTextRegOverflow(String text,double size,Color color, int line){
  return Text(text,style: TextStyle(fontSize: size,color: color,fontFamily: GOOGLE_SANS_REG),overflow: TextOverflow.ellipsis,maxLines: line);
}

